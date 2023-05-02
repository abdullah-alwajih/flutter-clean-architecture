// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommendation.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecommendationAdapter extends TypeAdapter<Recommendation> {
  @override
  final int typeId = 1;

  @override
  Recommendation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Recommendation(
      id: fields[0] as int,
      backdropPath: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Recommendation obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.backdropPath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecommendationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
