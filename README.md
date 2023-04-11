Since it is impossible to get country phone codes from https://restcountries.com/, I partially borrowed the code from this package: https://pub.dev/packages/country_picker and adapted it to my project.

The project implemented:
1. Searching by country name & country (phone) code;
2. Phone number formatter works depending on the selected country, because different countries have different number lengths. For example, in China, the number consists of 11 digits, and in Ukraine - of 9.