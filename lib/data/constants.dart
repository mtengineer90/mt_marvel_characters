

class EndPoint {
  static String characters = 'characters';

  static String charactersProfile(String characterId) {
    return '$characters/$characterId';
  }
}

enum RequestTypes { get, post, delete, put }

enum HttpError { badRequest, notFound, serverError, unauthorized, invalidData }
