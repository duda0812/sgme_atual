import 'package:flutter/material.dart';
import 'login.dart';

class Telainicial extends StatelessWidget {
  const Telainicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.grey[300],
            child: Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 1000),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center, 
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center, 
                      crossAxisAlignment: CrossAxisAlignment.center, 
                      children: [
                        Flexible(
                          flex: 2,
                          child: RichText(
                            textAlign: TextAlign.left,
                            text: const TextSpan(
                              style: TextStyle(
                                fontSize: 49,
                                fontWeight: FontWeight.bold,
                              ),
                              children: [
                                TextSpan(
                                  text: "S",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 84, 108, 120),
                                  ),
                                ),
                                TextSpan(
                                  text: "istema de\n",
                                  style: TextStyle(color: Colors.black87),
                                ),
                                TextSpan(
                                  text: "G",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 84, 108, 120),
                                  ),
                                ),
                                TextSpan(
                                  text: "erenciamento de\n",
                                  style: TextStyle(color: Colors.black87),
                                ),
                                TextSpan(
                                  text: "M",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 84, 108, 120),
                                  ),
                                ),
                                TextSpan(
                                  text: "ateriais\n",
                                  style: TextStyle(color: Colors.black87),
                                ),
                                TextSpan(
                                  text: "E",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 84, 108, 120),
                                  ),
                                ),
                                TextSpan(
                                  text: "sportivos",
                                  style: TextStyle(color: Colors.black87),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 60), 
                        Flexible(
                          flex: 2,
                          child: Image.asset(
                            'assets/images/image.png',
                            width: 400,
                            height: 400,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40), 
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        elevation: 5,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 60,
                          vertical: 30,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        "Registre-se!",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              color: Colors.white,
              height: 80,
              width: double.infinity,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Com o SGME, você pode gerenciar os materiais esportivos de sua instituição.",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8), 
                    Text(
                      "Faça o controle de todos os objetos.",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 20,
            top: 20,
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                "SGME",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
          ),

          Positioned(
            right: 20,
            top:20,
            child: ElevatedButton(onPressed: (){},
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ), child: Text("Entrar"),
            ),)
        ],
      )
    );
  }
}