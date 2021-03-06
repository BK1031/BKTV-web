import 'package:bk1031_tv/pages/auth/login_page.dart';
import 'package:bk1031_tv/pages/auth/register_page.dart';
import 'package:bk1031_tv/pages/home/home_page.dart';
import 'package:bk1031_tv/pages/home/movies_page.dart';
import 'package:bk1031_tv/pages/home/shows_page.dart';
import 'package:bk1031_tv/pages/video/movie_details_page.dart';
import 'package:bk1031_tv/pages/video/player_page.dart';
import 'package:bk1031_tv/pages/video/show_details_page.dart';
import 'package:bk1031_tv/utils/config.dart';
import 'package:bk1031_tv/utils/service_account.dart';
import 'package:bk1031_tv/utils/theme.dart';
import 'package:firebase/firebase.dart';
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

void main() {
  initializeApp(
      apiKey: ServiceAccount.apiKey,
      authDomain: ServiceAccount.authDomain,
      databaseURL: ServiceAccount.databaseUrl,
      projectId: ServiceAccount.projectID,
      storageBucket: ServiceAccount.storageUrl
  );

  // AUTH ROUTES
  router.define('/login', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new LoginPage();
  }));
  router.define('/register', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new RegisterPage();
  }));

  // HOME ROUTES
  router.define('/', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new HomePage();
  }));
  router.define('/movies', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new MoviesPage();
  }));
  router.define('/movies/details', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new MovieDetailsPage();
  }));
  router.define('/shows', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new ShowsPage();
  }));
  router.define('/shows/details', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new ShowDetailsPage();
  }));

  // PLAYER ROUTES
  router.define('/watch', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new PlayerPage();
  }));

  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: mainTheme,
    initialRoute: '/',
    onGenerateRoute: router.generator,
  ));
}