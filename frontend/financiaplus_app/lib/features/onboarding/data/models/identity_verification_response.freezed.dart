// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'identity_verification_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IdentityVerificationResponse {

 double get similarity; bool get approved; String get message;
/// Create a copy of IdentityVerificationResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IdentityVerificationResponseCopyWith<IdentityVerificationResponse> get copyWith => _$IdentityVerificationResponseCopyWithImpl<IdentityVerificationResponse>(this as IdentityVerificationResponse, _$identity);

  /// Serializes this IdentityVerificationResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IdentityVerificationResponse&&(identical(other.similarity, similarity) || other.similarity == similarity)&&(identical(other.approved, approved) || other.approved == approved)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,similarity,approved,message);

@override
String toString() {
  return 'IdentityVerificationResponse(similarity: $similarity, approved: $approved, message: $message)';
}


}

/// @nodoc
abstract mixin class $IdentityVerificationResponseCopyWith<$Res>  {
  factory $IdentityVerificationResponseCopyWith(IdentityVerificationResponse value, $Res Function(IdentityVerificationResponse) _then) = _$IdentityVerificationResponseCopyWithImpl;
@useResult
$Res call({
 double similarity, bool approved, String message
});




}
/// @nodoc
class _$IdentityVerificationResponseCopyWithImpl<$Res>
    implements $IdentityVerificationResponseCopyWith<$Res> {
  _$IdentityVerificationResponseCopyWithImpl(this._self, this._then);

  final IdentityVerificationResponse _self;
  final $Res Function(IdentityVerificationResponse) _then;

/// Create a copy of IdentityVerificationResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? similarity = null,Object? approved = null,Object? message = null,}) {
  return _then(_self.copyWith(
similarity: null == similarity ? _self.similarity : similarity // ignore: cast_nullable_to_non_nullable
as double,approved: null == approved ? _self.approved : approved // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [IdentityVerificationResponse].
extension IdentityVerificationResponsePatterns on IdentityVerificationResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IdentityVerificationResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IdentityVerificationResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IdentityVerificationResponse value)  $default,){
final _that = this;
switch (_that) {
case _IdentityVerificationResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IdentityVerificationResponse value)?  $default,){
final _that = this;
switch (_that) {
case _IdentityVerificationResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double similarity,  bool approved,  String message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IdentityVerificationResponse() when $default != null:
return $default(_that.similarity,_that.approved,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double similarity,  bool approved,  String message)  $default,) {final _that = this;
switch (_that) {
case _IdentityVerificationResponse():
return $default(_that.similarity,_that.approved,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double similarity,  bool approved,  String message)?  $default,) {final _that = this;
switch (_that) {
case _IdentityVerificationResponse() when $default != null:
return $default(_that.similarity,_that.approved,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IdentityVerificationResponse implements IdentityVerificationResponse {
  const _IdentityVerificationResponse({required this.similarity, required this.approved, required this.message});
  factory _IdentityVerificationResponse.fromJson(Map<String, dynamic> json) => _$IdentityVerificationResponseFromJson(json);

@override final  double similarity;
@override final  bool approved;
@override final  String message;

/// Create a copy of IdentityVerificationResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IdentityVerificationResponseCopyWith<_IdentityVerificationResponse> get copyWith => __$IdentityVerificationResponseCopyWithImpl<_IdentityVerificationResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IdentityVerificationResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IdentityVerificationResponse&&(identical(other.similarity, similarity) || other.similarity == similarity)&&(identical(other.approved, approved) || other.approved == approved)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,similarity,approved,message);

@override
String toString() {
  return 'IdentityVerificationResponse(similarity: $similarity, approved: $approved, message: $message)';
}


}

/// @nodoc
abstract mixin class _$IdentityVerificationResponseCopyWith<$Res> implements $IdentityVerificationResponseCopyWith<$Res> {
  factory _$IdentityVerificationResponseCopyWith(_IdentityVerificationResponse value, $Res Function(_IdentityVerificationResponse) _then) = __$IdentityVerificationResponseCopyWithImpl;
@override @useResult
$Res call({
 double similarity, bool approved, String message
});




}
/// @nodoc
class __$IdentityVerificationResponseCopyWithImpl<$Res>
    implements _$IdentityVerificationResponseCopyWith<$Res> {
  __$IdentityVerificationResponseCopyWithImpl(this._self, this._then);

  final _IdentityVerificationResponse _self;
  final $Res Function(_IdentityVerificationResponse) _then;

/// Create a copy of IdentityVerificationResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? similarity = null,Object? approved = null,Object? message = null,}) {
  return _then(_IdentityVerificationResponse(
similarity: null == similarity ? _self.similarity : similarity // ignore: cast_nullable_to_non_nullable
as double,approved: null == approved ? _self.approved : approved // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
