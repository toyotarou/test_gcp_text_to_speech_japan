import '../models/speech.dart';

class SpeechService {
  int index = 0;

  ///
  List<Speech> speechList = [
    //
    Speech(characterName: 'jap1', characterText: '...'),
    Speech(characterName: 'jap1', characterText: 'あめんぼ赤いなあいうえお'),
    Speech(characterName: 'jap2', characterText: '柿の木栗の木かきくけこ'),
    Speech(characterName: 'jap3', characterText: '大角豆に酢をかけさしすせそ'),
    Speech(characterName: 'jap4', characterText: '立ちましょラッパでたちつてと'),
    Speech(characterName: 'jap5', characterText: 'ナメクジのろのろなにぬねの'),
    Speech(characterName: 'jap6', characterText: '鳩ポッポほろほろはひふへほ'),
    Speech(characterName: 'jap7', characterText: 'まいまいネジ巻きまみむめも'),
    Speech(characterName: 'jap8', characterText: '焼き栗ゆで栗やいゆえよ'),
  ];

  ///
  void nextQuestion() {
    if (index < speechList.length - 1) {
      index++;
    }
  }

  ///
  String? getCharacterText() => speechList[index].characterText;

  ///
  String? getCharacterName() => speechList[index].characterName;

  ///
  bool isFinished() {
    if (index >= speechList.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  ///
  int getNumber() => index;

  ///
  void reset() => index = 0;
}
