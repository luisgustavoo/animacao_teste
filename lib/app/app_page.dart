import 'package:animacao_teste/app/cubit/app_cubit.dart';
import 'package:animacao_teste/modules/home/home_page.dart';
import 'package:animacao_teste/modules/home/widgets/menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppPage extends StatelessWidget {
  const AppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: const _AppView(),
    );
  }
}

class _AppView extends StatelessWidget {
  const _AppView();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            Widget child = const HomePage();

            var top = 0.0;
            var left = 0.0;
            var bottom = 0.0;
            var right = 0.0;
            if (state.menuApp.isOpen) {
              top = 100;
              left = 200;
              bottom = 100;
              right -= 200;

              child = ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    20,
                  ),
                ),
                child: Material(
                  elevation: 5,
                  child: child,
                ),
              );
            }

            return Stack(
              clipBehavior: Clip.none,
              // alignment: Alignment.center,
              // fit: StackFit.expand,
              children: [
                const MenuWidget(),
                AnimatedPositioned(
                  top: top,
                  left: left,
                  bottom: bottom,
                  right: right,
                  duration: const Duration(milliseconds: 200),
                  child: child,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
