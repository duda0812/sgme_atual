import 'package:flutter/material.dart';
import 'modeloEmp.dart';
import 'telaInicial.dart';

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

    
    emprestimos = widget.emprestimosIniciais
        .map((e) => EmprestimoModel(
              nome: e.nome,
              imagem: e.imagem,
              dataEmprestimo: e.dataEmprestimo,
              dataDevolucao: e.dataDevolucao,
              status: e.status ?? "Pendente",
            ))
        .toList();
  }

  void devolverEmprestimo(EmprestimoModel e) {
    setState(() {
      e.status = "Devolvido";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(color: Colors.grey[300]),
  Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Image.asset(
                'assets/images/image.png',
                width: 400,
                fit: BoxFit.contain,
              ),
            ),
          ),
           Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Image.asset(
                'assets/images/image.png',
                width: 400,
                fit: BoxFit.contain,
              ),
            ),
          ),
          
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 90,
              color: Colors.grey[100],
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      const Icon(Icons.account_circle_outlined, size: 50),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.matricula,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600)),
                          const Text("Aluno(a)", style: TextStyle(fontSize: 14)),
                        ],
                      )
                    ]),

                    Row(children: [
                        TextButton(
                        onPressed: () =>
                            Navigator.push(context, MaterialPageRoute(builder: (_) => const Telainicial())),
                        child: const Text("Sair", style: TextStyle(fontSize: 18)),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context, emprestimos);
                        },
                        child: const Text("Materiais",
                            style: TextStyle(fontSize: 18)),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text("Empréstimos",
                            style: TextStyle(fontSize: 18)),
                      ),
                    ]),
                  ],
                ),
              ),
            ),
          ),

          
          const Positioned(
            top: 120,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                "Materiais emprestados",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
            ),
          ),

          
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
                      .map(
                        (e) => EmprestimoCard(
                          nome: e.nome,
                          imagem: e.imagem,
                          dataEmprestimo: e.dataEmprestimo,
                          dataDevolucao: e.dataDevolucao,
                          status: e.status ?? "Pendente",
                          onDevolver: () => devolverEmprestimo(e),
                        ),
                      )
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



class EmprestimoCard extends StatelessWidget {
  final String nome;
  final String imagem;
  final String dataEmprestimo;
  final String dataDevolucao;
  final String status;
  final VoidCallback onDevolver;

  const EmprestimoCard({
    super.key,
    required this.nome,
    required this.imagem,
    required this.dataEmprestimo,
    required this.dataDevolucao,
    required this.status,
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
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
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

          Text("Empréstimo:", style: const TextStyle(fontSize: 14)),
          Text(dataEmprestimo,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),

          const SizedBox(height: 8),

          Text("Devolução:", style: const TextStyle(fontSize: 14)),
          Text(dataDevolucao,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),

          const SizedBox(height: 12),

   
          Text(
            "Status: $status",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: status == "Devolvido" ? Colors.green : Colors.red,
            ),
          ),

          const SizedBox(height: 16),

       
          ElevatedButton(
            onPressed: status == "Devolvido" ? null : onDevolver,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFCC6633),
              foregroundColor: Colors.white,
              minimumSize: const Size(150, 40),
              disabledBackgroundColor: Colors.grey,
            ),
            child: const Text("DEVOLVER",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
