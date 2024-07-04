import 'package:parawarga_apps/translations/id_ID/id_id_translations.dart';

import 'en_US/en_us_translations.dart';

abstract class AppTranslation {
  static Map<String, Map<String, String>> translations = {
    'en': enUs,
    'id': idId,
  };
}