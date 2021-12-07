class User {
  String? id;
  String? email;
  String? name;
  //Map<String, List<String>>? userHistoryCoin;
  User(
    this.id,
    this.email,
    this.name,
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    // if (this.userHistoryCoin != null) {
    //   data['userHistoryCoin'] = this.userHistoryCoin.toJson();
    // }
    return data;
  }
}
