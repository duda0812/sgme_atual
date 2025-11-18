import 'package:flutter/material.dart';
import 'package:projeto/home.dart'; 
import 'package:projeto/telaInicial.dart';

class Material_emprestado extends StatefulWidget {
  final String matricula;
  const Material_emprestado({super.key,  required this.matricula});

  @override
  State<Material_emprestado> createState() => _Material_emprestadoState();
}

class _Material_emprestadoState extends State<Material_emprestado> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(color: Colors.grey[300]),


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
                              MaterialPageRoute(builder: (_) =>  Home(matricula: widget.matricula,)),
                            );
                          },
                          child: const Text("Voltar",
                              style: TextStyle(color: Colors.black87, fontSize: 18)),
                        ),
                       
                       
                       
                       
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),);
  }
}