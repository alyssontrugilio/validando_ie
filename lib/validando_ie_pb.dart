bool checkInscricaoEstadualPB(String inscricaoEstadual) {
  bool valid = true;
  int length = inscricaoEstadual.length;

  if (length != 9) {
    valid = false;
  }

  if (valid) {
    int soma = 0;
    int peso = 9;
    for (int i = 0; i < length - 1; i++) {
      soma += int.parse(inscricaoEstadual[i]) * peso;
      peso--;
    }

    int resto = soma % 11;
    int dig = 11 - resto;
    if (dig == 10 || dig == 11) {
      dig = 0;
    }

    valid = inscricaoEstadual[length - 1] == dig.toString();
  }

  return valid;
}

void main() {
  print(checkInscricaoEstadualPB('331578077')); // should print: true
}
