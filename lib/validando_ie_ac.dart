bool checkInscricaoEstadualAC(String inscricaoEstadual) {
  if (inscricaoEstadual.length != 13 ||
      inscricaoEstadual.substring(0, 2) != '01') {
    return false;
  }

  String corpo = inscricaoEstadual.substring(0, inscricaoEstadual.length - 2);
  int pesoInicial = 4;
  int peso = pesoInicial;
  int soma = 0;
  for (int i = 0; i < corpo.length; i++) {
    soma += int.parse(corpo[i]) * peso;
    peso--;
    if (peso == 1) {
      peso = 9;
    }
  }

  int dig = 11 - soma % 11;
  if (dig >= 10) {
    dig = 0;
  }

  String dig1 = dig.toString();
  corpo += dig1;
  pesoInicial = 5;
  peso = pesoInicial;
  soma = 0;
  for (int i = 0; i < corpo.length; i++) {
    soma += int.parse(corpo[i]) * peso;
    peso--;
    if (peso == 1) {
      peso = 9;
    }
  }

  dig = 11 - soma % 11;
  if (dig >= 10) {
    dig = 0;
  }

  String dig2 = dig.toString();
  return inscricaoEstadual.endsWith(dig1 + dig2);
}

void main() {
  print(checkInscricaoEstadualAC('0171724275112'));
}
