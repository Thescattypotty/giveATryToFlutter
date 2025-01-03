import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:giveatrytoflutter/components/customDrawer/custom_drawer.dart';
import 'package:giveatrytoflutter/pages/home/home.dart';

class FunOptions extends StatefulWidget {
  const FunOptions({super.key});

  @override
  _FunOptionsState createState() => _FunOptionsState();
}

class _FunOptionsState extends State<FunOptions> {
  bool isAirplaneMode = false;
  bool isWifiEnabled = true;
  bool isBluetoothEnabled = false;
  bool isNotificationsEnabled = true;
  bool isSoundEnabled = true;
  bool isVibrationEnabled = true;
  bool isBatterySaverEnabled = false;
  bool isPrivacyEnabled = true;
  bool isSecurityEnabled = true;

  late CameraController _cameraController;
  late List<CameraDescription> _cameras;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  void _initializeCamera() async {
    _cameras = await availableCameras();
    _cameraController = CameraController(
      _cameras[0],
      ResolutionPreset.medium,
    );
    await _cameraController.initialize();
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: const Text("Fun Options",
            style: TextStyle(color: Colors.white, fontSize: 30)),
        backgroundColor: Colors.brown,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(17.0),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            const Text("Airplane Mode"),
            Switch(
              value: isAirplaneMode,
              onChanged: (value) {
                setState(() {
                  isAirplaneMode = value;
                });
              },
            ),
            const SizedBox(height: 20),
            const Text("Wi-Fi"),
            Switch(
              value: isWifiEnabled,
              onChanged: (value) {
                setState(() {
                  isWifiEnabled = value;
                });
              },
            ),
            const SizedBox(height: 20),
            const Text("Bluetooth"),
            Switch(
              value: isBluetoothEnabled,
              onChanged: (value) {
                setState(() {
                  isBluetoothEnabled = value;
                });
              },
            ),
            const SizedBox(height: 20),
            const Text("Notifications"),
            Switch(
              value: isNotificationsEnabled,
              onChanged: (value) {
                setState(() {
                  isNotificationsEnabled = value;
                });
              },
            ),
            const SizedBox(height: 20),
            const Text("Sound"),
            Switch(
              value: isSoundEnabled,
              onChanged: (value) {
                setState(() {
                  isSoundEnabled = value;
                });
              },
            ),
            const SizedBox(height: 20),
            const Text("Vibration"),
            Switch(
              value: isVibrationEnabled,
              onChanged: (value) {
                setState(() {
                  isVibrationEnabled = value;
                });
              },
            ),
            const SizedBox(height: 20),
            const Text("Battery Saver"),
            Switch(
              value: isBatterySaverEnabled,
              onChanged: (value) {
                setState(() {
                  isBatterySaverEnabled = value;
                });
              },
            ),
            const SizedBox(height: 20),
            const Text("Privacy"),
            Switch(
              value: isPrivacyEnabled,
              onChanged: (value) {
                setState(() {
                  isPrivacyEnabled = value;
                });
              },
            ),
            const SizedBox(height: 20),
            const Text("Security"),
            Switch(
              value: isSecurityEnabled,
              onChanged: (value) {
                setState(() {
                  isSecurityEnabled = value;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CameraPreviewPage(
                      cameraController: _cameraController,
                    ),
                  ),
                );
              },
              child: const Text("Open Camera"),
            ),
            ElevatedButton(
              onPressed: () {
                _cameraController.dispose();
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
              child: const Text("Close Camera & Navigate to Home"),
            ),
          ],
        ),
      ),
    );
  }
}

class CameraPreviewPage extends StatelessWidget {
  final CameraController cameraController;

  const CameraPreviewPage({Key? key, required this.cameraController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Camera Preview"),
        backgroundColor: Colors.brown,
      ),
      body: CameraPreview(cameraController),
    );
  }
}
