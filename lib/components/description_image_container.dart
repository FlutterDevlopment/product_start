import 'package:flutter/material.dart';
import 'package:product_saling_test/pages/description_page.dart';
import '../constants.dart';

class DescriptionImageContainer extends StatelessWidget {
  const DescriptionImageContainer({
    Key key,
    @required this.size,
    @required this.widget,
  }) : super(key: key);

  final Size size;
  final DescriptionPage widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height / 2.4,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
          Container(
            width: size.width,
            child: ClipRect(
              child: FadeInImage(
                fit: BoxFit.cover,
                image: NetworkImage(widget.imageUrl),
                placeholder: NetworkImage(widget.alternateImgUrl),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(kHorizontalPadding),
                child: CircleAvatar(
                  maxRadius: 23,
                  backgroundColor: Colors.grey.withOpacity(0.5),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(kHorizontalPadding),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 5.0,
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.white.withOpacity(0.5),
                      maxRadius: 23,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.shopping_bag,
                          color: Colors.grey[850],
                        ),
                      ),
                    ),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
