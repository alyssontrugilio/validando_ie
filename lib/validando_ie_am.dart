bool checkInscricaoEstadualAM(String inscricaoEstadual) {
  if (inscricaoEstadual.length != 9) {
    return false;
  }

  String corpo = inscricaoEstadual.substring(0, inscricaoEstadual.length - 1);
  int soma = 0;
  int peso = 9;

  for (int i = 0; i < corpo.length; i++) {
    soma += int.parse(corpo[i]) * peso;
    peso--;
  }

  int resultado;
  if (soma < 11) {
    resultado = 11 - soma;
  } else {
    int resto = soma % 11;
    if (resto <= 1) {
      resultado = 0;
    } else {
      resultado = 11 - resto;
    }
  }

  return inscricaoEstadual.endsWith(resultado.toString());
}

void main() {
  print(checkInscricaoEstadualAM('029581869'));
}
