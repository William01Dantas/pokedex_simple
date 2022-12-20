import '../theme/color_outlet.dart';

class Functions {
  static colorCard(String color) {
    switch (color) {
      case 'black':
        return ColorOutlet.colorCardBlack;
      case 'blue':
        return ColorOutlet.colorCardBlue;
      case 'brown':
        return ColorOutlet.colorCardBrown;
      case 'gray':
        return ColorOutlet.colorCardGray;
      case 'green':
        return ColorOutlet.colorCardGreen;
      case 'pink':
        return ColorOutlet.colorCardPink;
      case 'purple':
        return ColorOutlet.colorCardPurple;
      case 'red':
        return ColorOutlet.colorCardRed;
      case 'white':
        return ColorOutlet.colorCardWhite;
      case 'yellow':
        return ColorOutlet.colorCardYellow;
      default:
        return ColorOutlet.colorCardBlack;
    }
  }

  static String upperCaseFirstLetter(String text) {
    return text[0].toUpperCase() + text.substring(1);
  }

  static String getAbreviation(String text) {
    var list = text.split('-');
    if (list.length < 2) {
      return text;
    } else {
      return '${list[0].substring(0, 2)}.${list[1]}';
    }
  }
}
