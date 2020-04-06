class SummaryResponse {
  List<Country> countries;
  String date;

  SummaryResponse({this.countries, this.date});

  factory SummaryResponse.fromJson(Map<String, dynamic> json) {
    return SummaryResponse(
      countries: json['Countries'] != null ? (json['Countries'] as List).map((i) => Country.fromJson(i)).toList() : null,
      date: json['Date'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Date'] = this.date;
    if (this.countries != null) {
      data['Countries'] = this.countries.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Country {
  String country;
  int newConfirmed;
  int newDeaths;
  int newRecovered;
  String slug;
  int totalConfirmed;
  int totalDeaths;
  int totalRecovered;

  Country({this.country, this.newConfirmed, this.newDeaths, this.newRecovered, this.slug, this.totalConfirmed, this.totalDeaths, this.totalRecovered});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      country: json['Country'],
      newConfirmed: json['NewConfirmed'],
      newDeaths: json['NewDeaths'],
      newRecovered: json['NewRecovered'],
      slug: json['Slug'],
      totalConfirmed: json['TotalConfirmed'],
      totalDeaths: json['TotalDeaths'],
      totalRecovered: json['TotalRecovered'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Country'] = this.country;
    data['NewConfirmed'] = this.newConfirmed;
    data['NewDeaths'] = this.newDeaths;
    data['NewRecovered'] = this.newRecovered;
    data['Slug'] = this.slug;
    data['TotalConfirmed'] = this.totalConfirmed;
    data['TotalDeaths'] = this.totalDeaths;
    data['TotalRecovered'] = this.totalRecovered;
    return data;
  }
}