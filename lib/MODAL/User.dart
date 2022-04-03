class ClubhouseUser{
  String? uid;
  String? email;
  String? name;
  String? num;

  ClubhouseUser({
    required this.uid,
    required this.email,
    required this.name,
    required this.num,
  });

  factory ClubhouseUser.fromMap(map){
    return ClubhouseUser(
      uid: map['uid'],
      email: map['email'],
      name: map['name'],
      num: map['num'],
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'num': num,
    };
  }
}
