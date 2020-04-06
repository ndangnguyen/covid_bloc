class StatisticsResponse {
  List<Object> errors;
  List<Object> parameters;
  List<CountryStatistics> countries;
  int results;

  StatisticsResponse({this.errors, this.parameters, this.countries, this.results});

  factory StatisticsResponse.fromJson(Map<String, dynamic> json) {
    return StatisticsResponse(
      countries: json['response'] != null ? (json['response'] as List).map((i) => CountryStatistics.fromJson(i)).toList() : null,
      results: json['results'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['results'] = this.results;
    if (this.countries != null) {
      data['response'] = this.countries.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CountryStatistics {
  Cases cases;
  String country;
  String day;
  Deaths deaths;
  String time;

  CountryStatistics({this.cases, this.country, this.day, this.deaths, this.time});

  factory CountryStatistics.fromJson(Map<String, dynamic> json) {
    return CountryStatistics(
      cases: json['cases'] != null ? Cases.fromJson(json['cases']) : null,
      country: json['country'],
      day: json['day'],
      deaths: json['deaths'] != null ? Deaths.fromJson(json['deaths']) : null,
      time: json['time'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['day'] = this.day;
    data['time'] = this.time;
    if (this.cases != null) {
      data['cases'] = this.cases.toJson();
    }
    if (this.deaths != null) {
      data['deaths'] = this.deaths.toJson();
    }
    return data;
  }
}

class Deaths {
  String newDeaths;
  int total;

  Deaths(this.newDeaths, this.total);

  factory Deaths.fromJson(Map<String, dynamic> json) {
    return Deaths(
      json['new'],
      json['total'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['new'] = this.newDeaths;
    data['total'] = this.total;
    return data;
  }
}

class Cases {
  int active;
  int critical;
  String newCase;
  int recovered;
  int total;

  Cases({this.active, this.critical, this.newCase, this.recovered, this.total});

  factory Cases.fromJson(Map<String, dynamic> json) {
    return Cases(
      active: json['active'],
      critical: json['critical'],
      newCase: json['new'],
      recovered: json['recovered'],
      total: json['total'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['active'] = this.active;
    data['critical'] = this.critical;
    data['new'] = this.newCase;
    data['recovered'] = this.recovered;
    data['total'] = this.total;
    return data;
  }
}
