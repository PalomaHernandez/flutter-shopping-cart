import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget {
  final String label;  
  final String value; 

   const CustomRichText({
    super.key,
    required this.label,
    required this.value,
  });

   @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return RichText(
      text: TextSpan(
        text: label,
        style: theme.textTheme.bodyLarge
            ?.copyWith(fontWeight: FontWeight.w500),
        children: [
          TextSpan(
            text: value,
            style: theme.textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}