import 'package:bloc/bloc.dart';
import 'package:booklyapp/features/home/data/models/book_model/book_model.dart';
import 'package:booklyapp/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());

  final HomeRepo homeRepo;
  Future<void> fetch_featuredBooks({int pageNumper = 0}) async {
    if (pageNumper == 0) {
      emit(FeaturedBooksLoding());
    } else {
      emit(FeaturedBookspaginationLoding());
    }

    var Result = await homeRepo.fetch_featuredBooks(pageNumper: pageNumper);
    Result.fold((failure) {
      if (pageNumper == 0) {
        emit(
          FeaturedBooksFailure(failure.errorMassage),
        );
      } else {
        emit(FeaturedBooksFailurepagination(failure.errorMassage));
      }
    }, (books) {
      emit(
        FeaturedBooksSuccess(books),
      );
    });
  }
}
