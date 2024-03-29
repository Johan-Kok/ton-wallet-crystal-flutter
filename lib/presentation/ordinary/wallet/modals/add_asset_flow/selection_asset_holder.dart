import 'package:flutter/material.dart';

import '../../../../../domain/models/token_contract_asset.dart';
import '../../../../design/design.dart';
import '../../../../design/utils.dart';

class SelectionAssetHolder extends StatelessWidget {
  final TokenContractAsset asset;
  final bool? isSelected;
  final VoidCallback? onTap;

  const SelectionAssetHolder({
    Key? key,
    required this.asset,
    this.isSelected,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Material(
        type: MaterialType.card,
        color: CrystalColor.primary,
        child: CrystalInkWell(
          onTap: onTap,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 14.0,
              horizontal: 16.0,
            ),
            child: Row(
              children: [
                CircleIcon(
                  color: Colors.transparent,
                  icon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: asset.logoURI != null
                        ? getTokenAssetIcon(asset.logoURI!)
                        : getRandomTokenAssetIcon(asset.name.hashCode),
                  ),
                ),
                const CrystalDivider(width: 16.0),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 24,
                        child: Text(
                          asset.name,
                          style: const TextStyle(
                            fontSize: 18.0,
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w700,
                            color: CrystalColor.fontDark,
                          ),
                        ),
                      ),
                      const CrystalDivider(height: 2),
                      SizedBox(
                        height: 20,
                        child: Text(
                          asset.symbol,
                          style: const TextStyle(
                            fontSize: 14.0,
                            letterSpacing: 0.75,
                            color: CrystalColor.fontSecondaryDark,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (isSelected != null)
                  IgnorePointer(
                    child: CrystalSwitch(
                      isActive: isSelected!,
                      onTap: () {},
                    ),
                  ),
              ],
            ),
          ),
        ),
      );
}
