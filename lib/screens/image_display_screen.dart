import 'package:flutter/material.dart';

class ImageDisplayScreenWidget extends StatelessWidget {
  final String imageUrl;
  final BuildContext context;
  final String location;
  const ImageDisplayScreenWidget(
      {super.key,
      required this.imageUrl,
      required this.context,
      required this.location});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          InteractiveViewer(
            child: Hero(
              tag: imageUrl,
              child: Image.network(
                imageUrl,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: const EdgeInsets.all(
                  10,
                ),
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
                width: double.infinity,
                child: Text(
                  location,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
            child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      45,
                    ),
                    color: Colors.black26,
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                      child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
