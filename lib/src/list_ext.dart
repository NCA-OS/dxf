import 'dart:collection';

class ListExt<E> extends ListBase<E?> {
  List innerList = [];

  @override
  int get length => innerList.length;

  @override
  set length(int length) {
    innerList.length = length;
  }

  @override
  void operator []=(int index, E? value) {
    innerList[index] = value;
  }

  @override
  E? operator [](int index) => innerList[index];

  @override
  void add(E? value) {
    innerList.add(value);
  }

  @override
  void addAll(Iterable<E?> all) {
    innerList.addAll(all);
  }
}
