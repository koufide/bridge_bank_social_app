import 'package:bridgebank_social_app/data/models/session.dart';
import 'package:bridgebank_social_app/rest/backend_rest_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){

  test("Check login successful", ()async{

    final res = await BackendRestService()
        .signIn(email: "angebagui@adjemin.com",
        password: "123456789");

    print("Body Response => $res");

    expect(res is Session, true);

  });

  test("Check register successful", ()async{

    final res = await BackendRestService()
        .signUp(
        firstName: "Ange",
        lastName: "Bagui",
        email: "${DateTime.now().microsecond}@adjemin.com",
        password: "123456789");

    print("Body Response => $res");

    expect(res is Session, true);

  });


}