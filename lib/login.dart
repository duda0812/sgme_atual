import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(

        children: [
          Container(
            color:  Colors.grey[300],
      
            
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
          
        Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 100,),
                    Text(
                      "Para começarmos, insira sua matrícula e senha.",
                      style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 100), 
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Matrícula',
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 35, horizontal: 12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    const SizedBox(height: 30), 
                   
                   
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Senha',
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 35, horizontal: 12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        style: TextStyle(fontSize: 14),
                      ),
                    ),

                    const SizedBox(height: 100),

                    
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.04, 
                      child: ElevatedButton(
                        
                        onPressed: () {},
                        child: Text('Entrar'),
                      ),
                    ),
                  ],
                ),
              
            
          ),
        ],
      ),
    );
  }
}