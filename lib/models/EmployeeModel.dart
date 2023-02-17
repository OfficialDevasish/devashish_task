import 'dart:convert';
/// success : true
/// message : "Register successfully."
/// data : {"session":{"token_type":"Bearer","expires_in":31536000,"access_token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIyIiwianRpIjoiOWQ4YmJlMjA5N2FiMzdhMTE2ODk1YTE3OGY4Mjk2ZTZmMjBlNmU3YzczYTE3MTc2M2Q0ZmJmNGZkZWMxNmFlMzMyYWRmOTQyNTE1N2YxYjQiLCJpYXQiOjE2NzUwNzcwMjUuMDI4NzYwOTEwMDM0MTc5Njg3NSwibmJmIjoxNjc1MDc3MDI1LjAyODc2MzA1NTgwMTM5MTYwMTU2MjUsImV4cCI6MTcwNjYxMzAyNS4wMjQxNjgwMTQ1MjYzNjcxODc1LCJzdWIiOiI0MSIsInNjb3BlcyI6WyIqIl19.iQC6OHm-wnN1VNWTrSA7CxOpYpUwEuLJShQR-gSd0E8320sL2rdt85D8ujFIB_UtfX1r08QXW1TTcROOF7tEgotkICuyz92wafjzJBEhVHcaMMyw6_YW-1XztOkZiWt6S5hWy5l3pmzX9F_qeEYJ47K39h3ASE_ZpaieqSMsspcueTF4JkKKTrj3rHShkDjyhzLgxRJrrZnA1TocDh3Jv0KyJ2ekBtfrwxamUIx2TuzxWU0WDAOWejv9pFzaM5e4Tz1YTebAfgDxOZuzxVGznJqFDT7lHIJyXSI70cR9GhsQKyCoP0s6jYiyc4YrUkJ5M-FYdeOLGxirBlz6V3q5ZNZv8w8SlH-OtHhfRFo6jF_C05AoLPtUPK9heL-UQm1eh2m0O6E92SBXvLZfsV5av3AnfDzcpZMBCQZH_UrYh3RvLyekEZP2DyJD96np-AR0TfS_-c-aGLMddTq8OgTc2LjBApBtHs59QFLaqC2ukbUuOSHk957_sk0IjFQ1HJoRbZVGTzWfpFSnFYUws5FvlSSNFrY1s3agGwRQtAdmsGd1FpHAZuMY1m09wjQUs2kLbn-F4WN3-Bo7tO5eZHNAoc87831nKy_CUH6rKsdYq_dj22qeyEjg8B26Cau9harboT_Y14WdUqevyrG_txZu_T4fHX5HrG3vT7yT2xK3DWs","refresh_token":"def5020064c6194d2ce3635f449545135d7993554bbbe5aeadc9c17fffc713dd94a5f19918dcb70089c8ce389bb6a29981fc2d2607ddd22ebce33b134eef3552b2a985dec3063f71fc65606d4e4929cff0a7d7b33a000bbee35e615c62b661542b7a1d07a50850d80f1c4d7642ee9d3b79a124f038f0dbed1b845c79da5b1eedb38261651bcbad120b93bbef4c8e04d548afa7a6dbdb08f14f3e6133f53ebd43d0025319f0c3f82d40d04c3f699e2685048aabc22daea91d470a5d92048ba869012eaa3874902d332d422b676d390d639655a27a73debf3309be06626935a093a141476c62fd20574e85ee4d275f33686b470a7cef34b87616a4870bad74a2524cec65d7e1860a3672da3adb89b3b694aeda7a1ad3ced4ac066dcdf0cd69350eb2bf03a30c0d3028376bf68e623ff37b56c1e69da2ca7a7096a9b19f93c3affd589a018e43bb8d5b3060a254a07c6a80de64de24e391bf3d84fdc5d3fa1e9e3527f36282d1"},"user":{"firstname":"rohit","lastname":"bhuva","email":"rbhuva@gmail.com","updated_at":"2023-01-30T11:10:24.000000Z","created_at":"2023-01-30T11:10:24.000000Z","id":41}}

