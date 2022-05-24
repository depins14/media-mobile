import 'package:bloc/bloc.dart';

class OptionCubit extends Cubit<List<String>> {
  OptionCubit() : super([]);

  void selectOption(String id) {
    if (!isSelected(id)) {
      state.add(id);
    } else {
      state.remove(id);
    }
    print(state);
    emit(List.from(state));
  }

  bool isSelected(String id) {
    int index = state.indexOf(id);
    if (index == -1) {
      return false;
    } else {
      return true;
    }
  }
}
