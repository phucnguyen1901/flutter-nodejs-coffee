

class UserModel{
  final String name, username, id;

  UserModel(this.name, this.username, this.id);

  factory UserModel.fromJson( Map<String,dynamic> json){
    return UserModel(
        json['name'],
        json['username'],
        json['_id']
    );
  }

}




