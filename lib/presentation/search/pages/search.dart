import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/common/helper/widgets/appbar/app_bar.dart';
import 'package:netflix/presentation/search/bloc/search_cubit.dart';
import 'package:netflix/presentation/search/bloc/selectable_option_cubit.dart';
import 'package:netflix/presentation/search/widgets/search_content.dart';
import 'package:netflix/presentation/search/widgets/search_filed.dart';
import 'package:netflix/presentation/search/widgets/search_options.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        title: Text('Search'),
        hideBack: false,
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => SelectOptionCubit()),
          BlocProvider(create: (context) => SearchCubit()),
        ],
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SearchFiledWidget(),
              SizedBox(
                height: 10,
              ),
              SearchOptions(),
              SizedBox(
                height: 10,
              ),
              Expanded(child: SearchContent()),
            ],
          ),
        ),
      ),
    );
  }
}
