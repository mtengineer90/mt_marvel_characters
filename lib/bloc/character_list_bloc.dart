
import 'dart:async';

import 'package:testcasemt/bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';
import '../data/characters.dart';
import '../data/constants.dart';
import '../data/request_repo.dart';

class CharacterListBloc implements Bloc {
  final client = ReqAPI();
  final _searchQueryController = StreamController<String?>();
  Sink<String?> get searchQuery => _searchQueryController.sink;
  late Stream<List<Result>?> charactersStream;


  CharacterListBloc() {
    charactersStream = _searchQueryController.stream
        .startWith(null)
        .debounceTime(const Duration(milliseconds: 100))
        .switchMap(

            (query) {
              if(query == null || query.isEmpty){
                return client
                    .get(endPoint: EndPoint.characters)
                    .asStream()
                    .startWith(null);
              } else {
                return client
                    .getWithQuery(endPoint: EndPoint.characters,query: query)
                    .asStream()
                    .startWith(null);
              }

        }
        );

  }

  @override
  void dispose() {
    _searchQueryController.close();
  }
}
