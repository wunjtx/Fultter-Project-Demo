
class City {
  int id;
  String n;
  City(
      {this.id,
      this.n,
 });

  City.fromJSON(Map<String, dynamic> json) {
    this.id = json['id'];
    this.n = json['n'];
  }
}



class CityList {
  List<City> citilist;

  CityList(
      {this.citilist,
   });

  CityList.fromJSON(Map<String, dynamic> json) {

    if (json['p'] != null) {
      citilist = List<City>();
      json['p'].forEach((v) {
        citilist.add(City.fromJSON(v));
      });
    }

  }
}
