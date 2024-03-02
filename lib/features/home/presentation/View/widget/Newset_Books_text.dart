import 'package:booklyapp/core/utils/Styles.dart';
import 'package:flutter/material.dart';

class Newset_Books_text extends StatelessWidget {
  const Newset_Books_text({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          "Newset Books",
          style: Styles.textstyle18,
        ),
      ],
    );
  }
}
