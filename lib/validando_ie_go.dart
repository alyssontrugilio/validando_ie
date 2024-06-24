bool checkInscricaoEstadualGO(String inscricaoEstadual) {
  if (inscricaoEstadual.length != 9) {
    return false;
  }

  var inicio = int.parse(inscricaoEstadual.substring(0, 2));
  if (!(inicio == 10 || inicio == 11 || (inicio >= 20 && inicio <= 29))) {
    return false;
  }

  return calculaDigito(inscricaoEstadual);
}

bool calculaDigito(String inscricaoEstadual) {
  int soma = 0;
  int peso = 9;

  for (int i = 0; i < 8; i++) {
    soma += int.parse(inscricaoEstadual[i]) * peso;
    peso--;
  }

  int resto = soma % 11;
  int digitoVerificador;

  if (resto == 0 || resto == 1) {
    digitoVerificador = 0;
  } else {
    digitoVerificador = 11 - resto;
  }

  return digitoVerificador == int.parse(inscricaoEstadual[8]);
}

void main() {
  print(
    checkInscricaoEstadualGO("124444652"),
  );
}
