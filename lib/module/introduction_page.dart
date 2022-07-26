import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swallet/constants/app_constants.dart';

import '../fade_animation.dart';

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({Key? key}) : super(key: key);

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            _Name(pageController: _pageController),
            _Income(pageController: _pageController),
            _Category(pageController: _pageController),
          ],
        ),
      ),
    );
  }
}

class _Name extends StatelessWidget {
  _Name({Key? key, required this.pageController}) : super(key: key);
  final PageController pageController;

  final TextEditingController _nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: AppConstants.kPadding,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Text(
              'How would you like to be called?',
              style: theme.textTheme.headline2,
            ),
            const SizedBox(height: 50),
            TextFormField(
              controller: _nameController,
              autofocus: true,
              decoration: const InputDecoration(
                hintText: 'Enter your name',
                isDense: true,
                suffixIcon: Icon(FeatherIcons.user),
              ),
              validator: (value) => value!.isEmpty ? 'Please enter your name' : null,
              textCapitalization: TextCapitalization.words,
              autofillHints: const [AutofillHints.name],
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            const Spacer(),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
              child: Text(
                'Next',
                style: theme.textTheme.subtitle2?.copyWith(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Income extends StatelessWidget {
  final PageController pageController;
  _Income({Key? key, required this.pageController}) : super(key: key) {
    _focusNode.requestFocus();
  }

  final TextEditingController _incomeController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final _focusNode = FocusNode();
  final List<String> categorys = ['Salary', 'Bonus', 'Other', 'Profit'];

  final RxString _category = ''.obs;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: AppConstants.kPadding,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Text(
              'How much money do you have?',
              style: theme.textTheme.headline2,
            ),
            const SizedBox(height: 50),
            TextFormField(
              controller: _incomeController,
              focusNode: _focusNode,
              autofocus: true,
              decoration: const InputDecoration(
                hintText: 'Income',
                prefixText: '\u20B9 ',
                isDense: true,
                suffixIcon: Icon(FeatherIcons.creditCard),
              ),
              validator: (value) => value!.isEmpty ? 'Please enter your income' : null,
              keyboardType: TextInputType.number,
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            const SizedBox(height: 30),
            Text(
              'Select your category',
              style: theme.textTheme.bodyText2,
            ),
            const SizedBox(height: 10),
            FadeAnimation(
              delay: 1.3,
              child: Wrap(
                spacing: 13,
                children: [
                  for (final category in categorys)
                    Obx(() => InputChip(
                          backgroundColor: theme.scaffoldBackgroundColor,
                          side: BorderSide(color: theme.dividerColor),
                          label: Text(category),
                          selectedColor: theme.scaffoldBackgroundColor,
                          selected: _category.value == category,
                          onSelected: (selected) {
                            if (selected) {
                              _category.value = category;
                            }
                          },
                        )),
                  Chip(
                    backgroundColor: Colors.black,
                    side: BorderSide(color: theme.dividerColor),
                    label: const Text('Add new', style: TextStyle(color: Colors.white)),
                    avatar: const Icon(FeatherIcons.plus, size: 17, color: Colors.white),
                  )
                ],
              ),
            ),
            const Spacer(),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _focusNode.unfocus();
                  pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
              child: Text(
                'Next',
                style: theme.textTheme.subtitle2?.copyWith(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Category extends StatefulWidget {
  const _Category({Key? key, required this.pageController}) : super(key: key);

  final PageController pageController;

  @override
  State<_Category> createState() => __CategoryState();
}

class __CategoryState extends State<_Category> {
  final RxList suggestion = <String>[
    'Food & Drinks',
    'Entertainment',
    'Transport',
    'Investment',
    'Shopping',
    'Loans',
    'Bills & Utilities',
    'Health',
    'Restaurant',
    'Travel',
    'Clothing',
    'Beauty',
    'Home',
    'Education',
    'Gift',
    'Work',
    'Fitness',
  ].obs;

  final RxList _categories = <String>[].obs;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: AppConstants.kPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Text('Add your categories', style: theme.textTheme.headline2),
          const SizedBox(height: 20),
          Obx(() => Wrap(
                spacing: 13,
                children: [
                  for (final category in _categories)
                    FadeAnimation(
                      delay: 0.5,
                      child: Chip(
                        backgroundColor: theme.scaffoldBackgroundColor,
                        side: BorderSide(color: theme.dividerColor),
                        label: Text(category),
                        deleteIcon: const Icon(FeatherIcons.x, size: 17, color: Colors.black),
                        onDeleted: () {
                          _categories.remove(category);
                          suggestion.add(category);
                        },
                      ),
                    ),
                ],
              )),
          const SizedBox(height: 20),
          Text('*suggested categories', style: theme.textTheme.bodyText2),
          const SizedBox(height: 10),
          Obx(() => Wrap(
                spacing: 13,
                children: [
                  for (final category in suggestion)
                    FadeAnimation(
                      delay: 0.5,
                      child: InputChip(
                        backgroundColor: theme.scaffoldBackgroundColor,
                        side: BorderSide(color: theme.dividerColor),
                        label: Text(category),
                        selectedColor: theme.scaffoldBackgroundColor,
                        selected: _categories.contains(category),
                        onSelected: (selected) {
                          if (selected) {
                            _categories.add(category);
                            suggestion.remove(category);
                          }
                        },
                      ),
                    ),
                  FadeAnimation(
                    delay: 0.3,
                    child: Chip(
                      backgroundColor: Colors.black,
                      side: BorderSide(color: theme.dividerColor),
                      label: const Text('Add new', style: TextStyle(color: Colors.white)),
                      avatar: const Icon(FeatherIcons.plus, size: 17, color: Colors.white),
                    ),
                  )
                ],
              )),
          const Spacer(),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              minimumSize: const Size.fromHeight(50),
            ),
            onPressed: () {},
            child: Text(
              'Continue',
              style: theme.textTheme.subtitle2?.copyWith(),
            ),
          ),
        ],
      ),
    );
  }
}
