// ignore_for_file: constant_identifier_names

import 'dart:async';

import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

part 'asset_images.dart';

enum AssetIcons {
  blank,
  add,
  amenities,
  arrow_back,
  arrow_forward,
  arrow_left,
  arrow_right,
  birthday,
  book,
  booking,
  building1,
  building2,
  calendar,
  camera,
  check_circle,
  check_mark,
  chevron_left,
  chevron_right,
  clock,
  community,
  connect,
  cross_mark,
  delete,
  desk,
  dining,
  directory,
  dragIndicator,
  edit,
  email,
  event,
  exit,
  face_id,
  faq,
  fitness,
  floor,
  food,
  gridview,
  groups,
  google_meet,
  home_pin,
  home,
  hub,
  info,
  led,
  linkedin_mc,
  location1,
  location2,
  location3,
  lock_open,
  lock,
  logo,
  map,
  meeting,
  mic_translucent,
  mic,
  minus,
  navigate,
  news,
  notification,
  notification2,
  online_meeting,
  outlet,
  outlook_mc,
  people,
  personal,
  phone,
  policy,
  planon_mc,
  privacy,
  profile,
  room,
  schedule,
  search,
  send,
  servicenow_mc,
  settings,
  slack_mtc,
  space,
  support,
  teams_mc,
  ticketing,
  todo,
  transportation,
  upload,
  wellness,
  work,
  workplace,
  zoom_mc,
  filter,
  favorite_outline,
  favorite_filled,
  star_filled,
  start_half_filled,
  star_outline,
  repeat,
  features,
  video_call,
  locker_bank,
  map2,
  visibility,
  group,
  videocam,
  person,
  cross_circle,
  ;

  factory AssetIcons.fromName(String? name) => AssetIcons.values.firstWhere(
        (e) => e.name == name,
        orElse: () => AssetIcons.blank,
      );
}

enum AssetIconType {
  /// monotone
  mt,

  /// multicolor
  mc,

  /// monotone and multicolor
  mtc,
  ;

  factory AssetIconType.fromName(String? name) =>
      AssetIconType.values.firstWhere(
        (e) => e.name == name,
        orElse: () => AssetIconType.mt,
      );

  String get _path => '_$name';
}

enum AssetIconFormat {
  png,
  svg,
  ;

  String get _path => '_$name';
}

const String _baseDir = 'packages/common/assets';
const String _imageDir = '$_baseDir/images';
const String _iconDir = '$_baseDir/icons';
final Map<AssetIcons, Uint8List> _iconData = {};

extension AssetIconsX on AssetIcons {
  bool get isPNG => name.endsWith(AssetIconFormat.png.name);

  bool get isSVG => !isPNG;

  AssetIconFormat get format =>
      isPNG ? AssetIconFormat.png : AssetIconFormat.svg;

  String get _noPng =>
      isPNG ? name.replaceAll(AssetIconFormat.png._path, '') : name;

  List<AssetIconType> get types {
    final value = _noPng;
    return value.endsWith(AssetIconType.mc._path)
        ? [AssetIconType.mc]
        : value.endsWith(AssetIconType.mtc._path)
            ? [AssetIconType.mt, AssetIconType.mc]
            : [AssetIconType.mt];
  }

  String _byType(AssetIconType type) =>
      '$_iconDir/${name}_${type.name}.${format.name}'
          .replaceAll('_${AssetIconType.mt.name}', '');

  String? byType(AssetIconType type) =>
      types.contains(type) ? _byType(type) : null;

  String byTypeOrMonotone(AssetIconType type) =>
      byType(type) ?? _byType(AssetIconType.mt);

  String get monotone => byType(AssetIconType.mt) ?? byType(AssetIconType.mc)!;

  String get multicolor =>
      byType(AssetIconType.mc) ?? byType(AssetIconType.mt)!;

  bool get hasMulticolor => types.contains(AssetIconType.mc);

  bool get hasMonotone => types.contains(AssetIconType.mt);

  AssetIconType get type => hasMulticolor ? AssetIconType.mc : AssetIconType.mt;

  Uint8List get data => _iconData[this] ?? Uint8List(0);
}

Future<void> preloadIcon(AssetIcons icon) async {
  if (_iconData.containsKey(icon)) return;

  final iconPath = icon.byTypeOrMonotone(icon.type);
  final iconData = await rootBundle.load(iconPath);
  _iconData[icon] = iconData.buffer.asUint8List();
}

Future<void> preloadIcons([
  Iterable<AssetIcons> icons = const [],
]) async {
  await Future.wait(icons.map(preloadIcon));
}
