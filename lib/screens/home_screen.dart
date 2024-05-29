import 'package:doctor_booking/shared/widgets/avatars/circle_avatar_with_text_label.dart';
import 'package:doctor_booking/shared/widgets/cards/appointment_preview_card.dart';
import 'package:doctor_booking/shared/widgets/titles/section_title.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:models/models.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // create a bloc and provide it to the HomeView
    return const HomeView();
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // Create HomeView UI
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome',
              style: textTheme.bodyMedium,
            ),
            const SizedBox(
              height: 4.0,
            ),
            Text('Massimo D',
                style:
                    textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 4.0,
            ),
            Row(
              children: [
                Icon(Icons.location_on, color: colorScheme.secondary),
                const SizedBox(
                  width: 4.0,
                ),
                Text('Dubai, UAE',
                    style: textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.secondary)),
                const SizedBox(
                  width: 4.0,
                ),
                Icon(Icons.expand_more, color: colorScheme.secondary),
              ],
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined),
          ),
          const SizedBox(
            width: 4.0,
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(64.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                  // border: OutlineInputBorder(),
                  hintText: 'Search doctor',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: Container(
                      margin: const EdgeInsets.all(4.0),
                      padding: const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                          color: colorScheme.onSurfaceVariant,
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Icon(
                        Icons.filter_alt_outlined,
                        color: colorScheme.surfaceVariant,
                      ))),
            ),
          ),
        ),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            _DoctorCategories(),
             SizedBox(height: 16.0,),
            _MySchedule()
          ],
        ),
      ),
    );
  }
}

class _MySchedule extends StatelessWidget {
  const _MySchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          title: 'My Schedule',
          action: 'See all',
          onPressed: (){},
        ),
        const AppointmentPreviewCard()
      ],
    );
  }
}



class _DoctorCategories extends StatelessWidget {
  const _DoctorCategories();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // section title
        SectionTitle(
          title: 'Categories',
          action: 'See all',
          onPressed: (){},
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
            children: DoctorCategory.values
              .take(5)
              .map(
                (category) => Expanded(
                  child: CircleAvatarWithTextLabel(
                    icon: category.icon,
                    label: category.name
                  ),
                )
              ).toList()
        )
      ],
    );
  }
}
