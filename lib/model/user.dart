class User{
  final String imagePath;
  final String name;
  final String cvpath;
  final String occupation;
  final String region;
  final String address;
  final String education;
  final String sex;

  const User({
    required this.imagePath,
    required this.name,
    required this.cvpath,
    required this.occupation,
    required this.region,
    required this.address,
    required this.education,
    required this.sex,
  });
  User copy({
    String? imagePath,
    String? name,
    String? cvpath,
    String? occupation,
    String? region,
    String? address,
    String? education,
    String? sex,


  }) =>

  User(
    imagePath: imagePath ?? this.imagePath,
    name: name ?? this.name,
    cvpath: cvpath ?? this.cvpath,
    occupation: occupation ?? this.occupation,
    region: region ?? this.region,
    address: address ?? this.address,
    education: education ?? this.education,
    sex: sex ?? this.sex




  );


  static User fromJson(Map<String, dynamic> json) => User(
    imagePath: json['imagePath'],
    name: json['name'],
    cvpath: json['cvpath'],
    occupation: json['occupation'],
    region: json['region'],
    address: json['address'],
    education: json['education'],
    sex: json['sex'],
  );


Map<String, dynamic> toJson() => {
        'imagePath': imagePath,
        'name': name,
        'cvpath': cvpath,
        'occupation': occupation,
        'region': region,
        'address': address,
        'education': education,
        'sex': sex,

};


}