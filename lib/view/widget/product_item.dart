import 'package:artacode_challenge_app/model/product_model.dart';
import 'package:artacode_challenge_app/repository/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class ProductItem extends StatelessWidget {
  final ProductModel model;
  final VoidCallback? onTap;

  const ProductItem(this.model, {super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 56),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: AppColors.mainShadowColor,
                blurRadius: 12,
                offset: Offset(0, 4),
              )
            ],
          ),
          child: Material(
            color: Colors.white.withOpacity(.5),
            borderRadius: BorderRadius.circular(8),
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: onTap,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 56),
                  Text(
                    model.title,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    textDirection: TextDirection.rtl,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    intl.NumberFormat.decimalPattern().format(model.price),
                    style: TextStyle(
                      fontSize: 20,
                      height: .5,
                      color: AppColors.productPriceColor,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    'تومان',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.productPriceColor,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox.square(
              dimension: 112,
              child: Image.asset(
                model.images.first,
                fit: BoxFit.contain,
              ),
            ),
          ],
        )
      ],
    );
  }
}
