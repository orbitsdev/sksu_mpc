import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sksumpc/components/h.dart';
import 'package:sksumpc/components/progress/loader.dart';
import 'package:sksumpc/components/v.dart';

class AppModal {
  static void errorMessage(
      {required BuildContext context,
      String? message = 'Error ',
      bool dismissible = true}) {
    showDialog(
      context: context,
      barrierDismissible: dismissible,
      builder: (BuildContext context) {
        return Center(
          child: Container(
            width: 300,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "Close",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ]),
          ),
        );
      },
    );
  }

  static void alert({
    required BuildContext context,
    String title = 'Error',
    String message = 'Message',
  }) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
  }

  static void progress({
    required BuildContext context,
    String title = 'Error',
    String message = 'Message',
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
              height: 45,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Loader(),
                  H(24),
                  Center(
                    child: Text('Signing out...',
                        style: TextStyle(
                          fontSize: 14,
                        )),
                  ),
                ],
              )),
        );
      },
    );
  }
}
