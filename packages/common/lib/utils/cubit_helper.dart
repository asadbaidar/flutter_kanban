import 'package:bloc/bloc.dart';
import 'package:common/common.dart';

extension CubitHelper<T> on Cubit<T> {
  Future<void> when<V>(
    Data<V> value, {
    required FutureCallback<V> act,
    required OnValue<Data<V>> emit,
    Callback<Data<V>>? loading,
    OnValueCallback<Data<V>, V>? loaded,
    OnValueCallback<Data<V>, Object>? failure,
  }) async {
    emit(loading?.call() ?? value.toLoading());
    try {
      final result = await act();
      if (V.toString() == 'void') {
        emit(value.toLoaded());
      } else {
        emit(loaded?.call(result) ?? value.toLoaded(value: result));
      }
    } catch (e) {
      emit(failure?.call(e) ?? value.toFailure(error: e));
    }
  }
}

extension MapHelper<K, V> on Map<K, V> {
  R? get<R>(K key) => $cast(this[key]);

  Map<K, V> copyWith(K key, V value) => {...this, key: value};
}
