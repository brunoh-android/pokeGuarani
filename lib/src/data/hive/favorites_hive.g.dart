// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavoritesHiveAdapter extends TypeAdapter<FavoritesHive> {
  @override
  final int typeId = 1;

  @override
  FavoritesHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavoritesHive(
      id: fields[0] as int,
      name: fields[1] as String,
      img: fields[2] as String,
      type: fields[3] as String,
      weight: fields[4] as double,
    );
  }

  @override
  void write(BinaryWriter writer, FavoritesHive obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.img)
      ..writeByte(3)
      ..write(obj.type)
      ..writeByte(4)
      ..write(obj.weight);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoritesHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
