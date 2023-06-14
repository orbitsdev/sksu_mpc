import 'package:get/get.dart';
import 'package:sksumpc/controllers/auth/auth_controller.dart';
import 'package:sksumpc/controllers/file/file_controller.dart';
import 'package:sksumpc/controllers/member/member_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController(), permanent: true);
    Get.put(FileController(), permanent: true);
    Get.put(MemberController(), permanent: true);
  }
}
