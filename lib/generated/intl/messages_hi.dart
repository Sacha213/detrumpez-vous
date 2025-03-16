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
    "appTitle": MessageLookupByLibrary.simpleMessage(
      "एक खाद्य उत्पाद स्कैन करें",
    ),
    "brandNotFound": MessageLookupByLibrary.simpleMessage("ब्रांड अज्ञात"),
    "descriptionNotFound": MessageLookupByLibrary.simpleMessage(
      "विवरण नहीं मिला",
    ),
    "problemReportMessage": MessageLookupByLibrary.simpleMessage(
      "यदि आपने संयुक्त राज्य से किसी उत्पाद की पहचान की है, तो कृपया रिपोर्ट करें ताकि हम इसे अपनी सूची में जोड़ सकें।",
    ),
    "problemReportTitle": MessageLookupByLibrary.simpleMessage(
      "उत्पाद के साथ समस्या?",
    ),
    "productNotFound": MessageLookupByLibrary.simpleMessage("उत्पाद नहीं मिला"),
    "safe": MessageLookupByLibrary.simpleMessage("सुरक्षित"),
    "safeProductMessage": MessageLookupByLibrary.simpleMessage(
      "यह उत्पाद किसी अमेरिकी कंपनी से नहीं है!",
    ),
    "sourceNotFound": MessageLookupByLibrary.simpleMessage("स्रोत अज्ञात"),
    "unknown": MessageLookupByLibrary.simpleMessage("अनजान"),
    "unknownProductMessage": MessageLookupByLibrary.simpleMessage(
      "खोजा गया उत्पाद हमारे डेटाबेस में नहीं मिला।",
    ),
    "usa": MessageLookupByLibrary.simpleMessage("USA"),
    "usaProductMessage": MessageLookupByLibrary.simpleMessage(
      "यह उत्पाद एक अमेरिकी कंपनी से है!",
    ),
  };
}
