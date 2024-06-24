bool checkInscricaoEstadualMA(String ie) {
  if (ie.length != 9 || !ie.startsWith('12')) {
    return false;
  }
  int soma = 0;
  int peso = 9;

  for (int i = 0; i < ie.length - 1; i++) {
    soma += int.parse(ie[i]) * peso;
    peso--;
  }

  int resto = soma % 11;
  int digitoVerificador;

  if (resto == 0 || resto == 1) {
    digitoVerificador = 0;
  } else {
    digitoVerificador = 11 - resto;
  }

  if (resto == 0 || resto == 1) {
    digitoVerificador = 0;
  } else {
    digitoVerificador = 11 - resto;
  }

  return digitoVerificador == int.parse(ie[ie.length - 1]);
}

void main() {
  print(checkInscricaoEstadualMA('123497566'));
}
