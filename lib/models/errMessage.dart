class ErrMsg {
  bool success;
  String message;
  ErrMsg({required this.message, required this.success});
  factory ErrMsg.fromJson(Map<String, dynamic> json) =>
      ErrMsg(message: json["message"], success: json["success"]);
  Map<String, dynamic> toJson() => {"success": success, "message": message};
}
