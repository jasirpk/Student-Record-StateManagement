import 'package:hive/hive.dart';
import 'package:studentlist_state/model/modal.dart';

class Boxes {
  static Box<Notes> getData() => Hive.box<Notes>('notes');
}
