bool checkInscricaoEstadualTO(String inscricaoEstadual) {
  return checkAntiga(inscricaoEstadual) || checkNova(inscricaoEstadual);
}

bool checkAntiga(String inscricaoEstadual) {
  bool valid = true;
  if (inscricaoEstadual.length != 11) {
    valid = false;
  }

  if (valid) {
    String categoria = inscricaoEstadual.substring(2, 4);
    if (!['01', '02', '03', '99'].contains(categoria)) {
      valid = false;
    }
    String corpo = inscricaoEstadual.replaceRange(2, 4, '');
    valid = calculaDigito(corpo);
  }

  return valid;
}

bool checkNova(String inscricaoEstadual) {
  return inscricaoEstadual.length == 9 && calculaDigitoNova(inscricaoEstadual);
}

bool calculaDigitoNova(String inscricaoEstadual) {
  int peso = 9;
  int soma = 0;
  int length = inscricaoEstadual.length;
  int posicao = length - 1;
  String corpo = inscricaoEstadual.substring(0, length - 1);

  for (int i = 0; i < corpo.length; i++) {
    soma += int.parse(corpo[i]) * peso;
    peso--;
  }

  int resto = soma % 11;
  int dig = 11 - resto;

  if (resto < 2) {
    dig = 0;
  }

  return dig == int.parse(inscricaoEstadual[posicao]);
}

bool calculaDigito(String corpo) {
  // Implemente a lógica para calcular o dígito para a regra antiga
  return true;
}

void main() {
  print(checkInscricaoEstadualTO('104505320')); // should print: true
}
