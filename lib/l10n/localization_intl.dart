import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'messages_all.dart'; //1

//注释1的"messages_all.dart"文件是通过intl_generator 工具从arb文件生成的代码，所以在第一次运行生成命令之前，此文件不存在。
//注释2处的initializeMessages()方法和"messages_all.dart"文件一样，是同时生成的
class IntlLocalizations {
  static Future<IntlLocalizations> load(Locale locale) {
    final String name = locale.countryCode!.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    //2
    return initializeMessages(localeName).then((b) {
      Intl.defaultLocale = localeName;
      return IntlLocalizations();
    });
  }

  static IntlLocalizations? of(BuildContext context) {
    return Localizations.of<IntlLocalizations>(context, IntlLocalizations);
  }

  String get title {
    return Intl.message(
      'Flutter APP',
      name: 'title',
      desc: 'Title for the Demo application',
    );
  }
  String get setting {
    return Intl.message(
      'Settings',
      name: 'setting',
      desc: 'Title for the Demo application',
    );
  }

 /* //方式2
  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'title': 'Hello World',
    },
    'es': {
      'title': 'Hola Mundo',
    },
  };

  String? get title1 {
    return _localizedValues[locale.languageCode]['title'];
  }
  */
}

//Locale代理类
class IntlLocalizationsDelegate extends LocalizationsDelegate<IntlLocalizations> {
  const IntlLocalizationsDelegate();

  //是否支持某个Local
  @override
  bool isSupported(Locale locale) => ['en', 'zh'].contains(locale.languageCode);

  // Flutter会调用此类加载相应的Locale资源类
  @override
  Future<IntlLocalizations> load(Locale locale) {
    //3
    return  IntlLocalizations.load(locale);
  }

  // 当Localizations Widget重新build时，是否调用load重新加载Locale资源.
  @override
  bool shouldReload(IntlLocalizationsDelegate old) => false;
}

