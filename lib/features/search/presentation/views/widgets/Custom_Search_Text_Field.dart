import 'package:booklyapp/features/search/presentation/Manger/SearchBooksCubit/search_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Custom_Search_Text_Field extends StatefulWidget {
  const Custom_Search_Text_Field({
    super.key,
  });

  @override
  State<Custom_Search_Text_Field> createState() =>
      _Custom_Search_Text_FieldState();
}

class _Custom_Search_Text_FieldState extends State<Custom_Search_Text_Field> {
  final TextEditingController textEditingController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      onFieldSubmitted: (value) {
        BlocProvider.of<SearchBooksCubit>(context)
            .SearchBooks(BookName: value);
        textEditingController.clear();
      },
      decoration: InputDecoration(
        enabledBorder: buildOutLineInputBorder(),
        focusedBorder: buildOutLineInputBorder(),
        hintText: "Search",
        suffixIcon: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutLineInputBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.white));
  }
}
