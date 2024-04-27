import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/config/app_theme.dart';
import 'core/services/get/get.dart';

import 'core/services/model/notesmodel.dart';
import 'pages/home.dart';

final appPlatform = ValueNotifier(PlatformStyle.Material);

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NotesModelAdapter());
  await Hive.openBox<NotesModel>('notes');
  await Hive.openBox<NotesModel>('liked_notes');

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  runApp(const ProviderScope(child: Core()));
}

class Core extends StatelessWidget {
  const Core({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: appPlatform,
      builder: (context, value, child) {
        return ScreenUtilInit(
          key: ValueKey(value),
          child: PlatformProvider(
            settings: PlatformSettingsData(
                iosUsesMaterialWidgets: true,
                iosUseZeroPaddingForAppbarPlatformIcon: true,
                platformStyle: PlatformStyleData(android: value)),
            builder: (context) => PlatformTheme(
              themeMode: ThemeMode.system,
              materialLightTheme: AppThemes.lightTheme,
              materialDarkTheme: AppThemes.darkTheme,
              cupertinoLightTheme: AppThemes.ioslightTheme,
              cupertinoDarkTheme: AppThemes.iosdarkTheme,
              matchCupertinoSystemChromeBrightness: true,
              builder: (context) => PlatformApp(
                localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
                  DefaultMaterialLocalizations.delegate,
                  DefaultWidgetsLocalizations.delegate,
                  DefaultCupertinoLocalizations.delegate,
                ],
                navigatorKey: navigatorKey,
                home: HomeScreen(),
                debugShowCheckedModeBanner: false,
              ),
            ),
          ),
        );
      },
    );
  }
}
