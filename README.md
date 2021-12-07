<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->
## Features

![image](https://github.com/hhgz9527/yg_indicator_button/blob/main/example.gif?raw=true)

## Getting started

add `yg_indicator_button:` to your `pubspec.yaml` file.

```
dependencies:
  flutter:
    sdk: flutter
  yg_indicator_button:
```

## Usage

TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder. 

```dart
YGIndicatorButton(
    normalTitle: 'Create',
    height: 50,
    width: 200,
    action: (closure) {
        closure(YGIndicatorStatus.loading);
        // fake API request
	Future.delayed(const Duration(seconds: 2), () {
	    closure(YGIndicatorStatus.completed);
	});
    },
)
```
