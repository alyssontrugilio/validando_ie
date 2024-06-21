bool checkInscricaoEstadualAP(String inscricaoEstadual) {
  if (inscricaoEstadual.length != 9 ||
      inscricaoEstadual.substring(0, 2) != '03') {
    return false;
  }

  int p, d;
  int inscricao =
      int.parse(inscricaoEstadual.substring(0, inscricaoEstadual.length - 1));

  if (inscricao >= 3000001 && inscricao <= 3017000) {
    p = 5;
    d = 0;
  } else if (inscricao >= 3017001 && inscricao <= 3019022) {
    p = 9;
    d = 1;
  } else {
    p = 0;
    d = 0;
  }

  String corpo = inscricaoEstadual.substring(0, inscricaoEstadual.length - 1);
  int soma = p;
  int peso = 9;

  for (int i = 0; i < corpo.length; i++) {
    soma += int.parse(corpo[i]) * peso;
    peso--;
  }

  int resto = soma % 11;
  int resultado = 11 - resto;

  if (resultado == 10) {
    resultado = 0;
  } else if (resultado == 11) {
    resultado = d;
  }

  return inscricaoEstadual.endsWith(resultado.toString());
}

void main() {
  print(checkInscricaoEstadualAP('032704631'));
}
