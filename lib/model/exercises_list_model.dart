class ExercisesListModel {
  List<String> exerciseName = [
    'Chest Dip',
    'Push Up',
    'fly Agains Chains',
    'lying Floor Fly',
    'lay Down Push Up',
    'Power Push Aways',
    'Plank Push Up',
    'Pull Dwon',
    'Chain Up',
    'Back Extention',
    'Band Pull Down',
    'BandKneeling',
    'Band Streight',
    'Bar Bell',
    'Band Face Pull',
    'Band Shoulder Press',
    'Band Bent',
    'Band Raise',
    'Band Reverse Fly',
    'Band Single Arm',
    'Band Upright Row',
    'Air Bike',
    'Air Squat',
    'Both Leg Raise',
    'high Hop',
    'leg Raise',
    'Sit Up',
    'Twisting Crunch',
  ];

  String repsAndsets = '10 * 5';

  List exercisegif = [
    ('images/exersizes/chest/chestDip.gif'),
    ('images/exersizes/chest/pushUp.gif'),
    ('images/exersizes/chest/flyAgainsChains.gif'),
    ('images/exersizes/chest/lyingFloorFly.gif'),
    ('images/exersizes/chest/layDownPushUp.gif'),
    ('images/exersizes/chest/PowerPushAways.gif'),
    ('images/exersizes/chest/PlankPushUp.gif'),
    ('images/exersizes/back/PullDwon.gif'),
    ('images/exersizes/back/ChainUp.gif'),
    ('images/exersizes/back/BackExtention.gif'),
    ('images/exersizes/back/BandPullDown.gif'),
    ('images/exersizes/back/BandKneeling.gif'),
    ('images/exersizes/back/BandStreight.gif'),
    ('images/exersizes/back/BarBell.gif'),
    ('images/exersizes/shoulders/BandFacePull.gif'),
    ('images/exersizes/shoulders/BandShoulderPress.gif'),
    ('images/exersizes/shoulders/BandBent.gif'),
    ('images/exersizes/shoulders/BandRaise.gif'),
    ('images/exersizes/shoulders/BandReverseFly.gif'),
    ('images/exersizes/shoulders/BandSingleArm.gif'),
    ('images/exersizes/shoulders/BandUprightRow.gif'),
    ('images/exersizes/fullbody/AirBike.gif'),
    ('images/exersizes/fullbody/AirSquat.gif'),
    ('images/exersizes/fullbody/BothLegRaise.gif'),
    ('images/exersizes/fullbody/highHop.gif'),
    ('images/exersizes/fullbody/legRaise.gif'),
    ('images/exersizes/fullbody/SitUp.gif'),
    ('images/exersizes/fullbody/TwistingCrunch.gif'),
  ];
  ExercisesItem getById(int id) => ExercisesItem(
        id: id,
        name: exerciseName[id % exerciseName.length],
        image: exercisegif[id % exercisegif.length],
        subTitle: repsAndsets,
      );

// get exerciseItems by position

  ExercisesItem getPsition(int position) {
// int this simplfied case , an item position in the list is also its id
    return getById(position);
  }
}

class ExercisesItem {
  final int id;
  final String name;
  final String subTitle;
  final String image;

  ExercisesItem(
      {required this.id,
      required this.image,
      required this.name,
      required this.subTitle});

  @override
  int get hashcode => id;
  @override
  bool operator ==(Object other) => other is ExercisesItem && other.id == id;
}
