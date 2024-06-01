import 'package:bloc/bloc.dart';
import 'package:doctor_booking/repositories/doctor_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:models/models.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final DoctorRepository _doctorRepository;

  HomeBloc({
    required DoctorRepository doctorRepository,
  })  : _doctorRepository = doctorRepository,
        super(const HomeState()) {
    on<LoadHomeEvent>(_onLoadHome);
  }

  Future<void> _onLoadHome(LoadHomeEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(status: HomeStatus.loading));

    try {
      final doctorCategories = await _doctorRepository.fetchDoctorCategories();
      final nearbyDoctors = await _doctorRepository.fetchDoctor();

      emit(state.copyWith(
        status: HomeStatus.loaded,
        doctorCategories: doctorCategories,
        nearbyDoctors: nearbyDoctors,
      ));
    } catch (e) {
      emit(state.copyWith(status: HomeStatus.error));
    }
  }
}
