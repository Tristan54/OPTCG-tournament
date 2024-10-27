import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:optcg_tournament/pages/cards/tournament_card.dart';
import 'package:relative_scale/relative_scale.dart';

import '../models/tournament.dart';
import '../widgets/template.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  static const String id = 'menu_page';

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  late List<Tournament> _tournaments;

  @override
  void initState() {
    super.initState();
    initialization();

    _tournaments = [];
    _tournaments.add(Tournament("jour 1 test"));
  }

  void initialization() async {
    // Splash screen
    await Future.delayed(const Duration(seconds: 2));
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      Template template = Template(sx: sx, sy: sy, context: context);

      return template.build(
          child: Scaffold(
              appBar: AppBar(
                backgroundColor: template.primary,
                title: template.text(text: "Tournois", color: template.white),
              ),
              backgroundColor: template.white,
              body: ListView.builder(
                //physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  padding: const EdgeInsets.all(8),
                  itemCount: _tournaments.length,
                  itemBuilder: _itemBuilder
              ),
            floatingActionButton: FloatingActionButton.extended(
                icon: template.iconAdd(),
                label: template.text(text: "ajouter"),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                onPressed: () => print("click")
            ),
          ));
    });
  }

  Widget? _itemBuilder(BuildContext context, int index) {
    return Tournamentcard(tournament: _tournaments[index]);
  }

}
