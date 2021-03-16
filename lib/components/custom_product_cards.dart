import 'package:flutter/material.dart';
import 'package:product_saling_test/blueprints/image_hub.dart';
import 'package:product_saling_test/pages/description_page.dart';
import 'package:show_up_animation/show_up_animation.dart';
import '../constants.dart';

class CustomProductCards extends StatelessWidget {
  const CustomProductCards({
    Key key,
    @required this.size,
    this.categoryItems,
    this.index,
  }) : super(key: key);

  final Size size;
  final categoryItems;
  final index;

  @override
  Widget build(BuildContext context) {
    String price = categoryItems[index]["productCost"];
    ImageHub imageHub = ImageHub();
    String imageUrl = categoryItems[index]["productImage"];
    String alternateImgUrl = imageHub.getImage();
    var size = MediaQuery.of(context).size;
    return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DescriptionPage(
                  product: categoryItems[index],
                  imageUrl: imageUrl,
                  alternateImgUrl: alternateImgUrl),
            ),
          );
        },
        child: ShowUpAnimation(
          delayStart: Duration(milliseconds: 3),
          animationDuration: Duration(seconds: 2),
          curve: Curves.bounceIn,
          direction: Direction.vertical,
          offset: 0.5,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Container(
              width: size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF88898E), Color(0xFFDEDFE1)],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFBCBDC2),
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 10.0,
                  ),
                ],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: FadeInImage(
                            fit: BoxFit.cover,
                            placeholder: NetworkImage(alternateImgUrl),
                            image: NetworkImage(imageUrl),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: kVerticalPadding),
                        child: Text(
                          categoryItems[index]["productName"],
                          style: kProductTitle,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: kVerticalPadding),
                        child: Text("\$${price.substring(0, 3)}",
                            style: kPriceText),
                      )
                    ],
                  ),
                )
              ]),
            ),
          ),
        ));
  }
}
