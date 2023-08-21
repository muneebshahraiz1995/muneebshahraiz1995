import 'package:bloc/bloc.dart';
import 'package:flutter_cubit/data/model/request/post_request.dart';
import 'package:flutter_cubit/data/model/response/post_response.dart';
import 'package:flutter_cubit/data/repository/home_page_repository.dart';
import 'package:meta/meta.dart';


part 'homepage_event.dart';
part 'homepage_state.dart';

class HomepageBloc extends Bloc<HomepageEvent, HomepageState> {
  late PostResponse data;
  final HomePageRepo homePageRepo;

  HomepageBloc(this.homePageRepo) : super(HomepageInitial()) {
    on<HomepageEvent>((event, emit) async {
      if (event is SendData) {
        emit(HomepageLoading());
        await Future.delayed(const Duration(seconds: 3), () async {
          data = await homePageRepo.fetchDetails(event.title,event.userId);
          emit(HomepageLoaded(data));
        });
      }
    });
  }
}
