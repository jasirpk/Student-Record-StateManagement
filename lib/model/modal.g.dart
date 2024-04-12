// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modal.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NotesAdapter extends TypeAdapter<Notes> {
  @override
  final int typeId = 0;

  @override
  Notes read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Notes(
      image: fields[0] as String,
      userName: fields[1] as String,
      userContact: fields[2] as String,
      userAge: fields[3] as String,
      userRollNumber: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Notes obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.image)
      ..writeByte(1)
      ..write(obj.userName)
      ..writeByte(2)
      ..write(obj.userContact)
      ..writeByte(3)
      ..write(obj.userAge)
      ..writeByte(4)
      ..write(obj.userRollNumber);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
