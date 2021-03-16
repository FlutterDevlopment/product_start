import 'package:flutter/material.dart';

class CustomElevationButton extends StatelessWidget {
  const CustomElevationButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ConstrainedBox(
        constraints:
            BoxConstraints.tightFor(width: double.infinity, height: 50),
        child: ElevatedButton(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(20),
            backgroundColor: MaterialStateProperty.all(
              Color(0xFF464648).withOpacity(0.8),
            ),
            shadowColor: MaterialStateProperty.all(
              Colors.white,
            ),
          ),
          onPressed: () {},
          child: Text(
            "Add to Cart",
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w800,
                fontFamily: "Nunito_bold"),
          ),
        ),
      ),
    );
  }
}
