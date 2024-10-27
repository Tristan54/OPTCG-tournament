import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

import '../models/tournament.dart';
import '../widgets/template.dart';

class TournamentView extends StatefulWidget {

  final Tournament tournament;

  const TournamentView({Key? key, required this.tournament}) : super(key: key);


  @override
  State<TournamentView> createState() => _TournamentViewState();
}

class _TournamentViewState extends State<TournamentView> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      Template template = Template(sx: sx, sy: sy, context: context);

      return template.build(
          child: Scaffold(
              appBar: AppBar(
                iconTheme: IconThemeData(
                  color: template.white,
                ),
                backgroundColor: template.primary,
                title: template.text(text: widget.tournament.name, color: template.white),
              ),
              backgroundColor: template.white,
              body: Column(
                children: [
                  Padding(padding: EdgeInsets.all(template.small_padding), child: template.title(text: "Liste des participants")),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: template.body_width,
                        child: TextField(
                          controller: _controller,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "nom participant",
                          ),
                          onSubmitted: (String value) async {
                            await showDialog<void>(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Thanks!'),
                                  content: Text(
                                      'You typed "$value", which has length ${value.characters.length}.'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        width: template.small_padding,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: template.black, side: BorderSide(color: template.black, width: 1),
                        ),
                        onPressed: () async {
                          print("click");
                        },
                        child: template.iconAdd(),
                      ),

                    ],
                  )
                ],
              )
          )
      );
    });
  }
}
