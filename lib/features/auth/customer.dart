class Customer {
  Customer({
    required this.id,
    required this.name,
    required this.email,
    required this.mobileNumber,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: json['id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      mobileNumber: json['mobileNumber'] as String?,
    );
  }

  factory Customer.def() {
    return Customer(
      id: 'Vitalii',
      name: 'Kharlan',
      email: 'vitaliy.kharlan.1977@gmail.com',
      mobileNumber: '+38 (050) 4848948',
    );
  }

  final String? id;
  final String? name;
  final String? email;
  final String? mobileNumber;

  Customer copyWith({
    String? id,
    String? name,
    String? email,
    String? mobileNumber,
  }) {
    return Customer(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      mobileNumber: mobileNumber ?? this.mobileNumber,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'mobileNumber': mobileNumber,
    };
  }
}
