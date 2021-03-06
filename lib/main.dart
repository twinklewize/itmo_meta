import 'package:flutter/material.dart';
import 'package:ict_hack/features/auth/start_page.dart';
import 'providers/auth_provider.dart';
import 'providers/chats_provider.dart';
import 'providers/feed_provider.dart';
import 'package:ict_hack/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'features/custom_avatar/custom_avatar_view.dart';
import 'features/custom_avatar/custom_avatar_view_model.dart';
import 'providers/market_provider.dart';
import 'providers/my_feed_provider.dart';
import 'providers/user_provider.dart';
import 'ui_kit/constants/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: MarketProvider(),
        ),
        ChangeNotifierProvider.value(
          value: MyFeedProvider(),
        ),
        ChangeNotifierProvider.value(
          value: CustomAvatarViewModel(),
        ),
        ChangeNotifierProvider.value(
          value: FeedProvider(),
        ),
        ChangeNotifierProvider.value(
          value: UserProvider(),
        ),
        ChangeNotifierProvider.value(
          value: ChatsProvider(),
        ),
        ChangeNotifierProvider.value(
          value: AuthProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'ITMO Meta',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(color: AppColors.primary),
          // primarySwatch: Colors.blue,
          primaryColor: AppColors.primary,
          scaffoldBackgroundColor: AppColors.backgroundLight,
        ),
        home: const StartPage(),
      ),
    );
  }
}