EmployeeModel employeeModelFromJson(String str) => EmployeeModel.fromJson(json.decode(str));
String employeeModelToJson(EmployeeModel data) => json.encode(data.toJson());
class EmployeeModel {
  EmployeeModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  EmployeeModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;
EmployeeModel copyWith({  bool? success,
  String? message,
  Data? data,
}) => EmployeeModel(  success: success ?? _success,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get success => _success;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// session : {"token_type":"Bearer","expires_in":31536000,"access_token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIyIiwianRpIjoiOWQ4YmJlMjA5N2FiMzdhMTE2ODk1YTE3OGY4Mjk2ZTZmMjBlNmU3YzczYTE3MTc2M2Q0ZmJmNGZkZWMxNmFlMzMyYWRmOTQyNTE1N2YxYjQiLCJpYXQiOjE2NzUwNzcwMjUuMDI4NzYwOTEwMDM0MTc5Njg3NSwibmJmIjoxNjc1MDc3MDI1LjAyODc2MzA1NTgwMTM5MTYwMTU2MjUsImV4cCI6MTcwNjYxMzAyNS4wMjQxNjgwMTQ1MjYzNjcxODc1LCJzdWIiOiI0MSIsInNjb3BlcyI6WyIqIl19.iQC6OHm-wnN1VNWTrSA7CxOpYpUwEuLJShQR-gSd0E8320sL2rdt85D8ujFIB_UtfX1r08QXW1TTcROOF7tEgotkICuyz92wafjzJBEhVHcaMMyw6_YW-1XztOkZiWt6S5hWy5l3pmzX9F_qeEYJ47K39h3ASE_ZpaieqSMsspcueTF4JkKKTrj3rHShkDjyhzLgxRJrrZnA1TocDh3Jv0KyJ2ekBtfrwxamUIx2TuzxWU0WDAOWejv9pFzaM5e4Tz1YTebAfgDxOZuzxVGznJqFDT7lHIJyXSI70cR9GhsQKyCoP0s6jYiyc4YrUkJ5M-FYdeOLGxirBlz6V3q5ZNZv8w8SlH-OtHhfRFo6jF_C05AoLPtUPK9heL-UQm1eh2m0O6E92SBXvLZfsV5av3AnfDzcpZMBCQZH_UrYh3RvLyekEZP2DyJD96np-AR0TfS_-c-aGLMddTq8OgTc2LjBApBtHs59QFLaqC2ukbUuOSHk957_sk0IjFQ1HJoRbZVGTzWfpFSnFYUws5FvlSSNFrY1s3agGwRQtAdmsGd1FpHAZuMY1m09wjQUs2kLbn-F4WN3-Bo7tO5eZHNAoc87831nKy_CUH6rKsdYq_dj22qeyEjg8B26Cau9harboT_Y14WdUqevyrG_txZu_T4fHX5HrG3vT7yT2xK3DWs","refresh_token":"def5020064c6194d2ce3635f449545135d7993554bbbe5aeadc9c17fffc713dd94a5f19918dcb70089c8ce389bb6a29981fc2d2607ddd22ebce33b134eef3552b2a985dec3063f71fc65606d4e4929cff0a7d7b33a000bbee35e615c62b661542b7a1d07a50850d80f1c4d7642ee9d3b79a124f038f0dbed1b845c79da5b1eedb38261651bcbad120b93bbef4c8e04d548afa7a6dbdb08f14f3e6133f53ebd43d0025319f0c3f82d40d04c3f699e2685048aabc22daea91d470a5d92048ba869012eaa3874902d332d422b676d390d639655a27a73debf3309be06626935a093a141476c62fd20574e85ee4d275f33686b470a7cef34b87616a4870bad74a2524cec65d7e1860a3672da3adb89b3b694aeda7a1ad3ced4ac066dcdf0cd69350eb2bf03a30c0d3028376bf68e623ff37b56c1e69da2ca7a7096a9b19f93c3affd589a018e43bb8d5b3060a254a07c6a80de64de24e391bf3d84fdc5d3fa1e9e3527f36282d1"}
/// user : {"firstname":"rohit","lastname":"bhuva","email":"rbhuva@gmail.com","updated_at":"2023-01-30T11:10:24.000000Z","created_at":"2023-01-30T11:10:24.000000Z","id":41}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      Session? session, 
      User? user,}){
    _session = session;
    _user = user;
}

  Data.fromJson(dynamic json) {
    _session = json['session'] != null ? Session.fromJson(json['session']) : null;
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  Session? _session;
  User? _user;
Data copyWith({  Session? session,
  User? user,
}) => Data(  session: session ?? _session,
  user: user ?? _user,
);
  Session? get session => _session;
  User? get user => _user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_session != null) {
      map['session'] = _session?.toJson();
    }
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    return map;
  }

}

