class Tournament {

  late String _name;

  Tournament(this._name);

  String get name => _name;

  set name(String value) {
    _name = value;
  }
}