String createPhoneString(String areaCode, String phoneNumber) {
  return "$areaCode(${phoneNumber.substring(0, 3)})${phoneNumber.substring(3, 6)}-${phoneNumber.substring(6)}";
}

String createPhoneStringFromAuth(String phoneNumber) {
  return "${phoneNumber.substring(0, 2)}(${phoneNumber.substring(2, 5)})${phoneNumber.substring(5, 8)}-${phoneNumber.substring(8)}";
}
