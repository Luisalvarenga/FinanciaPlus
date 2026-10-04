// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'credit_application_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreditApplicationState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreditApplicationState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreditApplicationState()';
}


}

/// @nodoc
class $CreditApplicationStateCopyWith<$Res>  {
$CreditApplicationStateCopyWith(CreditApplicationState _, $Res Function(CreditApplicationState) __);
}


/// Adds pattern-matching-related methods to [CreditApplicationState].
extension CreditApplicationStatePatterns on CreditApplicationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CreditApplicationInitial value)?  initial,TResult Function( CreditApplicationLoading value)?  loading,TResult Function( CreditApplicationSuccess value)?  success,TResult Function( CreditApplicationError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CreditApplicationInitial() when initial != null:
return initial(_that);case CreditApplicationLoading() when loading != null:
return loading(_that);case CreditApplicationSuccess() when success != null:
return success(_that);case CreditApplicationError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CreditApplicationInitial value)  initial,required TResult Function( CreditApplicationLoading value)  loading,required TResult Function( CreditApplicationSuccess value)  success,required TResult Function( CreditApplicationError value)  error,}){
final _that = this;
switch (_that) {
case CreditApplicationInitial():
return initial(_that);case CreditApplicationLoading():
return loading(_that);case CreditApplicationSuccess():
return success(_that);case CreditApplicationError():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CreditApplicationInitial value)?  initial,TResult? Function( CreditApplicationLoading value)?  loading,TResult? Function( CreditApplicationSuccess value)?  success,TResult? Function( CreditApplicationError value)?  error,}){
final _that = this;
switch (_that) {
case CreditApplicationInitial() when initial != null:
return initial(_that);case CreditApplicationLoading() when loading != null:
return loading(_that);case CreditApplicationSuccess() when success != null:
return success(_that);case CreditApplicationError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( CreditApplication application)?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CreditApplicationInitial() when initial != null:
return initial();case CreditApplicationLoading() when loading != null:
return loading();case CreditApplicationSuccess() when success != null:
return success(_that.application);case CreditApplicationError() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( CreditApplication application)  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case CreditApplicationInitial():
return initial();case CreditApplicationLoading():
return loading();case CreditApplicationSuccess():
return success(_that.application);case CreditApplicationError():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( CreditApplication application)?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case CreditApplicationInitial() when initial != null:
return initial();case CreditApplicationLoading() when loading != null:
return loading();case CreditApplicationSuccess() when success != null:
return success(_that.application);case CreditApplicationError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class CreditApplicationInitial implements CreditApplicationState {
  const CreditApplicationInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreditApplicationInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreditApplicationState.initial()';
}


}




/// @nodoc


class CreditApplicationLoading implements CreditApplicationState {
  const CreditApplicationLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreditApplicationLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreditApplicationState.loading()';
}


}




/// @nodoc


class CreditApplicationSuccess implements CreditApplicationState {
  const CreditApplicationSuccess(this.application);
  

 final  CreditApplication application;

/// Create a copy of CreditApplicationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreditApplicationSuccessCopyWith<CreditApplicationSuccess> get copyWith => _$CreditApplicationSuccessCopyWithImpl<CreditApplicationSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreditApplicationSuccess&&(identical(other.application, application) || other.application == application));
}


@override
int get hashCode => Object.hash(runtimeType,application);

@override
String toString() {
  return 'CreditApplicationState.success(application: $application)';
}


}

/// @nodoc
abstract mixin class $CreditApplicationSuccessCopyWith<$Res> implements $CreditApplicationStateCopyWith<$Res> {
  factory $CreditApplicationSuccessCopyWith(CreditApplicationSuccess value, $Res Function(CreditApplicationSuccess) _then) = _$CreditApplicationSuccessCopyWithImpl;
@useResult
$Res call({
 CreditApplication application
});


$CreditApplicationCopyWith<$Res> get application;

}
/// @nodoc
class _$CreditApplicationSuccessCopyWithImpl<$Res>
    implements $CreditApplicationSuccessCopyWith<$Res> {
  _$CreditApplicationSuccessCopyWithImpl(this._self, this._then);

  final CreditApplicationSuccess _self;
  final $Res Function(CreditApplicationSuccess) _then;

/// Create a copy of CreditApplicationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? application = null,}) {
  return _then(CreditApplicationSuccess(
null == application ? _self.application : application // ignore: cast_nullable_to_non_nullable
as CreditApplication,
  ));
}

/// Create a copy of CreditApplicationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CreditApplicationCopyWith<$Res> get application {
  
  return $CreditApplicationCopyWith<$Res>(_self.application, (value) {
    return _then(_self.copyWith(application: value));
  });
}
}

/// @nodoc


class CreditApplicationError implements CreditApplicationState {
  const CreditApplicationError(this.message);
  

 final  String message;

/// Create a copy of CreditApplicationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreditApplicationErrorCopyWith<CreditApplicationError> get copyWith => _$CreditApplicationErrorCopyWithImpl<CreditApplicationError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreditApplicationError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'CreditApplicationState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $CreditApplicationErrorCopyWith<$Res> implements $CreditApplicationStateCopyWith<$Res> {
  factory $CreditApplicationErrorCopyWith(CreditApplicationError value, $Res Function(CreditApplicationError) _then) = _$CreditApplicationErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$CreditApplicationErrorCopyWithImpl<$Res>
    implements $CreditApplicationErrorCopyWith<$Res> {
  _$CreditApplicationErrorCopyWithImpl(this._self, this._then);

  final CreditApplicationError _self;
  final $Res Function(CreditApplicationError) _then;

/// Create a copy of CreditApplicationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(CreditApplicationError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
