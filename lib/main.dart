import 'package:booklyapp/constants.dart';
import 'package:booklyapp/core/utils/API_Service.dart';
import 'package:booklyapp/core/utils/SimpelBlocObserver.dart';
import 'package:booklyapp/core/utils/service_locator.dart';
import 'package:booklyapp/features/Splash/presentation/views/splash_view.dart';
import 'package:booklyapp/features/home/data/repos/Home_repo_impl.dart';
import 'package:booklyapp/features/home/data/repos/home_repo.dart';
import 'package:booklyapp/features/home/presentation/manger/Newset_books_cubit/newset_books_cubit.dart';
import 'package:booklyapp/features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  setupServiceLocator();
  Bloc.observer =SimpelBlocObserver();
  runApp(const Bookly_App());
}

class Bookly_App extends StatelessWidget {
  const Bookly_App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
            getit.get<Home_repo_impl>(),
          )..fetch_featuredBooks(),
        ),
        BlocProvider(
          create: (context) => NewsetBooksCubit(
            Home_repo_impl(
              Api_Service(),
            ),
          )..fetch_NewsetBooks()
        ),
      ],
      child: GetMaterialApp(
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kprimaryColor,
          textTheme: GoogleFonts.montserratAlternatesTextTheme(
              ThemeData.dark().textTheme),
        ),
        debugShowCheckedModeBanner: false,
        home: const splash_view(),
      ),
    );
  }
}
