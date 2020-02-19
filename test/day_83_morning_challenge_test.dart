import 'package:test/test.dart';
import '../bin/main.dart';
void main() {
  test('1', () {
    var list1=LinkedList();
    list1.createLinkedList([3,7,8,10]);
    list1.printLinkedList();
    var list2=LinkedList();
    list2.createLinkedList([99,2,1,8,10]);
    expect(findIntersectingNode(list1,list2),8);
  });
  test('2', () {
    var list1=LinkedList();
    list1.createLinkedList([3,7,8,10]);
    list1.printLinkedList();
    var list2=LinkedList();
    list2.createLinkedList([2,1,8,10]);
    expect(findIntersectingNode(list1,list2),8);
  });
  test('3', () {
    var list1=LinkedList();
    list1.createLinkedList([3,7,8,10]);
    list1.printLinkedList();
    var list2=LinkedList();
    list2.createLinkedList([2,1,9,10]);
    expect(findIntersectingNode(list1,list2),10);
  });
  test('4', () {
    var list1=LinkedList();
    list1.createLinkedList([3,7,8,10]);
    list1.printLinkedList();
    var list2=LinkedList();
    list2.createLinkedList([2,1,9,12]);
    expect(findIntersectingNode(list1,list2),null);
  });
}
