part of 'newset_books_cubit.dart';

sealed class NewsetBooksState extends Equatable {
  const NewsetBooksState();

  @override
  List<Object> get props => [];
}

final class NewsetBooksInitial extends NewsetBooksState {}
final class NewsetBooksLoding extends NewsetBooksState {}
final class NewsetBooksSuccess extends NewsetBooksState{
  final List <BookModel> Books ;

 const NewsetBooksSuccess(this.Books);
}
final class NewsetBooksFailure extends NewsetBooksState {
  final String ErrorMassage;

 const NewsetBooksFailure(this.ErrorMassage);
}
