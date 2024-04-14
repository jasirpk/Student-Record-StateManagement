import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:studentlist_state/model/box.dart';
import 'package:studentlist_state/model/modal.dart';

class ListViewController extends GetxController {
  RxList<Notes> studentList = <Notes>[].obs;
  final Box<Notes> dataBox = Boxes.getData();
  final RxString searchQuery = ''.obs;
  final RxBool isGridView = false.obs;

  @override
  void onInit() {
    super.onInit();

    fetchData();
  }

  Future<void> fetchData() async {
    try {
      // Clear the existing list before fetching new data
      studentList.clear();
      // Fetch data from Hive or any other data source
      List<Notes> data = dataBox.values.toList();
      // Update studentList with the fetched data
      studentList.addAll(data);
    } catch (e) {
      // Handle error
      print('Error fetching data: $e');
    }
  }

  List<Notes> get filteredData {
    return studentList
        .where((student) => student.userName
            .toLowerCase()
            .contains(searchQuery.value.toLowerCase()))
        .toList();
  }

  void setSearchQuery(String value) {
    searchQuery.value = value;
  }

  void toggleViewMode() {
    isGridView.value = !isGridView.value;
  }
}
