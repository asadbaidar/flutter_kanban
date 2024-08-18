abstract interface class ToModel<Model> {
  Model toModel();
}

abstract interface class FromModel<Entity, Model> {
  Entity fromModel(Model model);
}
