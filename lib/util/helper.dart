
String toTitleCase(String text) {
  if (text.isEmpty) {
    return text;
  }

  // List of words to exclude from being capitalized
  List<String> exceptions = [
    'and', 'or', 'nor', 'but', 'so', 'for', 'yet', 'the', 'a', 'an', 'in', 'on', 'at', 'by', 'with', 'has', 'have', 'of'
  ];

  return text.split(' ').map((word) {
    // Capitalize word if it's not an exception, otherwise leave it as is
    if (exceptions.contains(word.toLowerCase())) {
      return word.toLowerCase(); // Keep exception words lowercase
    } else {
      return word.length > 1
          ? word[0].toUpperCase() + word.substring(1).toLowerCase()
          : word.toUpperCase();
    }
  }).join(' ');
}


String nineTNine(double value){
  if(value > 99){
    return '99+';
  }else{
    return value.toStringAsFixed(0);
  }
}


bool validateEmail(String email) {
  final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
  return emailRegex.hasMatch(email);
}


