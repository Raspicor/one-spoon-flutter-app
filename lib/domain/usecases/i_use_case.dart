import 'dart:async';

abstract class IUseCase<I, O> {
  Future<O> invoke(I sender);
}
