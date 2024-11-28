import 'package:flutter/material.dart';
import 'main_01_segunda_tela.dart'; // Import da segunda tela
// import 'package:flutter/widgets.dart'; // classes que compoem os componentes da tela


main(){
  runApp(Projeto01App());
}

class Projeto01App extends StatelessWidget{

  const Projeto01App ({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Exemplo de navegação entre telas',
      theme: ThemeData(
        primarySwatch: Colors.grey, 
      ),
      home: Projeto01AppScreen(),
    );
  }
}

class Projeto01AppScreen extends StatefulWidget{
  const Projeto01AppScreen ({super.key});

  @override
  Projeto01AppState createState() => Projeto01AppState();
}

class Projeto01AppState extends State<Projeto01AppScreen>{
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

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              "Menu",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Tela Principal"),
              onTap: () {
                Navigator.pop(context); // fecha o drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.arrow_forward),
              title: Text('Segunda tela'),
              onTap: () {
                Navigator.pop(context); // fecha o drawer
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => Segunda_Tela_App01())
                );
              },
            )
          ],
        ),
      ),

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

