// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meu App',
      home: PrincipalView(),
    );
  }
}

class PrincipalView extends StatefulWidget {
  const PrincipalView({super.key});

  @override
  State<PrincipalView> createState() => _PrincipalViewState();
}

class _PrincipalViewState extends State<PrincipalView> {
  //
  // Atributos
  //

  //Identificador do formulário
  var formKey = GlobalKey<FormState>();

  //Controladores dos campos de texto
  var txtValor1 = TextEditingController();
  var txtValor2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(50, 100, 50, 100),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              //

              //imagem

              Image.asset(
                'lib/imagens/imagen.jpg',
                width: 200,
                height: 200,
              ),
              // CAMPO DE TEXTO
              //
              TextFormField(
                controller: txtValor1,
                style: TextStyle(fontSize: 32),
                decoration: InputDecoration(
                  labelText: 'Valor 1',
                  border: OutlineInputBorder(),
                ),
                //
                // Validação
                //
                validator: (value) {
                  if (value == null) {
                    return 'Informe um valor';
                  } else if (value.isEmpty) {
                    return 'Informe um valor';
                  } else if (double.tryParse(value) == null) {
                    return 'Informe um valor NUMÉRICO';
                  }
                  //Retornar null significa que o campo
                  //foi validado com sucesso!
                  return null;
                },
              ),

              SizedBox(height: 30),

              TextFormField(
                controller: txtValor2,
                style: TextStyle(fontSize: 32),
                decoration: InputDecoration(
                  labelText: 'Valor 2',
                  border: OutlineInputBorder(),
                ),
                //
                // Validação
                //
                validator: (value) {
                  if (value == null) {
                    return 'Informe um valor';
                  } else if (value.isEmpty) {
                    return 'Informe um valor';
                  } else if (double.tryParse(value) == null) {
                    return 'Informe um valor NUMÉRICO';
                  }

                  //Retornar null significa que o campo
                  //foi validado com sucesso!
                  return null;
                },
              ),

              SizedBox(height: 30),

              //
              // BOTÃO
              //
              //ElevatedButton, OutlinedButton, TextButton
              Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade100,
                      foregroundColor: Colors.blue.shade900,
                      minimumSize: Size(10, 10),
                    ),
                    onPressed: () {
                      //
                      // Chamar os VALIDADORES
                      //
                      if (formKey.currentState!.validate()) {
                        //Os campos foram validados com sucesso!
                  
                        // recuperar as informações dos campos de texto
                  
                        setState(() {
                          //retornar o conteudo do campo valor 1
                          double v1 = double.parse(txtValor1.text);
                          //retornar o ocnteudo do campo valor 2
                          double v2 = double.parse(txtValor2.text);
                          double resultado = v1 + v2;
                  
                          //exibir o resultado
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Resultado: $resultado'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        });
                      }
                    },
                    child: Text(
                      'Soma',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade100,
                      foregroundColor: Colors.blue.shade900,
                      minimumSize: Size(20, 10),
                    ),
                    onPressed: () {
                      //
                      // Chamar os VALIDADORES
                      //
                      if (formKey.currentState!.validate()) {
                        //Os campos foram validados com sucesso!
                  
                        // recuperar as informações dos campos de texto
                  
                        setState(() {
                          //retornar o conteudo do campo valor 1
                          double v1 = double.parse(txtValor1.text);
                          //retornar o ocnteudo do campo valor 2
                          double v2 = double.parse(txtValor2.text);
                          double resultado = v1 * v2;
                  
                          //exibir o resultado
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Resultado: $resultado'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        });
                      }
                    },
                    child: Text(
                      'Multiplicação',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade100,
                      foregroundColor: Colors.blue.shade900,
                      minimumSize: Size(20, 10),
                    ),
                    onPressed: () {
                      //
                      // Chamar os VALIDADORES
                      //
                      if (formKey.currentState!.validate()) {
                        //Os campos foram validados com sucesso!
                  
                        // recuperar as informações dos campos de texto
                  
                        setState(() {
                          //retornar o conteudo do campo valor 1
                          double v1 = double.parse(txtValor1.text);
                          //retornar o ocnteudo do campo valor 2
                          double v2 = double.parse(txtValor2.text);
                          double resultado = v1 / v2;
                  
                          //exibir o resultado
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Resultado: $resultado'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        });
                      }
                    },
                    child: Text(
                      'Divisão',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
