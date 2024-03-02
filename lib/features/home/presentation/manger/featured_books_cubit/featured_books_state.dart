part of 'featured_books_cubit.dart';

sealed class FeaturedBooksState extends Equatable {
  const FeaturedBooksState();

  @override
  List<Object> get props => [];
}

final class FeaturedBooksInitial extends FeaturedBooksState {}

final class FeaturedBooksLoding extends FeaturedBooksState {}

final class FeaturedBookspaginationLoding extends FeaturedBooksState {
  // final List<BookModel> books ;

  // FeaturedBookspaginationLoding(this.books);
}

final class FeaturedBooksSuccess extends FeaturedBooksState {
  final List<BookModel> books;

  const FeaturedBooksSuccess(this.books);
}

final class FeaturedBooksFailure extends FeaturedBooksState {
  final String ErrorMassage;

  const FeaturedBooksFailure(this.ErrorMassage);
}
final class FeaturedBooksFailurepagination extends FeaturedBooksState {
  final String ErrorMassage;

  const FeaturedBooksFailurepagination(this.ErrorMassage);
}

