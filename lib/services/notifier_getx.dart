import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:studentlist_state/model/box.dart';
import 'package:studentlist_state/model/modal.dart';

class ListViewController extends GetxController {
  final Box<Notes> dataBox = Boxes.getData();
  final RxString searchQuery = ''.obs;
  final RxBool isGridView = false.obs;

  List<Notes> get filteredData => dataBox.values
      .where((student) => student.userName
          .toLowerCase()
          .contains(searchQuery.value.toLowerCase()))
      .toList();

  void setSearchQuery(String value) {
    searchQuery.value = value;
  }

  void toggleViewMode() {
    isGridView.value = !isGridView.value;
  }
}
