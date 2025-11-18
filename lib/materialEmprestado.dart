import 'package:flutter/material.dart';

class Material_emprestado extends StatefulWidget {
  final String matricula;
  final String nomeMaterial;
  final String imagemMaterial;

  const Material_emprestado({
    super.key,
    required this.matricula,
    required this.nomeMaterial,
    required this.imagemMaterial,
  });

  @override
  State<Material_emprestado> createState() => _Material_emprestadoState();
}

class _Material_emprestadoState extends State<Material_emprestado> {
  TextEditingController dataEmprestimo = TextEditingController();
  TextEditingController dataDevolucao = TextEditingController();

  Future<void> pickDate() async {
    DateTime? dataSelecionada = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );

    if (dataSelecionada != null) {
      dataEmprestimo.text = "${dataSelecionada.day}/${dataSelecionada.month}/${dataSelecionada.year}";
      DateTime devolucao = dataSelecionada.add(const Duration(days: 7));
      dataDevolucao.text = "${devolucao.day}/${devolucao.month}/${devolucao.year}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.orange[700],
        title: const Text("Solicitar Material"),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Container(
            width: 320,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFFBDBDBD),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFCC6633), width: 2),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(widget.nomeMaterial, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black87), textAlign: TextAlign.center),
                const SizedBox(height: 12),
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black54, width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.asset(widget.imagemMaterial, fit: BoxFit.contain),
                  ),
                ),
                const SizedBox(height: 20),
                const Text("Matrícula:", style: TextStyle(fontSize: 16)),
                Text(widget.matricula, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                const SizedBox(height: 25),
                
                TextField(
                  controller: dataEmprestimo,
                  readOnly: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: "Data do Empréstimo",
                    prefixIcon: const Icon(Icons.date_range),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  onTap: pickDate,
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: dataDevolucao,
                  readOnly: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: "Data da Devolução",
                    prefixIcon: const Icon(Icons.calendar_today),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                ),
                const SizedBox(height: 25),
                ElevatedButton(
                  onPressed: () {
                    if (dataEmprestimo.text.isEmpty || dataDevolucao.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Preencha as datas!")));
                      return;
                    }

                    Navigator.pop(context, {
                      "nome": widget.nomeMaterial,
                      "imagem": widget.imagemMaterial,
                      "dataEmprestimo": dataEmprestimo.text,
                      "dataDevolucao": dataDevolucao.text,
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFCC6633),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text("CONFIRMAR", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
