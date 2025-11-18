import 'package:flutter/material.dart';
import 'package:projeto/emprestimo.dart';
import 'package:projeto/materialEmprestado.dart';
import 'package:projeto/telaInicial.dart';
import 'package:projeto/modeloEmp.dart';
import 'package:projeto/materialModel.dart';

class Home extends StatefulWidget {
  final String matricula;
  const Home({super.key, required this.matricula});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<EmprestimoModel> emprestimos = [];

  List<MaterialModel> materiais = [
    MaterialModel(nome: "Bola de vôlei", imagem: "assets/images/bola_volei.png", quantidade: 12),
    MaterialModel(nome: "Bola de futebol", imagem: "assets/images/bola_futebol.png", quantidade: 8),
    MaterialModel(nome: "Bola de basquete", imagem: "assets/images/bola_basquete.jpg", quantidade: 9),
    MaterialModel(nome: "Bola de tênis de mesa", imagem: "assets/images/bola_tenis.png", quantidade: 10),
  ];

  void adicionarEmprestimo(EmprestimoModel e) {
    setState(() {
      emprestimos.add(e);

   
      final mat = materiais.firstWhere((m) => m.nome == e.nome);
      mat.quantidade--;
    });
  }

  void atualizarMateriaisAoDevolver(List<EmprestimoModel> listaAtualizada) {
    setState(() {
 
      emprestimos = listaAtualizada;

     
      for (var emp in listaAtualizada) {
        if (emp.status == "Devolvido") {
          final mat = materiais.firstWhere((m) => m.nome == emp.nome);
          mat.quantidade++;
        }
      }
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
          

          const Positioned(
            top: 120,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                "Materiais disponíveis",
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
                  children: materiais
                      .map(
                        (m) => MaterialCard(
                          material: m,
                          matriculaAluno: widget.matricula,
                          onEmprestimoConfirmado: adicionarEmprestimo,
                        ),
                      )
                      .toList(),
                ),
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

                      const SizedBox(width: 10),

                      TextButton(
                        onPressed: () {},
                        child: const Text("Materiais", style: TextStyle(fontSize: 18)),
                      ),

                      const SizedBox(width: 10),

                      TextButton(
                        onPressed: () async {
                          final listaAtualizada = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => Emprestimo(
                                matricula: widget.matricula,
                                emprestimosIniciais: emprestimos,
                              ),
                            ),
                          );

                          if (listaAtualizada != null) {
                            atualizarMateriaisAoDevolver(listaAtualizada);
                          }
                        },
                        child: const Text("Empréstimos", style: TextStyle(fontSize: 18)),
                      ),
                    ]),
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



class MaterialCard extends StatelessWidget {
  final MaterialModel material;
  final String matriculaAluno;
  final Function(EmprestimoModel) onEmprestimoConfirmado;

  const MaterialCard({
    super.key,
    required this.material,
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
        children: [
          Text(material.nome,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),

          const SizedBox(height: 10),

          Container(
            width: 95,
            height: 95,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black54, width: 2),
            ),
            child: Image.asset(material.imagem, fit: BoxFit.contain),
          ),

          const SizedBox(height: 10),
          const Text("Disponível:", style: TextStyle(fontSize: 15)),
          Text("${material.quantidade}",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),

          const SizedBox(height: 10),

          ElevatedButton(
            onPressed: material.quantidade > 0
                ? () async {
                    final resultado = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => Material_emprestado(
                          matricula: matriculaAluno,
                          nomeMaterial: material.nome,
                          imagemMaterial: material.imagem,
                        ),
                      ),
                    );

                    if (resultado != null) {
                      onEmprestimoConfirmado(
                        EmprestimoModel(
                          nome: resultado["nome"],
                          imagem: resultado["imagem"],
                          dataEmprestimo: resultado["dataEmprestimo"],
                          dataDevolucao: resultado["dataDevolucao"],
                        ),
                      );
                    }
                  }
                : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFCC6633),
              foregroundColor: Colors.white,
            ),
            child: const Text("SOLICITAR"),
          )
        ],
      ),
    );
  }
}
