// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'client.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Client {

 int get id; String get firstName; String get lastName; String get documentNumber; String get email; String get phone; String? get address; DateTime? get birthDate; String? get gender; bool get profileComplete; bool get identityVerified; double? get biometricScore;
/// Create a copy of Client
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClientCopyWith<Client> get copyWith => _$ClientCopyWithImpl<Client>(this as Client, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Client&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.documentNumber, documentNumber) || other.documentNumber == documentNumber)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.profileComplete, profileComplete) || other.profileComplete == profileComplete)&&(identical(other.identityVerified, identityVerified) || other.identityVerified == identityVerified)&&(identical(other.biometricScore, biometricScore) || other.biometricScore == biometricScore));
}


@override
int get hashCode => Object.hash(runtimeType,id,firstName,lastName,documentNumber,email,phone,address,birthDate,gender,profileComplete,identityVerified,biometricScore);

@override
String toString() {
  return 'Client(id: $id, firstName: $firstName, lastName: $lastName, documentNumber: $documentNumber, email: $email, phone: $phone, address: $address, birthDate: $birthDate, gender: $gender, profileComplete: $profileComplete, identityVerified: $identityVerified, biometricScore: $biometricScore)';
}


}

/// @nodoc
abstract mixin class $ClientCopyWith<$Res>  {
  factory $ClientCopyWith(Client value, $Res Function(Client) _then) = _$ClientCopyWithImpl;
@useResult
$Res call({
 int id, String firstName, String lastName, String documentNumber, String email, String phone, String? address, DateTime? birthDate, String? gender, bool profileComplete, bool identityVerified, double? biometricScore
});




}
/// @nodoc
class _$ClientCopyWithImpl<$Res>
    implements $ClientCopyWith<$Res> {
  _$ClientCopyWithImpl(this._self, this._then);

  final Client _self;
  final $Res Function(Client) _then;

/// Create a copy of Client
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? firstName = null,Object? lastName = null,Object? documentNumber = null,Object? email = null,Object? phone = null,Object? address = freezed,Object? birthDate = freezed,Object? gender = freezed,Object? profileComplete = null,Object? identityVerified = null,Object? biometricScore = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,documentNumber: null == documentNumber ? _self.documentNumber : documentNumber // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,birthDate: freezed == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as DateTime?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,profileComplete: null == profileComplete ? _self.profileComplete : profileComplete // ignore: cast_nullable_to_non_nullable
as bool,identityVerified: null == identityVerified ? _self.identityVerified : identityVerified // ignore: cast_nullable_to_non_nullable
as bool,biometricScore: freezed == biometricScore ? _self.biometricScore : biometricScore // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [Client].
extension ClientPatterns on Client {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Client value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Client() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Client value)  $default,){
final _that = this;
switch (_that) {
case _Client():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Client value)?  $default,){
final _that = this;
switch (_that) {
case _Client() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String firstName,  String lastName,  String documentNumber,  String email,  String phone,  String? address,  DateTime? birthDate,  String? gender,  bool profileComplete,  bool identityVerified,  double? biometricScore)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Client() when $default != null:
return $default(_that.id,_that.firstName,_that.lastName,_that.documentNumber,_that.email,_that.phone,_that.address,_that.birthDate,_that.gender,_that.profileComplete,_that.identityVerified,_that.biometricScore);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String firstName,  String lastName,  String documentNumber,  String email,  String phone,  String? address,  DateTime? birthDate,  String? gender,  bool profileComplete,  bool identityVerified,  double? biometricScore)  $default,) {final _that = this;
switch (_that) {
case _Client():
return $default(_that.id,_that.firstName,_that.lastName,_that.documentNumber,_that.email,_that.phone,_that.address,_that.birthDate,_that.gender,_that.profileComplete,_that.identityVerified,_that.biometricScore);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String firstName,  String lastName,  String documentNumber,  String email,  String phone,  String? address,  DateTime? birthDate,  String? gender,  bool profileComplete,  bool identityVerified,  double? biometricScore)?  $default,) {final _that = this;
switch (_that) {
case _Client() when $default != null:
return $default(_that.id,_that.firstName,_that.lastName,_that.documentNumber,_that.email,_that.phone,_that.address,_that.birthDate,_that.gender,_that.profileComplete,_that.identityVerified,_that.biometricScore);case _:
  return null;

}
}

}

/// @nodoc


class _Client implements Client {
  const _Client({required this.id, required this.firstName, required this.lastName, required this.documentNumber, required this.email, required this.phone, this.address, this.birthDate, this.gender, required this.profileComplete, required this.identityVerified, this.biometricScore});
  

@override final  int id;
@override final  String firstName;
@override final  String lastName;
@override final  String documentNumber;
@override final  String email;
@override final  String phone;
@override final  String? address;
@override final  DateTime? birthDate;
@override final  String? gender;
@override final  bool profileComplete;
@override final  bool identityVerified;
@override final  double? biometricScore;

/// Create a copy of Client
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClientCopyWith<_Client> get copyWith => __$ClientCopyWithImpl<_Client>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Client&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.documentNumber, documentNumber) || other.documentNumber == documentNumber)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.profileComplete, profileComplete) || other.profileComplete == profileComplete)&&(identical(other.identityVerified, identityVerified) || other.identityVerified == identityVerified)&&(identical(other.biometricScore, biometricScore) || other.biometricScore == biometricScore));
}


@override
int get hashCode => Object.hash(runtimeType,id,firstName,lastName,documentNumber,email,phone,address,birthDate,gender,profileComplete,identityVerified,biometricScore);

@override
String toString() {
  return 'Client(id: $id, firstName: $firstName, lastName: $lastName, documentNumber: $documentNumber, email: $email, phone: $phone, address: $address, birthDate: $birthDate, gender: $gender, profileComplete: $profileComplete, identityVerified: $identityVerified, biometricScore: $biometricScore)';
}


}

/// @nodoc
abstract mixin class _$ClientCopyWith<$Res> implements $ClientCopyWith<$Res> {
  factory _$ClientCopyWith(_Client value, $Res Function(_Client) _then) = __$ClientCopyWithImpl;
@override @useResult
$Res call({
 int id, String firstName, String lastName, String documentNumber, String email, String phone, String? address, DateTime? birthDate, String? gender, bool profileComplete, bool identityVerified, double? biometricScore
});




}
/// @nodoc
class __$ClientCopyWithImpl<$Res>
    implements _$ClientCopyWith<$Res> {
  __$ClientCopyWithImpl(this._self, this._then);

  final _Client _self;
  final $Res Function(_Client) _then;

/// Create a copy of Client
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? firstName = null,Object? lastName = null,Object? documentNumber = null,Object? email = null,Object? phone = null,Object? address = freezed,Object? birthDate = freezed,Object? gender = freezed,Object? profileComplete = null,Object? identityVerified = null,Object? biometricScore = freezed,}) {
  return _then(_Client(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,documentNumber: null == documentNumber ? _self.documentNumber : documentNumber // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,birthDate: freezed == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as DateTime?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,profileComplete: null == profileComplete ? _self.profileComplete : profileComplete // ignore: cast_nullable_to_non_nullable
as bool,identityVerified: null == identityVerified ? _self.identityVerified : identityVerified // ignore: cast_nullable_to_non_nullable
as bool,biometricScore: freezed == biometricScore ? _self.biometricScore : biometricScore // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
