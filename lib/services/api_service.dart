import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/game_model.dart';

class ApiService {
  static const String baseUrl = 'https://www.freetogame.com/api/games';

  Future<List<Game>> fetchGames() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final List<dynamic> body = json.decode(response.body);
      return body.map((json) => Game.fromJson(json)).toList();
    } else {
      throw Exception('Gagal mengambil data game dari server');
    }
  }
}
