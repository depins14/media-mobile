class SoalModel {
  late int? id;
  late String? pertanyaan;
  late String? option1;
  late String? option2;
  late String? option3;
  late String? option4;
  late String? option5;
  late String? key;

  SoalModel({
    this.id,
    this.pertanyaan,
    this.option1,
    this.option2,
    this.option3,
    this.option4,
    this.option5,
    this.key,
  });

  SoalModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pertanyaan = json['pertanyaan'];
    option1 = json['option1'];
    option2 = json['option2'];
    option3 = json['option3'];
    option4 = json['option4'];
    option5 = json['option5'];
    key = json['key'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'pertanyaan': pertanyaan,
      'option1': option1,
      'option2': option2,
      'option3': option3,
      'option4': option4,
      'option5': option5,
      'key': key,
    };
  }
}
