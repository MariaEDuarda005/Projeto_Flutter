import 'package:flutter/material.dart';

main(){

  // chama a classe
  runApp(new Projeto01App());

}

class Projeto01App extends StatelessWidget {
  
  Projeto01App({super.key}); 

  Widget build(BuildContext){
    // retorna um widget da home com um texto

    // Scaffold -> tem três partes (header, body e footer)

    return MaterialApp(
      home: Scaffold(
        // appBar - atributo
        // AppBar - com o A maiusculo é uma nova classe com novos atributos
        appBar: AppBar(
          centerTitle: true,
          title: const Text("App da Turma A", 
          style: TextStyle(color: Color.fromARGB(255, 172, 193, 204), fontSize: 25, fontWeight: FontWeight.bold)),
          backgroundColor: const Color.fromARGB(255, 25, 6, 54),
        ),
        body: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // alinhar tudo que está dentro do body
          children: [
            const Text(
              "Construindo App da Turma", 
              style: TextStyle(fontSize: 30),
            ),
          const SizedBox(height: 20), // espaço entre o texto e o botão


          TextButton(
              onPressed: () {},
              child: const Text(
                'TextButton Ativo',
                style: TextStyle(color: Colors.green),
              ),
            ),
          TextButton(
              onPressed: null,
              child: Text(
                'TextButton Inativo',
                style: TextStyle(color: Colors.red[200]),
              ),
            ), 

            
          ], // componentes internos
        ),
        ),
      ),
    );
  }

}