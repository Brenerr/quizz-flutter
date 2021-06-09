import 'perguntas.dart';

class Helper {
  int _numeroDaQuestaoAtual = 0;

  List<Perguntas> _bancoDePerguntas = [
    Perguntas('Qual seu tenista favorito?', 'Rafael Nadal', 'Roger Federer'),
    Perguntas('Qual seu carro favorito?', 'Ferrari ', 'Lamborghini'),
    Perguntas('Qual seu jogador de futebol favorito?', 'Messi', 'Cristiano Ronaldo'),
    Perguntas('Qual sua cerveja favorita?', 'Brahma', 'Skol'),
    Perguntas('Qual seu estilo musical favorito?', 'Rock', 'Funk'),
    Perguntas('Qual seu console favorito?', 'Playstation', 'Xbox'),
    Perguntas('Qual sua série favorita?', 'Friend', 'How I Met Your Mother'),
    Perguntas('Qual sua marca favorita?', 'Adidas', 'Nike'),
    Perguntas('Qual seu refrigerante favorito?', 'Coca Cola', 'Pepsi'),
    Perguntas('Qual seu fast food favorito?', 'McDonalds', 'Burger King'),
  ];

  void proximaPergunta() {
    if (_numeroDaQuestaoAtual < _bancoDePerguntas.length - 1) {
      _numeroDaQuestaoAtual++;
    }
  }

  String obterQuestao() {
    return _bancoDePerguntas[_numeroDaQuestaoAtual].questao;
  }

  String obterOpcao1() {
    return _bancoDePerguntas[_numeroDaQuestaoAtual].opcao1;
  }

  String obterOpcao2() {
    return _bancoDePerguntas[_numeroDaQuestaoAtual].opcao2;
  }
  
  confereFimDaExecucao() {
    if (_numeroDaQuestaoAtual >= _bancoDePerguntas.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  resetarQuiz() {
    _numeroDaQuestaoAtual = 0;
  }
}