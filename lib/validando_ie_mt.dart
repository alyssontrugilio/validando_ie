bool checkInscricaoEstadualMT(String inscricaoEstadual) {
  bool valid = true;
  int length = inscricaoEstadual.length;

  if (length != 11) {
    valid = false;
  }

  if (valid) {
    String corpo = inscricaoEstadual.substring(0, length - 1);
    int modulo = 11;

    int calculaDigito(String corpo, int modulo) {
      int peso = 3;
      int soma = 0;

      for (int i = 0; i < corpo.length; i++) {
        soma += int.parse(corpo[i]) * peso;
        peso--;
        if (peso < 2) {
          peso = 9;
        }
      }

      int resto = soma % modulo;
      int dig;

      if (resto == 0 || resto == 1) {
        dig = 0;
      } else {
        dig = modulo - resto;
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
  print(checkInscricaoEstadualMT('76814697674'));
}
