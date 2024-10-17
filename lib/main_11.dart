import 'package:flutter/material.dart';
import 'main_01_segunda_tela.dart'; // Import da segunda tela


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

  String texto = "";
  String localSensor = ''; // armazena o texto do sensor
  String tipoSensor = '';
  String macAdress = '';
  double? latitude; // ? - pode assumir valor nulo
  double? longitude;
  String responsavel = '';
  String observacao = '';
  String unidadeMedida = '';
  bool statusOperacional = true;

  // TextEditingController -> vai controlar as caixas de texto 
  final TextEditingController _controller = TextEditingController(); // final -> não sabe do valor antes de compilar | _ -> é para deixar privado, essa variabel só serve para o instaciamento dessa classe
  final TextEditingController _tipoController = TextEditingController();
  final TextEditingController _macAdressController = TextEditingController();
  final TextEditingController _latitudeController = TextEditingController();
  final TextEditingController _longitudeController = TextEditingController();
  final TextEditingController _responsavelController = TextEditingController();
  final TextEditingController _observacaoController = TextEditingController();
  final TextEditingController _unidadeMedida = TextEditingController();

  @override
  // boa pratica para liberar os recursos de memoria que são usado no TextEditingController
  void dispose() {
    _controller.dispose();
    _tipoController.dispose();
    _macAdressController.dispose();
    _latitudeController.dispose();
    _longitudeController.dispose();
    _responsavelController.dispose();
    _observacaoController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context)  {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar:AppBar(
        title: const Text("App da Turma A", style: TextStyle(color: Colors.white),),
        backgroundColor: const Color.fromARGB(255,64,60,134),
      ),

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
                  MaterialPageRoute(builder: (context) => Segunda_Tela_App())
                );
              },
            )
          ],
        ),
      ),

      body: SingleChildScrollView (
        child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          Text("Construindo App da Turma", style: const TextStyle(fontSize: 24)), // qualquer coisa dar ctrl + c
          const SizedBox(height: 20),

          // caixa de texto local sensor
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

          const SizedBox(height: 10), // para dar espaço entre um campo de outro

          // caixa de texto tipo de sensor
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0), // espaço lateral
            child: TextField(
              controller: _tipoController, // Controlador para capturar o texto
              decoration: const InputDecoration(
                labelText: "Tipo de sensor",
                border: OutlineInputBorder(),
              ),
              maxLength: 20, // limite de caracteres para digitação
              onChanged: (value){
                tipoSensor = value; // atualiza a variavel ao digitar
              },
            ),
          ),

          const SizedBox(height: 10), // para dar espaço entre um campo de outro

          // caixa de texto mac adress
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0), // espaço lateral
            child: TextField(
              controller: _macAdressController, // Controlador para capturar o texto
              decoration: const InputDecoration(
                labelText: "Mac Adress",
                border: OutlineInputBorder(),
              ),
              maxLength: 14, // limite de caracteres para digitação
              onChanged: (value){
                macAdress = value; // atualiza a variavel ao digitar
              },
            ),
          ),

          const SizedBox(height: 10), // para dar espaço entre um campo de outro

          // caixa de texto latitude
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0), // espaço lateral
            child: TextField(
              controller: _latitudeController, // Controlador para capturar o texto
              decoration: const InputDecoration(
                labelText: "Latitude",
                border: OutlineInputBorder(),
              ),
              maxLength: 20, // limite de caracteres para digitação
              onChanged: (value){
                latitude = double.tryParse(value); // atualiza a variavel ao digitar
              },
            ),
          ),

          const SizedBox(height: 10), // para dar espaço entre um campo de outro

          // caixa de texto longitude
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0), // espaço lateral
            child: TextField(
              controller: _longitudeController, // Controlador para capturar o texto
              decoration: const InputDecoration(
                labelText: "Longitude",
                border: OutlineInputBorder(),
              ),
              maxLength: 20, // limite de caracteres para digitação
              onChanged: (value){
                longitude = double.tryParse(value); // atualiza a variavel ao digitar
              },
            ),
          ),

          const SizedBox(height: 10), // para dar espaço entre um campo de outro

          // caixa de texto responsavel
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0), // espaço lateral
            child: TextField(
              controller: _responsavelController, // Controlador para capturar o texto
              decoration: const InputDecoration(
                labelText: "Responsavel",
                border: OutlineInputBorder(),
              ),
              maxLength: 20, // limite de caracteres para digitação
              onChanged: (value){
                responsavel = value; // atualiza a variavel ao digitar
              },
            ),
          ),

          const SizedBox(height: 10), // para dar espaço entre um campo de outro

          // Campo do status operaciona
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                const Text("Status Operacional"),
                Switch(
                  value: statusOperacional, 
                  onChanged: (value) {
                    setState(() {
                      statusOperacional = value;
                    });
                  },
                ),
              ],
            ),
          ),

          // caixa de texto observação
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0), // espaço lateral
            child: TextField(
              controller: _observacaoController, // Controlador para capturar o texto
              decoration: const InputDecoration(
                labelText: "Observação",
                border: OutlineInputBorder(),
              ),
              maxLength: 100, // limite de caracteres para digitação
              onChanged: (value){
                observacao = value; // atualiza a variavel ao digitar
              },
            ),
          ),

          const SizedBox(height: 10), // para dar espaço entre um campo de outro

          // caixa de unidade de medida
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0), // espaço lateral
            child: TextField(
              controller: _unidadeMedida, // Controlador para capturar o texto
              decoration: const InputDecoration(
                labelText: "Unidade de Medida",
                border: OutlineInputBorder(),
              ),
              maxLength: 20, // limite de caracteres para digitação
              onChanged: (value){
                unidadeMedida = value; // atualiza a variavel ao digitar
              },
            ),
          ),

          const SizedBox(height: 20), // para dar espaço entre um campo de outro

          // Botão
          ElevatedButton(
            onPressed: () {
              setState(() {
                texto = localSensor.isNotEmpty // se não for vazia 
                // atualiza do texto
                  ? 'Local: $tipoSensor \n' 
                    'Tipo: $tipoSensor \n'
                    'Mac Adress: $macAdress \n'
                    'Latitude: $latitude \n'
                    'Longitude: $longitude \n'
                    'Responsavel: $responsavel \n'
                    'Observação: $observacao'
                  : 'Por favor insira todos os dados'; // mensagem se não escrever nada

              });

              _controller.clear();
              _tipoController.clear();
              _macAdressController.clear();
              _latitudeController.clear();
              _longitudeController.clear();
              _responsavelController.clear();
              _observacaoController.clear();

              localSensor = '';
              tipoSensor = '';
              macAdress = '';
              latitude = 0;
              longitude = 0;
              responsavel = '';
              observacao = '';
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(200,50),
            ),
            child: const Text('Clique aqui'),
             ),

            const SizedBox(height: 20), // para dar espaço entre um campo de outro

            Text(texto, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 20),

        ],
      )
      ),

    //acrescentar o rodape
    bottomNavigationBar: const BottomAppBar(
      color: Color.fromARGB(255, 158, 155, 155),//Cor de fundo cinza claro
      child:  Padding(
      padding: EdgeInsets.all(16.0),
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

