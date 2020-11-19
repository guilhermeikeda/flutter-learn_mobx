import 'package:mobx/mobx.dart';
import 'package:validators/validators.dart';
import 'form_error_state.dart';

part 'login.store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  final FormErrorState error = FormErrorState();
  List<ReactionDisposer> _disposers;

  void setupValidations() {
    _disposers = [
      reaction((_) => name, validateUsername),
      reaction((_) => email, validateEmail),
      reaction((_) => password, validatePassword)
    ];
  }

  @observable
  String name = '';

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  ObservableFuture<bool> usernameCheck = ObservableFuture.value(true);

  @computed
  bool get isUserCheckPending => usernameCheck.status == FutureStatus.pending;

  @computed
  bool get canLogin => !error.hasErrors;

  @action
  void setUsername(String value) => name = value;

  @action
  void setEmail(String value) => email = value;

  @action
  void setPassword(String value) => password = value;

  @action
  Future validateUsername(String value) async {
    if (isNull(value) || value.isEmpty) {
      error.username = 'Cannot be blank';
      return;
    }

    try {
      usernameCheck = ObservableFuture(checkValidUsername(value));

      error.username = null;

      final isValid = await usernameCheck;

      if (!isValid) {
        error.username = 'Username cannot be "admin"';
        return;
      }
    } on Object catch (_) {
      error.username = null;
    }
    error.username = null;
  }

  @action
  void validatePassword(String value) {
    error.password = isNull(value) || value.isEmpty ? 'Cannot be blank' : null;
  }

  @action
  void validateEmail(String value) {
    error.email = isEmail(value) ? null : 'Not a valid email';
  }

  Future<bool> checkValidUsername(String value) async {
    await Future.delayed(const Duration(seconds: 1));

    return value != 'admin';
  }

  void validateAll() {
    validatePassword(password);
    validateEmail(email);
    validateUsername(name);
  }

  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }
}
