class ChallengeResponse {
  final int statusCode;
  final dynamic data;
  final String? message;

  ChallengeResponse({
    required this.statusCode,
    required this.data,
    this.message,
  });
}

class Challengeservice {
  Future<ChallengeResponse> getChallenge() async {
    try {
      return ChallengeResponse(statusCode: 201, data: null, message: "");
    } catch (e) {
      return ChallengeResponse(statusCode: 500, data: null, message: "");
    }
  }

  Future<ChallengeResponse> getThemes() async {
    try {
      return ChallengeResponse(statusCode: 201, data: null, message: "");
    } catch (e) {
      return ChallengeResponse(statusCode: 500, data: null, message: "");
    }
  }

  Future<ChallengeResponse> getSeries() async {
    try {
      return ChallengeResponse(statusCode: 201, data: null, message: "");
    } catch (e) {
      return ChallengeResponse(statusCode: 500, data: null, message: "");
    }
  }

  Future<ChallengeResponse> searchTheme(String title) async {
    try {
      print(title);
      return ChallengeResponse(statusCode: 201, data: null, message: "");
    } catch (e) {
      return ChallengeResponse(statusCode: 500, data: null, message: "");
    }
  }

  Future<ChallengeResponse> searchChallenge(String query) async {
    try {
      print(query);
      return ChallengeResponse(statusCode: 201, data: null, message: "");
    } catch (e) {
      return ChallengeResponse(
        statusCode: 500,
        data: null,
        message: "Erreur serveur",
      );
    }
  }

  Future<ChallengeResponse> searchSeries(String title) async {
    try {
      print(title);
      return ChallengeResponse(statusCode: 201, data: null, message: "");
    } catch (e) {
      return ChallengeResponse(statusCode: 500, data: null, message: "");
    }
  }

  Future<ChallengeResponse> participeChallenge(
    int user_id,
    int challenge_id,
  ) async {
    try {
      print("$user_id participe à $challenge_id");
      return ChallengeResponse(statusCode: 201, data: null, message: "");
    } catch (e) {
      return ChallengeResponse(
        statusCode: 500,
        data: null,
        message: "Erreur serveur",
      );
    }
  }
}
