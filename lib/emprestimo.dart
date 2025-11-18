import 'package:flutter/material.dart';
import 'modeloEmp.dart';

class Emprestimo extends StatefulWidget {
  final String matricula;
  final List<EmprestimoModel> emprestimosIniciais;

  const Emprestimo({
    super.key,
    required this.matricula,
    this.emprestimosIniciais = const [],
  });

  @override
  State<Emprestimo> createState() => _EmprestimoState();
}

class _EmprestimoState extends State<Emprestimo> {
  late List<EmprestimoModel> emprestimos;

  @override
  void initState() {
    super.initState();
    emprestimos = List.from(widget.emprestimosIniciais);
  }

  void devolverEmprestimo(EmprestimoModel e) {
    setState(() {
      emprestimos.remove(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(color: Colors.grey[300]),

          // TOPO
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 90,
              color: Colors.grey[100],
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  children: [
                    const Icon(Icons.account_circle_outlined, size: 50, color: Colors.black87),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.matricula,
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black87)),
                        const Text("Aluno(a)", style: TextStyle(fontSize: 14, color: Colors.black54)),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),

          // TÍTULO
          Positioned(
            top: 120,
            left: 0,
            right: 0,
            child: const Center(
              child: Text(
                "Materiais emprestados",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black87),
              ),
            ),
          ),

          // LISTA DE EMPRÉSTIMOS
          Padding(
            padding: const EdgeInsets.only(top: 180),
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 40,
                  runSpacing: 40,
                  children: emprestimos
                      .map((e) => EmprestimoCard(
                            nome: e.nome,
                            imagem: e.imagem,
                            dataEmprestimo: e.dataEmprestimo,
                            dataDevolucao: e.dataDevolucao,
                            onDevolver: () => devolverEmprestimo(e),
                          ))
                      .toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ------------------- EMPRESTIMO CARD -------------------

class EmprestimoCard extends StatelessWidget {
  final String nome;
  final String imagem;
  final String dataEmprestimo;
  final String dataDevolucao;
  final VoidCallback onDevolver;

  const EmprestimoCard({
    super.key,
    required this.nome,
    required this.imagem,
    required this.dataEmprestimo,
    required this.dataDevolucao,
    required this.onDevolver,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: const Color(0xFFBDBDBD),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFCC6633), width: 2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(nome,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black87),
              textAlign: TextAlign.center),
          const SizedBox(height: 12),
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black54, width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset(imagem, fit: BoxFit.contain),
            ),
          ),
          const SizedBox(height: 16),
          Text("Empréstimo:", style: const TextStyle(fontSize: 14, color: Colors.black87)),
          Text(dataEmprestimo, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text("Devolução:", style: const TextStyle(fontSize: 14, color: Colors.black87)),
          Text(dataDevolucao, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: onDevolver,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFCC6633),
              foregroundColor: Colors.white,
              minimumSize: const Size(150, 40),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
            ),
            child: const Text("DEVOLVER", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
