import 'package:flutter/material.dart';

class PageThree extends StatefulWidget {
  final ColorScheme colorScheme;
  const PageThree({Key? key, required this.colorScheme}) : super(key: key);

  @override
  _PageThreeState createState() => _PageThreeState();
}
class _PageThreeState extends State<PageThree> with TickerProviderStateMixin {
  final List<String> _songTitles = [
    'Song One',
    'Song Two',
    'Song Three',
    'Song Four',
    'Song Five',
    'Song Six',
    'Song Seven',
    'Song Eight',
    'Song Nine',
    'Song Ten',
    'Song Eleven',
    'Song Twelve',
    'Song Thirteen',
    'Song Fourteen',
    'Song Fifteen',
  ];

  final List<int> _dailyListens = [
    12345,
    23456,
    34567,
    45678,
    56789,
    67890,
    78901,
    89012,
    90123,
    98765,
    87654,
    76543,
    65432,
    54321,
    43210,
  ];

  late final AnimationController _animationController;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _animationController, curve: Curves.bounceOut);
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [widget.colorScheme.primary,widget.colorScheme.secondary],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: ListView.builder(
        itemCount: _songTitles.length,
        itemBuilder: (BuildContext context, int index) {
          return SizeTransition(
            sizeFactor: _animation,
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              color: Colors.white,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: widget.colorScheme.secondary,
                  child: Text(
                    '${index + 1}',
                    style: TextStyle(color: widget.colorScheme.secondary, fontWeight: FontWeight.bold),
                  ),
                ),
                title: Text(
                  _songTitles[index],
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                ),
                subtitle: Text(
                  'Daily Listens: ${_dailyListens[index]}',
                  style: TextStyle(color: Colors.grey.shade800),
                ),
                trailing: Icon(Icons.music_note, color: widget.colorScheme.secondary),
              ),
            ),
          );
        },
      ),
    );
  }
}