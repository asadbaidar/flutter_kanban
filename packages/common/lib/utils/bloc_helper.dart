import 'package:bloc/bloc.dart';
import 'package:common/common.dart';

typedef OnDataValue<V> = void Function(Data<V> data);

extension BlocHelper<T> on BlocBase<T> {
  Future<void> when<V>(
    Data<V> value, {
    required FutureCallback<V> act,
    required OnDataValue<V> emit,
    OnDataValue<V>? onLoaded,
    Callback<Data<V>>? loading,
    OnValueCallback<Data<V>, V>? loaded,
    OnValueCallback<Data<V>, Object>? failure,
  }) async {
    emit(loading?.call() ?? value.toLoading());
    try {
      final result = await act();
      if (V.toString() == 'void') {
        (onLoaded ?? emit)(value.toLoaded());
      } else {
        (onLoaded ??
            emit)(loaded?.call(result) ?? value.toLoaded(value: result));
      }
    } catch (e) {
      emit(failure?.call(e) ?? value.toFailure(error: e));
    }
  }
}

mixin SafeBloc<T> on BlocBase<T> {
  @override
  void emit(T state) {
    if (isClosed) return;
    super.emit(state);
  }
}
