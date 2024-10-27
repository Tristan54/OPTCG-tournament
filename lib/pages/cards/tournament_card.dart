import 'package:flutter/material.dart';
import 'package:optcg_tournament/pages/tournament_view.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../models/tournament.dart';
import '../../widgets/template.dart';

class Tournamentcard extends StatelessWidget {

  final Tournament tournament;

  const Tournamentcard({Key? key, required this.tournament}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  RelativeBuilder(builder: (context, height, width, sy, sx) {
      Template template = Template(sx: sx, sy: sy, context: context);

      return Center(
        child: Card(
          elevation: 5,
          shadowColor: template.grey,
          child: InkWell(
            splashColor: template.yellow,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => TournamentView(tournament: tournament,)),);
            },
            //
            child: SizedBox(
              width: width,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(template.small_padding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(left: template.small_padding),
                            child: template.text(text: tournament.name)
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
    );
  }
}
