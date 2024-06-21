bool checkInscricaoEstadualRR(String inscricaoEstadual) {
  bool valid = true;
  int length = inscricaoEstadual.length;

  if (length != 9) {
    valid = false;
  }

  if (valid) {
    int soma = 0;
    for (int i = 0; i < length - 1; i++) {
      soma += int.parse(inscricaoEstadual[i]) * (i + 1);
    }

    int dig = soma % 9;

    valid = inscricaoEstadual[length - 1] == dig.toString();
  }

  return valid;
}

void main() {
  print(checkInscricaoEstadualRR('245646051'));
}
