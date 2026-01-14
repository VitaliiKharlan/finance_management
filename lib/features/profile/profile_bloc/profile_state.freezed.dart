// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileState {


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ProfileState);
  }


  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProfileState()';
  }


}

/// @nodoc
class $ProfileStateCopyWith<$Res> {
  $ProfileStateCopyWith(ProfileState _, $Res Function(ProfileState) __);
}


/// Adds pattern-matching-related methods to [ProfileState].
extension ProfileStatePatterns on ProfileState {
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

  @optionalTypeArgs TResult maybeMap

  <

  TResult

  extends

  Object?

  >

  (

  {

  TResult

  Function

  (

  ProfileInitialState

  value

  )

  ?

  initial

  ,

  TResult

  Function

  (

  ProfileFailureState

  value

  )

  ?

  failure

  ,

  TResult

  Function

  (

  ProfileViewState

  value

  )

  ?

  view

  ,

  TResult

  Function

  (

  ProfileEditState

  value

  )

  ?

  edit

  ,

  required

  TResult

  orElse

  (

  )

  ,
}){
final _that = this;
switch (_that) {
case ProfileInitialState() when initial != null:
return initial(_that);case ProfileFailureState() when failure != null:
return failure(_that);case ProfileViewState() when view != null:
return view(_that);case ProfileEditState() when edit != null:
return edit(_that);case _:
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

@optionalTypeArgs
TResult map<TResult extends Object?>(
    {required TResult Function( ProfileInitialState value) initial, required TResult Function( ProfileFailureState value) failure, required TResult Function( ProfileViewState value) view, required TResult Function( ProfileEditState value) edit,}) {
  final _that = this;
  switch (_that) {
    case ProfileInitialState():
      return initial(_that);
    case ProfileFailureState():
      return failure(_that);
    case ProfileViewState():
      return view(_that);
    case ProfileEditState():
      return edit(_that);
    case _:
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

@optionalTypeArgs
TResult? mapOrNull<TResult extends Object?>(
    {TResult? Function( ProfileInitialState value)? initial, TResult? Function( ProfileFailureState value)? failure, TResult? Function( ProfileViewState value)? view, TResult? Function( ProfileEditState value)? edit,}) {
  final _that = this;
  switch (_that) {
    case ProfileInitialState() when initial != null:
      return initial(_that);
    case ProfileFailureState() when failure != null:
      return failure(_that);
    case ProfileViewState() when view != null:
      return view(_that);
    case ProfileEditState() when edit != null:
      return edit(_that);
    case _:
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

@optionalTypeArgs TResult maybeWhen
<
TResult extends Object?>(
{
TResult
Function
(
)
?
initial
,
TResult
Function
(
String
message
)
?
failure
,
TResult
Function
(
)
?
view
,
TResult
Function
(
)
?
edit
,
required
TResult
orElse(),}) {final _that = this;
switch (_that) {
case ProfileInitialState() when initial != null:
return initial();case ProfileFailureState() when failure != null:
return failure(_that.message);case ProfileViewState() when view != null:
return view();case ProfileEditState() when edit != null:
return edit();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function() initial,required TResult Function( String message) failure,required TResult Function() view,required TResult Function() edit,}) {final _that = this;
switch (_that) {
case ProfileInitialState():
return initial();case ProfileFailureState():
return failure(_that.message);case ProfileViewState():
return view();case ProfileEditState():
return edit();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()? initial,TResult? Function( String message)? failure,TResult? Function()? view,TResult? Function()? edit,}) {final _that = this;
switch (_that) {
case ProfileInitialState() when initial != null:
return initial();case ProfileFailureState() when failure != null:
return failure(_that.message);case ProfileViewState() when view != null:
return view();case ProfileEditState() when edit != null:
return edit();case _:
return null;

}
}

}

/// @nodoc


class ProfileInitialState implements ProfileState {
const ProfileInitialState();


@override
bool operator ==(Object other) {
return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileInitialState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
return 'ProfileState.initial()';
}


}


/// @nodoc


class ProfileFailureState implements ProfileState {
const ProfileFailureState(this.message);


final String message;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileFailureStateCopyWith<ProfileFailureState> get copyWith => _$ProfileFailureStateCopyWithImpl<ProfileFailureState>(this, _$identity);


@override
bool operator ==(Object other) {
return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileFailureState&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
return 'ProfileState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $ProfileFailureStateCopyWith<$Res> implements $ProfileStateCopyWith<$Res> {
factory $ProfileFailureStateCopyWith(ProfileFailureState value, $Res Function(ProfileFailureState) _then) = _$ProfileFailureStateCopyWithImpl;
@useResult
$Res call({
String message
});


}
/// @nodoc
class _$ProfileFailureStateCopyWithImpl<$Res>
implements $ProfileFailureStateCopyWith<$Res> {
_$ProfileFailureStateCopyWithImpl(this._self, this._then);

final ProfileFailureState _self;
final $Res Function(ProfileFailureState) _then;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
return _then(ProfileFailureState(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
));
}


}

/// @nodoc


class ProfileViewState implements ProfileState {
const ProfileViewState();


@override
bool operator ==(Object other) {
return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileViewState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
return 'ProfileState.view()';
}


}


/// @nodoc


class ProfileEditState implements ProfileState {
const ProfileEditState();


@override
bool operator ==(Object other) {
return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileEditState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
return 'ProfileState.edit()';
}


}


// dart format on
