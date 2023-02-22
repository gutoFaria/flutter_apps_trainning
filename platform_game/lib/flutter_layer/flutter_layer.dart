import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/score/score_bloc.dart';

class FlutterLayer extends StatelessWidget {
  const FlutterLayer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScoreBloc, ScoreState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Score: ${state.score}', style: Theme.of(context).textTheme.bodyText2),
            TextButton(
              style: Theme.of(context).textButtonTheme.style,
              onPressed: (){
                context.read<ScoreBloc>().add(IncreaseScoreEvent());
              }, 
              child: const Text('+ score',)
            )
          ],
        );
      },
    );
  }
}