/// firstname : "rohit"
/// lastname : "bhuva"
/// email : "rbhuva@gmail.com"
/// updated_at : "2023-01-30T11:10:24.000000Z"
/// created_at : "2023-01-30T11:10:24.000000Z"
/// id : 41

User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());
class User {
  User({
      String? firstname, 
      String? lastname, 
      String? email, 
      String? updatedAt, 
      String? createdAt, 
      int? id,}){
    _firstname = firstname;
    _lastname = lastname;
    _email = email;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
    _id = id;
}

  User.fromJson(dynamic json) {
    _firstname = json['firstname'];
    _lastname = json['lastname'];
    _email = json['email'];
    _updatedAt = json['updated_at'];
    _createdAt = json['created_at'];
    _id = json['id'];
  }
  String? _firstname;
  String? _lastname;
  String? _email;
  String? _updatedAt;
  String? _createdAt;
  int? _id;
User copyWith({  String? firstname,
  String? lastname,
  String? email,
  String? updatedAt,
  String? createdAt,
  int? id,
}) => User(  firstname: firstname ?? _firstname,
  lastname: lastname ?? _lastname,
  email: email ?? _email,
  updatedAt: updatedAt ?? _updatedAt,
  createdAt: createdAt ?? _createdAt,
  id: id ?? _id,
);
  String? get firstname => _firstname;
  String? get lastname => _lastname;
  String? get email => _email;
  String? get updatedAt => _updatedAt;
  String? get createdAt => _createdAt;
  int? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['firstname'] = _firstname;
    map['lastname'] = _lastname;
    map['email'] = _email;
    map['updated_at'] = _updatedAt;
    map['created_at'] = _createdAt;
    map['id'] = _id;
    return map;
  }

}

