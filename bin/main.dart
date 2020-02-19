//  Given two singly linked lists that intersect at some point, find the intersecting node.
//  The lists are non-cyclical.
//
//  For example, given A = 3 -> 7 -> 8 -> 10 and B = 99 -> 1 -> 8 -> 10, return
//  the node with value 8.
//
//  In this example, assume nodes with the same value are the exact same
//  node objects.

class Node{
  int val;
  Node next;
  Node(this.val);
}
class LinkedList{
 void createLinkedList(elements){
    int i;
    for(i=0;i<elements.length;i++){
      addNode(elements[i]);
    }
  }
  Node head;
void   addNode(val) {
    var node = Node(val);// create new node
    var currentNode = head;
    if (head == null) { //if head is null its the first node
      head = node;
    } else {
      currentNode = head;
      while (currentNode.next != null) {  //else browse till the next node is null and add the node
        currentNode = currentNode.next;
      }
      currentNode.next = node; // attach node
    }
  }
  int findSize(){
    var currentNode = head;
    var size=0;
    while (currentNode != null) {
      size=size+1;
      currentNode = currentNode.next;
    }
    return size;
  }
 void printLinkedList(){
    var currentNode = head;
    var list='';
    while (currentNode != null) {
      list=list+'${currentNode.val}'+'-->>';
      currentNode = currentNode.next;
    }
    print(list);
  }
}


int findIntersectingNode(LinkedList list1, LinkedList list2){ //for lists of unequal length O(m+n) complexity
  var currentNode1=list1.head;
  var currentNode2=list2.head;
  var size1=list1.findSize();
  var size2=list2.findSize();
  var difference=(size1-size2).abs();
 if(size1>size2){
   while(difference>0){
     currentNode1=currentNode1.next;
     difference=difference-1;
   }
 }
 else if(size1<size2){
   while(difference>0){
     currentNode2=currentNode2.next;
     difference=difference-1;
   }
 }
 while(currentNode2!=null){
     if(currentNode1.val==currentNode2.val) {
       return currentNode1.val;
     }
     else{
       currentNode2=currentNode2.next;
       currentNode1=currentNode1.next;
     }
   }
   return null;
}
void main(){
  var list1=LinkedList();
  list1.createLinkedList([3,7,8,10]);
  list1.printLinkedList();
  var list2=LinkedList();
  list2.createLinkedList([99,2,1,8,10]);
  list2.printLinkedList();
  var intersectingNode=findIntersectingNode(list1,list2);
  if(intersectingNode==null){
    print('No interseting node');
  }
  else {
    print('Intersecting Node is ='+intersectingNode.toString());
  }
}

//
//int findIntersectingNode(LinkedList list1, LinkedList list2){
// var currentNode1=list1.head;
// while(currentNode1.next!=null){
//   var currentNode2=list2.head;
//   while(currentNode2!=null){
//     if(currentNode1.val==currentNode2.val) {
//       return currentNode1.val;
//     }
//     else{
//       currentNode2=currentNode2.next;
//     }
//   }
//  currentNode1=currentNode1.next;
// }
// return null;
//}
//int findIntersectingNode2(LinkedList list1, LinkedList list2){ // O(m+n) complexity  using hash table
//  Map m={};
//  var keyFound=false;
//  var currentNode1=list1.head;
//  while(currentNode1.next!=null){
//    m[currentNode1.val]=1;
//    currentNode1=currentNode1.next;
//  }
//  m[currentNode1.val]=1;
//  print(m);
//  var currentNode2=list2.head;
//  while(currentNode2.next!=null){
//    for (var k in m.keys) {
//      if(k==currentNode2.val){
//        m[k]=2;
//        keyFound=true;
//      }
//    }
//    if(!keyFound){
//      m[currentNode2.val]=1;
//    }
//    currentNode2=currentNode2.next;
//  }
//  keyFound=false;
//  for (var k in m.keys) {
//    if(k==currentNode2.val){
//      m[k]=2;
//      keyFound=true;
//    }
//  }
//  if(!keyFound){
//    m[currentNode2.val]=1;
//  }
//  print(m);
//  var answer;
//  for (var k in m.values) {
//    if(k==2){
//
//    }
//  }
//  return answer;
//}
//int findIntersectingNode3(LinkedList list1, LinkedList list2){ //for lists of equal length O(m+n) complexity
//  var currentNode1=list1.head;
//  var currentNode2=list2.head;
//    while(currentNode2!=null){
//      if(currentNode1.val==currentNode2.val) {
//        return currentNode1.val;
//      }
//      else{
//        currentNode2=currentNode2.next;
//        currentNode1=currentNode1.next;
//      }
//    }
//    return null;
//}