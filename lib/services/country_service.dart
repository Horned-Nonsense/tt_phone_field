import '../models/country.dart';
import '../resources/country_data.dart';

class CountryService {
  final List<Country> _countries;

  CountryService()
      : _countries = countryData
            .map((country) => Country.fromJson(json: country))
            .toList();

  List<Country> getAll() {
    return _countries;
  }

  Country? findByCode(String? code) {
    final uppercaseCode = code?.toUpperCase();
    return _countries
        .firstWhere((country) => country.countryCode == uppercaseCode);
  }

  Country? findByName(String? name) {
    return _countries.firstWhere((country) => country.name == name);
  }
}
