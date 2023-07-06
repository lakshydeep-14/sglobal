import 'package:flutter/material.dart';

class OnError extends StatelessWidget {
  final String error;
  final VoidCallback? onRetryTap;

  const OnError({
    Key? key,
    required this.error,
    this.onRetryTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "ERROR!",
            ),
            const SizedBox(height: 5),
            Text(error, style: const TextStyle(color: Colors.black)),
            const SizedBox(height: 30),
            SizedBox(
              width: 100,
              child: TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue)),
                onPressed: onRetryTap ?? () {},
                child: const Text(
                  "Retry",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
