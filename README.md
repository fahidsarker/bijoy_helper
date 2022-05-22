# bijoy_helper (A Flutter Package to help with bijoy conversions)

**Note: Fonts are not included and you have to manually setup the fonts**

## Usage

### add the dependency

add to pubspec.yaml:

```yaml
bijoy_helper: ^0.0.3
```

### import the package

```dart
import 'package:bijoy_helper/bijoy_helper.dart';
```

### Convert a string from unicode to bijoy

- #### Use the unicodeToBijoy function

```dart
String unicodeToBijoy(String unicodeStr);
```

Here, the unicodeStr represents a string in unicode version and this will be converted to bijoy compatable version
e.g.

```dart
print(unicodeToBijoy("উভয় পাশে ধানের শীষে বেষ্টিত পানিতে ভাসমান জাতীয় ফুল শাপলা। তার মাথায় পাটগাছের পরস্পর সংযুক্ত তিনটি পাতা এবং উভয পাশে দুটি করে তারকা।"));
```

> Output: Dfq cv‡k av‡bi kx‡l ‡ewóZ cvwb‡Z fvmgvb RvZxq dyj kvcjv| Zvi gv_vq cvUMv‡Qi ci¯úi mshy³ wZbwU cvZv Ges Dfh cv‡k `ywU K‡i ZviKv|

- #### Use the String extension function

```dart
String get .toBijoy;
String .toBijoyIf(bool condition);
```

.toBijoy simply returns the converted string whereas .toBijoyIf returns the string only if the condition is true. Else returns the original string
e.g.

```dart
print("উভয় পাশে ধানের শীষে বেষ্টিত পানিতে ভাসমান জাতীয় ফুল শাপলা। তার মাথায় পাটগাছের পরস্পর সংযুক্ত তিনটি পাতা এবং উভয পাশে দুটি করে তারকা।".toBijoy);
```

> Output: Dfq cv‡k av‡bi kx‡l ‡ewóZ cvwb‡Z fvmgvb RvZxq dyj kvcjv| Zvi gv_vq cvUMv‡Qi ci¯úi mshy³ wZbwU cvZv Ges Dfh cv‡k `ywU K‡i ZviKv|

- #### Use the BijoyText and BijoyText.rich
  Just like the Text Widget but you dont have to manually convert it any more.
  e.g:

```dart
import 'package:flutter/material.dart';
import 'package:bijoy_helper/bijoy_helper.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bijoy Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:  Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: BijoyText(
              'এই প্যাকেজটি ফ্লাটার ফ্রেমওয়ার্কে বিজয় সমর্থনের জন্য লেখা হয়েছে',
              style: TextStyle(fontFamily: 'SutonyMJ', fontSize: 20.0, height: 1.2),
            ),
          ),
        ),
      ),
    );
  }
}
```

<img src="screenshots/ss_with_bijoy.jpg" alt="ss_with_bijoy" style="width:200px;"/>

It also has an additional `toBijoyIf` optional param which you can use to conditionally convert (thigh can help you when you are using multiple locales)

```dart
import 'package:flutter/material.dart';
import 'package:bijoy_helper/bijoy_helper.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bijoy Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:  Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: BijoyText(
              'এই প্যাকেজটি ফ্লাটার ফ্রেমওয়ার্কে বিজয় সমর্থনের জন্য লেখা হয়েছে',
              style: TextStyle(fontFamily: 'SutonyMJ', fontSize: 20.0, height: 1.2),
              toBijoyIf: false,
            ),
          ),
        ),
      ),
    );
  }
}
```

<img src="screenshots/ss_without_bijoy.jpg" alt="ss_without_bijoy" style="width:200px;"/>

Happy coding :-)
