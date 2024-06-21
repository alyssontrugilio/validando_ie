bool checkInscricaoEstadualSP(String inscricaoEstadual) {
  bool valid = true;
  int length = inscricaoEstadual.length;

  if (length != 12) {
    valid = false;
  }

  if (valid) {
    String corpo = inscricaoEstadual.substring(0, 8);
    List<int> pesos = [1, 3, 4, 5, 6, 7, 8, 10];
    int soma = 0;

    for (int i = 0; i < corpo.length; i++) {
      soma += int.parse(corpo[i]) * pesos[i];
    }

    int dig = soma % 11;
    String strDig = dig.toString();
    int length = strDig.length;
    int dig1 = int.parse(strDig.substring(length - 1, length));

    corpo = inscricaoEstadual.substring(0, 11);
    int peso = 3;
    soma = 0;

    for (int i = 0; i < corpo.length; i++) {
      soma += int.parse(corpo[i]) * peso;
      peso--;
      if (peso == 1) {
        peso = 10;
      }
    }

    dig = soma % 11;
    strDig = dig.toString();
    length = strDig.length;
    int dig2 = int.parse(strDig.substring(length - 1, length));

    valid =
        dig1 == int.parse(inscricaoEstadual[inscricaoEstadual.length - 4]) &&
            dig2 == int.parse(inscricaoEstadual[inscricaoEstadual.length - 1]);
  }

  return valid;
}

void main() {
  print(checkInscricaoEstadualSP('977258604051'));
}
