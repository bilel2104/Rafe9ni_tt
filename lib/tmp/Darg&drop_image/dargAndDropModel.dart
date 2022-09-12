class ItemModel {
  String? name;
  String? value;
  late String imgurl;
  bool accepting = false;

  ItemModel(
      {this.name, this.value, required this.imgurl, this.accepting = false});

  ItemModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    value = json['value'];
    imgurl = json['imgurl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['value'] = this.value;
    data['imgurl'] = this.imgurl;
    return data;
  }
}
