bool checkInscricaoEstadualDF(String inscricaoEstadual) {
  bool valid = true;
  int length = inscricaoEstadual.length;

  if (length != 13) {
    valid = false;
  }

  if (valid) {
    String corpo = inscricaoEstadual.substring(0, length - 2);
    int modulo = 11;

    int calculaDigito(String corpo) {
      int peso = corpo.length - 7;
      int soma = 0;

      for (int i = 0; i < corpo.length; i++) {
        soma += int.parse(corpo[i]) * peso;
        peso--;
        if (peso == 1) {
          peso = 9;
        }
      }

      int resto = soma % modulo;
      int dig = modulo - resto;

      if (dig >= 10) {
        dig = 0;
      }
      return dig;
    }

    int primeiroDigito = calculaDigito(corpo);
    int segundoDigito = calculaDigito(corpo + primeiroDigito.toString());

    int posPrimeiroDigito = inscricaoEstadual.length - 2;
    int posSegundoDigito = inscricaoEstadual.length - 1;

    valid = inscricaoEstadual[posPrimeiroDigito] == primeiroDigito.toString() &&
        inscricaoEstadual[posSegundoDigito] == segundoDigito.toString();
  }

  return valid;
}

void main() {
  print(checkInscricaoEstadualDF('0742056500190'));
}
