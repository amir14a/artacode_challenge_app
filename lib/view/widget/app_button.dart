import 'package:artacode_challenge_app/repository/colors.dart';
import 'package:flutter/material.dart';

class AppButton extends StatefulWidget {
  final VoidCallback? onTap;
  final String text;
  final bool isLoading;
  final double? minHeight;

  const AppButton({super.key, required this.text, this.onTap, this.isLoading = false, this.minHeight});

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool isTapDown = false;

  _setTapDown(bool value) {
    setState(() {
      isTapDown = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (event) => _setTapDown(true),
      onTapUp: (event) => _setTapDown(false),
      onTapCancel: () => _setTapDown(false),
      child: AnimatedScale(
        duration: kThemeAnimationDuration * .3,
        scale: isTapDown ? 0.875 : 1,
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: widget.minHeight ?? kMinInteractiveDimension),
          child: Material(
            borderRadius: BorderRadius.circular(50),
            elevation: 0,
            color: AppColors.mainButtonBg,
            child: InkWell(
              borderRadius: BorderRadius.circular(50),
              onTap: widget.onTap,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (widget.isLoading)
                    SizedBox.square(
                      dimension: 24,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                  else
                    Expanded(
                      child: Text(
                        textAlign: TextAlign.center,
                        widget.text,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
