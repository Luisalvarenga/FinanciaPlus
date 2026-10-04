// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'credit_application_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreditApplicationResponse {

 int get id; int get clientId; double get requestedAmount; double? get creditScore; bool get amlMatch; String get status; String? get ipAddress; String? get country; String? get region; String? get city; int? get riskScore; String? get riskLevel; DateTime? get createdAt;
/// Create a copy of CreditApplicationResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreditApplicationResponseCopyWith<CreditApplicationResponse> get copyWith => _$CreditApplicationResponseCopyWithImpl<CreditApplicationResponse>(this as CreditApplicationResponse, _$identity);

  /// Serializes this CreditApplicationResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreditApplicationResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.requestedAmount, requestedAmount) || other.requestedAmount == requestedAmount)&&(identical(other.creditScore, creditScore) || other.creditScore == creditScore)&&(identical(other.amlMatch, amlMatch) || other.amlMatch == amlMatch)&&(identical(other.status, status) || other.status == status)&&(identical(other.ipAddress, ipAddress) || other.ipAddress == ipAddress)&&(identical(other.country, country) || other.country == country)&&(identical(other.region, region) || other.region == region)&&(identical(other.city, city) || other.city == city)&&(identical(other.riskScore, riskScore) || other.riskScore == riskScore)&&(identical(other.riskLevel, riskLevel) || other.riskLevel == riskLevel)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,clientId,requestedAmount,creditScore,amlMatch,status,ipAddress,country,region,city,riskScore,riskLevel,createdAt);

