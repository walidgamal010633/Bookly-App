import 'package:booklyapp/core/utils/API_Service.dart';
import 'package:booklyapp/features/home/data/repos/Home_repo_impl.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

final getit = GetIt.instance;
void setupServiceLocator() {
  getit.registerSingleton<Home_repo_impl>(
    Home_repo_impl(
      Api_Service(),
    ),
  );
}
