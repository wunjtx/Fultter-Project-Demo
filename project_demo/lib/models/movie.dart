
class Movie {
  int movieId;
  String actorName1;
  String actorName2;
  String titleCn;
  String type;
  String directorName;
  int rYear;
  String img;
  String commonSpecial ;

  Movie(
      {this.movieId,
      this.rYear,
      this.titleCn,
      this.commonSpecial,
      this.img,
      this.type,
      this.directorName,
      this.actorName1,
      this.actorName2});

  Movie.fromJSON(Map<String, dynamic> json) {
    this.movieId = json['movieId'];
    this.rYear = json['rYear'];
    this.titleCn = json['titleCn'];
    this.commonSpecial = json['commonSpecial'];
    this.img =json['img'];
    this.type = json['type'] ;
    this.directorName = json['directorName'] ;
    this.actorName1 = json['actorName1'] ;
    this.actorName2 = json['actorName2'];
  }
}
