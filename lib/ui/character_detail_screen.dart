import 'package:testcasemt/bloc/bloc_provider.dart';
import 'package:testcasemt/data/characters.dart';
import 'package:flutter/material.dart';
import '../bloc/character_detail_bloc.dart';
import 'character_detail.dart';

class CharacterDetailScreen extends StatelessWidget{
  const CharacterDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<CharacterDetailBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Karakter Detay Sayfası'),
      ),
      body: RefreshIndicator(
        onRefresh: bloc.refresh,
        child: Container(
          alignment: Alignment.center,
          child: _buildContent(bloc),
        ),
      ),
    );
  }

  Widget _buildContent(CharacterDetailBloc bloc) {
    return StreamBuilder<Result?>(
      stream: bloc.characterStream,
      builder: (context, snapshot) {
        final character = snapshot.data;
        if (character == null) {
          return const Center(child: CircularProgressIndicator());
        }
        return CharacterDetail(character);
      },
    );
  }

}

