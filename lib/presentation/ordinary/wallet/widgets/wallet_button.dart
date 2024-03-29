import 'package:flutter/material.dart';

import '../../../design/design.dart';

class WalletButton extends StatelessWidget {
  const WalletButton({
    Key? key,
    this.onTap,
    required this.title,
    required this.iconAsset,
  }) : super(key: key);

  final String title;
  final VoidCallback? onTap;
  final String iconAsset;

  @override
  Widget build(BuildContext context) => ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 56.0),
        child: Column(
          children: [
            Container(
              height: 56.0,
              width: 56.0,
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                shape: const CircleBorder(),
                color: CrystalColor.secondary.withOpacity(0.16),
              ),
              child: Material(
                type: MaterialType.transparency,
                child: CrystalInkWell(
                  onTap: onTap,
                  splashColor: CrystalColor.secondary,
                  highlightColor: CrystalColor.secondary,
                  child: Center(
                    child: Image.asset(
                      iconAsset,
                      width: 20,
                      height: 20,
                      gaplessPlayback: true,
                      color: CrystalColor.secondary,
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                ),
              ),
            ),
            const CrystalDivider(height: 4.0),
            Text(
              title,
              style: const TextStyle(
                fontSize: 11,
                letterSpacing: 0.8,
                color: CrystalColor.secondary,
              ),
            ),
          ],
        ),
      );
}
