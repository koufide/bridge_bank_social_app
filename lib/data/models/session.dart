import 'package:bridgebank_social_app/data/models/user.dart';
import 'package:flutter_login/flutter_login.dart';

import 'authorisation.dart';

class Session {
  User? user;
  Authorisation? authorisation;

  Session({this.user, this.authorisation});

  // create from json
  Session.fromJson(Map<String, dynamic> json) {
    if (json['user']) {
      user = User.fromJson(json['user'] as Map<String, dynamic>);
    }

    if (json['authorization']) {
      authorisation =
          Authorisation.fromJson(json['authorization'] as Map<String, dynamic>);
    }
  }
  // create to json
  Map<String, dynamic> toJson() {
    return {
      "user": user?.toJson(),
      "authorisation": authorisation?.toJson(),
    };
  }
}
