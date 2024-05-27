import 'dart:io';
import 'package:translator/translator.dart';

void main() async {
  final GoogleTranslator googleTranslator = GoogleTranslator();

  String sourceLanguage = '';
  String targetLanguage = '';

  String selectLanguage(String prompt) {
    print(prompt);
    return stdin.readLineSync()?.toLowerCase() ?? '';
  }
  
  void checkAndSaveLanguages() {
      sourceLanguage = selectLanguage('Выберите язык исходного текста: ru(Русский), en(Английски), ky(Кыргызский)');
      targetLanguage = selectLanguage('Выберите язык, на который нужно перевести: ru(Русский), en(Английски), ky(Кыргызский)');
    }

  void translateText() async {
    checkAndSaveLanguages();
    print('Введите текст для перевода:');
    var sourceText = stdin.readLineSync().toString();
    try {
      final translatedText = await googleTranslator.translate(sourceText, from: sourceLanguage, to: targetLanguage);
    print('Перевод: ');
    print(translatedText);
    } catch (e) {
      print('Ошибка при переводе: $e');
    }
  }
  
  void mainMenu(){
    print('Здравствуйте! Вы в Главном меню.');
    checkAndSaveLanguages();

    print('Что вы хотите сделать?');
    print('1. Перевести текст');
    print('2. Выбрать другие языки');
    print('3. Выйти из программы');

    var choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        translateText();
        break;
      case '2':
        sourceLanguage == null;
        targetLanguage == null;
        mainMenu();
        break;
      case '3':
        print('Спасибо за использование программы. До свидания!');
        break;
      default:
        print('Некорректный ввод. Попробуйте еще раз.');
        mainMenu(); 
    }
  }
  mainMenu();
}
