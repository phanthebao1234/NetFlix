import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/common/helper/widgets/appbar/app_bar.dart';
import 'package:netflix/presentation/search/bloc/select_option_cubit.dart';
import 'package:netflix/presentation/search/widgets/search_filed.dart';
import 'package:netflix/presentation/search/widgets/selectable_option.dart';

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
        providers: [BlocProvider(create: (context) => SelectOptionCubit())],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SearchFiledWidget(),
              const SizedBox(
                height: 10,
              ),
              BlocBuilder<SelectOptionCubit, SearchType>(
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SelectableOption(
                        title: 'Movie',
                        isSelected: context.read<SelectOptionCubit>().state ==
                            SearchType.moive,
                        onTap: () =>
                            context.read<SelectOptionCubit>().selectMovie(),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SelectableOption(
                        title: 'TVs',
                        isSelected: context.read<SelectOptionCubit>().state ==
                            SearchType.tv,
                        onTap: () =>
                            context.read<SelectOptionCubit>().selectTV(),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
