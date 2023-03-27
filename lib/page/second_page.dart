import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

import '../color_schemes.g.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
      ),
      themeMode: ThemeMode.system,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Buttons'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SlowlyCheckboxListTileWidget(),
            CheckboxButtonWidget(),
            LinkedTappableLabelTextWidget(),
            SwitchWidget(),
            ActionClipWidget(),
            RadioButtonWidget(),
          ],
        ),
      ),
    );
  }
}

enum RadioButtonMenu {
  ferrari,
  mercedes,
  redBull,
}

class CheckboxButtonWidget extends StatefulWidget {
  const CheckboxButtonWidget({super.key});

  @override
  State<CheckboxButtonWidget> createState() => _CheckboxButtonWidgetState();
}

class _CheckboxButtonWidgetState extends State<CheckboxButtonWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };

      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}

class SlowlyCheckboxListTileWidget extends StatefulWidget {
  const SlowlyCheckboxListTileWidget({super.key});

  @override
  State<SlowlyCheckboxListTileWidget> createState() => _SlowlyCheckboxListTileWidgetState();
}

class _SlowlyCheckboxListTileWidgetState extends State<SlowlyCheckboxListTileWidget> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: const Text('Animate Slowly'),
      value: timeDilation != 1.0,
      onChanged: (bool? value) {
        setState(() {
          timeDilation = value! ? 10.0 : 1.0;
        });
      },
      secondary: const Icon(Icons.hourglass_empty),
    );
  }
}

class LinkedLabelCheckbox extends StatelessWidget {
  const LinkedLabelCheckbox({
    super.key,
    required this.label,
    required this.padding,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final EdgeInsets padding;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        children: <Widget>[
          Expanded(
            child: RichText(
              text: TextSpan(
                text: label,
                style: const TextStyle(
                  color: Colors.blueAccent,
                  decoration: TextDecoration.underline,
                  fontSize: 17,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    debugPrint('Label has been tapped.');
                  },
              ),
            ),
          ),
          Checkbox(
            value: value,
            onChanged: (bool? newValue) {
              onChanged(newValue!);
            },
          ),
        ],
      ),
    );
  }
}

class LinkedTappableLabelTextWidget extends StatefulWidget {
  const LinkedTappableLabelTextWidget({super.key});

  @override
  State<LinkedTappableLabelTextWidget> createState() => _LinkedTappableLabelTextWidgetState();
}

class _LinkedTappableLabelTextWidgetState extends State<LinkedTappableLabelTextWidget> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return LinkedLabelCheckbox(
      label: 'Linked, tappable label text',
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      value: _isSelected,
      onChanged: (bool newValue) {
        setState(() {
          _isSelected = newValue;
        });
      },
    );
  }
}

class SwitchWidget extends StatefulWidget {
  const SwitchWidget({super.key});

  @override
  State<SwitchWidget> createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  bool light0 = true;
  bool light1 = true;
  bool light2 = true;

  final MaterialStateProperty<Icon?> thumbIcon = MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      // Thumb icon when the switch is selected.
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.check);
      }
      return const Icon(Icons.close);
    },
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Switch(
          value: light0,
          onChanged: (bool value) {
            setState(() {
              light0 = value;
            });
          },
        ),
        Switch(
          thumbIcon: thumbIcon,
          value: light1,
          onChanged: (bool value) {
            setState(() {
              light1 = value;
            });
          },
        ),
      ],
    );
  }
}

class ActionClipWidget extends StatefulWidget {
  const ActionClipWidget({super.key});

  @override
  State<ActionClipWidget> createState() => _ActionClipWidgetState();
}

class _ActionClipWidgetState extends State<ActionClipWidget> {
  bool favorite = false;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: ActionChip(
        avatar: Icon(favorite ? Icons.favorite : Icons.favorite_border),
        label: const Text(
          'Save to favorites',
        ),
        onPressed: () {
          setState(() {
            favorite = !favorite;
          });
        },
      ),
    );
  }
}

class RadioButtonWidget extends StatefulWidget {
  const RadioButtonWidget({super.key});

  @override
  State<RadioButtonWidget> createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButtonWidget> {
  RadioButtonMenu? _buttonMenu = RadioButtonMenu.ferrari;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Ferrari'),
          leading: Radio<RadioButtonMenu>(
            value: RadioButtonMenu.ferrari,
            groupValue: _buttonMenu,
            onChanged: (RadioButtonMenu? value) {
              setState(() {
                _buttonMenu = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Mercedes'),
          leading: Radio<RadioButtonMenu>(
            value: RadioButtonMenu.mercedes,
            groupValue: _buttonMenu,
            onChanged: (RadioButtonMenu? value) {
              setState(() {
                _buttonMenu = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('RedBull'),
          leading: Radio<RadioButtonMenu>(
            value: RadioButtonMenu.redBull,
            groupValue: _buttonMenu,
            onChanged: (RadioButtonMenu? value) {
              setState(() {
                _buttonMenu = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
