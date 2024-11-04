import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/presentation/search/bloc/search_cubit.dart';
import 'package:netflix/presentation/search/bloc/selectable_option_cubit.dart';
import 'package:netflix/presentation/search/widgets/selectable_option.dart';

class SearchOptions extends StatelessWidget {
  const SearchOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectOptionCubit, SearchType>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SelectableOption(
                title: 'Movie',
                isSelected:
                    context.read<SelectOptionCubit>().state == SearchType.movie,
                onTap: () {
                  context.read<SelectOptionCubit>().selectMovie();
                  context.read<SearchCubit>().search(
                        context.read<SearchCubit>().textEditingController.text,
                        context.read<SelectOptionCubit>().state,
                      );
                }),
            const SizedBox(
              width: 10,
            ),
            SelectableOption(
                title: 'TVs',
                isSelected:
                    context.read<SelectOptionCubit>().state == SearchType.tv,
                onTap: () {
                  context.read<SelectOptionCubit>().selectTV();
                  context.read<SearchCubit>().search(
                        context.read<SearchCubit>().textEditingController.text,
                        context.read<SelectOptionCubit>().state,
                      );
                }),
          ],
        );
      },
    );
  }
}
