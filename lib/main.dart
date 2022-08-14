
import 'package:testcasemt/bloc/bloc_provider.dart';
import 'package:testcasemt/ui/app_colors.dart';
import 'package:testcasemt/ui/character_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'bloc/character_list_bloc.dart';

void main() {
  runApp(const CharacterFinder());
}

class CharacterFinder extends StatelessWidget {
  const CharacterFinder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final w500AclonicaFont = GoogleFonts.aclonica(
      fontWeight: FontWeight.w500,
    );
    return BlocProvider<CharacterListBloc>(
        bloc: CharacterListBloc(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Karakter Listesi',
          home: const CharacterListScreen(),
          theme: ThemeData(
            primarySwatch: AppColors.black,
            primaryColor: AppColors.black,
            colorScheme: Theme.of(context).colorScheme.copyWith(
                  secondary: AppColors.blue,
                  primary: AppColors.black,
                ),
            scaffoldBackgroundColor: AppColors.grey,
            backgroundColor: AppColors.grey,
            primaryTextTheme: TextTheme(
              headline6: w500AclonicaFont,
            ),
            textTheme: TextTheme(
              subtitle1: w500AclonicaFont.apply(color: AppColors.black),
              headline6: w500AclonicaFont.apply(color: AppColors.black),
              bodyText2: TextStyle(color: AppColors.black),
            ),
          ),
        ));
  }
}
