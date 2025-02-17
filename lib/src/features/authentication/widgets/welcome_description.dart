import 'package:flutter/material.dart';

class WelcomeDescription extends StatelessWidget {
  const WelcomeDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Restez connecté avec la communauté EKOD ! Retrouvez vos anciens '
      'camarades, découvrez des opportunités professionnelles et participez '
      'aux événements de promotion. Une plateforme unique pour maintenir des '
      "liens précieux pendant vos études et après l'obtention de votre "
      'diplôme.',
      style: Theme.of(context).textTheme.bodyMedium,
      textAlign: TextAlign.center,
    );
  }
}
