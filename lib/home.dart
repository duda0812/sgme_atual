import 'package:flutter/material.dart';
import 'package:projeto/emprestimo.dart';
import 'package:projeto/materialEmprestado.dart';
import 'package:projeto/telaInicial.dart';
import 'package:projeto/modeloEmp.dart';

class Home extends StatefulWidget {
  final String matricula;
  const Home({super.key, required this.matricula});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<EmprestimoModel> emprestimos = [];

  void adicionarEmprestimo(EmprestimoModel e) {
    setState(() {
      emprestimos.add(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(color: Colors.grey[300]),
          // Imagens de fundo
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
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
              padding: const EdgeInsets.only(left: 16.0),
              child: Image.asset(
                'assets/images/image.png',
                width: 400,
                fit: BoxFit.contain,
              ),
            ),
          ),

          // TOPO
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
                        const Icon(Icons.account_circle_outlined, size: 50, color: Colors.black87),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.matricula,
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87)),
                            const Text("Aluno(a)",
                                style: TextStyle(fontSize: 14, color: Colors.black54)),
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
                              MaterialPageRoute(builder: (_) => const Telainicial()),
                            );
                          },
                          child: const Text("Sair", style: TextStyle(color: Colors.black87, fontSize: 18)),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text("Materiais", style: TextStyle(color: Colors.black87, fontSize: 18)),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text("Pendências", style: TextStyle(color: Colors.black87, fontSize: 18)),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text("Devolução", style: TextStyle(color: Colors.black87, fontSize: 18)),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => Emprestimo(
                                  matricula: widget.matricula,
                                  emprestimosIniciais: emprestimos,
                                ),
                              ),
                            );
                          },
                          child: const Text("Empréstimos", style: TextStyle(color: Colors.black87, fontSize: 18)),
                        ),
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
                "Materiais disponíveis",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ),
          ),

          // CARDS DE MATERIAIS
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
                    MaterialCard(
                      nome: "Bola de vôlei",
                      imagem: "assets/images/bola_volei.png",
                      quantidade: 12,
                      matriculaAluno: widget.matricula,
                      onEmprestimoConfirmado: adicionarEmprestimo,
                    ),
                    MaterialCard(
                      nome: "Bola de futebol",
                      imagem: "assets/images/bola_futebol.png",
                      quantidade: 8,
                      matriculaAluno: widget.matricula,
                      onEmprestimoConfirmado: adicionarEmprestimo,
                    ),
                    MaterialCard(
                      nome: "Bola de basquete",
                      imagem: "assets/images/bola_basquete.jpg",
                      quantidade: 9,
                      matriculaAluno: widget.matricula,
                      onEmprestimoConfirmado: adicionarEmprestimo,
                    ),
                    MaterialCard(
                      nome: "Bola de tênis de mesa",
                      imagem: "assets/images/bola_tenis.png",
                      quantidade: 10,
                      matriculaAluno: widget.matricula,
                      onEmprestimoConfirmado: adicionarEmprestimo,
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

// -------------------- MaterialCard --------------------

class MaterialCard extends StatelessWidget {
  final String nome;
  final String imagem;
  final int quantidade;
  final String matriculaAluno;
  final Function(EmprestimoModel) onEmprestimoConfirmado;

  const MaterialCard({
    super.key,
    required this.nome,
    required this.imagem,
    required this.quantidade,
    required this.matriculaAluno,
    required this.onEmprestimoConfirmado,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: const Color(0xFFBDBDBD),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFCC6633), width: 2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(nome, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: Colors.black87), textAlign: TextAlign.center),
          const SizedBox(height: 10),
          Container(
            width: 95,
            height: 95,
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
          const SizedBox(height: 15),
          const Text("Quantidade disponível:", style: TextStyle(fontSize: 15, color: Colors.black)),
          const SizedBox(height: 4),
          Text("$quantidade", style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: Colors.black)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: ElevatedButton(
              onPressed: () async {
                final resultado = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => Material_emprestado(
                      matricula: matriculaAluno,
                      nomeMaterial: nome,
                      imagemMaterial: imagem,
                    ),
                  ),
                );

                if (resultado != null && resultado is Map<String, String>) {
                  onEmprestimoConfirmado(EmprestimoModel(
                    nome: resultado["nome"]!,
                    imagem: resultado["imagem"]!,
                    dataEmprestimo: resultado["dataEmprestimo"]!,
                    dataDevolucao: resultado["dataDevolucao"]!,
                  ));
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFCC6633),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                minimumSize: const Size(double.infinity, 40),
              ),
              child: const Text("SOLICITAR", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}
