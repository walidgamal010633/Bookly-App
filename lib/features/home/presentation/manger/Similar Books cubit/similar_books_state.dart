part of 'similar_books_cubit.dart';

@immutable
sealed class SimilarBooksState {}

final class SimilarBooksInitial extends SimilarBooksState {}
final class SimilarBooksLoding extends SimilarBooksState {}
final class SimilarBooksSuccess extends SimilarBooksState {
  final List<BookModel> Books ;

  SimilarBooksSuccess({required this.Books});
}
final class SimilarBooksFailer extends SimilarBooksState {
  final String ErrorMassage ;

  SimilarBooksFailer({required this.ErrorMassage});
}
