class RegisterResponseModel {
  String? email;
  String? name;
  String? password;
  String? password2;
  String? address;

  RegisterResponseModel(
      {this.email, this.name, this.password, this.password2, this.address});

  RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    password = json['password'];
    password2 = json['password2'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['name'] = this.name;
    data['password'] = this.password;
    data['password2'] = this.password2;
    data['address'] = this.address;
    return data;
  }
}