import 'package:vehicle_rental_app/core/data/model/language_model.dart';

class ShareKey {

  static const String baseUrl = 'https://6831fb52c3f2222a8cb111ff.mockapi.io/api/v1';
  static const String vehiclesUri = '/vehicles';
  static const String appName = 'Vehicle Rental';
  static const String theme = 'theme';
  static const String token = 'token';
  static const String countryCode = 'country_code';
  static const String languageCode = 'language_code';
  static const String bookmarks = 'bookmarks';
  static const String pushNotificationState = 'pushNotificationState';
  static const String isNewActivityState = 'isNewActivityState';
  static const String isUpcomingBookmarksState = 'isUpcomingBookmarksState';
  static const String isAgeGroupState = 'isAgeGroupState';

  static List<LanguageModel> languages = [
    LanguageModel(languageName: 'English', countryCode: 'US', languageCode: 'en'),
    LanguageModel(languageName: 'Bangla', countryCode: 'BD', languageCode: 'bn'),
  ];
}