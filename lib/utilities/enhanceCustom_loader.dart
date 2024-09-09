import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EnhancedCustomLoader {
  static EnhancedCustomLoader? _instance;

  EnhancedCustomLoader._();

  factory EnhancedCustomLoader() {
    return _instance ??= EnhancedCustomLoader._();
  }

  OverlayState? _overlayState;
  OverlayEntry? _overlayEntry;

  void _buildLoader() {
    _overlayEntry = OverlayEntry(
      builder: (context) {
        return Container(
          color: Colors.black.withOpacity(0.5),
          child: Center(
            child: _buildLoaderWidget(),
          ),
        );
      },
    );
  }

  void show() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _overlayState = Overlay.of(Get.context!);
      _buildLoader();
      _overlayState!.insert(_overlayEntry!);
    });
  }

  void hide() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  Widget _buildLoaderWidget() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20),
          _buildAnimatedLoader(),
          const SizedBox(height: 20),
          const Text(
            'Loading...',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnimatedLoader() {
    return SizedBox(
      width: 50,
      height: 50,
      child: CustomPaint(
        painter: _LoaderPainter(),
      ),
    );
  }
}

class _LoaderPainter extends CustomPainter {
  final Paint _paint = Paint()
    ..color = Colors.blue
    ..strokeWidth = 4
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - _paint.strokeWidth / 2;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      0,
      2 * 3.14 * 0.75,
      false,
      _paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}