public class Main {
    public static void main(String[] args) {
        DoublyLinkedList<Integer> list = new DoublyLinkedList<>();
        DoublyLinkedList<Integer> list2 = new DoublyLinkedList<>();
        list.add(1);
        list.add(2);
        list.print();
        list.add(3);
        list.print();
        list.removeAll(2);
        list.print();
        list2.add(4);
        list2.add(5);
        list2.add(6);
        list2.add(7);
        list2.print();
        list.extend(list2);
        list.print();
        list.rev();
        list.print();
    }
}
