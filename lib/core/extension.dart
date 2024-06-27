// ignore_for_file: prefer_const_constructors



extension SortedBy<E> on List<E> {
  List<E> sortedBy(Comparable Function(E e) key) =>
      toList()..sort((a, b) => key(a).compareTo(key(b)));

  List<E> sortedDescBy(Comparable Function(E e) key) =>
      toList()..sort((b, a) => key(a).compareTo(key(b)));
}

extension StringCasingExtension on String {
  String toCapitalized() => length > 0 ?'${this[0].toUpperCase()}${substring(1).toLowerCase()}':'';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.toCapitalized()).join(' ');
}