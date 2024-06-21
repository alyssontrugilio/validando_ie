bool checkInscricaoEstadualMG(String inscricaoEstadual) {
  bool valid = true;
  int length = inscricaoEstadual.length;

  if (length != 13) {
    valid = false;
  }

  if (valid) {
    String corpo =
        '${inscricaoEstadual.substring(0, 3)}0${inscricaoEstadual.substring(3, length - 2)}';

    int calculaPrimeiroDigito(String corpo) {
      String concatenacao = "";
      for (int i = 0; i < corpo.length; i++) {
        int peso = ((i + 3) % 2 == 0) ? 2 : 1;
        concatenacao += (int.parse(corpo[i]) * peso).toString();
      }

      int soma = 0;
      for (int i = 0; i < concatenacao.length; i++) {
        soma += int.parse(concatenacao[i]);
      }

      int lastChar = soma % 10;
      return (lastChar == 0) ? 0 : (10 - lastChar);
    }

    int calculaSegundoDigito(String corpo) {
      int peso = 3;
      int soma = 0;
      for (int i = 0; i < corpo.length; i++) {
        soma += int.parse(corpo[i]) * peso;
        peso--;
        if (peso == 1) {
          peso = 11;
        }
      }

      int resto = soma % 11;
      int dig = 11 - resto;

      if (dig >= 10) {
        dig = 0;
      }
      return dig;
    }

    int digito1 = calculaPrimeiroDigito(corpo);
    int digito2 = calculaSegundoDigito(
        inscricaoEstadual.substring(0, length - 1) + digito1.toString());

    valid = inscricaoEstadual[length - 2] == digito1.toString() &&
        inscricaoEstadual[length - 1] == digito2.toString();
  }

  return valid;
}

void main() {
  print(checkInscricaoEstadualMG('8412665105390')); // should print: true
}
