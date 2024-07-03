import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:momento/src/modules/liveness/liveness_controller.dart';

class LivenessPage extends StatefulWidget {
  const LivenessPage({super.key});

  @override
  State<LivenessPage> createState() => _LivenessPageState();
}

class _LivenessPageState extends State<LivenessPage> {
  final controller = Get.find<LivenessController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(''),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('Capture Image'),
          ),
        ));
  }
}
