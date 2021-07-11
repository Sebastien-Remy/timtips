import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'partners_record.g.dart';

abstract class PartnersRecord
    implements Built<PartnersRecord, PartnersRecordBuilder> {
  static Serializer<PartnersRecord> get serializer =>
      _$partnersRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'owner_id')
  DocumentReference get ownerId;

  @nullable
  String get name;

  @nullable
  double get units;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(PartnersRecordBuilder builder) => builder
    ..name = ''
    ..units = 0.0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('partners');

  static Stream<PartnersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  PartnersRecord._();
  factory PartnersRecord([void Function(PartnersRecordBuilder) updates]) =
      _$PartnersRecord;

  static PartnersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createPartnersRecordData({
  DocumentReference ownerId,
  String name,
  double units,
}) =>
    serializers.toFirestore(
        PartnersRecord.serializer,
        PartnersRecord((p) => p
          ..ownerId = ownerId
          ..name = name
          ..units = units));
