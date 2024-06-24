bool checkInscricaoEstadualTO(String ie) {
  // Verifica se a inscrição estadual atende a nova ou a antiga regra de validação
  return _checkAntiga(ie) || _checkNova(ie);
}

bool _checkAntiga(String ie) {
  if (ie.length != 11) {
    return false;
  }

  final categoria = ie.substring(2, 4);
  if (!['01', '02', '03', '99'].contains(categoria)) {
    return false;
  }

  // Remove a categoria do cálculo de validação
  final corpo = ie.substring(0, 2) + ie.substring(4, ie.length - 1);
  final digitoVerificador = ie.substring(ie.length - 1);

  return _calculaDigito(corpo) == digitoVerificador;
}

bool _checkNova(String ie) {
  if (ie.length != 9) {
    return false;
  }

  return _calculaDigitoNova(ie.substring(0, ie.length - 1)) ==
      ie.substring(ie.length - 1);
}

String _calculaDigito(String corpo) {
  var soma = 0;
  var peso = 9;

  for (var i = 0; i < corpo.length; i++) {
    soma += int.parse(corpo[i]) * peso;
    peso--;
  }

  final resto = soma % 11;
  var digito = 11 - resto;
  if (resto < 2) {
    digito = 0;
  }

  return digito.toString();
}

String _calculaDigitoNova(String corpo) {
  var soma = 0;
  var peso = 9;

  for (var i = 0; i < corpo.length; i++) {
    soma += int.parse(corpo[i]) * peso;
    peso--;
  }

  final resto = soma % 11;
  var digito = 11 - resto;
  if (resto < 2) {
    digito = 0;
  }

  return digito.toString();
}

void main() {
  print(checkInscricaoEstadualTO('243429330'));
  print(checkInscricaoEstadualTO('104960051'));
}
