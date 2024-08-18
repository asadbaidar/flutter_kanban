import 'package:flutter/material.dart';

class LifecycleObserver extends StatefulWidget {
  const LifecycleObserver({
    super.key,
    this.onInit,
    this.onInitiated,
    this.onResumed,
    this.onDetached,
    this.onInactive,
    this.onHidden,
    this.onPaused,
    this.onDisposed,
    this.rebuildOnResume = false,
    this.child,
    this.builder,
  });

  final VoidCallback? onInit;
  final VoidCallback? onInitiated;
  final VoidCallback? onResumed;
  final VoidCallback? onDetached;
  final VoidCallback? onInactive;
  final VoidCallback? onHidden;
  final VoidCallback? onPaused;
  final VoidCallback? onDisposed;
  final bool rebuildOnResume;
  final Widget? child;
  final WidgetBuilder? builder;

  @override
  State<LifecycleObserver> createState() => _LifecycleObserverState();
}

class _LifecycleObserverState extends State<LifecycleObserver> {
  late final LifecycleCallbackHandler? handler;

  bool get requiredAppLifecycle =>
      widget.rebuildOnResume ||
      widget.onResumed != null ||
      widget.onDetached != null ||
      widget.onInactive != null ||
      widget.onHidden != null ||
      widget.onPaused != null;

  @override
  void initState() {
    super.initState();
    widget.onInit?.call();
    if (widget.onInitiated != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        widget.onInitiated?.call();
      });
    }
    if (requiredAppLifecycle) {
      handler = LifecycleCallbackHandler(
        onResumed: _onResumed,
        onDetached: widget.onDetached,
        onInactive: widget.onInactive,
        onHidden: widget.onHidden,
        onPaused: widget.onPaused,
      );
      WidgetsBinding.instance.addObserver(handler!);
    }
  }

  void _onResumed() {
    widget.onResumed?.call();
    if (widget.rebuildOnResume) setState(() {});
  }

  @override
  void dispose() {
    widget.onDisposed?.call();
    if (requiredAppLifecycle) {
      WidgetsBinding.instance.removeObserver(handler!);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      widget.builder?.call(context) ?? widget.child ?? const SizedBox.shrink();
}

class LifecycleCallbackHandler extends WidgetsBindingObserver {
  LifecycleCallbackHandler({
    this.onResumed,
    this.onDetached,
    this.onInactive,
    this.onHidden,
    this.onPaused,
  });

  final VoidCallback? onResumed;
  final VoidCallback? onDetached;
  final VoidCallback? onInactive;
  final VoidCallback? onHidden;
  final VoidCallback? onPaused;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        onResumed?.call();
      case AppLifecycleState.detached:
        onDetached?.call();
      case AppLifecycleState.inactive:
        onInactive?.call();
      case AppLifecycleState.hidden:
        onHidden?.call();
      case AppLifecycleState.paused:
        onPaused?.call();
    }
  }
}
