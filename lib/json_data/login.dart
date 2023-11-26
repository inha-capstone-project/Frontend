// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
    bool isSuccess;
    String message;
    Result result;
    String httpStatus;

    Login({
        required this.isSuccess,
        required this.message,
        required this.result,
        required this.httpStatus,
    });

    factory Login.fromJson(Map<String, dynamic> json) => Login(
        isSuccess: json["isSuccess"],
        message: json["message"],
        result: Result.fromJson(json["result"]),
        httpStatus: json["httpStatus"],
    );

    Map<String, dynamic> toJson() => {
        "isSuccess": isSuccess,
        "message": message,
        "result": result.toJson(),
        "httpStatus": httpStatus,
    };
}

class Result {
    Token token;
    int id;
    String userId;
    String nickname;

    Result({
        required this.token,
        required this.id,
        required this.userId,
        required this.nickname,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        token: Token.fromJson(json["token"]),
        id: json["id"],
        userId: json["userId"],
        nickname: json["nickname"],
    );

    Map<String, dynamic> toJson() => {
        "token": token.toJson(),
        "id": id,
        "userId": userId,
        "nickname": nickname,
    };
}

class Token {
    String accessToken;

    Token({
        required this.accessToken,
    });

    factory Token.fromJson(Map<String, dynamic> json) => Token(
        accessToken: json["accessToken"],
    );

    Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
    };
}