
class Pest{
  String crop;
  String pest;
  String description;

  Pest({this.crop, this.pest, this.description});

  Pest.fromJson(Map<String, dynamic> json){
    crop = json['crop'];
    pest = json['pest'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['crop'] = this.crop;
    data['pest'] = this.pest;
    data['description'] = this.description;
    return data;
  }
}