@override
String toString() {
  return 'CreditApplicationResponse(id: $id, clientId: $clientId, requestedAmount: $requestedAmount, creditScore: $creditScore, amlMatch: $amlMatch, status: $status, ipAddress: $ipAddress, country: $country, region: $region, city: $city, riskScore: $riskScore, riskLevel: $riskLevel, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $CreditApplicationResponseCopyWith<$Res>  {
  factory $CreditApplicationResponseCopyWith(CreditApplicationResponse value, $Res Function(CreditApplicationResponse) _then) = _$CreditApplicationResponseCopyWithImpl;
@useResult
$Res call({
 int id, int clientId, double requestedAmount, double? creditScore, bool amlMatch, String status, String? ipAddress, String? country, String? region, String? city, int? riskScore, String? riskLevel, DateTime? createdAt
});




}
/// @nodoc
class _$CreditApplicationResponseCopyWithImpl<$Res>
    implements $CreditApplicationResponseCopyWith<$Res> {
  _$CreditApplicationResponseCopyWithImpl(this._self, this._then);

  final CreditApplicationResponse _self;
  final $Res Function(CreditApplicationResponse) _then;

/// Create a copy of CreditApplicationResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? clientId = null,Object? requestedAmount = null,Object? creditScore = freezed,Object? amlMatch = null,Object? status = null,Object? ipAddress = freezed,Object? country = freezed,Object? region = freezed,Object? city = freezed,Object? riskScore = freezed,Object? riskLevel = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as int,requestedAmount: null == requestedAmount ? _self.requestedAmount : requestedAmount // ignore: cast_nullable_to_non_nullable
as double,creditScore: freezed == creditScore ? _self.creditScore : creditScore // ignore: cast_nullable_to_non_nullable
as double?,amlMatch: null == amlMatch ? _self.amlMatch : amlMatch // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,ipAddress: freezed == ipAddress ? _self.ipAddress : ipAddress // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,riskScore: freezed == riskScore ? _self.riskScore : riskScore // ignore: cast_nullable_to_non_nullable
as int?,riskLevel: freezed == riskLevel ? _self.riskLevel : riskLevel // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreditApplicationResponse].
extension CreditApplicationResponsePatterns on CreditApplicationResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreditApplicationResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreditApplicationResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreditApplicationResponse value)  $default,){
final _that = this;
switch (_that) {
case _CreditApplicationResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreditApplicationResponse value)?  $default,){
final _that = this;
switch (_that) {
case _CreditApplicationResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int clientId,  double requestedAmount,  double? creditScore,  bool amlMatch,  String status,  String? ipAddress,  String? country,  String? region,  String? city,  int? riskScore,  String? riskLevel,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreditApplicationResponse() when $default != null:
return $default(_that.id,_that.clientId,_that.requestedAmount,_that.creditScore,_that.amlMatch,_that.status,_that.ipAddress,_that.country,_that.region,_that.city,_that.riskScore,_that.riskLevel,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int clientId,  double requestedAmount,  double? creditScore,  bool amlMatch,  String status,  String? ipAddress,  String? country,  String? region,  String? city,  int? riskScore,  String? riskLevel,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _CreditApplicationResponse():
return $default(_that.id,_that.clientId,_that.requestedAmount,_that.creditScore,_that.amlMatch,_that.status,_that.ipAddress,_that.country,_that.region,_that.city,_that.riskScore,_that.riskLevel,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int clientId,  double requestedAmount,  double? creditScore,  bool amlMatch,  String status,  String? ipAddress,  String? country,  String? region,  String? city,  int? riskScore,  String? riskLevel,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _CreditApplicationResponse() when $default != null:
return $default(_that.id,_that.clientId,_that.requestedAmount,_that.creditScore,_that.amlMatch,_that.status,_that.ipAddress,_that.country,_that.region,_that.city,_that.riskScore,_that.riskLevel,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreditApplicationResponse implements CreditApplicationResponse {
  const _CreditApplicationResponse({required this.id, required this.clientId, required this.requestedAmount, this.creditScore, required this.amlMatch, required this.status, this.ipAddress, this.country, this.region, this.city, this.riskScore, this.riskLevel, this.createdAt});
  factory _CreditApplicationResponse.fromJson(Map<String, dynamic> json) => _$CreditApplicationResponseFromJson(json);

@override final  int id;
@override final  int clientId;
@override final  double requestedAmount;
@override final  double? creditScore;
@override final  bool amlMatch;
@override final  String status;
@override final  String? ipAddress;
@override final  String? country;
@override final  String? region;
@override final  String? city;
@override final  int? riskScore;
@override final  String? riskLevel;
@override final  DateTime? createdAt;

/// Create a copy of CreditApplicationResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreditApplicationResponseCopyWith<_CreditApplicationResponse> get copyWith => __$CreditApplicationResponseCopyWithImpl<_CreditApplicationResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreditApplicationResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreditApplicationResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.requestedAmount, requestedAmount) || other.requestedAmount == requestedAmount)&&(identical(other.creditScore, creditScore) || other.creditScore == creditScore)&&(identical(other.amlMatch, amlMatch) || other.amlMatch == amlMatch)&&(identical(other.status, status) || other.status == status)&&(identical(other.ipAddress, ipAddress) || other.ipAddress == ipAddress)&&(identical(other.country, country) || other.country == country)&&(identical(other.region, region) || other.region == region)&&(identical(other.city, city) || other.city == city)&&(identical(other.riskScore, riskScore) || other.riskScore == riskScore)&&(identical(other.riskLevel, riskLevel) || other.riskLevel == riskLevel)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,clientId,requestedAmount,creditScore,amlMatch,status,ipAddress,country,region,city,riskScore,riskLevel,createdAt);

@override
String toString() {
  return 'CreditApplicationResponse(id: $id, clientId: $clientId, requestedAmount: $requestedAmount, creditScore: $creditScore, amlMatch: $amlMatch, status: $status, ipAddress: $ipAddress, country: $country, region: $region, city: $city, riskScore: $riskScore, riskLevel: $riskLevel, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$CreditApplicationResponseCopyWith<$Res> implements $CreditApplicationResponseCopyWith<$Res> {
  factory _$CreditApplicationResponseCopyWith(_CreditApplicationResponse value, $Res Function(_CreditApplicationResponse) _then) = __$CreditApplicationResponseCopyWithImpl;
@override @useResult
$Res call({
 int id, int clientId, double requestedAmount, double? creditScore, bool amlMatch, String status, String? ipAddress, String? country, String? region, String? city, int? riskScore, String? riskLevel, DateTime? createdAt
});




}
/// @nodoc
class __$CreditApplicationResponseCopyWithImpl<$Res>
    implements _$CreditApplicationResponseCopyWith<$Res> {
  __$CreditApplicationResponseCopyWithImpl(this._self, this._then);

  final _CreditApplicationResponse _self;
  final $Res Function(_CreditApplicationResponse) _then;

/// Create a copy of CreditApplicationResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? clientId = null,Object? requestedAmount = null,Object? creditScore = freezed,Object? amlMatch = null,Object? status = null,Object? ipAddress = freezed,Object? country = freezed,Object? region = freezed,Object? city = freezed,Object? riskScore = freezed,Object? riskLevel = freezed,Object? createdAt = freezed,}) {
  return _then(_CreditApplicationResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as int,requestedAmount: null == requestedAmount ? _self.requestedAmount : requestedAmount // ignore: cast_nullable_to_non_nullable
as double,creditScore: freezed == creditScore ? _self.creditScore : creditScore // ignore: cast_nullable_to_non_nullable
as double?,amlMatch: null == amlMatch ? _self.amlMatch : amlMatch // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,ipAddress: freezed == ipAddress ? _self.ipAddress : ipAddress // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,riskScore: freezed == riskScore ? _self.riskScore : riskScore // ignore: cast_nullable_to_non_nullable
as int?,riskLevel: freezed == riskLevel ? _self.riskLevel : riskLevel // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
