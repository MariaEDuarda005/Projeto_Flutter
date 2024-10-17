import 'package:flutter/material.dart';
import 'main_11.dart';

class Segunda_Tela_App extends StatelessWidget {
  const Segunda_Tela_App({super.key});
    
  @override  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sensores Cadastrados"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Aqui serão listados os sensores cadastrados.",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Volta para a tela anterior
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => Projeto01App())
                );
              },
              child: const Text("Voltar para Tela Principal"),
            ),
          ],
        ),
      ),
    );
  }
}
