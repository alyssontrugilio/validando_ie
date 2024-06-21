bool checkInscricaoEstadualRO(String inscricaoEstadual) {
  bool valid = true;
  int length = inscricaoEstadual.length;

  if (length != 14) {
    valid = false;
  }

  if (valid) {
    int soma = 0;
    int peso = 6;
    for (int i = 0; i < length - 1; i++) {
      soma += int.parse(inscricaoEstadual[i]) * peso;
      peso = peso == 2 ? 9 : peso - 1;
    }

    int resto = soma % 11;
    int dig = 11 - resto;
    if (dig >= 10) {
      dig -= 10;
    }

    valid = inscricaoEstadual[length - 1] == dig.toString();
  }

  return valid;
}

void main() {
  print(checkInscricaoEstadualRO('25640586265507'));
}
