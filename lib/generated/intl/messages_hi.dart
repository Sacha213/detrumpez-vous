// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a hi locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'hi';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "appDescription": MessageLookupByLibrary.simpleMessage(
      "अपने उत्पाद का बारकोड स्कैन करें ताकि पता चल सके कि ब्रांड किसी अमेरिकी कंपनी का है या नहीं।",
    ),
    "appTitle": MessageLookupByLibrary.simpleMessage("बारकोड स्कैन करें"),
    "brandNotFound": MessageLookupByLibrary.simpleMessage("ब्रांड नहीं मिला"),
    "cancel": MessageLookupByLibrary.simpleMessage("रद्द करें"),
    "descriptionNotFound": MessageLookupByLibrary.simpleMessage(
      "यह ब्रांड हमारे अमेरिकी ब्रांड डेटाबेस में मौजूद नहीं है।",
    ),
    "manualSearchPlaceholder": MessageLookupByLibrary.simpleMessage(
      "खाद्य ब्रांड दर्ज करें",
    ),
    "problemReportMessage": MessageLookupByLibrary.simpleMessage(
      "हम परफेक्ट नहीं हैं और शायद सभी ब्रांडों की पहचान अभी तक नहीं हो पाई है। हालांकि, हमारे डेटाबेस में पहले से ही 400 से अधिक खाद्य ब्रांड शामिल हैं। यदि आपको ऐसा कोई उत्पाद मिलता है जो सूचीबद्ध नहीं है, तो कृपया ब्रांड का नाम हमें ईमेल करें ताकि हम अपनी सूची को अपडेट कर सकें। अकेले हम तेजी से आगे बढ़ते हैं, लेकिन मिलकर हम और भी दूर जा सकते हैं।",
    ),
    "problemReportTitle": MessageLookupByLibrary.simpleMessage(
      "क्या उत्पाद में कोई समस्या है?",
    ),
    "productNotFound": MessageLookupByLibrary.simpleMessage("उत्पाद नहीं मिला"),
    "safe": MessageLookupByLibrary.simpleMessage("नहीं USA"),
    "safeProductMessage": MessageLookupByLibrary.simpleMessage(
      "यह उत्पाद ऐसा प्रतीत नहीं होता कि यह किसी अमेरिकी कंपनी का है।",
    ),
    "sourceNotFound": MessageLookupByLibrary.simpleMessage("स्रोत नहीं मिला"),
    "unknown": MessageLookupByLibrary.simpleMessage("अज्ञात"),
    "unknownProductMessage": MessageLookupByLibrary.simpleMessage(
      "जो उत्पाद आप खोज रहे हैं, वह हमारे डेटाबेस में नहीं मिला।",
    ),
    "usa": MessageLookupByLibrary.simpleMessage("USA"),
    "usaProductMessage": MessageLookupByLibrary.simpleMessage(
      "यह उत्पाद एक अमेरिकी कंपनी से है!",
    ),
    "validate": MessageLookupByLibrary.simpleMessage("सत्यापित करें"),
    "welcome": MessageLookupByLibrary.simpleMessage("आपका स्वागत है"),
  };
}
