import 'dart:math';

class ImageHub {
  String getImage() {
    var randomGenerator = Random();
    var number = randomGenerator.nextInt(100);

    String imageLink = "https://picsum.photos/250?image=$number";
    return imageLink;
  }
}
