import 'dart:io';

import 'package:permission_handler/permission_handler.dart';

enum ErrorType {
  dioError,
  firebaseError,
  appError,
}

class Constant {
  static bool isBoarding = false;
  static bool isLoggedIn = false;
  static bool isPermissionGranted = false;

  // static UserProfile? userProfile;

  static const List<String> reasons = [
    'Shopping',
    'Early loan re-payment',
    'Medical Expense',
    'Credit Card Bill',
    'Others'
  ];
  static const termsOfUseUrl = 'https://jifytestbucket.s3.ap-south-1.amazonaws.com/Legal/TermsOfUser.pdf';
  static const kmTermsUrl = 'https://jifytestbucket.s3.ap-south-1.amazonaws.com/Legal/KMTermsOfUse.pdf';
  static const privacyPolicy = 'https://jifytestbucket.s3.ap-south-1.amazonaws.com/Legal/PrivacyPolicy.pdf';

  static String tartanWebUser = 'TARTAN_WEB_USER';
  static String tartanNativeUser = 'TARTAN_NATIVE_USER';
  static String firstTimeUser = 'FIRST_TIME_USER';
  static String userDoesNotExist = 'USER_DOES_NOT_EXIST';
  static String validUserExit = 'VALID_USER_EXIT';
  static String kycDoneStatus = 'DONE';
  static String kycPendingStatus = 'PENDING';
  static String kycNotStartedStatus = 'NOTSTARTED';
  static String digiLocker = 'digilocker';
  static String noDigiLocker = 'no_digilocker';
  static String helpEmail = 'preeti@jify.co';
  static List<Permission> permissions = [
    Permission.location,
    Permission.camera,
    Permission.storage,
    Permission.microphone,
    if (Platform.isAndroid) Permission.bluetooth,
  ];
  static String enterValidAmount = 'Enter valid amount';
  static String errMaxAmount = 'You entered more than maximum amount';
}
