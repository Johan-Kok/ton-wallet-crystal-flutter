import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nekoton_flutter/nekoton_flutter.dart';

import '../../../domain/blocs/key/key_creation_bloc.dart';
import '../../../injection.dart';
import '../../design/design.dart';
import '../widget/input_password_modal_body.dart';

class DeriveKeyModalBody extends StatefulWidget {
  final KeySubject keySubject;
  final String name;

  const DeriveKeyModalBody({
    Key? key,
    required this.keySubject,
    required this.name,
  }) : super(key: key);

  static String get title => LocaleKeys.derive_key_modal_title.tr();

  @override
  _DeriveKeyModalBodyState createState() => _DeriveKeyModalBodyState();
}

class _DeriveKeyModalBodyState extends State<DeriveKeyModalBody> {
  late final KeyCreationBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = getIt.get<KeyCreationBloc>();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocListener<KeyCreationBloc, KeyCreationState>(
        bloc: bloc,
        listener: (context, state) => state.maybeWhen(
          success: () {
            context.router.navigatorKey.currentState?.pop();
          },
          orElse: () => null,
        ),
        child: InputPasswordModalBody(
          onSubmit: (password) => bloc.add(
            KeyCreationEvent.deriveKey(
              name: widget.name,
              password: password,
              keySubject: widget.keySubject,
            ),
          ),
          publicKey: widget.keySubject.value.publicKey,
        ),
      );
}
