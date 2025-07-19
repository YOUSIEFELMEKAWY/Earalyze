// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Earalyze`
  String get appName {
    return Intl.message('Earalyze', name: 'appName', desc: '', args: []);
  }

  /// `AI-powered X-ray analysis`
  String get appDesc {
    return Intl.message(
      'AI-powered X-ray analysis',
      name: 'appDesc',
      desc: '',
      args: [],
    );
  }

  /// `No Route Found`
  String get noRoute {
    return Intl.message('No Route Found', name: 'noRoute', desc: '', args: []);
  }

  /// `Skip`
  String get skip {
    return Intl.message('Skip', name: 'skip', desc: '', args: []);
  }

  /// `Next`
  String get next {
    return Intl.message('Next', name: 'next', desc: '', args: []);
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get getStarted {
    return Intl.message('Get Started', name: 'getStarted', desc: '', args: []);
  }

  /// `Welcome!`
  String get welcome {
    return Intl.message('Welcome!', name: 'welcome', desc: '', args: []);
  }

  /// `Enter Your Email`
  String get enterYourEmail {
    return Intl.message(
      'Enter Your Email',
      name: 'enterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Password`
  String get enterYourPassword {
    return Intl.message(
      'Enter Your Password',
      name: 'enterYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password?`
  String get forgetPassword {
    return Intl.message(
      'Forget Password?',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signIn {
    return Intl.message('Sign In', name: 'signIn', desc: '', args: []);
  }

  /// `OR`
  String get or {
    return Intl.message('OR', name: 'or', desc: '', args: []);
  }

  /// `Facebook`
  String get facebook {
    return Intl.message('Facebook', name: 'facebook', desc: '', args: []);
  }

  /// `Google`
  String get google {
    return Intl.message('Google', name: 'google', desc: '', args: []);
  }

  /// `Don't have an account? `
  String get dontHaveAnAccount {
    return Intl.message(
      'Don\'t have an account? ',
      name: 'dontHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account? `
  String get alreadyHaveAnAccount {
    return Intl.message(
      'Already have an account? ',
      name: 'alreadyHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signUp {
    return Intl.message('Sign up', name: 'signUp', desc: '', args: []);
  }

  /// `Write a message...`
  String get writeAMessage {
    return Intl.message(
      'Write a message...',
      name: 'writeAMessage',
      desc: '',
      args: [],
    );
  }

  /// `Someone with your ear anytime, anywhere!`
  String get onboardingTitle1 {
    return Intl.message(
      'Someone with your ear anytime, anywhere!',
      name: 'onboardingTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Find your diagnosis easily`
  String get onboardingTitle2 {
    return Intl.message(
      'Find your diagnosis easily',
      name: 'onboardingTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Fast and hassle-free experience`
  String get onboardingTitle3 {
    return Intl.message(
      'Fast and hassle-free experience',
      name: 'onboardingTitle3',
      desc: '',
      args: [],
    );
  }

  /// `Know your ear condition and follow the appropriate treatment plan if you are sick.`
  String get onboardingSubTitle1 {
    return Intl.message(
      'Know your ear condition and follow the appropriate treatment plan if you are sick.',
      name: 'onboardingSubTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Get access to the best diagnosis for my condition.`
  String get onboardingSubTitle2 {
    return Intl.message(
      'Get access to the best diagnosis for my condition.',
      name: 'onboardingSubTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Completely free service, start checking and manage your health smoothly`
  String get onboardingSubTitle3 {
    return Intl.message(
      'Completely free service, start checking and manage your health smoothly',
      name: 'onboardingSubTitle3',
      desc: '',
      args: [],
    );
  }

  /// `The aim of the application is to analyze the CT scan of the ear and show whether the person is healthy or sick and determine the appropriate treatment plan if he is sick and avoid the disease if he is healthy`
  String get aimOfApp {
    return Intl.message(
      'The aim of the application is to analyze the CT scan of the ear and show whether the person is healthy or sick and determine the appropriate treatment plan if he is sick and avoid the disease if he is healthy',
      name: 'aimOfApp',
      desc: '',
      args: [],
    );
  }

  /// `Total Analysis`
  String get totalAnalysis {
    return Intl.message(
      'Total Analysis',
      name: 'totalAnalysis',
      desc: '',
      args: [],
    );
  }

  /// `Healthy Cases`
  String get healthyCases {
    return Intl.message(
      'Healthy Cases',
      name: 'healthyCases',
      desc: '',
      args: [],
    );
  }

  /// `Critical Cases`
  String get criticalCases {
    return Intl.message(
      'Critical Cases',
      name: 'criticalCases',
      desc: '',
      args: [],
    );
  }

  /// `Tip of the Day:`
  String get tipOfTheDay {
    return Intl.message(
      'Tip of the Day:',
      name: 'tipOfTheDay',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Scan`
  String get scan {
    return Intl.message('Scan', name: 'scan', desc: '', args: []);
  }

  /// `AI Chat`
  String get aiChat {
    return Intl.message('AI Chat', name: 'aiChat', desc: '', args: []);
  }

  /// `Result`
  String get result {
    return Intl.message('Result', name: 'result', desc: '', args: []);
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Supported formats: JPG, PNG. Max size: 5MB.`
  String get supportedFormats {
    return Intl.message(
      'Supported formats: JPG, PNG. Max size: 5MB.',
      name: 'supportedFormats',
      desc: '',
      args: [],
    );
  }

  /// `Analyze Image`
  String get analyzeImage {
    return Intl.message(
      'Analyze Image',
      name: 'analyzeImage',
      desc: '',
      args: [],
    );
  }

  /// `Upload CT Scan`
  String get uploadCtScan {
    return Intl.message(
      'Upload CT Scan',
      name: 'uploadCtScan',
      desc: '',
      args: [],
    );
  }

  /// `Angle Type`
  String get angleType {
    return Intl.message('Angle Type', name: 'angleType', desc: '', args: []);
  }

  /// `Patient's condition`
  String get patientCondition {
    return Intl.message(
      'Patient\'s condition',
      name: 'patientCondition',
      desc: '',
      args: [],
    );
  }

  /// `Save as pdf`
  String get pdf {
    return Intl.message('Save as pdf', name: 'pdf', desc: '', args: []);
  }

  /// `Share Result`
  String get shareResult {
    return Intl.message(
      'Share Result',
      name: 'shareResult',
      desc: '',
      args: [],
    );
  }

  /// `Good Morning`
  String get goodMorning {
    return Intl.message(
      'Good Morning',
      name: 'goodMorning',
      desc: '',
      args: [],
    );
  }

  /// `Good Evening`
  String get goodEvening {
    return Intl.message(
      'Good Evening',
      name: 'goodEvening',
      desc: '',
      args: [],
    );
  }

  /// `App Settings`
  String get appSettings {
    return Intl.message(
      'App Settings',
      name: 'appSettings',
      desc: '',
      args: [],
    );
  }

  /// `Language: `
  String get language {
    return Intl.message('Language: ', name: 'language', desc: '', args: []);
  }

  /// `English`
  String get english {
    return Intl.message('English', name: 'english', desc: '', args: []);
  }

  /// `Arabic`
  String get arabic {
    return Intl.message('Arabic', name: 'arabic', desc: '', args: []);
  }

  /// `Theme: `
  String get theme {
    return Intl.message('Theme: ', name: 'theme', desc: '', args: []);
  }

  /// `Light`
  String get light {
    return Intl.message('Light', name: 'light', desc: '', args: []);
  }

  /// `Dark`
  String get dark {
    return Intl.message('Dark', name: 'dark', desc: '', args: []);
  }

  /// `Security`
  String get security {
    return Intl.message('Security', name: 'security', desc: '', args: []);
  }

  /// `Change Password`
  String get changePassword {
    return Intl.message(
      'Change Password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `Edit Profile`
  String get editProfile {
    return Intl.message(
      'Edit Profile',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `Delete Account`
  String get deleteAccount {
    return Intl.message(
      'Delete Account',
      name: 'deleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Scan Your Ray`
  String get scanYourRay {
    return Intl.message(
      'Scan Your Ray',
      name: 'scanYourRay',
      desc: '',
      args: [],
    );
  }

  /// `Upload Your Ray`
  String get uploadYourRay {
    return Intl.message(
      'Upload Your Ray',
      name: 'uploadYourRay',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match.`
  String get passwordDontMatch {
    return Intl.message(
      'Passwords do not match.',
      name: 'passwordDontMatch',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get firstName {
    return Intl.message('First Name', name: 'firstName', desc: '', args: []);
  }

  /// `Last Name`
  String get lastName {
    return Intl.message('Last Name', name: 'lastName', desc: '', args: []);
  }

  /// `Check Email`
  String get checkEmail {
    return Intl.message('Check Email', name: 'checkEmail', desc: '', args: []);
  }

  /// `Please Enter Your Email Address To Receive A verification code`
  String get messageForCheckEmail {
    return Intl.message(
      'Please Enter Your Email Address To Receive A verification code',
      name: 'messageForCheckEmail',
      desc: '',
      args: [],
    );
  }

  /// `Stapes Length`
  String get stapesLenth {
    return Intl.message(
      'Stapes Length',
      name: 'stapesLenth',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
