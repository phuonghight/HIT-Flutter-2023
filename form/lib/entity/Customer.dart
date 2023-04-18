class Customer {
  String name;

  // 1: khách hàng
  // 2: vừa là khách hàng vừa là nà cung cấp
  // 3: nhà cung cấp
  int? type;

  String city;
  String district;
  String phoneNumber;
  String address;
  String email;
  String taxcode;
  String idNumber;
  String description;

  Customer({
    this.district = '',
    this.address = '',
    this.description = '',
    this.email = '',
    this.phoneNumber = '',
    required this.name,
    required this.type,
    required this.city,
    required this.taxcode,
    required this.idNumber,
  });
}
