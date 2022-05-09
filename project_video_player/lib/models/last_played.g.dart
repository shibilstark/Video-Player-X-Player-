// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'last_played.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LastPlayedModelAdapter extends TypeAdapter<LastPlayedModel> {
  @override
  final int typeId = 3;

  @override
  LastPlayedModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LastPlayedModel(
      lastPlayedVideo: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LastPlayedModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.lastPlayedVideo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LastPlayedModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
