// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bank_customer_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BankCustomerResponse {

 String get documentNumber; String get firstName; String get lastName; String get address; String get birthDate; String get gender; String get email; String? get phone;
/// Create a copy of BankCustomerResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BankCustomerResponseCopyWith<BankCustomerResponse> get copyWith => _$BankCustomerResponseCopyWithImpl<BankCustomerResponse>(this as BankCustomerResponse, _$identity);

  /// Serializes this BankCustomerResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BankCustomerResponse&&(identical(other.documentNumber, documentNumber) || other.documentNumber == documentNumber)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.address, address) || other.address == address)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,documentNumber,firstName,lastName,address,birthDate,gender,email,phone);

@override
String toString() {
  return 'BankCustomerResponse(documentNumber: $documentNumber, firstName: $firstName, lastName: $lastName, address: $address, birthDate: $birthDate, gender: $gender, email: $email, phone: $phone)';
}


}

/// @nodoc
abstract mixin class $BankCustomerResponseCopyWith<$Res>  {
  factory $BankCustomerResponseCopyWith(BankCustomerResponse value, $Res Function(BankCustomerResponse) _then) = _$BankCustomerResponseCopyWithImpl;
@useResult
$Res call({
 String documentNumber, String firstName, String lastName, String address, String birthDate, String gender, String email, String? phone
});




}
/// @nodoc
class _$BankCustomerResponseCopyWithImpl<$Res>
    implements $BankCustomerResponseCopyWith<$Res> {
  _$BankCustomerResponseCopyWithImpl(this._self, this._then);

  final BankCustomerResponse _self;
  final $Res Function(BankCustomerResponse) _then;

/// Create a copy of BankCustomerResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? documentNumber = null,Object? firstName = null,Object? lastName = null,Object? address = null,Object? birthDate = null,Object? gender = null,Object? email = null,Object? phone = freezed,}) {
  return _then(_self.copyWith(
documentNumber: null == documentNumber ? _self.documentNumber : documentNumber // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,birthDate: null == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BankCustomerResponse].
extension BankCustomerResponsePatterns on BankCustomerResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BankCustomerResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BankCustomerResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BankCustomerResponse value)  $default,){
final _that = this;
switch (_that) {
case _BankCustomerResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BankCustomerResponse value)?  $default,){
final _that = this;
switch (_that) {
case _BankCustomerResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String documentNumber,  String firstName,  String lastName,  String address,  String birthDate,  String gender,  String email,  String? phone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BankCustomerResponse() when $default != null:
return $default(_that.documentNumber,_that.firstName,_that.lastName,_that.address,_that.birthDate,_that.gender,_that.email,_that.phone);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String documentNumber,  String firstName,  String lastName,  String address,  String birthDate,  String gender,  String email,  String? phone)  $default,) {final _that = this;
switch (_that) {
case _BankCustomerResponse():
return $default(_that.documentNumber,_that.firstName,_that.lastName,_that.address,_that.birthDate,_that.gender,_that.email,_that.phone);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String documentNumber,  String firstName,  String lastName,  String address,  String birthDate,  String gender,  String email,  String? phone)?  $default,) {final _that = this;
switch (_that) {
case _BankCustomerResponse() when $default != null:
return $default(_that.documentNumber,_that.firstName,_that.lastName,_that.address,_that.birthDate,_that.gender,_that.email,_that.phone);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BankCustomerResponse implements BankCustomerResponse {
  const _BankCustomerResponse({required this.documentNumber, required this.firstName, required this.lastName, required this.address, required this.birthDate, required this.gender, required this.email, this.phone});
  factory _BankCustomerResponse.fromJson(Map<String, dynamic> json) => _$BankCustomerResponseFromJson(json);

@override final  String documentNumber;
@override final  String firstName;
@override final  String lastName;
@override final  String address;
@override final  String birthDate;
@override final  String gender;
@override final  String email;
@override final  String? phone;

/// Create a copy of BankCustomerResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BankCustomerResponseCopyWith<_BankCustomerResponse> get copyWith => __$BankCustomerResponseCopyWithImpl<_BankCustomerResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BankCustomerResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BankCustomerResponse&&(identical(other.documentNumber, documentNumber) || other.documentNumber == documentNumber)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.address, address) || other.address == address)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,documentNumber,firstName,lastName,address,birthDate,gender,email,phone);

@override
String toString() {
  return 'BankCustomerResponse(documentNumber: $documentNumber, firstName: $firstName, lastName: $lastName, address: $address, birthDate: $birthDate, gender: $gender, email: $email, phone: $phone)';
}


}

/// @nodoc
abstract mixin class _$BankCustomerResponseCopyWith<$Res> implements $BankCustomerResponseCopyWith<$Res> {
  factory _$BankCustomerResponseCopyWith(_BankCustomerResponse value, $Res Function(_BankCustomerResponse) _then) = __$BankCustomerResponseCopyWithImpl;
@override @useResult
$Res call({
 String documentNumber, String firstName, String lastName, String address, String birthDate, String gender, String email, String? phone
});




}
/// @nodoc
class __$BankCustomerResponseCopyWithImpl<$Res>
    implements _$BankCustomerResponseCopyWith<$Res> {
  __$BankCustomerResponseCopyWithImpl(this._self, this._then);

  final _BankCustomerResponse _self;
  final $Res Function(_BankCustomerResponse) _then;

/// Create a copy of BankCustomerResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? documentNumber = null,Object? firstName = null,Object? lastName = null,Object? address = null,Object? birthDate = null,Object? gender = null,Object? email = null,Object? phone = freezed,}) {
  return _then(_BankCustomerResponse(
documentNumber: null == documentNumber ? _self.documentNumber : documentNumber // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,birthDate: null == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
