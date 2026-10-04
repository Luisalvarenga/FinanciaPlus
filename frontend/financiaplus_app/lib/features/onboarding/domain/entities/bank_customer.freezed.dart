// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bank_customer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BankCustomer {

 String get documentNumber; String get address; DateTime get birthDate; String get gender;
/// Create a copy of BankCustomer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BankCustomerCopyWith<BankCustomer> get copyWith => _$BankCustomerCopyWithImpl<BankCustomer>(this as BankCustomer, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BankCustomer&&(identical(other.documentNumber, documentNumber) || other.documentNumber == documentNumber)&&(identical(other.address, address) || other.address == address)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.gender, gender) || other.gender == gender));
}


@override
int get hashCode => Object.hash(runtimeType,documentNumber,address,birthDate,gender);

@override
String toString() {
  return 'BankCustomer(documentNumber: $documentNumber, address: $address, birthDate: $birthDate, gender: $gender)';
}


}

/// @nodoc
abstract mixin class $BankCustomerCopyWith<$Res>  {
  factory $BankCustomerCopyWith(BankCustomer value, $Res Function(BankCustomer) _then) = _$BankCustomerCopyWithImpl;
@useResult
$Res call({
 String documentNumber, String address, DateTime birthDate, String gender
});




}
/// @nodoc
class _$BankCustomerCopyWithImpl<$Res>
    implements $BankCustomerCopyWith<$Res> {
  _$BankCustomerCopyWithImpl(this._self, this._then);

  final BankCustomer _self;
  final $Res Function(BankCustomer) _then;

/// Create a copy of BankCustomer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? documentNumber = null,Object? address = null,Object? birthDate = null,Object? gender = null,}) {
  return _then(_self.copyWith(
documentNumber: null == documentNumber ? _self.documentNumber : documentNumber // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,birthDate: null == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as DateTime,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [BankCustomer].
extension BankCustomerPatterns on BankCustomer {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BankCustomer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BankCustomer() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BankCustomer value)  $default,){
final _that = this;
switch (_that) {
case _BankCustomer():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BankCustomer value)?  $default,){
final _that = this;
switch (_that) {
case _BankCustomer() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String documentNumber,  String address,  DateTime birthDate,  String gender)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BankCustomer() when $default != null:
return $default(_that.documentNumber,_that.address,_that.birthDate,_that.gender);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String documentNumber,  String address,  DateTime birthDate,  String gender)  $default,) {final _that = this;
switch (_that) {
case _BankCustomer():
return $default(_that.documentNumber,_that.address,_that.birthDate,_that.gender);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String documentNumber,  String address,  DateTime birthDate,  String gender)?  $default,) {final _that = this;
switch (_that) {
case _BankCustomer() when $default != null:
return $default(_that.documentNumber,_that.address,_that.birthDate,_that.gender);case _:
  return null;

}
}

}

/// @nodoc


class _BankCustomer implements BankCustomer {
  const _BankCustomer({required this.documentNumber, required this.address, required this.birthDate, required this.gender});
  

@override final  String documentNumber;
@override final  String address;
@override final  DateTime birthDate;
@override final  String gender;

/// Create a copy of BankCustomer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BankCustomerCopyWith<_BankCustomer> get copyWith => __$BankCustomerCopyWithImpl<_BankCustomer>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BankCustomer&&(identical(other.documentNumber, documentNumber) || other.documentNumber == documentNumber)&&(identical(other.address, address) || other.address == address)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.gender, gender) || other.gender == gender));
}


@override
int get hashCode => Object.hash(runtimeType,documentNumber,address,birthDate,gender);

@override
String toString() {
  return 'BankCustomer(documentNumber: $documentNumber, address: $address, birthDate: $birthDate, gender: $gender)';
}


}

/// @nodoc
abstract mixin class _$BankCustomerCopyWith<$Res> implements $BankCustomerCopyWith<$Res> {
  factory _$BankCustomerCopyWith(_BankCustomer value, $Res Function(_BankCustomer) _then) = __$BankCustomerCopyWithImpl;
@override @useResult
$Res call({
 String documentNumber, String address, DateTime birthDate, String gender
});




}
/// @nodoc
class __$BankCustomerCopyWithImpl<$Res>
    implements _$BankCustomerCopyWith<$Res> {
  __$BankCustomerCopyWithImpl(this._self, this._then);

  final _BankCustomer _self;
  final $Res Function(_BankCustomer) _then;

/// Create a copy of BankCustomer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? documentNumber = null,Object? address = null,Object? birthDate = null,Object? gender = null,}) {
  return _then(_BankCustomer(
documentNumber: null == documentNumber ? _self.documentNumber : documentNumber // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,birthDate: null == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as DateTime,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
