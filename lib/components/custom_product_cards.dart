import 'package:flutter/material.dart';
import '../constants.dart';

class CustomProductCards extends StatelessWidget {
  const CustomProductCards({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // TODO: go to description page
      },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 10.0,
              ),
            ],
            borderRadius: BorderRadius.circular(19),
            color: Colors.white,
          ),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  image: DecorationImage(
                      image:
                          NetworkImage("http://lorempixel.com/640/480/fashion"),
                      fit: BoxFit.cover),
                ),
                height: 100,
                width: 200,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  "\$389",
                  style: kTextStyle.copyWith(color: Colors.red, fontSize: 22),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: Text("Unbranded Steel Salad",
                    textAlign: TextAlign.center,
                    // overflow: TextOverflow.ellipsis,
                    style: kTextStyle.copyWith(
                        color: Colors.grey[700], fontSize: 15)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
