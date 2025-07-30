import 'package:flutter_bloc/flutter_bloc.dart';

/// Product Base Cubit
abstract class BaseCubit<T extends Object> extends Cubit<T> {
  // ignore: public_member_api_docs
  BaseCubit(super.initialState);

  @override
  void emit(T state) {
    if (isClosed) return;
    super.emit(state);
  }
}
