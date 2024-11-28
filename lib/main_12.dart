import 'package:flutter/material.dart';
import 'main_01_segunda_tela.dart'; // Importe a Segunda_Tela_App

main() {
  runApp(Projeto01App());
}

//ALTERAÇÕES PARA PERMITIR ACESSAR SEGUNDA TELA
class Projeto01App extends StatelessWidget {
  const Projeto01App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //Desativa a tarja DEBUG
      title: 'Exemplo navegação duas telas',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: Projeto01AppScreen(),
    );
  }
}

class Projeto01AppScreen extends StatefulWidget {
  const Projeto01AppScreen({super.key});
  @override
  Projeto01AppState createState() => Projeto01AppState();
}

//class Projeto01App extends StatelessWidget {
class Projeto01AppState extends State<Projeto01AppScreen> {
  //const Projeto01App({super.key});
  String texto = 'As Melhores Turmas DS 8,9,10';
  String localSensor = ''; //Armazena o local do Sensor

  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose(); //Libera o controlador quando não for mais necessário
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('App Bar da Turma B'),
          backgroundColor: const Color.fromARGB(
              255, 119, 118, 118), //Cor de fundo cinza claro
        ),
        //Aqui começa o menu sandwiche
        drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 90, 90, 91),
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Tela Principal'),
              onTap: () {
                Navigator.pop(context); // Fecha o drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.arrow_forward),
              title: Text('Segunda Tela'),
              onTap: () {
                Navigator.pop(context); // Fecha o drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Segunda_Tela_App01()),
                );
              },
            ),
          ],
        ),
      ),
        body: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                texto,
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20), //Espaçamento entre o texto e o botão
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0), // Espaço lateral
                child: TextField(
                  controller: _controller, //Controlador para captura do texto
                  decoration: InputDecoration(
                    labelText: 'Local do Sensor', //Nome do Campo de digitação
                    border: OutlineInputBorder(),
                  ),
                  maxLength: 20, //Limite de caracteres
                  onChanged: (value) {
                    localSensor = value; //Atualiza a variavael ao digitar
                  },
                ),
              ),

              ElevatedButton(
                onPressed: () {
                  setState(() {
                    texto = localSensor.isNotEmpty
                        ? 'Local do Sensor: $localSensor' //Atualiza o texto com o lcoal do sensor
                        : 'Por favor, insira o local do sensor!';
                  });
                }, //Adicionaremos uma função do botão aqui
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(200, 50),
                ),
                child: Text('Clique Aqui'),
              )
            ],
          ),
        ),
        //Acrescentando o Rodapé
        bottomNavigationBar: BottomAppBar(
          color:
              const Color.fromARGB(255, 53, 52, 52), // Cor de fundo cinza claro
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Aqui é o rodapé', textAlign: TextAlign.center)),
        ),
      );
    //);
  }
}
