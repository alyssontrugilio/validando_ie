bool checkInscricaoEstadualBA(String inscricaoEstadual) {
  bool valid = true;
  int length = inscricaoEstadual.length;

  if (length != 9 && length != 8) {
    valid = false;
  }

  if (valid) {
    String corpo = inscricaoEstadual.substring(0, length - 2);
    int modulo =
        (length == 9 && ['6', '7', '9'].contains(inscricaoEstadual[1])) ||
                (length == 8 && ['6', '7', '9'].contains(inscricaoEstadual[0]))
            ? 11
            : 10;

    int calculaDigito(String corpo, int modulo) {
      int peso = corpo.length + 1;
      int soma = 0;

      for (int i = 0; i < corpo.length; i++) {
        soma += int.parse(corpo[i]) * peso;
        peso--;
      }

      int resto = soma % modulo;
      int dig = modulo - resto;

      if (dig >= 10) {
        dig = 0;
      }
      return dig;
    }

    int dig2 = calculaDigito(corpo, modulo);
    int dig1 = calculaDigito(corpo + dig2.toString(), modulo);

    int posdig2 = inscricaoEstadual.length - 1;
    int posdig1 = inscricaoEstadual.length - 2;

    valid = inscricaoEstadual[posdig1] == dig1.toString() &&
        inscricaoEstadual[posdig2] == dig2.toString();
  }

  return valid;
}

void main() {
  print(checkInscricaoEstadualBA('542276554'));
}
