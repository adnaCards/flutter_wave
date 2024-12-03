class Customer {
  String email;
  String phoneNumber;
  String name;

  Customer({required this.name, required this.phoneNumber, required this.email});

  /// Converts instance of Customer to json
  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "phonenumber": phoneNumber,
      "name": name
    };
  }
}