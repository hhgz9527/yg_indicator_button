library yg_indicator_button;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum YGIndicatorStatus {
  none,
  loading,
  completed,
}

class YGIndicatorButton extends StatefulWidget {
  final String normalTitle;
  final String? loadingTitle;
  final String? completedTitle;
  final double? width;
  final double? height;
  final Widget? normalWidget; // when use this, normalTitle will disable
  final Widget? loadingWidget; // when use this, loadingTitle will disable
  final Widget? completedWidget; // when use this, completedTitle will disable
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final Function(Function(YGIndicatorStatus result))? action;

  const YGIndicatorButton({
    Key? key,
    required this.normalTitle,
    this.loadingTitle,
    this.completedTitle,
    this.action,
    this.width,
    this.height,
    this.backgroundColor,
    this.normalWidget,
    this.loadingWidget,
    this.completedWidget,
    this.borderRadius,
  }) : super(key: key);

  @override
  _YGIndicatorButtonState createState() => _YGIndicatorButtonState();
}

class _YGIndicatorButtonState extends State<YGIndicatorButton> {
  YGIndicatorStatus _requestStatus = YGIndicatorStatus.none;

  @override
  Widget build(BuildContext context) {
    switch (_requestStatus) {
      case YGIndicatorStatus.none:
        return SizedBox(
          height: widget.height ?? 50,
          width: widget.width ?? double.infinity,
          child: CupertinoButton(
            borderRadius: widget.borderRadius,
            color: widget.backgroundColor ?? CupertinoColors.systemBlue,
            child: widget.normalWidget ?? Text(widget.normalTitle),
            onPressed: () {
              if (widget.action != null) {
                widget.action!(
                  (requestStatus) {
                    setState(() {
                      _requestStatus = requestStatus;
                    });
                  },
                );
              }
            },
          ),
        );
      case YGIndicatorStatus.loading:
        return Container(
          height: widget.height ?? 50,
          width: widget.width ?? double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: widget.backgroundColor ?? CupertinoColors.systemBlue,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildActivityIndicator(),
              Container(width: 15),
              widget.loadingWidget ?? Text(widget.loadingTitle ?? 'Updating', style: const TextStyle(color: Colors.white)),
            ],
          ),
        );
      case YGIndicatorStatus.completed:
        return Container(
          height: widget.height ?? 50,
          width: widget.width ?? double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).brightness == Brightness.light ? const Color(0xff23BA66).withAlpha(200) : const Color(0xff23BA66),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.done, color: Colors.white),
              Container(width: 15),
              widget.completedWidget ?? Text(widget.completedTitle ?? 'Succeeded', style: const TextStyle(color: Colors.white)),
            ],
          ),
        );
    }
  }

  _buildActivityIndicator() {
    return CupertinoTheme(
      data: CupertinoThemeData(
        brightness: Theme.of(context).brightness,
      ),
      child: const CupertinoActivityIndicator(radius: 8),
    );
  }
}
