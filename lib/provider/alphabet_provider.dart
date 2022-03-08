import 'package:flutter/foundation.dart';


class AlphabetProvider with ChangeNotifier, DiagnosticableTreeMixin{
  String? _word;


  set AssignWord (eword){
    return _word = eword;
  }
  String get word => _word!;
  }

class PositionProvider with ChangeNotifier,DiagnosticableTreeMixin{
  String? _position;
  set AssignPosition(wordv) {
    return _position = wordv;
  }
  String get position => _position!;
}