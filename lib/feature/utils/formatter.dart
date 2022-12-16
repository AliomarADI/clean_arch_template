class Formatter {
  static String getRawPhone(String phone) {
    return phone.replaceAll(RegExp('[^z0-9]'), '');
  }

  static String formatAddress(String address) {
    String formattedAddress = address.replaceFirst(', Алматы, Казахстан', '');
    formattedAddress = formattedAddress.replaceFirst('Алматы, Казахстан', '');
    formattedAddress = formattedAddress.replaceFirst('улица', 'ул.');
    formattedAddress = formattedAddress.replaceFirst('проспект', 'пр.');
    formattedAddress = formattedAddress.replaceFirst('миркорайон', 'мкр.');

    return formattedAddress;
  }
}
