// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_credit_application_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateCreditApplicationRequest {

 double get requestedAmount;
/// Create a copy of CreateCreditApplicationRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateCreditApplicationRequestCopyWith<CreateCreditApplicationRequest> get copyWith => _$CreateCreditApplicationRequestCopyWithImpl<CreateCreditApplicationRequest>(this as CreateCreditApplicationRequest, _$identity);

  /// Serializes this CreateCreditApplicationRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateCreditApplicationRequest&&(identical(other.requestedAmount, requestedAmount) || other.requestedAmount == requestedAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,requestedAmount);

@override
String toString() {
  return 'CreateCreditApplicationRequest(requestedAmount: $requestedAmount)';
}


}

/// @nodoc
abstract mixin class $CreateCreditApplicationRequestCopyWith<$Res>  {
  factory $CreateCreditApplicationRequestCopyWith(CreateCreditApplicationRequest value, $Res Function(CreateCreditApplicationRequest) _then) = _$CreateCreditApplicationRequestCopyWithImpl;
@useResult
$Res call({
 double requestedAmount
});




}
/// @nodoc
class _$CreateCreditApplicationRequestCopyWithImpl<$Res>
    implements $CreateCreditApplicationRequestCopyWith<$Res> {
  _$CreateCreditApplicationRequestCopyWithImpl(this._self, this._then);

  final CreateCreditApplicationRequest _self;
  final $Res Function(CreateCreditApplicationRequest) _then;

/// Create a copy of CreateCreditApplicationRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? requestedAmount = null,}) {
  return _then(_self.copyWith(
requestedAmount: null == requestedAmount ? _self.requestedAmount : requestedAmount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateCreditApplicationRequest].
extension CreateCreditApplicationRequestPatterns on CreateCreditApplicationRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateCreditApplicationRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateCreditApplicationRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateCreditApplicationRequest value)  $default,){
final _that = this;
switch (_that) {
case _CreateCreditApplicationRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateCreditApplicationRequest value)?  $default,){
final _that = this;
switch (_that) {
case _CreateCreditApplicationRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double requestedAmount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateCreditApplicationRequest() when $default != null:
return $default(_that.requestedAmount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double requestedAmount)  $default,) {final _that = this;
switch (_that) {
case _CreateCreditApplicationRequest():
return $default(_that.requestedAmount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double requestedAmount)?  $default,) {final _that = this;
switch (_that) {
case _CreateCreditApplicationRequest() when $default != null:
return $default(_that.requestedAmount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateCreditApplicationRequest implements CreateCreditApplicationRequest {
  const _CreateCreditApplicationRequest({required this.requestedAmount});
  factory _CreateCreditApplicationRequest.fromJson(Map<String, dynamic> json) => _$CreateCreditApplicationRequestFromJson(json);

@override final  double requestedAmount;

/// Create a copy of CreateCreditApplicationRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateCreditApplicationRequestCopyWith<_CreateCreditApplicationRequest> get copyWith => __$CreateCreditApplicationRequestCopyWithImpl<_CreateCreditApplicationRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateCreditApplicationRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateCreditApplicationRequest&&(identical(other.requestedAmount, requestedAmount) || other.requestedAmount == requestedAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,requestedAmount);

@override
String toString() {
  return 'CreateCreditApplicationRequest(requestedAmount: $requestedAmount)';
}


}

/// @nodoc
abstract mixin class _$CreateCreditApplicationRequestCopyWith<$Res> implements $CreateCreditApplicationRequestCopyWith<$Res> {
  factory _$CreateCreditApplicationRequestCopyWith(_CreateCreditApplicationRequest value, $Res Function(_CreateCreditApplicationRequest) _then) = __$CreateCreditApplicationRequestCopyWithImpl;
@override @useResult
$Res call({
 double requestedAmount
});




}
/// @nodoc
class __$CreateCreditApplicationRequestCopyWithImpl<$Res>
    implements _$CreateCreditApplicationRequestCopyWith<$Res> {
  __$CreateCreditApplicationRequestCopyWithImpl(this._self, this._then);

  final _CreateCreditApplicationRequest _self;
  final $Res Function(_CreateCreditApplicationRequest) _then;

/// Create a copy of CreateCreditApplicationRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requestedAmount = null,}) {
  return _then(_CreateCreditApplicationRequest(
requestedAmount: null == requestedAmount ? _self.requestedAmount : requestedAmount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
