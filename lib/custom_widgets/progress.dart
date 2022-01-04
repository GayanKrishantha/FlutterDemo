import 'package:flutter/material.dart';
import 'package:test_f_one/helpers/constants.dart';

class ProgressWidget extends StatelessWidget {
  const ProgressWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.center,
      decoration: const BoxDecoration(
        color: Colors.white70,
      ),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(Dimensions.pX10)),
        width: Dimensions.pX200,
        height: Dimensions.pX150,
        alignment: AlignmentDirectional.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: SizedBox(
                height: Dimensions.pX48,
                width: Dimensions.pX48,
                child: CircularProgressIndicator(
                  backgroundColor: AppColors().primary,
                  value: null,
                  strokeWidth: Dimensions.pX4,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: Dimensions.pX24),
              child: const Center(
                child: Text(
                  "loading...",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
