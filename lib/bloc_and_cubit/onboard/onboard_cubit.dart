import 'package:bloc/bloc.dart';

class OnboardCubit extends Cubit<int> {
  OnboardCubit() : super(0);

  void nextPage() {
    if(state == 2) return;
    emit(state + 1);
  }

  void previousPage() {
    if(state == 0) return;
    emit(state-1);
  }
}