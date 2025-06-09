import 'package:flutter/material.dart';
import 'regioes.dart';

class VerMapa extends StatelessWidget {
  const VerMapa({super.key});
  String direcaoToEmoji(String direcao) {
    switch (direcao.toLowerCase()) {
      case 'norte':
        return '⬆️';
      case 'sul':
        return '⬇️';
      case 'leste':
        return '➡️';
      case 'oeste':
        return '⬅️';
      case 'noroeste':
        return '↖️';
      case 'nordeste':
        return '↗️';
      case 'sudoeste':
        return '↙️';
      case 'sudeste':
        return '↘️';
      default:
        return '❓';
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text("Mapa Conceitual"),),
      body: Padding(
        padding:const EdgeInsets.all(16),
        child: regioes.isEmpty ? const Center(child: Text('Nenuma região cadastrada')) : GridView.builder(
          itemCount: regioes.length, gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 12,
            childAspectRatio: 1.3,
          ),
          itemBuilder: (context, index){
            final regiao = regioes[index];
            return Card(
              elevation:4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            regiao.nome,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text('${regiao.velocidade} cm/ano'),
                          const SizedBox(height: 4),
                          Text(
                            '${direcaoToEmoji(regiao.direcao)} ${regiao.direcao}',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}