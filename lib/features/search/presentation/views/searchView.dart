import 'package:booklyapp/core/utils/API_Service.dart';
import 'package:booklyapp/core/utils/service_locator.dart';
import 'package:booklyapp/features/search/Data/repos/SearchRepoImpl.dart';
import 'package:booklyapp/features/search/presentation/Manger/SearchBooksCubit/search_books_cubit.dart';
import 'package:booklyapp/features/search/presentation/views/widgets/SearchViewBody.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
            BlocProvider(
          create: (context) => SearchBooksCubit(SearchRepoImpl(Api_Service())),
        
        ),
           
        ],
              child: const Scaffold(
            body: SafeArea(child: SearchViewBody()),
          ),
    );
  }
}
