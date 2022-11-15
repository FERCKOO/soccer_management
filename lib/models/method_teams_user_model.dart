//Clase para obtener la liga en donde juega el usuario
class MethodLeaguesUser {
  String? league;

  MethodLeaguesUser(league){
    this.league = league;
  }
}

// clase para obtener el equipo en el que juega el usuario
class MethodTeamsUser {
  List teams = [];

  MethodTeamsUser(teams){
    this.teams = teams;
  }

  /*MethodTeamsUser.fromJson(Map<List, dynamic> json){
    teams = json['name']; // equipo
  }
  */
}
  