import 'package:flutter/material.dart';
import 'package:nekoton_flutter/nekoton_flutter.dart';

import '../../../../domain/blocs/account/current_accounts_bloc.dart';
import '../../../design/design.dart';
import '../../../router.gr.dart';
import 'profile_actions.dart';
import 'profile_carousel.dart';

class WalletBody extends StatelessWidget {
  final List<AssetsList> accounts;
  final AssetsList? currentAccount;
  final PanelController modalController;
  final CurrentAccountsBloc bloc;

  const WalletBody({
    Key? key,
    required this.accounts,
    required this.currentAccount,
    required this.modalController,
    required this.bloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => AnimatedAppearance(
        duration: const Duration(milliseconds: 400),
        child: SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.only(top: 14),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        LocaleKeys.wallet_screen_title.tr(),
                        style: const TextStyle(
                          fontSize: 30,
                          letterSpacing: 0.25,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      IconButton(
                        onPressed: () => context.router.push(const SettingsRouterRoute()),
                        icon: const Icon(
                          Icons.person,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
                const CrystalDivider(height: 16),
                AnimatedAppearance(
                  duration: const Duration(milliseconds: 250),
                  offset: const Offset(1, 0),
                  child: ProfileCarousel(
                    accounts: accounts,
                    onPageChanged: (i) {
                      if (i < accounts.length) {
                        bloc.add(CurrentAccountsEvent.setCurrentAccount(accounts[i].address));
                      } else {
                        modalController.hide();
                        bloc.add(const CurrentAccountsEvent.setCurrentAccount(null));
                      }
                    },
                    onPageSelected: (i) {
                      if (i == accounts.length) {
                        modalController.hide();
                      } else {
                        modalController.show();
                      }
                    },
                  ),
                ),
                const CrystalDivider(height: 16),
                if (currentAccount != null)
                  ProfileActions(
                    key: ValueKey(currentAccount!.address),
                    address: currentAccount!.address,
                  ),
                const CrystalDivider(height: 20),
              ],
            ),
          ),
        ),
      );
}