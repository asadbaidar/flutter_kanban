import 'package:common/common.dart';

abstract interface class ToModel<Model> {
  Model toModel();
}

abstract interface class FromModel<Entity, Model> {
  Entity fromModel(Model model);
}

extension EntityToModelList<E extends ToModel<dynamic>> on List<E> {
  List<M> toModels<M>() => map((e) => e.toModel() as M).toList();
}

List<M> $mapToModels<E extends ToModel<M>, M>(List<E> entities) {
  return entities.map((e) => e.toModel()).toList();
}

extension FromJsonArray on JsonArray {
  /// [apply] mapping on json array to return list of [R]
  List<R>? mapJsonArray<R>(R Function(JsonObject it) apply) =>
      $cast<JsonArray>(this)?.map<R>((e) => apply(e as JsonObject)).toList();
}
