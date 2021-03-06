import 'dart:async';

import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:quake/src/bloc/earthquakes_bloc.dart';
import 'package:quake/src/locale/l10n/messages_all.dart';
import 'package:quake/src/utils/map_url.dart';
import 'package:quake/src/utils/unit_of_measurement_conversion.dart';

/// https://flutter.io/docs/development/accessibility-and-localization/internationalization
class QuakeLocalizations {
  static String localeCode;
  static _QuakeLocalizationsDelegate delegate = _QuakeLocalizationsDelegate();

  static Future<QuakeLocalizations> load(Locale locale) {
    final String _name =
        locale.countryCode == null ? locale.languageCode : locale.toString();
    final String _localeName = Intl.canonicalizedLocale(_name);
    QuakeLocalizations.localeCode = _localeName;
    return initializeMessages(_localeName).then((bool _) {
      Intl.defaultLocale = _localeName;
      return QuakeLocalizations();
    });
  }

  static QuakeLocalizations of(BuildContext context) =>
      Localizations.of<QuakeLocalizations>(context, QuakeLocalizations);

  // == SECTION general ==
  String get applicationName => Intl.message(
        "Quake",
        name: "applicationName",
        desc: "application name",
      );

  String get title => Intl.message(
        "Quake",
        name: "title",
      );

  String get earthquake => Intl.message(
        "Earthquake",
        name: "earthquake",
      );

  // == SECTION intro ==
  String get skip => Intl.message(
        "skip",
        name: "skip",
      );

  String get next => Intl.message(
        "next",
        name: "next",
      );

  String get finish => Intl.message(
        "finish",
        name: "finish",
      );

  String get welcomeTitle => Intl.message(
        "Welcome to Quake!",
        name: "welcomeTitle",
        desc: "the title of the first landing page screen",
      );

  String get welcomeDescription =>
      Intl.message("Keep track of the earthquakes near you to stay safe.",
          name: "welcomeDescription",
          desc: "the description of the first landing page screen");

  String get appStatusTitle => Intl.message(
        "You can make Quake better!",
        name: "appStatusTitle",
        desc: "the title of the second landing page screen",
      );

  String get appStatusDescription => Intl.message(
      "The app is in an active development state. Help the developer by reporting bug or suggesting features to add.",
      name: "appStatusDescription",
      desc: "the description of the first landing page screen");

  // == SECTION bottomAppBar ==
  String get all => Intl.message(
        "All",
        name: "all",
      );

  String get nearby => Intl.message(
        "Nearby",
        name: "nearby",
      );

  String get map => Intl.message(
        "Map",
        name: "map",
      );

  // == SECTION tooltips ==
  String get searchTooltip => Intl.message(
        "Search",
        name: "searchTooltip",
      );

  String get settingsTooltip => Intl.message(
        "settings",
        name: "settingsTooltip",
      );

  // == SECTION earthquakeCard ==
  String get magnitude => Intl.message(
        "Magnitude",
        name: "magnitude",
      );

  String get depthKm => Intl.message(
        "Depth (km)",
        name: "depthKm",
      );

  String get depth => Intl.message(
        "Depth",
        name: "depth",
      );

  // == SECTION error messages ==
  String get allEarthquakesError => Intl.message(
        "Failed to get the list of earthquakes, try again later because something bad happened.",
        name: "allEarthquakesError",
      );

  String get noInternetConnection => Intl.message(
        "You're not connected to internet, you must enable an internet connectionto use Quake.",
        name: "noInternetConnection",
      );

  String get noEarthquakes => Intl.message(
        "No earthquakes happened in the last 7 days.",
        name: "noEarthquakes",
      );

  // == SECTION nearby screen ==
  String get locationNotEnabled => Intl.message(
        "You have never allowed location permission, allow Quake to access it to view nearby earthquakes.",
        name: "locationNotEnabled",
      );

  String get promptForLocationPermissionButton => Intl.message(
        "Allow location permission.",
        name: "promptForLocationPermissionButton",
      );

