import 'package:mobx/mobx.dart';
import 'package:validators/validators.dart';

part 'form_error_state.g.dart';

class FormErrorState = _FormErrorState with _$FormErrorState;

abstract class _FormErrorState with Store {
  @observable
  String username;

  @observable
  String email;

  @observable
  String password;

  @computed
  bool get hasErrors =>
      !isNull(username) || !isNull(email) || !isNull(password);
}
