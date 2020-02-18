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


Node findIntersectingNode(LinkedList list1, LinkedList list2){
 var currentNode1=list1.head;
 while(currentNode1.next!=null){
   var currentNode2=list2.head;
   while(currentNode2!=null){
     if(currentNode1.val==currentNode2.val) {
       return currentNode1;
     }
     else{
       currentNode2=currentNode2.next;
     }
   }
  currentNode1=currentNode1.next;
 }
 return null;
}

void main(){
  var list1=LinkedList();
  list1.createLinkedList([3,7,8,10]);
  list1.printLinkedList();
  var list2=LinkedList();
  list2.createLinkedList([99,1,8,10]);
  list2.printLinkedList();
  var intersectingNode=findIntersectingNode(list1,list2);
  if(intersectingNode==null){
    print('No interseting node');
  }
  else {
    print('Intersecting Node is ='+intersectingNode.val.toString());
  }
}