class Authorisation {
  String? token;
  String? bearer;

  Authorisation({this.token, this.bearer});

  Authorisation.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    bearer = json['type'];
  }

  Map<String, dynamic> toJson(){
    return {
      "token":token,
      "bearer":bearer,
    };
  }


}
