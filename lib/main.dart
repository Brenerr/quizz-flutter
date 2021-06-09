import 'package:flutter/material.dart';
import 'helper.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Helper helper = Helper();

void main() => runApp(QuizzApp());

class QuizzApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Atividade Quizz'),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<String> respostas = [];

  void armazenarRespostas(String respostaSelecionadaPeloUsuario) {
    
    setState(() {
      if (helper.confereFimDaExecucao() == true) {

        Alert(
          context: context,
          title: 'Fim do Quiz!',
          desc: '$respostas',
        ).show();

        helper.resetarQuiz();

        respostas.clear();
      } else {
        respostas.add(respostaSelecionadaPeloUsuario);
        helper.proximaPergunta();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                helper.obterQuestao(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                armazenarRespostas(helper.obterOpcao1());
              },
              child: Text(helper.obterOpcao1()),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: 
            
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                armazenarRespostas(helper.obterOpcao2());
              },
              child: Text(helper.obterOpcao2()),
            ),
          ),
        ),
      ],
    );
  }

}
