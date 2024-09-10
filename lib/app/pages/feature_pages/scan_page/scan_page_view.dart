import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:tedikap_admin/common/themes.dart';
import 'package:tedikap_admin/routes/AppPages.dart';

class ScanPage extends StatelessWidget {
  const ScanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Scan QR Code',
          style: appBarText,
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Scan the QR code to confirm the order', style: normalText),
          const SizedBox(height: 20),
          Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width * 0.8,
              child: MobileScanner(
                controller: MobileScannerController(
                  detectionSpeed: DetectionSpeed.noDuplicates,
                  returnImage: true,
                ),
                onDetect: (capture) {
                  // print(capture);
                  final List<Barcode> barcodes = capture.barcodes;
                  final Uint8List? image = capture.image;
                  // for (final Barcode barcode in barcodes) {
                  //   // print('barcode lmao: ${barcode.rawValue}');
                  // }
                  if (image != null) {
                    // showDialog(
                    //     context: context,
                    //     builder: (context) => SizedBox(
                    //           height: 200,
                    //           child: AlertDialog(
                    //             title:
                    //             Text(barcodes.first.rawValue ?? 'No barcode found'),
                    //             content: Image.memory(image),
                    //           ),
                    //         ));
                    Get.offAndToNamed(Routes.ORDER_STATUS,
                        arguments: barcodes.first.rawValue);
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