  String get locationPromptAlertTitle => Intl.message(
        "Location permission",
        name: "locationPromptAlertTitle",
      );

  String get locationPromptAlertContent => Intl.message(
        "Quake needs location to show earthquakes nearby, we keep the data in the local storage",
        name: "locationPromptAlertContent",
      );

  // == SECTION general alerts ==
  String get alertCancelButton => Intl.message(
        "cancel",
        name: "alertCancelButton",
      );

  String get alertOkButton => Intl.message(
        "ok",
        name: "alertOkButton",
      );

  // == SECTION earthquake details ==
  String get peopleInvolved => Intl.message(
        "People involved",
        name: "peopleInvolved",
      );

  // == SECTION general ==
  String get loadingEarthquakeInfos => Intl.message(
        "Loading earthquake infos...",
        name: "loadingEarthquakeInfos",
      );

  String get shareNotAvailable => Intl.message(
        "Action not available for this earthquake...",
        name: "shareNotAvailable",
      );

  String get loadingWithDots => Intl.message(
        "Loading...",
        name: "loadingWithDots",
      );

  String get notAvailable => Intl.message(
        "Not available.",
        name: "notAvailable",
      );

  String shareIntentText(
    String location,
    String magnitude,
    String country,
    String time,
  ) =>
      Intl.message(
        "$time: Registered an earthquake of $magnitude on Richter Scale in $location ($country).\n\nShared with Quake.",
        args: [location, magnitude, country, time],
        name: "shareIntentText",
      );

  // == SECTION settings ==
  String get settings => Intl.message(
        "Settings",
        name: "settings",
      );
  String get appearance => Intl.message(
        "Appearance",
        name: "appearance",
      );
  String get chooseTheme => Intl.message(
        "Choose theme",
        name: "chooseTheme",
      );
  String get chooseThemeLong => Intl.message(
        "Change the whole app's appearance",
        name: "chooseThemeLong",
      );
  String get general => Intl.message(
        "General",
        name: "general",
      );
  String get notifications => Intl.message(
        "Notifications",
        name: "notifications",
      );
  String get specialThanks => Intl.message(
        "Special thanks",
        name: "specialThanks",
      );
  String get other => Intl.message(
        "Other",
        name: "other",
      );

  String get meters => Intl.message(
        "meters",
        name: "meters",
      );
  String get kilometers => Intl.message(
        "kilometers",
        name: "kilometers",
      );
  String get miles => Intl.message(
        "miles",
        name: "miles",
      );

  String get metersShort => Intl.message(
        "m",
        name: "metersShort",
      );
  String get kilometersShort => Intl.message(
        "km",
        name: "kilometersShort",
      );
  String get milesShort => Intl.message(
        "mi",
        name: "milesShort",
      );

  String unitOfMeasurement(UnitOfMeasurement unit, {bool short: false}) {
    switch (unit) {
      case UnitOfMeasurement.kilometers:
        return short ? kilometersShort : kilometers;
      case UnitOfMeasurement.meters:
        return short ? metersShort : meters;
      case UnitOfMeasurement.miles:
        return short ? milesShort : miles;
      default:
        return short ? kilometersShort : kilometers;
    }
  }

  String mapProvider(MapStyles style) {
    switch (style) {
      case MapStyles.base:
        return baseMap;
      case MapStyles.dark:
        return darkMap;
      case MapStyles.light:
        return lightMap;
      default:
        return "unknown";
    }
  }

  String get baseMap => Intl.message(
        "Base map",
        name: "baseMap",
      );

  String get darkMap => Intl.message(
        "Dark map",
        name: "darkMap",
      );

  String get lightMap => Intl.message(
        "Light map",
        name: "lightMap",
      );

  String get depthSettingsTile => Intl.message(
        "Unit of measurement for depth",
        name: "depthSettingsTile",
      );

  String get mapProviderSettingsTile => Intl.message(
        "Map Provider",
        name: "mapProviderSettingsTile",
      );

  String get notificationsSettingsTile => Intl.message(
        "Enable/Disable notifications.",
        name: "notificationsSettingsTile",
      );

