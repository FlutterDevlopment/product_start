import "package:flutter/material.dart";
import '../constants.dart';

class ProductPageBanner extends StatelessWidget {
  const ProductPageBanner({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: kHorizontalPadding, vertical: kVerticalPadding),
      child: Container(
        width: double.infinity,
        height: size.height * 0.23,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage("images/home_card.jpg"),
              ),
            ),
            Positioned(
              top: 53,
              left: 85,
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Summer Sales",
                      style: kBannerTextStyle,
                    ),
                    TextSpan(
                      text: "\n\t\t\t\tupto 50% off",
                      style: kBannerTextStyle.copyWith(
                        fontSize: 15.0,
                        color: Colors.grey[300],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
