import '../utils/utils.dart';

class Country {
  final String phoneCode;
  final String name;
  final String example;
  final String countryCode;

  Country({
    required this.phoneCode,
    required this.name,
    required this.example,
    required this.countryCode,
  });

  bool startsWith(String newQuery) {
    String query = newQuery;
    if (newQuery.startsWith("+")) {
      query = newQuery.replaceAll("+", "").trim();
    }
    return phoneCode.startsWith(query.toLowerCase()) ||
        name.toLowerCase().startsWith(query.toLowerCase()) ||
        countryCode.toLowerCase().startsWith(query.toLowerCase());
  }

  static Country worldWide = Country(
    phoneCode: '',
    countryCode: 'WW',
    name: 'World Wide',
    example: '',
  );

  Country.fromJson({required Map<String, dynamic> json})
      : phoneCode = json['e164_cc'],
        countryCode = json['iso2_cc'],
        name = json['name'],
        example = json['example'];

  bool get iswWorldWide => countryCode == Country.worldWide.countryCode;

  String get flagEmoji => Utils.countryCodeToEmoji(countryCode);
}
