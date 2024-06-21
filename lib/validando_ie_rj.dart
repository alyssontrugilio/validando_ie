bool checkInscricaoEstadualRJ(String inscricaoEstadual) {
  bool valid = true;
  int length = inscricaoEstadual.length;

  if (length != 8) {
    valid = false;
  }

  if (valid) {
    int soma = 0;
    int peso = 2;
    for (int i = length - 2; i >= 0; i--) {
      soma += int.parse(inscricaoEstadual[i]) * peso;
      peso = peso == 7 ? 2 : peso + 1;
    }

    int resto = soma % 11;
    int dig = 11 - resto;
    if (dig >= 10) {
      dig = 0;
    }

    valid = inscricaoEstadual[length - 1] == dig.toString();
  }

  return valid;
}

void main() {
  print(checkInscricaoEstadualRJ('80073020'));
}
