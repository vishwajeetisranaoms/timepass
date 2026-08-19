import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AnimatedXpBar extends StatelessWidget {
  final double progress; // 0.0 to 1.0
  final double height;

  const AnimatedXpBar({
    super.key,
    required this.progress,
    this.height = 12.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Stack(
        children: [
          FractionallySizedBox(
            widthFactor: progress.clamp(0.0, 1.0),
            child: Container(
              decoration: BoxDecoration(
                gradient: AppColors.xpGradient,
                borderRadius: BorderRadius.circular(999),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryFixedDim.withValues(alpha: 0.5),
                    blurRadius: 10,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CapacityBar extends StatelessWidget {
  final double progress;
  final Color activeColor;

  const CapacityBar({
    super.key,
    required this.progress,
    this.activeColor = AppColors.primaryFixedDim,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 6,
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
      ),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: progress.clamp(0.0, 1.0),
        child: Container(
          decoration: BoxDecoration(
            color: activeColor,
            borderRadius: BorderRadius.circular(999),
            boxShadow: [
              BoxShadow(
                color: activeColor.withValues(alpha: 0.8),
                blurRadius: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
