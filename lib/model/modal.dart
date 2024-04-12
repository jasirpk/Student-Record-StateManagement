import 'package:hive/hive.dart';
part 'modal.g.dart';

@HiveType(typeId: 0)
class Notes extends HiveObject {
  @HiveField(0)
  String image;

  @HiveField(1)
  String userName;

  @HiveField(2)
  String userContact;

  @HiveField(3)
  String userAge;

  @HiveField(4)
  String userRollNumber;

  Notes(
      {required this.image,
      required this.userName,
      required this.userContact,
      required this.userAge,
      required this.userRollNumber});
}
