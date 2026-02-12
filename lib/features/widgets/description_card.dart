import 'package:fake_api_app/core/constants/appColors.dart';
import 'package:flutter/material.dart';

class DescriptionCard extends StatefulWidget {
  const DescriptionCard({super.key, required this.description});

  final String description;

  @override
  State<DescriptionCard> createState() => _DescriptionCardState();
}

class _DescriptionCardState extends State<DescriptionCard> {
  bool isShowMore = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        width: double.infinity,
        child: Card(
          color: Appcolors.appColor.withOpacity(0.1),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Description",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 12),
                Text(
                  widget.description,
                  style: TextStyle(fontSize: 16),
                  maxLines: isShowMore ? 3 : null,
                  overflow: TextOverflow.fade,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        isShowMore = !isShowMore;
                      });
                    },
                    child: Text(
                      isShowMore ? "Show more" : "Show less",
                      style: TextStyle(color: Appcolors.appColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
