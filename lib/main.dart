import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:studentlist_state/model/modal.dart';
import 'package:studentlist_state/screens/splash_screen.dart';
import 'package:get/get.dart';
import 'package:studentlist_state/services/provider.dart';
import 'package:studentlist_state/services/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(NotesAdapter());
  await Hive.openBox<Notes>('notes');

  Get.put(Service());

  runApp(StudentRecord());
}

class StudentRecord extends StatelessWidget {
  const StudentRecord({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileDetailProvider(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                seedColor: Color.fromARGB(255, 83, 64, 112))),
        home: SpalashScreen(),
      ),
    );
  }
}
