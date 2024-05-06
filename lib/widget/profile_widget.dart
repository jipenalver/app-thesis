import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  final String? imagePath;
  final VoidCallback onClicked;

  const ProfileWidget({
    super.key,
    required this.imagePath,
    required this.onClicked,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    return Center(
        child: Stack(
      children: [
        buildImage(),
        Positioned(bottom: 0, right: 4, child: buildEditIcon(color))
      ],
    ));
  }

  Widget buildImage() {
    final image = NetworkImage(imagePath!);

    return ClipOval(
        child: Material(
      color: Colors.transparent,
      child: Ink.image(
        image: image,
        fit: BoxFit.cover,
        width: 128,
        height: 128,
        child: InkWell(
          onTap: onClicked,
        ),
      ),
    ));
  }

  Widget buildEditIcon(Color color) {
    return buildCircle(
        color: Colors.white,
        all: 3,
        child: buildCircle(
            color: color,
            all: 8,
            child: const Icon(Icons.edit, size: 20, color: Colors.white)));
  }

  Widget buildCircle(
      {required Widget child,
      required,
      required double all,
      required Color color}) {
    return ClipOval(
      child:
          Container(color: color, padding: EdgeInsets.all(all), child: child),
    );
  }
}
