
import 'package:flutter/material.dart';
import 'package:marketing_apps/utils/colors.dart';

class MarketingText {
  TextStyle fontButton(){
    return new TextStyle(
      color: Colors.white,
      fontFamily: 'Muli',
      fontSize: 12.0
    );
  }

  TextStyle fontHeaderPrimary(){
    return new TextStyle(
      color: MarketingColors.primaryColor,
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      fontFamily: 'Muli',
    );
  }

  TextStyle fontBigBold(){
    return new TextStyle(
      color: Colors.black,
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      fontFamily: 'Muli',
    );
  }

  TextStyle fontBig(){
    return new TextStyle(
      color: Colors.black,
      fontSize: 18.0,
      fontWeight: FontWeight.normal,
      fontFamily: 'Muli',
    );
  }

  TextStyle fontMediumBold(){
    return new TextStyle(
      color: Colors.black,
      fontSize: 14.0,
      fontWeight: FontWeight.bold
    );
  }

  TextStyle fontMediumSemiBold(){
    return new TextStyle(
      color: Colors.black,
      fontSize: 14.0,
      fontWeight: FontWeight.w600
    );
  }

  TextStyle fontMedium(){
    return new TextStyle(
      color: Colors.black,
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      fontFamily: 'Muli',
    );
  }

  TextStyle fontNormal(){
    return new TextStyle(
      color: Colors.black,
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      fontFamily: 'Muli',
    );
  }

  TextStyle fontSmall(){
    return new TextStyle(
      color: Colors.black,
      fontSize: 10.0,
      fontWeight: FontWeight.normal,
      fontFamily: 'Muli',
    );
  }

  TextStyle fontHeader(){
    return new TextStyle(
      color: Colors.black,
      fontSize: 14.0,
      fontFamily: 'Muli',
    );
  }

  TextStyle fontHeader2(){
    return new TextStyle(
      color: Colors.black,
      fontSize: 12.0,
      fontFamily: 'Gruppo',
    );
  }

}