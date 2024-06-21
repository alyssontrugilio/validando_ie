bool checkInscricaoEstadualSC(String inscricaoEstadual) {
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
    int dig = (resto == 0 || resto == 1) ? 0 : 11 - resto;

    valid = inscricaoEstadual[length - 1] == dig.toString();
  }

  return valid;
}

void main() {
  print(checkInscricaoEstadualSC('456020942'));
}