/// token_type : "Bearer"
/// expires_in : 31536000
/// access_token : "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIyIiwianRpIjoiOWQ4YmJlMjA5N2FiMzdhMTE2ODk1YTE3OGY4Mjk2ZTZmMjBlNmU3YzczYTE3MTc2M2Q0ZmJmNGZkZWMxNmFlMzMyYWRmOTQyNTE1N2YxYjQiLCJpYXQiOjE2NzUwNzcwMjUuMDI4NzYwOTEwMDM0MTc5Njg3NSwibmJmIjoxNjc1MDc3MDI1LjAyODc2MzA1NTgwMTM5MTYwMTU2MjUsImV4cCI6MTcwNjYxMzAyNS4wMjQxNjgwMTQ1MjYzNjcxODc1LCJzdWIiOiI0MSIsInNjb3BlcyI6WyIqIl19.iQC6OHm-wnN1VNWTrSA7CxOpYpUwEuLJShQR-gSd0E8320sL2rdt85D8ujFIB_UtfX1r08QXW1TTcROOF7tEgotkICuyz92wafjzJBEhVHcaMMyw6_YW-1XztOkZiWt6S5hWy5l3pmzX9F_qeEYJ47K39h3ASE_ZpaieqSMsspcueTF4JkKKTrj3rHShkDjyhzLgxRJrrZnA1TocDh3Jv0KyJ2ekBtfrwxamUIx2TuzxWU0WDAOWejv9pFzaM5e4Tz1YTebAfgDxOZuzxVGznJqFDT7lHIJyXSI70cR9GhsQKyCoP0s6jYiyc4YrUkJ5M-FYdeOLGxirBlz6V3q5ZNZv8w8SlH-OtHhfRFo6jF_C05AoLPtUPK9heL-UQm1eh2m0O6E92SBXvLZfsV5av3AnfDzcpZMBCQZH_UrYh3RvLyekEZP2DyJD96np-AR0TfS_-c-aGLMddTq8OgTc2LjBApBtHs59QFLaqC2ukbUuOSHk957_sk0IjFQ1HJoRbZVGTzWfpFSnFYUws5FvlSSNFrY1s3agGwRQtAdmsGd1FpHAZuMY1m09wjQUs2kLbn-F4WN3-Bo7tO5eZHNAoc87831nKy_CUH6rKsdYq_dj22qeyEjg8B26Cau9harboT_Y14WdUqevyrG_txZu_T4fHX5HrG3vT7yT2xK3DWs"
/// refresh_token : "def5020064c6194d2ce3635f449545135d7993554bbbe5aeadc9c17fffc713dd94a5f19918dcb70089c8ce389bb6a29981fc2d2607ddd22ebce33b134eef3552b2a985dec3063f71fc65606d4e4929cff0a7d7b33a000bbee35e615c62b661542b7a1d07a50850d80f1c4d7642ee9d3b79a124f038f0dbed1b845c79da5b1eedb38261651bcbad120b93bbef4c8e04d548afa7a6dbdb08f14f3e6133f53ebd43d0025319f0c3f82d40d04c3f699e2685048aabc22daea91d470a5d92048ba869012eaa3874902d332d422b676d390d639655a27a73debf3309be06626935a093a141476c62fd20574e85ee4d275f33686b470a7cef34b87616a4870bad74a2524cec65d7e1860a3672da3adb89b3b694aeda7a1ad3ced4ac066dcdf0cd69350eb2bf03a30c0d3028376bf68e623ff37b56c1e69da2ca7a7096a9b19f93c3affd589a018e43bb8d5b3060a254a07c6a80de64de24e391bf3d84fdc5d3fa1e9e3527f36282d1"

Session sessionFromJson(String str) => Session.fromJson(json.decode(str));
String sessionToJson(Session data) => json.encode(data.toJson());
class Session {
  Session({
      String? tokenType, 
      int? expiresIn, 
      String? accessToken, 
      String? refreshToken,}){
    _tokenType = tokenType;
    _expiresIn = expiresIn;
    _accessToken = accessToken;
    _refreshToken = refreshToken;
}

  Session.fromJson(dynamic json) {
    _tokenType = json['token_type'];
    _expiresIn = json['expires_in'];
    _accessToken = json['access_token'];
    _refreshToken = json['refresh_token'];
  }
  String? _tokenType;
  int? _expiresIn;
  String? _accessToken;
  String? _refreshToken;
Session copyWith({  String? tokenType,
  int? expiresIn,
  String? accessToken,
  String? refreshToken,
}) => Session(  tokenType: tokenType ?? _tokenType,
  expiresIn: expiresIn ?? _expiresIn,
  accessToken: accessToken ?? _accessToken,
  refreshToken: refreshToken ?? _refreshToken,
);
  String? get tokenType => _tokenType;
  int? get expiresIn => _expiresIn;
  String? get accessToken => _accessToken;
  String? get refreshToken => _refreshToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token_type'] = _tokenType;
    map['expires_in'] = _expiresIn;
    map['access_token'] = _accessToken;
    map['refresh_token'] = _refreshToken;
    return map;
  }

}