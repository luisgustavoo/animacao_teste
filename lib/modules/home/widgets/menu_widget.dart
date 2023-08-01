import 'package:animacao_teste/app/cubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          var left = -100.0;

          if (state.menuApp.isOpen) {
            left = 20.0;
          }

          return Stack(
            alignment: Alignment.centerLeft,
            children: [
              Container(
                color: Colors.blue,
              ),
              AnimatedPositioned(
                left: left,
                duration: const Duration(milliseconds: 200),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () {
                        context.read<AppCubit>().changePage(AppPages.listPage);
                      },
                      child: const Text(
                        'List Page',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        context
                            .read<AppCubit>()
                            .changePage(AppPages.orangePage);
                      },
                      child: const Text(
                        'Orange Page',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        context.read<AppCubit>().changePage(AppPages.redPage);
                      },
                      child: const Text(
                        'Red Page',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
