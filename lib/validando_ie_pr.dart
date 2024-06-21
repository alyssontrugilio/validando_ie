bool checkInscricaoEstadualPR(String inscricaoEstadual) {
  bool valid = true;
  int length = inscricaoEstadual.length;

  if (length != 10) {
    valid = false;
  }

  if (valid) {
    String mult1 = '32765432';
    String mult2 = '43276543';
    String controle = '';

    for (int j = 0; j < 2; j++) {
      int soma = 0;
      String mult = j == 0 ? mult1 : mult2;
      for (int i = 0; i < 8; i++) {
        soma += int.parse(inscricaoEstadual[i]) * int.parse(mult[i]);
      }
      if (j == 1) {
        soma += 2 * int.parse(controle);
      }
      int digito = 11 - (soma % 11);
      if (digito == 10 || digito == 11) {
        digito = 0;
      }
      controle += digito.toString();
    }

    valid = inscricaoEstadual.substring(length - 2) == controle;
  }

  return valid;
}

void main() {
  print(checkInscricaoEstadualPR('9071311225'));
}
