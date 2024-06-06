import 'package:doctor_booking/shared/widgets/avatars/circle_avatar_with_text_label.dart';
import 'package:doctor_booking/shared/widgets/cards/appointment_preview_card.dart';
import 'package:doctor_booking/shared/widgets/list_tiles/doctor_list_tile.dart';
import 'package:doctor_booking/shared/widgets/main_nav_bars/main_nav_bar.dart';
import 'package:doctor_booking/shared/widgets/titles/section_title.dart';
import 'package:doctor_booking/state/home/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.status == HomeStatus.loading ||
              state.status == HomeStatus.initial) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.amber,
              ),
            );
          }
          if (state.status == HomeStatus.loaded) {
            return const SingleChildScrollView(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  _DoctorCategories(),
                  SizedBox(
                    height: 16.0,
                  ),
                  _MySchedule(),
                  SizedBox(
                    height: 16.0,
                  ),
                  _NearbyDoctors()
                ],
              ),
            );
          } else {
            return const Center(
              child: Text('Error loading data'),
            );
          }
        },
      ),
      bottomNavigationBar: const MainNavBar(),
    );
  }
}

class _MySchedule extends StatelessWidget {
  const _MySchedule();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Column(
          children: [
            SectionTitle(
              title: 'My Schedule',
              action: 'See all',
              onPressed: () {},
            ),
            AppointmentPreviewCard(
                appointment: state.myAppointments.firstOrNull)
          ],
        );
      },
    );
  }
}

class _NearbyDoctors extends StatelessWidget {
  const _NearbyDoctors();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Column(
          children: [
            SectionTitle(
              title: 'Nearby Doctors',
              action: 'See all',
              onPressed: () {},
            ),
            const SizedBox(
              height: 8.0,
            ),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return Divider(
                  height: 24.0,
                  color: colorScheme.surfaceVariant,
                );
              },
              itemCount: state.nearbyDoctors.length,
              itemBuilder: (context, index) {
                final doctor = state.nearbyDoctors[index];
                return DoctorListTile(doctor: doctor);
              },
            )
          ],
        );
      },
    );
  }
}

class _DoctorCategories extends StatelessWidget {
  const _DoctorCategories();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Column(
          children: [
            // section title
            SectionTitle(
              title: 'Categories',
              action: 'See all',
              onPressed: () {},
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: state.doctorCategories
                    .take(5)
                    .map((category) => Expanded(
                          child: CircleAvatarWithTextLabel(
                              icon: category.icon, label: category.name),
                        ))
                    .toList())
          ],
        );
      },
    );
  }
}
