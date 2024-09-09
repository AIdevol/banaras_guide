// import 'dart:async';
// import 'package:flutter/material.dart';
//
// class AutoScrollingPageView extends StatefulWidget {
//   final int itemCount;
//   final Widget Function(BuildContext, int) itemBuilder;
//
//   const AutoScrollingPageView({
//     Key? key,
//     required this.itemCount,
//     required this.itemBuilder,
//   }) : super(key: key);
//
//   @override
//   _AutoScrollingPageViewState createState() => _AutoScrollingPageViewState();
// }
//
// class _AutoScrollingPageViewState extends State<AutoScrollingPageView> {
//   late PageController _pageController;
//   Timer? _timer;
//   int _currentPage = 0;
//
//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController(viewportFraction: 0.6, initialPage: 0);
//     _startAutoScroll();
//   }
//
//   @override
//   void dispose() {
//     _timer?.cancel();
//     _pageController.dispose();
//     super.dispose();
//   }
//
//   void _startAutoScroll() {
//     _timer = Timer.periodic(Duration(seconds: 3), (timer) {
//       if (_currentPage < widget.itemCount - 1) {
//         _currentPage++;
//       } else {
//         _currentPage = 0;
//       }
//       _pageController.animateToPage(
//         _currentPage,
//         duration: Duration(milliseconds: 350),
//         curve: Curves.easeInOut,
//       );
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return PageView.builder(
//       controller: _pageController,
//       itemCount: widget.itemCount,
//       itemBuilder: widget.itemBuilder,
//     );
//   }
// }
import 'dart:async';
import 'package:flutter/material.dart';

class AutoScrollingPageView extends StatefulWidget {
  final int itemCount;
  final Widget Function(BuildContext, int, PageController) itemBuilder;
  final Duration autoScrollDuration;
  final Duration animationDuration;
  final Curve animationCurve;

  const AutoScrollingPageView({
    Key? key,
    required this.itemCount,
    required this.itemBuilder,
    this.autoScrollDuration = const Duration(seconds: 3),
    this.animationDuration = const Duration(milliseconds: 350),
    this.animationCurve = Curves.easeInOut,
  }) : super(key: key);

  @override
  _AutoScrollingPageViewState createState() => _AutoScrollingPageViewState();
}

class _AutoScrollingPageViewState extends State<AutoScrollingPageView> {
  late PageController _pageController;
  Timer? _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.6, initialPage: 0);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startAutoScroll();
    });
  }

  @override
  void dispose() {
    _stopAutoScroll();
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(widget.autoScrollDuration, (timer) {
      if (_pageController.hasClients) {
        if (_currentPage < widget.itemCount - 1) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }
        _pageController.animateToPage(
          _currentPage,
          duration: widget.animationDuration,
          curve: widget.animationCurve,
        );
      }
    });
  }

  void _stopAutoScroll() {
    _timer?.cancel();
    _timer = null;
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      itemCount: widget.itemCount,
      itemBuilder: (context, index) => widget.itemBuilder(context, index, _pageController),
      onPageChanged: (index) {
        setState(() {
          _currentPage = index;
        });
      },
    );
  }
}