class LoginPayload {
  final String email;
  final String password;

  LoginPayload(this.email, this.password);

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }
}
