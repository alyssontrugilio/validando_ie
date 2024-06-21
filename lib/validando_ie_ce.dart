bool checkInscricaoEstadualCE(String inscricaoEstadual) {
  bool valid = true;
  int length = inscricaoEstadual.length;

  if (length != 9) {
    valid = false;
  }

  if (valid) {
    String corpo = inscricaoEstadual.substring(0, length - 1);
    int modulo = 11;

    int calculaDigito(String corpo, int modulo) {
      int peso = 9;
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

    int digito = calculaDigito(corpo, modulo);
    int posDigito = inscricaoEstadual.length - 1;

    valid = inscricaoEstadual[posDigito] == digito.toString();
  }

  return valid;
}

void main() {
  print(checkInscricaoEstadualCE('722161360'));
}
