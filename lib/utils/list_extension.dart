import 'package:collection/collection.dart' as collection;

extension ListExtension<T> on Iterable<T> {
  Iterable<T> distinct() {
    return toSet().toList();
  }

  bool isNullOrEmpty() {
    return this == null || this.isEmpty;
  }

  T firstOrDefault(bool test(T element)) {
    return this.firstWhere(test);
  }

  Map<S, Iterable<T>> groupBy<S>(S key(T element)) {
    return collection.groupBy(this, key);
  }

  double sum(double f(T element)) {
    return this.fold<double>(0.0, (previous, current) => previous + f(current));
  }

  Iterable<T> except(Iterable<T> elements) {
    var result = List<T>.from(this);
    if (elements == null || elements.isEmpty) return result;

    for (var element in elements) {
      while (result.contains(element)) {
        result.remove(element);
      }

      if (result.isEmpty) {
        break;
      }
    }
    return result;
  }

  Iterable<T> intersect(Iterable<T> elements) {
    var result = <T>[];
    if (elements == null || elements.isEmpty) return [];

    for (var element in elements) {
      if (this.contains(element)) {
        result.add(element);
      }
    }
    return result.distinct();
  }

  /// check whether `elements` are the same as current list or not, that means every element of A appears in B
  /// and every element of B appears in A
  bool isEqual(Iterable<T> elements) {
    return this.every((x) => elements.contains(x)) &&
        elements.every((x) => this.contains(x));
  }
}
