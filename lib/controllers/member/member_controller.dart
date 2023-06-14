import 'package:get/get.dart';
import 'package:sksumpc/api/api.dart';
import 'package:sksumpc/api/api_http.dart';
import 'package:sksumpc/models/member.dart';

class MemberController extends GetxController {
  List<Member> members = [];
  var isLoading = false.obs;
  var hasMoreMembers = false.obs;
  var offset = 0;
  var limit = 10;
  Future<void> fetchMember() async {

    isLoading(true);
    Future.delayed(Duration(seconds:2), (){
      isLoading(false);
    });
    print('fetching member');
    //  final response =   await ApiHttp().getRequest("${Api.members}/$offset/$limit");

    // print(response.data['data']);
  }
}
