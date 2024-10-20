import 'dart:convert';

SignupReqParams signupReqParamsFromJson(String str) => SignupReqParams.fromJson(json.decode(str));

String signupReqParamsToJson(SignupReqParams data) => json.encode(data.toJson());

class SignupReqParams {
    final String email;
    final String password;

    SignupReqParams({
        required this.email,
        required this.password,
    });

    SignupReqParams copyWith({
        String? email,
        String? password,
    }) => 
        SignupReqParams(
            email: email ?? this.email,
            password: password ?? this.password,
        );

    factory SignupReqParams.fromJson(Map<String, dynamic> json) => SignupReqParams(
        email: json["email"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
    };
}
