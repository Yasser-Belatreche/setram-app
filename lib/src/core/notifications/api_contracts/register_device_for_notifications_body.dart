class RegisterDeviceForNotificationsBody {
  final String imeiNo;
  final String token;
  final String deviceName;

  RegisterDeviceForNotificationsBody(
      {required this.imeiNo, required this.token, required this.deviceName});

  Map<String, dynamic> toJson() {
    return {
      "imeiNo": imeiNo,
      "token": token,
      "deviceName": deviceName,
    };
  }
}
