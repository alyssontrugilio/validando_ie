bool checkInscricaoEstadualES(String inscricaoEstadual) {
  bool valid = true;
  int length = inscricaoEstadual.length;

  if (length != 9) {
    valid = false;
  }

  if (valid) {
    String corpo = inscricaoEstadual.substring(0, length - 1);
    int modulo = 11;

    int calculaDigito(String corpo, int modulo) {
      int peso = 2;
      int soma = 0;

      for (int i = corpo.length - 1; i >= 0; i--) {
        soma += int.parse(corpo[i]) * peso;
        peso = peso == 9 ? 2 : peso + 1;
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
  print(checkInscricaoEstadualES('876196547'));
}
