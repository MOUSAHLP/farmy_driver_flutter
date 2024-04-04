class DeleteAccountParams {
  String? phone;
  String? password;

  DeleteAccountParams({this.phone, this.password});
  Map<String, dynamic> toJson() => {
    "phone": phone,
    "password": password,
  };
}