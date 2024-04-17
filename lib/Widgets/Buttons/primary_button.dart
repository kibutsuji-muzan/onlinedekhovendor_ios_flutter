import 'package:flutter/material.dart';
import 'package:onlinedkhovendor/Constants/assets_images.dart';

class PrimaryButton extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  const PrimaryButton({super.key, this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 295,
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.blueGrey, backgroundColor: Colors.white,

          //textStyle: Colors.,
          side: const BorderSide(
            color: Colors.grey,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.only(left: 70),
          child: Row(
            children: [
              Text(title),
              Padding(
                padding: const EdgeInsets.only(left: 7),
                child: Image.asset(
                  AssetsImage.instance.truecallerIcon,
                  width: 45,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
