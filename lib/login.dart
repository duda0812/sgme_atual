import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _matriculaController = TextEditingController();
  bool _obscurePassword = true;
  final TextEditingController _senhaController = TextEditingController();
  String? matricula;
  String? senha;  

  @override
  void dispose() {
    _matriculaController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(

        children: [
           Container(color: Colors.grey[300]),

   
    Positioned(
      left: 20,
      top: 20,
      child: TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        style: TextButton.styleFrom(
          foregroundColor: Colors.black87,
          padding: EdgeInsets.all(8),
          textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        child: Text('SGME'),
      ),
    ),

          
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
                        controller: _matriculaController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(13),
                        ],
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
                        controller: _senhaController,
                        obscureText: _obscurePassword,
                        decoration: InputDecoration(
                          labelText: 'Senha',
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 35, horizontal: 12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword ? Icons.visibility_off : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                        ),
                        style: TextStyle(fontSize: 14),
                      ),
                    ),

                    const SizedBox(height: 100),

                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.18,
                      height: MediaQuery.of(context).size.height * 0.08,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                          textStyle: TextStyle(fontSize: 14),
                        ),
                        onPressed: () {
                          final m = _matriculaController.text;
                          final s = _senhaController.text;
                          
                        

  setState(() {
    matricula = m;
    senha = s;
  });

  print("Matrícula salva: $matricula");
  print("Senha salva: $senha");
   Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => Home(matricula: m),
    ));
                          
                        },
                        child: Text('Entrar', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),),
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