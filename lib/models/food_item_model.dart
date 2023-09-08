class FoodItem {
  String? title;
  String? desc;
  String? price;
  String? asset;

  FoodItem({this.title, this.desc, this.price, this.asset});

  FoodItem.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    desc = json['desc'];
    price = json['price'];
    asset = json['asset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['desc'] = desc;
    data['price'] = price;
    data['asset'] = asset;
    return data;
  }
}
