import 'package:get/get.dart';

class BookmarkController extends GetxController {
  final editBookmark = false.obs;

  void toggleEdit() {
    editBookmark.value = !editBookmark.value;
  }
}
