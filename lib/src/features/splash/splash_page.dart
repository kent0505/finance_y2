import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../blocs/money/money_bloc.dart';
import '../../core/db/db.dart';
import '../../core/db/prefs.dart';
import '../../core/widgets/others/loading_widget.dart';
import '../../core/widgets/custom_scaffold.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void load() async {
    await initDB().then((_) {
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          context.read<MoneyBloc>().add(GetMoneyEvent());

          if (onboard) {
            context.go('/onboard');
          } else {
            context.go('/home');
          }
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    load();
  }

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      body: LoadingWidget(),
    );
  }
}
