bool checkInscricaoEstadualAL(String inscricaoEstadual) {
  if (inscricaoEstadual.length != 9 ||
      inscricaoEstadual.substring(0, 2) != '24') {
    return false;
  }

  String corpo = inscricaoEstadual.substring(0, inscricaoEstadual.length - 1);
  int soma = 0;
  int peso = 9;

  for (int i = 0; i < corpo.length; i++) {
    soma += int.parse(corpo[i]) * peso;
    peso--;
  }

  int produto = soma * 10;
  int resto = produto - ((produto ~/ 11) * 11);
  if (resto == 10) {
    resto = 0;
  }

  return inscricaoEstadual.endsWith(resto.toString());
}

void main() {
  print(checkInscricaoEstadualAL('248128760'));
}
