// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppSettings {

 ThemeMode get themeMode; String get languageCode; bool get notificationsEnabled; bool get biometricLockEnabled; bool get hasCompletedOnboarding;
/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppSettingsCopyWith<AppSettings> get copyWith => _$AppSettingsCopyWithImpl<AppSettings>(this as AppSettings, _$identity);

  /// Serializes this AppSettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AppSettings;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppSettings&&(identical(other.themeMode, _this.themeMode) || other.themeMode == _this.themeMode)&&(identical(other.languageCode, _this.languageCode) || other.languageCode == _this.languageCode)&&(identical(other.notificationsEnabled, _this.notificationsEnabled) || other.notificationsEnabled == _this.notificationsEnabled)&&(identical(other.biometricLockEnabled, _this.biometricLockEnabled) || other.biometricLockEnabled == _this.biometricLockEnabled)&&(identical(other.hasCompletedOnboarding, _this.hasCompletedOnboarding) || other.hasCompletedOnboarding == _this.hasCompletedOnboarding));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AppSettings;
  return Object.hash(runtimeType,_this.themeMode,_this.languageCode,_this.notificationsEnabled,_this.biometricLockEnabled,_this.hasCompletedOnboarding);
}

@override
String toString() {
  final _this = this as AppSettings;
  return 'AppSettings(themeMode: ${_this.themeMode}, languageCode: ${_this.languageCode}, notificationsEnabled: ${_this.notificationsEnabled}, biometricLockEnabled: ${_this.biometricLockEnabled}, hasCompletedOnboarding: ${_this.hasCompletedOnboarding})';
}


}

/// @nodoc
abstract mixin class $AppSettingsCopyWith<$Res>  {
  factory $AppSettingsCopyWith(AppSettings value, $Res Function(AppSettings) _then) = _$AppSettingsCopyWithImpl;
@useResult
$Res call({
 ThemeMode themeMode, String languageCode, bool notificationsEnabled, bool biometricLockEnabled, bool hasCompletedOnboarding
});




}
/// @nodoc
class _$AppSettingsCopyWithImpl<$Res>
    implements $AppSettingsCopyWith<$Res> {
  _$AppSettingsCopyWithImpl(this._self, this._then);

  final AppSettings _self;
  final $Res Function(AppSettings) _then;

/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? themeMode = null,Object? languageCode = null,Object? notificationsEnabled = null,Object? biometricLockEnabled = null,Object? hasCompletedOnboarding = null,}) {
  return _then(AppSettings(
themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as ThemeMode,languageCode: null == languageCode ? _self.languageCode : languageCode // ignore: cast_nullable_to_non_nullable
as String,notificationsEnabled: null == notificationsEnabled ? _self.notificationsEnabled : notificationsEnabled // ignore: cast_nullable_to_non_nullable
as bool,biometricLockEnabled: null == biometricLockEnabled ? _self.biometricLockEnabled : biometricLockEnabled // ignore: cast_nullable_to_non_nullable
as bool,hasCompletedOnboarding: null == hasCompletedOnboarding ? _self.hasCompletedOnboarding : hasCompletedOnboarding // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AppSettings].
extension AppSettingsPatterns on AppSettings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppSettings() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppSettings value)  $default,){
final _that = this;
switch (_that) {
case _AppSettings():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppSettings value)?  $default,){
final _that = this;
switch (_that) {
case _AppSettings() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ThemeMode themeMode,  String languageCode,  bool notificationsEnabled,  bool biometricLockEnabled,  bool hasCompletedOnboarding)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppSettings() when $default != null:
return $default(_that.themeMode,_that.languageCode,_that.notificationsEnabled,_that.biometricLockEnabled,_that.hasCompletedOnboarding);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ThemeMode themeMode,  String languageCode,  bool notificationsEnabled,  bool biometricLockEnabled,  bool hasCompletedOnboarding)  $default,) {final _that = this;
switch (_that) {
case _AppSettings():
return $default(_that.themeMode,_that.languageCode,_that.notificationsEnabled,_that.biometricLockEnabled,_that.hasCompletedOnboarding);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ThemeMode themeMode,  String languageCode,  bool notificationsEnabled,  bool biometricLockEnabled,  bool hasCompletedOnboarding)?  $default,) {final _that = this;
switch (_that) {
case _AppSettings() when $default != null:
return $default(_that.themeMode,_that.languageCode,_that.notificationsEnabled,_that.biometricLockEnabled,_that.hasCompletedOnboarding);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppSettings extends AppSettings {
  const _AppSettings({this.themeMode = ThemeMode.system, this.languageCode = 'en', this.notificationsEnabled = true, this.biometricLockEnabled = false, this.hasCompletedOnboarding = false}): super._();
  factory _AppSettings.fromJson(Map<String, dynamic> json) => _$AppSettingsFromJson(json);

@override@JsonKey() final  ThemeMode themeMode;
@override@JsonKey() final  String languageCode;
@override@JsonKey() final  bool notificationsEnabled;
@override@JsonKey() final  bool biometricLockEnabled;
@override@JsonKey() final  bool hasCompletedOnboarding;

/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppSettingsCopyWith<_AppSettings> get copyWith => __$AppSettingsCopyWithImpl<_AppSettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppSettingsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppSettings&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode)&&(identical(other.languageCode, languageCode) || other.languageCode == languageCode)&&(identical(other.notificationsEnabled, notificationsEnabled) || other.notificationsEnabled == notificationsEnabled)&&(identical(other.biometricLockEnabled, biometricLockEnabled) || other.biometricLockEnabled == biometricLockEnabled)&&(identical(other.hasCompletedOnboarding, hasCompletedOnboarding) || other.hasCompletedOnboarding == hasCompletedOnboarding));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,themeMode,languageCode,notificationsEnabled,biometricLockEnabled,hasCompletedOnboarding);
}

@override
String toString() {
    return 'AppSettings(themeMode: $themeMode, languageCode: $languageCode, notificationsEnabled: $notificationsEnabled, biometricLockEnabled: $biometricLockEnabled, hasCompletedOnboarding: $hasCompletedOnboarding)';
}


}

/// @nodoc
abstract mixin class _$AppSettingsCopyWith<$Res> implements $AppSettingsCopyWith<$Res> {
  factory _$AppSettingsCopyWith(_AppSettings value, $Res Function(_AppSettings) _then) = __$AppSettingsCopyWithImpl;
@override @useResult
$Res call({
 ThemeMode themeMode, String languageCode, bool notificationsEnabled, bool biometricLockEnabled, bool hasCompletedOnboarding
});




}
/// @nodoc
class __$AppSettingsCopyWithImpl<$Res>
    implements _$AppSettingsCopyWith<$Res> {
  __$AppSettingsCopyWithImpl(this._self, this._then);

  final _AppSettings _self;
  final $Res Function(_AppSettings) _then;

/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? themeMode = null,Object? languageCode = null,Object? notificationsEnabled = null,Object? biometricLockEnabled = null,Object? hasCompletedOnboarding = null,}) {
  return _then(_AppSettings(
themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as ThemeMode,languageCode: null == languageCode ? _self.languageCode : languageCode // ignore: cast_nullable_to_non_nullable
as String,notificationsEnabled: null == notificationsEnabled ? _self.notificationsEnabled : notificationsEnabled // ignore: cast_nullable_to_non_nullable
as bool,biometricLockEnabled: null == biometricLockEnabled ? _self.biometricLockEnabled : biometricLockEnabled // ignore: cast_nullable_to_non_nullable
as bool,hasCompletedOnboarding: null == hasCompletedOnboarding ? _self.hasCompletedOnboarding : hasCompletedOnboarding // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
