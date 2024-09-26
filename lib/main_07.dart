import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart'; // classes que compoem os componentes da tela


main(){
  runApp(Projeto01App());
}

class Projeto01App extends StatefulWidget{
  const Projeto01App ({super.key});
  @override
  Projeto01AppState createState() => Projeto01AppState();
}

class Projeto01AppState extends State<Projeto01App>{

  String texto = "Construindo App da Turma";
  String localSensor = ''; // armazena o texto do sensor

  // TextEditingController -> vai controlar as caixas de texto 
  final TextEditingController _controller = TextEditingController(); // final -> não sabe do valor antes de compilar | _ -> é para deixar privado, essa variabel só serve para o instaciamento dessa classe

  @override
  Widget build(BuildContext context)  {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar:AppBar(
        title: const Text("App da Turma A", style: TextStyle(color: Colors.white),),
        backgroundColor: Color.fromARGB(255,64,60,134),
      ) ,

      body: Center (
        child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          Text(texto, style: TextStyle(fontSize: 24)),
          SizedBox(height: 20),

          // caixa de texto
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0), // espaço lateral
            child: TextField(
              controller: _controller, // Controlador para capturar o texto
              decoration: const InputDecoration(
                labelText: "Local do sensor",
                border: OutlineInputBorder(),
              ),
              maxLength: 20, // limite de caracteres para digitação
              onChanged: (value){
                localSensor = value; // atualiza a variavel ao digitar
              },
            ),
          ),

          ElevatedButton(
            onPressed: () {
              setState(() {
                texto = localSensor.isNotEmpty // se não for vazia 
                  ? 'Local do sensor: $localSensor' // atualiza do texto
                  : 'Por favor insira um local do sensor'; // mensagem se não escrever nada

              });
              _controller.clear();
              localSensor = '';
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(200,50),
            ),
            child: Text('Clique aqui'),
             )

        ],
      )
      ),

    //acrescentar o rodape
    bottomNavigationBar: const BottomAppBar(
      color: Color.fromARGB(255, 158, 155, 155),//Cor de fundo cinza claro
      child:  Padding(
      padding: const EdgeInsets.all(16.0),
      child:Text(
        'Aqui é o Rodapé',
        textAlign: TextAlign.center,
      ),

      ),
    ),
    ),
    );
}
}

