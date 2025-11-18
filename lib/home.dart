import 'package:flutter/material.dart';
import 'package:projeto/telaInicial.dart';
import 'login.dart';


class Home extends StatefulWidget {
  final String matricula;
  const Home({super.key, required this.matricula});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(color: Colors.grey[300]),

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
                        Icon(Icons.account_circle_outlined,
                            size: 50, color: Colors.black87),
                        SizedBox(width: 10),
              
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.matricula, 
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                            Text(
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
                              MaterialPageRoute(builder: (_) => Telainicial()),
                            );
                          },
                          child: Text("Sair",
                              style: TextStyle(color: Colors.black87, fontSize: 18)),
                        ),
              
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => Telainicial()),
                            );
                          },
                          child: Text("Materiais",
                              style: TextStyle(color: Colors.black87, fontSize: 18)),
                        ),
              
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => Telainicial()),
                            );
                          },
                          child: Text("Pendências",
                              style: TextStyle(color: Colors.black87, fontSize: 18)),
                        ),
              
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => Telainicial()),
                            );
                          },
                          child: Text("Devolução",
                              style: TextStyle(color: Colors.black87, fontSize: 18)),
                        ),
              
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => Telainicial()),
                            );
                          },
                          child: Text("Empréstimos",
                              style: TextStyle(color: Colors.black87, fontSize: 18)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
         Positioned(
      top: 120, 
      left: 0,
      right: 0,
      child: Center(
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
Padding(
  padding: const EdgeInsets.only(top: 120),
  child: Center(
    child: Wrap(
      alignment: WrapAlignment.center,
      spacing: 40,   // espaçamento horizontal
      runSpacing: 40, // espaçamento vertical
      children: const [
        MaterialCard(
          nome: "Bola de vôlei",
          imagem: "assets/images/bola_volei.png",
          quantidade: 12,
        ),
        MaterialCard(
          nome: "Bola de futebol",
          imagem: "assets/images/bola_futebol.png",
          quantidade: 8,
        ),
        MaterialCard(
          nome: "Bola de basquete",
          imagem: "assets/images/bola_basquete.jpg",
          quantidade: 9,
        ),
        MaterialCard(
          nome: "Bola de tênis de mesa",
          imagem: "assets/images/bola_tenis.png",
          quantidade: 10,
        ),
      ],
    ),
  ),
),

  ],
)
        
      
    );
  }
}




class MaterialCard extends StatelessWidget {
  final String nome;
  final String imagem;
  final int quantidade;

  const MaterialCard({
    super.key,
    required this.nome,
    required this.imagem,
    required this.quantidade,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180, 
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: const Color(0xFFBDBDBD), 
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Color(0xFFCC6633), 
          width: 2,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         
          Text(
            nome,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),

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
              child: Image.asset(
                imagem,
                fit: BoxFit.contain,
              ),
            ),
          ),

          const SizedBox(height: 15),

          const Text(
            "Quantidade disponível:",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            "$quantidade",
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w900,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

