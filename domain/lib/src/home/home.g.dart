// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RepoAdapter extends TypeAdapter<Repo> {
  @override
  final int typeId = 0;

  @override
  Repo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Repo(
      id: fields[0] as int,
      name: fields[1] as String,
      url: fields[2] as String,
      isFavorite: fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Repo obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.url)
      ..writeByte(3)
      ..write(obj.isFavorite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RepoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
