// dados_globais.dart
import 'Regiao.dart';

final List<Regiao> _regioes = [];

List<Regiao> get regioes => _regioes;

void adicionarRegiao(Regiao r) {
  _regioes.add(r);
}
