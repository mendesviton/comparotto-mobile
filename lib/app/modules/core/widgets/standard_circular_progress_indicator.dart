import 'package:flutter/material.dart';

class StandardCircularProgressIndicator extends StatelessWidget {
  const StandardCircularProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF036A33)),
          strokeWidth: 8,
          strokeCap: StrokeCap.round,
          backgroundColor: Color(0xFFD2D8D7),
        ),
      ),
    );
  }
}
