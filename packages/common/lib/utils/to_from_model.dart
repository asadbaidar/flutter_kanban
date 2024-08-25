import 'package:common/common.dart';

abstract interface class ToModel<Model> {
  Model toModel();
}

extension EntityToModelList<E extends ToModel<dynamic>> on List<E> {
  List<M> toModels<M>() => map((e) => e.toModel() as M).toList();
}

List<M> $mapToModels<E extends ToModel<M>, M>(List<E> entities) {
  return entities.map((e) => e.toModel()).toList();
}

M $mapToModel<E extends ToModel<M>, M>(E entity) {
  return entity.toModel();
}

extension FromJsonArray on JsonArray {
  /// [apply] mapping on json array to return list of [R]
  List<R>? mapJsonArray<R>(R Function(JsonObject it) apply) =>
      $cast<JsonArray>(this)?.map<R>((e) => apply(e as JsonObject)).toList();
}

extension MapHelper<K, V> on Map<K, V> {
  R? get<R>(K key) => $cast(this[key]);

  Map<K, V> copyWith(K key, V value) => {...this, key: value};
}
