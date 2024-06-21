import 'package:bridgebank_social_app/rest/backend_impl_service.dart';
import 'package:flutter_test/flutter_test.dart';


void main(){

  test("check login successful", ()async{
    final res = await BackendImplService()
    .signIn(email: "angebagui@adjemin.com", password: "123456789");

    print("Body response ==> $res");
    expect(res is String, true);

  });

  // test("check login failed", (){
  //   final res = BackendImplService()
  //       .signIn(email: "angebagui@adjemin.com", password: "");
  //
  //   expect(res is String, true);
  //
  // });


}