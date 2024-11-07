import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/extra_model.dart';
import '../../../core/models/money.dart';
import '../../../core/widgets/others/svg_widget.dart';
import '../../../core/widgets/buttons/cuper_button.dart';
import '../../../blocs/navbar/navbar_bloc.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 60,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 30),
        margin: const EdgeInsets.only(
          left: 10,
          right: 10,
          bottom: 27,
        ),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(60),
        ),
        child: BlocBuilder<NavbarBloc, NavbarState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _NavBarButton(
                  asset: 'tab1',
                  active: state is NavbarInitial,
                  onPressed: () {
                    context.read<NavbarBloc>().add(ChangePageEvent(index: 0));
                  },
                ),
                _NavBarButton(
                  asset: 'tab2',
                  active: state is NavbarActivities,
                  onPressed: () {
                    context.read<NavbarBloc>().add(ChangePageEvent(index: 1));
                  },
                ),
                CuperButton(
                  onPressed: () {
                    context.push(
                      '/money',
                      extra: ExtraModel(
                        add: true,
                        money: defaultMoney,
                      ),
                    );
                  },
                  child: Container(
                    height: 43,
                    width: 43,
                    decoration: const BoxDecoration(
                      color: AppColors.main,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: SvgWidget('assets/+.svg'),
                    ),
                  ),
                ),
                _NavBarButton(
                  asset: 'tab3',
                  active: state is NavbarQuiz,
                  onPressed: () {
                    context.read<NavbarBloc>().add(ChangePageEvent(index: 2));
                  },
                ),
                _NavBarButton(
                  asset: 'tab4',
                  active: state is NavbarSettings,
                  onPressed: () {
                    context.read<NavbarBloc>().add(ChangePageEvent(index: 3));
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _NavBarButton extends StatelessWidget {
  const _NavBarButton({
    required this.asset,
    required this.active,
    required this.onPressed,
  });

  final String asset;
  final bool active;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return CuperButton(
      onPressed: onPressed,
      padding: 0,
      child: Container(
        width: 43,
        height: 43,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: active ? Colors.white : null,
        ),
        child: Center(
          child: SvgWidget(
            'assets/$asset.svg',
            color: active ? Colors.black : null,
          ),
        ),
      ),
    );
  }
}
