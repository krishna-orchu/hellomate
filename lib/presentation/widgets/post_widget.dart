import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 64/45,
      child: Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(16),
      ),
        child: Container(
          padding: EdgeInsets.all(8),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 16/9,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 4,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          "Hello Mate is a wonderful app",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        "Eluru, Tamil Nadu",
                        style: Theme.of(context).textTheme.bodySmall,
                      )
                    ],
                  ),
                  Text(
                      "8000",
                    style: Theme.of(context).textTheme.headlineSmall,
                  )
                ],
              )
            ],
          ),
        ),
    )
    );
  }
}
