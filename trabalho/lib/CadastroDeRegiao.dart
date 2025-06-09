import 'package:flutter/material.dart';

class CadastroDeRegiao extends StatefulWidget {
  const CadastroDeRegiao({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _CadastroDeRegiaoState createState() => _CadastroDeRegiaoState();
}

class _CadastroDeRegiaoState extends State<CadastroDeRegiao> {
  final controller = TextEditingController();
  final velocidadeControl = TextEditingController();
  String? direcaoSelect;
  final List<String> direcoes = [
    'Norte',
    'Sul',
    'Leste',
    'Oeste',
    'Nordeste',
    'Noroeste',
    'Sudeste',
    'Sudoeste',
  ];

  void salvarInfo() {
    final nome = controller.text;
    final velocidade = velocidadeControl.text;
    final direcao = direcaoSelect;

    if (nome.isNotEmpty && velocidade.isNotEmpty && direcao != null) {
      // ignore: avoid_print
      print('região: $nome \n velocidade:$velocidade \n direção: $direcao \n');
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Região $nome salva!')));

      controller.clear();
      velocidadeControl.clear();
      setState(() {
        direcaoSelect = null;
      });
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Falta de informação!')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('cadastrar uma Região')),
      body: Padding(
        padding:EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(labelText: "nome da região"),
            ),

            TextField(
              controller: velocidadeControl,
              decoration: InputDecoration(labelText: "velocidade (cm por ano)"),
              keyboardType: TextInputType.number,
            ),

            DropdownButton<String>(
              value: direcaoSelect,
              hint: Text("Selecione uma direção"),
              isExpanded: true,
              items: direcoes.map((direcaomap) {
                return DropdownMenuItem(
                  value: direcaomap,
                  child: Text(direcaomap),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  direcaoSelect = newValue;
                });
              },
            ),

            SizedBox(height:20),
            ElevatedButton(
              onPressed: salvarInfo,
              child: Text('Salvar Informações'),
            )
          ]
        )
      ),
    );
  }
}
