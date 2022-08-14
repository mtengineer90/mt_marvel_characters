
import 'package:testcasemt/bloc/bloc_provider.dart';
import 'package:flutter/material.dart';
import '../bloc/character_detail_bloc.dart';
import '../bloc/character_list_bloc.dart';
import '../data/characters.dart';
import 'character_detail_screen.dart';
import 'character_list_item.dart';

class CharacterListScreen extends StatelessWidget {
  const CharacterListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<CharacterListBloc>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Karakter Listesi')),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Ara ...',
              ),
              onChanged: bloc.searchQuery.add,
            ),
          ),
          Expanded(
            child: _buildResults(bloc),
          )
        ],
      ),
    );
  }

  Widget _buildResults(CharacterListBloc bloc) {
    return StreamBuilder<List<Result>?>(
      stream: bloc.charactersStream,
      builder: (context, snapshot) {
        final results = snapshot.data;
        if (results == null) {
          return const Center(child: CircularProgressIndicator());
        } else if (results.isEmpty) {
          return const Center(child: Text('Veri mevcut değil...'));
        }
        return _buildSearchResults(results);
      },
    );
  }

  Widget _buildSearchResults(List<Result> results) {
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final character = results[index];
        return InkWell(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CharacterListItem(character: character),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BlocProvider(
                  bloc: CharacterDetailBloc(id: results[index].id.toString()),
                  child: const CharacterDetailScreen(),
                ),
              ),
            );

          },
        );
      },
    );
  }
}
