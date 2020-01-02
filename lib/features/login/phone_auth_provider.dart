// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class PhoneAuth {

// var firebaseAuth = await FirebaseAuth.instance;
// firebaseAuth.verifyPhoneNumber(
//     phoneNumber: phone,
//     timeout: Duration(seconds: 60),
//     verificationCompleted: verificationCompleted,
//     verificationFailed: verificationFailed,
//     codeSent: codeSent,
//     codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);

// final PhoneCodeSent codeSent =
//     (String verificationId, [int forceResendingToken]) async {
//   this.actualCode = verificationId;
//   setState(() {
//     print('Code sent to $phone');
//     status = "\nEnter the code sent to " + phone;
//   });
// };
// final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
//     (String verificationId) {
//   this.actualCode = verificationId;
//   setState(() {
//     status = "\nAuto retrieval time out";
//   });
// };
// final PhoneVerificationFailed verificationFailed =
//     (AuthException authException) {
//   setState(() {
//     status = '${authException.message}';

//     print("Error message: " + status);
//     if (authException.message.contains('not authorized'))
//       status = 'Something has gone wrong, please try later';
//     else if (authException.message.contains('Network'))
//       status = 'Please check your internet connection and try again';
//     else
//       status = 'Something has gone wrong, please try later';
//   });
// };

// final PhoneVerificationCompleted verificationCompleted =
//     (AuthCredential auth) {
//   setState(() {
//     status = 'Auto retrieving verification code';
//   });
//   //_authCredential = auth;

//   firebaseAuth
//     .signInWithCredential(_authCredential)
//     .then((AuthResult value) {
//   if (value.user != null) {
//     setState(() {
//       status = 'Authentication successful';
//     });
//     onAuthenticationSuccessful();
//   } else {
//     setState(() {
//       status = 'Invalid code/invalid authentication';
//     });
//   }
// }).catchError((error) {
//   setState(() {
//     status = 'Something has gone wrong, please try later';
//   });
// });
// };
// void _signInWithPhoneNumber(String smsCode) async {
//   _authCredential = await PhoneAuthProvider.getCredential(
//       verificationId: actualCode, smsCode: smsCode);
//   firebaseAuth.signInWithCredential(_authCredential).catchError((error) {
//     setState(() {
//       status = 'Something has gone wrong, please try later';
//     });
//   }).then((FirebaseUser user) async {
//     setState(() {
//       status = 'Authentication successful';
//     });
//     onAuthenticationSuccessful();
//   });
// }
//  @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       body: new Center(
//         child: new Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             new TextField(
//               controller:  _phoneNumberController,
//             ),
//             new TextField(
//               controller: _smsCodeController,
//             ),
//             new FlatButton(
//               onPressed: () => _signInWithPhoneNumber(_smsCodeController.text),
//               child: const Text("Sign In"))
//           ],
//         ),
//       ),
//       floatingActionButton: new FloatingActionButton(
//         onPressed: () => _sendCodeToPhoneNumber(),
//         tooltip: 'get code',
//         child: new Icon(Icons.send),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }