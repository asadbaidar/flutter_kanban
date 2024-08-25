import 'package:bloc/bloc.dart';

mixin SafeBloc<T> on BlocBase<T> {
  @override
  void emit(T state) {
    if (isClosed) return;
    super.emit(state);
  }
}
