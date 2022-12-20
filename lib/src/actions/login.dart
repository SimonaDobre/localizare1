part of actions;

@freezed
class Login with _$Login {
  const factory Login({required String email, required String password}) = LoginStart;

  const factory Login.successful(AppUser user) = LoginSuccessful;

  const factory Login.error(Object error, StackTrace stackTrace) = LoginError;
}
