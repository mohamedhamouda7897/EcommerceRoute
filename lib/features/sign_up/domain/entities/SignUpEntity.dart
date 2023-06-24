/// message : "success"
/// user : {"name":"noura","email":"noura66@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0OTZiMDllZGZkOTUzMDAzMzlmOThmOSIsIm5hbWUiOiJub3VyYSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNjg3NTk3MjE4LCJleHAiOjE2OTUzNzMyMTh9.qzcaT38313yqUPfYEgIAk_7-q6BRE8rP-0x9hNgCRQE"

class SignUpEntity {
  SignUpEntity({
    this.user,
    this.token,
  });

  User? user;
  String? token;
}

class User {
  User({
    this.name,
    this.email,
  });

  String? name;
  String? email;
}
