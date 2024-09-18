class Movie
{
  String _tittle ="";
  String _ImageName = "";
  String _Description ="";
  String _Director="";
  double _rating ;
  String _Genre="";
  String _YEAR="";
  String _Duration="";




  Movie(this._tittle, this._ImageName,this._Description, this._Director, this._Genre, this._YEAR,this._Duration,this._rating);
  String get tittle => _tittle;

  String get Description => _Description;

  String get Director => _Director;

  String get ImageName => _ImageName;

  String get Genre => _Genre;

  String get YEAR => _YEAR;

  double get rating => _rating;

  String get Duration => _Duration;
}

