class User {
  int? id;
  String? firstName;
  String?lastName;
  String? email;
  String? photo;
  DateTime? createdAt;
  DateTime? updatedAt;
//DateTime? deletedAt;

  User({this.id, this.firstName, this.lastName, this.email, this.photo,
      this.createdAt, this.updatedAt});

  User.fromJson(Map<String, dynamic> json){
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    photo = json['photo'];

    if(json['created_at'] != null){
      createdAt = DateTime.parse(json['created_at']);
    }

    if(json['updated_at'] != null){
      updatedAt = DateTime.parse(json['updated_at']);
    }


  } // User.fromJson

Map<String, dynamic> toJson(){
    return {
      "id":id,
      "lastName":lastName,
      "firstName":firstName,
      "photo":photo,
      "email":email,
      "createdAt":createdAt,
      "updatedAt":updatedAt
    };
}
   
}