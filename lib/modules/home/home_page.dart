import 'package:animacao_teste/app/cubit/app_cubit.dart';
import 'package:animacao_teste/modules/home/pages/list_page.dart';
import 'package:animacao_teste/modules/home/pages/orange_page.dart';
import 'package:animacao_teste/modules/home/pages/red_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation'),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            context.read<AppCubit>().toggleMenu();
          },
        ),
      ),
      body: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          return IndexedStack(
            index: state.indexPage(state.appPages),
            children: const [
              ListPage(),
              OrangePage(),
              RedPage(),
            ],
          );
        },
      ),
    );
  }
}
