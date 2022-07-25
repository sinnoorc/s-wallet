import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:swallet/constants/app_constants.dart';
import 'package:swallet/routes/app_routes.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: Container(
          padding: AppConstants.kPadding,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                Text(
                  'S-Wallet',
                  style: theme.textTheme.headline1?.copyWith(height: 1),
                ),
                const SizedBox(height: 10),
                Text(
                  'Money management made easy.',
                  style: theme.textTheme.bodyText1,
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Get.isDarkMode ? AppConstants.kPrimaryColor : Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text('#openSource'),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: VerticalDivider(
                    thickness: 1,
                    color: Get.isDarkMode ? AppConstants.kPrimaryColor : Colors.black45,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Your data will be saved locally and won\'t be sent to any server.',
                ),
                const SizedBox(height: 20),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                  ),
                  onPressed: () => Get.toNamed(Routes.intro),
                  child: Text(
                    'Let\'s get started',
                    style: theme.textTheme.subtitle2?.copyWith(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
