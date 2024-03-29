import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nekoton_flutter/nekoton_flutter.dart';

import 'design.dart';

extension FastMediaQuery on BuildContext {
  MediaQueryData get media => MediaQuery.of(this);

  Size get screenSize => media.size;
  EdgeInsets get safeArea => media.padding;
  EdgeInsets get keyboardInsets => media.viewInsets;
}

extension StringX on String {
  String get capitalize =>
      trim().split('.').map((e) => e.isNotEmpty ? e.replaceFirst(e[0], e[0].toUpperCase()) : e).join(' ').trim();
}

extension DoubleX on double {
  String toStringAsCrypto({
    int minimumFractionDigits = 2,
    int maximumFractionDigits = 9,
    bool allowMinusSign = true,
    bool allowPlusSign = false,
    String? currency,
  }) {
    final buffer = StringBuffer("###,###,##0");

    if (minimumFractionDigits > 0 || maximumFractionDigits > 0) buffer.write('.');

    for (var i = 0; i < minimumFractionDigits; i++) {
      buffer.write('0');
    }

    final additionalFractionDigits = maximumFractionDigits - minimumFractionDigits;
    if (additionalFractionDigits > 0) {
      for (var i = 0; i < additionalFractionDigits; i++) {
        buffer.write('#');
      }
    }

    final formatter = NumberFormat(buffer.toString(), 'en_EN');
    final formattedValue = formatter.format(this).replaceFirst(formatter.symbols.MINUS_SIGN, '');

    buffer.clear();

    if (sign > 0 && allowPlusSign) {
      buffer.write(formatter.symbols.PLUS_SIGN);
      buffer.write(' ');
    } else if (sign < 0 && allowMinusSign) {
      buffer.write(formatter.symbols.MINUS_SIGN);
      buffer.write(' ');
    }
    buffer.write(formattedValue);

    if (currency != null) {
      buffer.write(' ');
      buffer.write(currency);
    }

    return buffer.toString();
  }
}

extension Describe on WalletType {
  String describe() => when(
        multisig: (multisigType) {
          switch (multisigType) {
            case MultisigType.safeMultisigWallet:
              return 'SafeMultisig';
            case MultisigType.safeMultisigWallet24h:
              return 'SafeMultisig24';
            case MultisigType.setcodeMultisigWallet:
              return 'SetcodeMultisig';
            case MultisigType.surfWallet:
              return 'Surf';
          }
        },
        walletV3: () => 'WalletV3',
      );
}

extension FormatTransactionTime on DateTime {
  String format() {
    final DateFormat formatter = DateFormat('MM/dd/yy HH:mm');
    final String formatted = formatter.format(this);
    return formatted;
  }
}
