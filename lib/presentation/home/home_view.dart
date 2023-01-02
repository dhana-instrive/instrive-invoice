import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../app/app.dart';
import 'cubit/home_cubit.dart';
import 'home_viewmodel.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final HomeViewModel _viewModel;

  @override
  void initState() {
    _viewModel = HomeViewModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        App().closeApp();
        return true;
      },
      child: BlocBuilder<HomeCubit, int>(
        bloc: _viewModel.cubit,
        builder: (_, index){
          return Scaffold(
            body: PageView.builder(
                itemCount: 3,
                controller: _viewModel.pageController,
                onPageChanged: _viewModel.onPageChange,
                itemBuilder: (_, index)=>_viewModel.getPages(context)[index],
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(FontAwesomeIcons.peopleGroup),
                    label: 'Clients'),
                BottomNavigationBarItem(
                    icon: Icon(FontAwesomeIcons.fileInvoice),
                    label: 'invoices'),
                BottomNavigationBarItem(
                    icon: Icon(FontAwesomeIcons.cube),
                    label: 'Producs'),
              ],
              currentIndex: index,
              onTap: _viewModel.onTap,
            )
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}

