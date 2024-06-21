bool checkInscricaoEstadualRN(String inscricaoEstadual) {
  bool valid = true;
  int length = inscricaoEstadual.length;

  if ((length != 9 && length != 10) || !inscricaoEstadual.startsWith('20')) {
    valid = false;
  }

  if (valid) {
    int soma = 0;
    int peso = length;
    for (int i = 0; i < length - 1; i++) {
      soma += int.parse(inscricaoEstadual[i]) * peso;
      peso--;
    }

    int resto = (soma * 10) % 11;
    if (resto == 10) {
      resto = 0;
    }

    valid = inscricaoEstadual[length - 1] == resto.toString();
  }

  return valid;
}

void main() {
  print(checkInscricaoEstadualRN('208689451')); // should print: true
}
