import 'package:flutter/material.dart';
import 'package:tt_phone_field/theme/app_text_styles.dart';

import '../../models/country.dart';
import '../../resources/country_data.dart';
import '../../services/country_service.dart';
import '../../utils/utils.dart';
import '../fields/app_field/app_text_field.dart';

class CountryListView extends StatefulWidget {
  final ValueChanged<Country> onSelect;

  final bool showPhoneCode;

  final bool searchAutofocus;

  final bool showWorldWide;

  final bool showSearch;

  const CountryListView({
    super.key,
    required this.onSelect,
    this.showPhoneCode = true,
    this.searchAutofocus = false,
    this.showWorldWide = false,
    this.showSearch = true,
  });

  @override
  State<CountryListView> createState() => _CountryListViewState();
}

class _CountryListViewState extends State<CountryListView> {
  final CountryService _countryService = CountryService();

  late List<Country> _countryList;
  late List<Country> _filteredList;

  @override
  void initState() {
    super.initState();

    _countryList = _countryService.getAll();

    _countryList =
        countryData.map((country) => Country.fromJson(json: country)).toList();

    if (!widget.showPhoneCode) {
      final ids = _countryList.map((e) => e.countryCode).toSet();
      _countryList.retainWhere((country) => ids.remove(country.countryCode));
    }

    _filteredList = <Country>[];
    if (widget.showWorldWide) {
      _filteredList.add(Country.worldWide);
    }
    _filteredList.addAll(_countryList);
  }

  void _filterSearchResults(String query) {
    List<Country> searchResult = <Country>[];

    if (query.isEmpty) {
      searchResult.addAll(_countryList);
    } else {
      searchResult = _countryList.where((c) => c.startsWith(query)).toList();
    }

    setState(() => _filteredList = searchResult);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            'Country code',
            style: AppTextStyles.mainTextStyle,
          ),
        ),
        const SizedBox(height: 12),
        if (widget.showSearch)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: AppTextField(
              onChanged: _filterSearchResults,
              hintText: 'Search a country',
              prefixIcon: const Icon(Icons.search),
            ),
          ),
        Expanded(
          child: ListView(
            children: [
              ..._filteredList
                  .map<Widget>((country) => _buildCountryTile(country))
                  .toList(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCountryTile(Country country) {
    final bool isRtl = Directionality.of(context) == TextDirection.rtl;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          widget.onSelect(country);
          Navigator.pop(context);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Row(
            children: <Widget>[
              Row(
                children: [
                  const SizedBox(width: 20),
                  _buildCountryFlag(country),
                  if (widget.showPhoneCode && !country.iswWorldWide) ...[
                    const SizedBox(width: 16),
                    SizedBox(
                      width: 64,
                      child: Text(
                        '${isRtl ? '' : '+'}${country.phoneCode}${isRtl ? '+' : ''}',
                        style: AppTextStyles.secondaryTextStyle,
                      ),
                    ),
                    const SizedBox(width: 4),
                  ] else
                    const SizedBox(width: 16),
                ],
              ),
              Expanded(
                child: Text(
                  country.name,
                  style: AppTextStyles.countryNameTextStyle,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCountryFlag(Country country) {
    final bool isRtl = Directionality.of(context) == TextDirection.rtl;
    return SizedBox(
      width: isRtl ? 52 : null,
      child: Text(
        country.iswWorldWide
            ? '\uD83C\uDF0D'
            : Utils.countryCodeToEmoji(country.countryCode),
        style: const TextStyle(
          fontSize: 32,
        ),
      ),
    );
  }
}
