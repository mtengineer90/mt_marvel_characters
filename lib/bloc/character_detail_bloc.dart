
import 'dart:async';

import 'package:testcasemt/bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';
import '../data/characters.dart';
import '../data/request_repo.dart';
import '../data/constants.dart';

class CharacterDetailBloc implements Bloc {
  final String id;
  final _refreshController = StreamController<void>();
  final _client = ReqAPI();

  late Stream<Result?> characterStream;

  CharacterDetailBloc({
    required this.id,
  }) {
    characterStream = _refreshController.stream
        .startWith({})
        .mapTo(id)
        .switchMap(
          (id) => _client.getDetail(endPoint: "${EndPoint.characters}/$id").asStream(),
        )
        .asBroadcastStream();
  }

  Future refresh() {
    final future = characterStream.first;
    _refreshController.sink.add({});
    return future;
  }

  @override
  void dispose() {
    _refreshController.close();
  }
}
