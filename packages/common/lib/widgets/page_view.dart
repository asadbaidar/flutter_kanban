import 'package:common/common.dart';
import 'package:flutter/material.dart';

typedef PageViewKey = GlobalKey<_CustomPageViewState>;

extension PageViewKeyValues on PageViewKey {
  PageController get controller => currentState!.controller;

  void enablePageSnapping(bool value) =>
      currentState!.enablePageSnapping(value);
}

class CustomPageView extends StatefulWidget {
  const CustomPageView({
    super.key,
    this.horizontalPadding = 0,
    this.viewportFraction = 1,
    required this.itemCount,
    required this.builder,
  });

  final double horizontalPadding;
  final double viewportFraction;
  final int itemCount;
  final NullableIndexedWidgetBuilder builder;

  @override
  State<CustomPageView> createState() => _CustomPageViewState();
}

class _CustomPageViewState extends State<CustomPageView> {
  late final PageController _controller;
  int _index = 0;
  bool _pageSnapping = true;

  PageController get controller => _controller;

  void enablePageSnapping(bool value) {
    if (_pageSnapping == value) return;
    setState(() => _pageSnapping = value);
    if (value) {
      // Animate to the current page to snap to it
      // when page snapping is enabled
      controller.animateToPage(
        _index,
        duration: 200.milliseconds,
        curve: Curves.ease,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = PageController(viewportFraction: widget.viewportFraction);
  }

  bool _isFirst(int index) => index == 0;

  bool _isLast(int index) => index == widget.itemCount - 1;

  bool _isEdge(int index) => _isFirst(index) || _isLast(index);

  @override
  Widget build(BuildContext context) {
    return StretchingOverscrollIndicator(
      axisDirection: AxisDirection.right,
      child: PageView.builder(
        padEnds: !_isEdge(_index),
        controller: _controller,
        pageSnapping: _pageSnapping,
        physics: const ClampingScrollPhysics(),
        itemCount: widget.itemCount,
        onPageChanged: (index) => setState(() => _index = index),
        itemBuilder: (context, index) {
          return Padding(
            padding: _isFirst(index)
                ? EdgeInsetsDirectional.only(
                    start: widget.horizontalPadding,
                  )
                : _isLast(index)
                    ? EdgeInsetsDirectional.only(
                        end: widget.horizontalPadding,
                      )
                    : EdgeInsets.symmetric(
                        horizontal: widget.horizontalPadding.half,
                      ),
            child: widget.builder(context, index),
          );
        },
      ),
    );
  }
}
