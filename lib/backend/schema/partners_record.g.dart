// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partners_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PartnersRecord> _$partnersRecordSerializer =
    new _$PartnersRecordSerializer();

class _$PartnersRecordSerializer
    implements StructuredSerializer<PartnersRecord> {
  @override
  final Iterable<Type> types = const [PartnersRecord, _$PartnersRecord];
  @override
  final String wireName = 'PartnersRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, PartnersRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.ownerId;
    if (value != null) {
      result
        ..add('owner_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DocumentReference)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.units;
    if (value != null) {
      result
        ..add('units')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DocumentReference)));
    }
    return result;
  }

  @override
  PartnersRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PartnersRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'owner_id':
          result.ownerId = serializers.deserialize(value,
                  specifiedType: const FullType(DocumentReference))
              as DocumentReference;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'units':
          result.units = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value,
                  specifiedType: const FullType(DocumentReference))
              as DocumentReference;
          break;
      }
    }

    return result.build();
  }
}

class _$PartnersRecord extends PartnersRecord {
  @override
  final DocumentReference ownerId;
  @override
  final String name;
  @override
  final double units;
  @override
  final DocumentReference reference;

  factory _$PartnersRecord([void Function(PartnersRecordBuilder) updates]) =>
      (new PartnersRecordBuilder()..update(updates)).build();

  _$PartnersRecord._({this.ownerId, this.name, this.units, this.reference})
      : super._();

  @override
  PartnersRecord rebuild(void Function(PartnersRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PartnersRecordBuilder toBuilder() =>
      new PartnersRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PartnersRecord &&
        ownerId == other.ownerId &&
        name == other.name &&
        units == other.units &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, ownerId.hashCode), name.hashCode), units.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PartnersRecord')
          ..add('ownerId', ownerId)
          ..add('name', name)
          ..add('units', units)
          ..add('reference', reference))
        .toString();
  }
}

class PartnersRecordBuilder
    implements Builder<PartnersRecord, PartnersRecordBuilder> {
  _$PartnersRecord _$v;

  DocumentReference _ownerId;
  DocumentReference get ownerId => _$this._ownerId;
  set ownerId(DocumentReference ownerId) => _$this._ownerId = ownerId;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  double _units;
  double get units => _$this._units;
  set units(double units) => _$this._units = units;

  DocumentReference _reference;
  DocumentReference get reference => _$this._reference;
  set reference(DocumentReference reference) => _$this._reference = reference;

  PartnersRecordBuilder() {
    PartnersRecord._initializeBuilder(this);
  }

  PartnersRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ownerId = $v.ownerId;
      _name = $v.name;
      _units = $v.units;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PartnersRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PartnersRecord;
  }

  @override
  void update(void Function(PartnersRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PartnersRecord build() {
    final _$result = _$v ??
        new _$PartnersRecord._(
            ownerId: ownerId, name: name, units: units, reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
