import 'package:flutter/material.dart';

import '../color_schemes.g.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

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
          title: const Text('Cards'),
        ),
        body: Column(
          children: const <Widget>[
            CardsWidget(),
            Spacer(),
            InkWellCard(),
            Spacer(),
            ElevatedCardWidget(),
            FilledCardWidget(),
            OutlinedCardWidget(),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

class CardsWidget extends StatelessWidget {
  const CardsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.alarm),
              title: Text('Cards Title'),
              subtitle: Text('Cards subtitle'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('No'),
                  onPressed: () {},
                ),
                TextButton(
                  child: const Text('Yes'),
                  onPressed: () {},
                ),
                const SizedBox(
                  width: 10,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class InkWellCard extends StatelessWidget {
  const InkWellCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            debugPrint('InkWell card tappped.');
          },
          child: const SizedBox(
            width: 300,
            height: 100,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'A card that can be tapped.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ElevatedCardWidget extends StatelessWidget {
  const ElevatedCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Card(
        child: SizedBox(
          width: 300,
          height: 100,
          child: Center(
            child: Text('Elevated Vard'),
          ),
        ),
      ),
    );
  }
}

class FilledCardWidget extends StatelessWidget {
  const FilledCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 0,
        color: Theme.of(context).colorScheme.surfaceVariant,
        child: const SizedBox(
          width: 300,
          height: 100,
          child: Center(
            child: Text('Filled Card'),
          ),
        ),
      ),
    );
  }
}

class OutlinedCardWidget extends StatelessWidget {
  const OutlinedCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.outline,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: const SizedBox(
          width: 300,
          height: 100,
          child: Center(
            child: Text('Filled Card'),
          ),
        ),
      ),
    );
  }
}
