class PhoneFormatter {
  static String formatPhoneNumber(String text) {
    String cleanedText = text.replaceAll(RegExp(r'[^\d]'), '');

    String formattedText = '';
    while (cleanedText.isNotEmpty) {
      formattedText += cleanedText.substring(0, 3) + '-';
      cleanedText = cleanedText.substring(3);
    }

    if (formattedText.endsWith('-')) {
      formattedText = formattedText.substring(0, formattedText.length - 1);
    }

    return formattedText;
  }
}
