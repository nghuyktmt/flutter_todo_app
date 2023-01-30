import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
class State<T> with _$State<T> {
  const State._();

  const factory State.init() = _init<T>;
  const factory State.loading() = _loading;
  const factory State.success(final T data) = _success<T>;
  const factory State.error(final Exception exception) = _error;

  bool get isInit =>
      maybeWhen(() => true, init: () => true, orElse: () => false);

  bool get isLoading =>
      maybeWhen(() => true, loading: () => true, orElse: () => false);

  bool get isSuccess =>
      maybeWhen(() => true, success: (_) => true, orElse: () => false);

  bool get isError =>
      maybeWhen(() => true, error: (_) => true, orElse: () => false);

  T? get data =>
      maybeWhen(() => null, success: (data) => data, orElse: () => null);
}
