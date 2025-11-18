import 'package:flutter/material.dart';
import 'home.dart';
import 'telaInicial.dart';

class Emprestimo extends StatefulWidget {
  final String matricula;
  const Emprestimo({super.key, required this.matricula});

  @override
  State<Emprestimo> createState() => _EmprestimoState();
}

class _EmprestimoState extends State<Emprestimo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
        
          Container(color: Colors.grey[300]),


          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 16.0),
              child: Image.asset(
                'assets/images/image.png',
                width: 250,
                fit: BoxFit.contain,
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0, bottom: 16.0),
              child: Image.asset(
                'assets/images/image.png',
                width: 250,
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
                 
                    Row(
                      children: [
                        const Icon(Icons.account_circle_outlined,
                            size: 50, color: Colors.black87),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.matricula,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                            const Text(
                              "Aluno(a)",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),

                    
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const Telainicial()),
                            );
                          },
                          child: const Text("Sair",
                              style: TextStyle(color: Colors.black87, fontSize: 18)),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    Home(matricula: widget.matricula),
                              ),
                            );
                          },
                          child: const Text("Materiais",
                              style: TextStyle(color: Colors.black87, fontSize: 18)),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text("Pendências",
                              style: TextStyle(color: Colors.black87, fontSize: 18)),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text("Devolução",
                              style: TextStyle(color: Colors.black87, fontSize: 18)),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text("Empréstimos",
                              style: TextStyle(color: Colors.black87, fontSize: 18)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),

          Positioned(
            top: 120,
            left: 0,
            right: 0,
            child: const Center(
              child: Text(
                "Materiais emprestados",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
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
                  children: [

                    // EXEMPLOS DE CARDS
                    EmprestimoCard(
                      nome: "Bola de vôlei",
                      imagem: "assets/images/bola_volei.png",
                      dataEmprestimo: "12/11/2025",
                      dataDevolucao: "19/11/2025",
                    ),
                    EmprestimoCard(
                      nome: "Bola de futebol",
                      imagem: "assets/images/bola_futebol.png",
                      dataEmprestimo: "10/11/2025",
                      dataDevolucao: "17/11/2025",
                    ),
                    EmprestimoCard(
                      nome: "Bola de basquete",
                      imagem: "assets/images/bola_basquete.jpg",
                      dataEmprestimo: "08/11/2025",
                      dataDevolucao: "15/11/2025",
                    ),

                  ],
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

  const EmprestimoCard({
    super.key,
    required this.nome,
    required this.imagem,
    required this.dataEmprestimo,
    required this.dataDevolucao,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: const Color(0xFFBDBDBD),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xFFCC6633),
          width: 2,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            nome,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),

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
              child: Image.asset(
                imagem,
                fit: BoxFit.contain,
              ),
            ),
          ),

          const SizedBox(height: 16),

          Text("Empréstimo:",
              style: TextStyle(fontSize: 14, color: Colors.black87)),
          Text(
            dataEmprestimo,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 8),

          Text("Devolução:",
              style: TextStyle(fontSize: 14, color: Colors.black87)),
          Text(
            dataDevolucao,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 16),

          ElevatedButton(
            onPressed: () {
              // Colocar ação de devolver material
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFCC6633),
              foregroundColor: Colors.white,
              minimumSize: const Size(150, 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            child: const Text(
              "DEVOLVER",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
