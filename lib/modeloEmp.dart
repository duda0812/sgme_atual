class EmprestimoModel {
  String nome;
  String imagem;
  String dataEmprestimo;
  String dataDevolucao;
  String status;

  EmprestimoModel({
    required this.nome,
    required this.imagem,
    required this.dataEmprestimo,
    required this.dataDevolucao,
    this.status = "Pendente",
  });
}

