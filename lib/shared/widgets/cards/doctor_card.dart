import 'package:flutter/material.dart';
import 'package:models/models.dart';

class DoctorCard extends StatefulWidget {
  const DoctorCard({super.key, required this.doctor, this.showAbout = true, this.showMoreInformation = true});
  final Doctor doctor;
  final bool showAbout;
  final bool showMoreInformation;

  @override
  State<DoctorCard> createState() => _DoctorCardState();
}

class _DoctorCardState extends State<DoctorCard> {
  bool showAll = false;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Card(
      color: Colors.transparent,
      elevation: 0.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 48,
                backgroundColor: colorScheme.background,
                backgroundImage: NetworkImage(widget.doctor.profileImageUrl),
              ),
              const SizedBox(width: 16,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.doctor.name,
                      style: textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4.0,),
                    Text(
                      widget.doctor.category.name,
                      style: textTheme.bodyMedium!.copyWith(color: colorScheme.background.withOpacity(.5)),
                    ),
                    const SizedBox(height: 8.0,),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: colorScheme.secondary,
                          size: 16,
                        ),
                        const SizedBox(width: 8.0,),
                        Text(
                          'New York, USA',
                          style: textTheme.bodySmall!.copyWith(color: colorScheme.onBackground.withOpacity(.5)),
                        ),
                      ],
                    ),
                    Divider(height: 32.0, color: colorScheme.surfaceVariant,),
                    //About
                    


                    
                    //More Information
                  ],
                ),
              )
            ],
          ),
          ...widget.showAbout
            ?
              [
                Text(
                    'About',
                    style: textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0,),
                  Text(
                    widget.doctor.bio,
                    maxLines: showAll ? null : 3,
                    style: textTheme.bodyMedium!.copyWith(color: colorScheme.onBackground.withOpacity(.5)),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    alignment: Alignment.centerLeft,
                  ),
                  onPressed: () {
                    setState(() {
                      showAll = !showAll;
                    });
                  },
                  child: Text(
                    showAll? 'Show Less' : 'Show All',
                    style: textTheme.bodyMedium!.copyWith(
                      color: colorScheme.secondary,
                      decoration: TextDecoration.underline,
                      decorationColor: colorScheme.secondary
                    ),
                  ),
                ),
                const SizedBox(height: 16.0,),
                  
              ]
            : [
                
              ],
        ],
      ),
    );
  }
}