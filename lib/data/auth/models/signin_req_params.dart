import 'dart:convert';

SigninReqParams signinReqParamsFromJson(String str) => SigninReqParams.fromJson(json.decode(str));

String signinReqParamsToJson(SigninReqParams data) => json.encode(data.toJson());

class SigninReqParams {
    final String email;
    final String password;

    SigninReqParams({
        required this.email,
        required this.password,
    });

    SigninReqParams copyWith({
        String? email,
        String? password,
    }) => 
        SigninReqParams(
            email: email ?? this.email,
            password: password ?? this.password,
        );

    factory SigninReqParams.fromJson(Map<String, dynamic> json) => SigninReqParams(
        email: json["email"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
    };
}
