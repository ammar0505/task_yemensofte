import 'package:flutter/material.dart';
import 'package:task_yemensofte/core/utils/inactivity_timer.dart';

class InactivityWrapper extends StatefulWidget {
  final Widget child;

  const InactivityWrapper({
    super.key,
    required this.child,
  });

  @override
  State<InactivityWrapper> createState() => _InactivityWrapperState();
}

class _InactivityWrapperState extends State<InactivityWrapper>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    InactivityTimer.startTimer(context);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    InactivityTimer.stopTimer();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      InactivityTimer.startTimer(context);
    } else if (state == AppLifecycleState.resumed) {
      InactivityTimer.resetTimer(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) => InactivityTimer.resetTimer(context),
      onPointerMove: (_) => InactivityTimer.resetTimer(context),
      onPointerUp: (_) => InactivityTimer.resetTimer(context),
      child: widget.child,
    );
  }
}
