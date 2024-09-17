String createPhoneString(String areaCode, String phoneNumber) {
  return "$areaCode(${phoneNumber.substring(0, 3)})${phoneNumber.substring(3, 6)}-${phoneNumber.substring(6)}";
}

String createPhoneVerificationString(String areaCode, String phoneNumber) {
  return "$areaCode ${phoneNumber.substring(6)} ${phoneNumber.substring(0, 3)} ${phoneNumber.substring(3, 6)}";
}
