bool checkInscricaoEstadualPE(String inscricaoEstadual) {
  bool valid = true;
  int length = inscricaoEstadual.length;

  if (length != 9) {
    valid = false;
  }

  if (valid) {
    String mult1 = '8765432';
    String mult2 = '98765432';
    String controle = '';

    for (int j = 0; j < 2; j++) {
      int soma = 0;
      String mult = j == 0 ? mult1 : mult2;
      for (int i = 0; i < (j == 0 ? 7 : 8); i++) {
        soma += int.parse(inscricaoEstadual[i]) * int.parse(mult[i]);
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
  print(checkInscricaoEstadualPE('245739068'));
}
