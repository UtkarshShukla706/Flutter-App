extension Extensioncase on String {
 
  String toTitleCase() {
    
    return trim()
        .split(' ')
        .map(
          (word) =>
              word.isNotEmpty
                  ? word[0].toUpperCase() + word.substring(1).toLowerCase()
                  : word,
        )
        .join(' ');
  }

  
  String toCamelCase() {
    if (isEmpty) return this; 

    
    List<String> words = trim().split(' ');
    String firstWord =
        words.first.toLowerCase();
    String camelCaseString =
        firstWord +
        words
            .sublist(1)
            .map((word) {
              return word.isEmpty
                  ? ''
                  : word[0].toUpperCase() + word.substring(1).toLowerCase();
            })
            .join('');

    return camelCaseString;
  }
}
