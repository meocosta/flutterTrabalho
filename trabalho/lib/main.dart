import 'package:flutter/material.dart';
import 'CadastroDeRegiao.dart';
import 'verMapa.dart';
import 'VerMatriz.dart';
import 'Regiao.dart';

void main() {
  runApp(const PlacasApp());
}

class PlacasApp extends StatelessWidget {
  const PlacasApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Placas Tectônicas App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFFFA200)),
      ),
      home: HomePlacas(),
    );
  }
}

class HomePlacas extends StatefulWidget {
  const HomePlacas({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _HomePlacasState createState() => _HomePlacasState();
}

class _HomePlacasState extends State<HomePlacas> {
  void loadCadastro() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CadastroDeRegiao()),
    );
  }

  void verMapa() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const VerMapa()),
    );
  }

  /*void verMatriz(){
    Navigator.push(
      context, MaterialPageRoute(builder:(context) => const VerMatriz(),)
    );
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bracas - as placas tectônicas no Brasil'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            OutlinedButton(
              onPressed: loadCadastro,
              child: const Text('Cadastrar nova Região'),
            ),

            OutlinedButton(
              onPressed: verMapa,
              child: const Text('Ver mapa conceitual'),
            ),

            OutlinedButton(
              onPressed: verMatriz,
              child: const Text('Ver matriz de deslocamento'),
            ),
          ],
        ),
      ),
    );
  }
}
