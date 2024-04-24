import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

class CustomLottieAnimationView extends StatelessWidget {
  final String lottieString;
  final String? displayText, actionText;
  final void Function()? actionOnPressed;

  const CustomLottieAnimationView({
    super.key,
    required this.lottieString,
    this.displayText,
    this.actionText,
    this.actionOnPressed
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Lottie.asset(
              lottieString,
              fit: BoxFit.contain,
            ),
            displayText != null ? Text(
              displayText!,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ) : const SizedBox.shrink(),
            const Gap(20),
            actionText != null ? SizedBox(
              width: 250,
              child: OutlinedButton(
                onPressed: actionOnPressed,
                child: Text(
                  actionText!,
                  style: Theme.of(context).textTheme.bodyMedium
                ),
              ),
            ) : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}