  String get specialThanksTile => Intl.message(
        "Contributors",
        name: "specialThanksTile",
      );

  String get minMagnitudeSettingsTile => Intl.message(
        "Minimum magnitude for map marker",
        name: "minMagnitudeSettingsTile",
      );

  String get earthquakesCountSettingsTile => Intl.message(
        "How many earthquakes to load at time",
        name: "earthquakesCountSettingsTile",
      );

  String get distanceMapSettingsTile => Intl.message(
        "Distance for near earthquakes",
        name: "distanceMapSettingsTile",
      );

  String get githubTileTitle => Intl.message(
        "Contribute to Quake",
        name: "githubTileTitle",
      );

  String get githubTileDescription => Intl.message(
        "Quake is an open source project, PRs with your additions are welcome. If you are having any issues check the issue tracker",
        name: "githubTileDescription",
      );

  String unexpectedException(Object e) => Intl.message(
      "Something really bad happened and I can't handle it.\nTechnical Details: $e",
      name: "unexpectedException",
      args: [e]);

  String get badResponse => Intl.message(
        "Got bad response from the server, retry later.",
        name: "badResponse",
      );

  String get malformedResponse => Intl.message(
        "Bad news here, the server answered in a language that I don't speak. Please contact the developer and check for app updates.",
        name: "malformedResponse",
      );

  String get noResponse => Intl.message(
        "Server did not respond, this might be a connection issue or a server issue. Try again later.",
        name: "noResponse",
      );

  String theme(String supportedTheme) {
    switch (supportedTheme) {
      case "light":
        return light;
      case "dark":
        return dark;
      case "indigoLight":
        return indigoLight;
      default:
        return "unknown";
    }
  }

  String get light => Intl.message(
        "Light",
        name: "light",
      );

  String get dark => Intl.message(
        "Dark",
        name: "dark",
      );

  String get indigoLight => Intl.message(
        "Indigo Light",
        name: "indigoLight",
      );
  String get search => Intl.message(
        "Search earthquake",
        name: "search",
      );
  String get advancedSearch => Intl.message(
        "Advanced search",
        name: "advancedSearch",
      );
  String get searchBoxLabel => Intl.message(
        "Search for location",
        name: "searchBoxLabel",
      );
  String get minDepth => Intl.message(
        "Min depth",
        name: "minDepth",
      );
  String get maxDepth => Intl.message(
        "Max depth",
        name: "maxDepth",
      );
  String get minMagnitude => Intl.message(
        "Min magnitude",
        name: "minMagnitude",
      );
  String get maxMagnitude => Intl.message(
        "Max magnitude",
        name: "maxMagnitude",
      );

  String get sourceSettingsTile => Intl.message(
        "Earthquake feed source",
        name: "sourceSettingsTile",
      );

  String source(EarthquakesListSource value) {
    switch (value) {
      case EarthquakesListSource.emsc:
        return emsc;
      case EarthquakesListSource.ingv:
        return ingv;
      default:
        return ingv;
    }
  }

  String get emsc => Intl.message(
        "European Mediterranean Seismological Centre",
        name: "emsc",
      );
  String get ingv => Intl.message(
        "National Institute of Geophysics and Volcanology",
        name: "ingv",
      );
  String get nearNotificationsSettingsTile => Intl.message(
        "Only near earthquakes",
        name: "nearNotificationsSettingsTile",
      );
  String get nearNotificationsSettingsTileSubtitle => Intl.message(
        "You must enable notifications and grant location permission before enabling this.",
        name: "nearNotificationsSettingsTileSubtitle",
      );
}

class _QuakeLocalizationsDelegate
    extends LocalizationsDelegate<QuakeLocalizations> {
  static const List<String> supportedLocales = ['en', 'it'];

  @override
  bool isSupported(Locale locale) =>
      supportedLocales.contains(locale.languageCode);

  @override
  Future<QuakeLocalizations> load(Locale locale) =>
      QuakeLocalizations.load(locale);

  @override
  bool shouldReload(LocalizationsDelegate<QuakeLocalizations> old) =>
      old != this;
}
