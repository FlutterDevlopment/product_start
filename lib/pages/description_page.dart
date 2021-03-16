import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:product_saling_test/blueprints/product_description_details.dart';
import 'package:product_saling_test/components/custom_elevationbutton.dart';
import 'package:product_saling_test/components/description_data_table.dart';
import 'package:product_saling_test/components/description_image_container.dart';
import 'package:product_saling_test/constants.dart';
import 'package:show_up_animation/show_up_animation.dart';

class DescriptionPage extends StatefulWidget {
  final product;
  final imageUrl;
  final alternateImgUrl;
  DescriptionPage({this.product, this.imageUrl, this.alternateImgUrl});

  @override
  _DescriptionPageState createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage>
    with TickerProviderStateMixin {
  AnimationController _animController;
  Animation<Offset> _animOffset;
  int delayAmount = 500;
  @override
  void initState() {
    _animController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    final curve =
        CurvedAnimation(curve: Curves.decelerate, parent: _animController);
    _animOffset =
        Tween<Offset>(begin: const Offset(0.0, 0.35), end: Offset.zero)
            .animate(curve);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _animController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    String price = widget.product["productCost"];
    var date = DateTime.parse(widget.product["productLaunchDate"]);
    var dateFormatted = "${date.day}-${date.month}-${date.year}";
    ProductDescriptions productDescriptions = ProductDescriptions();

    return Scaffold(
      // ignore: deprecated_member_use
      bottomNavigationBar: CustomElevationButton(),
      body: SizedBox(
        height: size.height,
        child: ListView(
          children: [
            ShowUpAnimation(
                delayStart: Duration(milliseconds: 100),
                animationDuration: Duration(seconds: 2),
                curve: Curves.bounceIn,
                direction: Direction.vertical,
                offset: 0.5,
                child: DescriptionImageContainer(size: size, widget: widget)),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFD6D6D6),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
              ),
              height: size.height,
              margin: EdgeInsets.only(top: size.height * 0.00001),
              child: ShowUpAnimation(
                delayStart: Duration(milliseconds: 3),
                animationDuration: Duration(seconds: 2),
                curve: Curves.bounceIn,
                direction: Direction.vertical,
                offset: 0.5,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  widget.product["productName"],
                                  style: TextStyle(
                                    color: Color(0xFF161618),
                                    fontSize: 22.5,
                                    fontFamily: "Nunito_bold",
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 5),
                                child: Text(
                                  "\$${price.substring(0, 3)}",
                                  style: kPriceText.copyWith(fontSize: 30),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.green[900],
                                  borderRadius: BorderRadius.circular(13)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5.3, vertical: 3),
                                child: Text(
                                  "4.7 ★",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 28,
                          ),
                          Text(
                            widget.product["productSummary"],
                            style: TextStyle(
                                color: Color(0xFF797A7F),
                                fontSize: 20,
                                fontFamily: "Nunito",
                                fontWeight: FontWeight.w600,
                                height: 1.5),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xFFEDEDED).withOpacity(0.8),
                            borderRadius: BorderRadius.circular(8)),
                        // height: 100,
                        width: size.width,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: ShowUpAnimation(
                            delayStart: Duration(milliseconds: 3),
                            animationDuration: Duration(seconds: 2),
                            curve: Curves.bounceIn,
                            direction: Direction.vertical,
                            offset: 0.5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Description",
                                  style: kProductTitle.copyWith(
                                      fontSize: 22, color: Color(0xFF21374D)),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                DescriptionDataTable(
                                    productDescriptions: productDescriptions,
                                    widget: widget,
                                    dateFormatted: dateFormatted)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
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
