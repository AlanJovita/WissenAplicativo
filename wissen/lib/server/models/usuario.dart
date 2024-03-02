class Usuario {
  late String nome;
  late String senha;
  late String email;
  late String telefone;
  late String endereco;
  late String cidade;
  late String estado;
  late String cep;
  late String bairro;
  late String tipoUsuario;
  late String status;

  toJson() {
    return {
      'nome': nome,
      'senha': senha,
      'email': email,
      'telefone': telefone,
      'endereco': endereco,
      'cidade': cidade,
      'estado': estado,
      'cep': cep,
      'bairro': bairro,
      'tipo_usuario': tipoUsuario,
      'status': status,
    };
  }
}
