


import 'package:flutter/material.dart';
import 'package:vendor/screens/Catalogue%20Images/catalogue_images.dart';
import 'package:vendor/screens/Complete%20Profile/complete_profile.dart';
import 'package:vendor/screens/CustomerProfile/customerprofile.dart';
import 'package:vendor/screens/Docs/docs.dart';
import 'package:vendor/screens/EmailVerification/EmailVerification.dart';
import 'package:vendor/screens/Feedback/feedback.dart';
import 'package:vendor/screens/Forgot%20Password/forgot_password.dart';
import 'package:vendor/screens/HelpCenter/help_center.dart';
import 'package:vendor/screens/Login%20Success/login_success.dart';
import 'package:vendor/screens/LoginPage-Welcome/login_page.dart';
import 'package:vendor/screens/MessagingChat/chat.dart';
import 'package:vendor/screens/MessagingInterior/chat_interior.dart';
import 'package:vendor/screens/MyShop/myshop.dart';
import 'package:vendor/screens/Notification/notifications.dart';
import 'package:vendor/screens/OTP/otp_screen.dart';
import 'package:vendor/screens/Photo%20Options/photo_options.dart';
import 'package:vendor/screens/RegisterPage/register_page.dart';
import 'package:vendor/screens/RegisterSuccess/register_success.dart';
import 'package:vendor/screens/ResendOTP/resendOTP.dart';
import 'package:vendor/screens/SettingsScreen/settings.dart';
import 'package:vendor/screens/Shop%20Images/shop_images.dart';
import 'package:vendor/screens/ShopStatus/shopstatus.dart';
import 'package:vendor/screens/Shop_Profile/shop_profile.dart';
import 'package:vendor/screens/home/home.dart';
import 'package:vendor/screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  LoginPage.routeName: (context) => LoginPage(),
  LoginSuccess.routeName: (context) => LoginSuccess(),
  ForgotPassword.routeName: (context) => ForgotPassword(),
  CompleteProfile.routeName: (context) => CompleteProfile(),
  RegisterPage.routeName: (context) => RegisterPage(),
  OTPScreen.routeName: (context) => OTPScreen(),
  EmailVerification.routeName: (context) => EmailVerification(),
  RegisterSuccess.routeName: (context) => RegisterSuccess(),
  ResendOTPScreen.routeName: (context) => ResendOTPScreen(),
  ChatScreen.routeName: (context) => ChatScreen(),
  ChatInterior.routeName: (context) => ChatInterior(),
  HomeScreen.routeName: (context) => HomeScreen(),
  ShopProfile.routeName: (context) => ShopProfile(),
  HelpCenter.routeName: (context) => HelpCenter(),
  Settings.routeName: (context) => Settings(),
  Notifications.routeName: (context) => Notifications(),
  MyShop.routeName: (context) => MyShop(),
  CustomerProfile.routeName: (context) => CustomerProfile(),
  FeedbackScreen.routeName: (context) => FeedbackScreen(),
  PhotoOptions.routName: (context) => PhotoOptions(),
  CatalogueImages.routeName: (context) => CatalogueImages(),
  ShopImages.routeName: (context) => ShopImages(),
  ShopStatus.routeName: (context) => ShopStatus(),
  Docs.routeName: (context) => Docs(),
  };
