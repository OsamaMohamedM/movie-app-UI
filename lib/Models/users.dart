class User
{
  String _name;
  String _pass;
  String _telphone;
  String _Email;
  String _ImageName;
  User(this._name,this._pass,this._telphone,this._Email,this._ImageName);

  String get name=>_name;
  String get pass=>_pass;
  String get tel=>_telphone;
  String get email=>_Email;

  String get ImageName => _ImageName;

  String get Email => _Email;

  String get telphone => _telphone;

  set telphone(String value) {
    _telphone = value;
  }

  set pass(String value) {
    _pass = value;
  }

  set name(String value) {
    _name = value;
  }

  set Email(String value) {
    _Email = value;
  }

  set ImageName(String value) {
    _ImageName = value;
  }
}

