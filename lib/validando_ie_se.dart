bool checkInscricaoEstadualSE(String inscricaoEstadual) {
  bool valid = true;
  int length = inscricaoEstadual.length;

  if (length != 9) {
    valid = false;
  }

  if (valid) {
    String corpo = inscricaoEstadual.substring(0, 8);
    List<int> pesos = [9, 8, 7, 6, 5, 4, 3, 2];
    int soma = 0;

    for (int i = 0; i < corpo.length; i++) {
      soma += int.parse(corpo[i]) * pesos[i];
    }

    int resto = soma % 11;
    int dig = 11 - resto;

    if (dig >= 10) {
      dig = 0;
    }

    valid = dig == int.parse(inscricaoEstadual[inscricaoEstadual.length - 1]);
  }

  return valid;
}

void main() {
  print(checkInscricaoEstadualSE('018866921')); // should print: true
}
