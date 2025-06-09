import 'package:flutter/material.dart';
import 'Regiao.dart';
import 'regioes.dart';

class VerMapa extends StatefulWidget {
  final List<Regiao>? regioes;

  const VerMapa({super.key, this.regioes});

  @override
  _VerMapaState createState() => _VerMapaState();
}

class _VerMapaState extends State<VerMapa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tabela de Regiões')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Table(
          border: TableBorder.all(),
          columnWidths: const {
            0: FixedColumnWidth(120),
            1: FixedColumnWidth(100),
            2: FixedColumnWidth(100),
          },
          children: [
            TableRow(
              decoration: BoxDecoration(color: Color(0xffbecdf6)),
              children: const [
                SizedBox(),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Vetores',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Direção',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            for (final regiao in regioes ?? [])
              TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(regiao.nome),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(regiao.velocidade.toString()),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(regiao.direcao),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
