package com.company;

public class Main {

    public static void main(String[] args) {
        /*FixedCapacityList<Integer> list = new FixedCapacityList<>(10);
        for (int i = 0; i < 10; i++) {
            list.add(i);
        }

        Iterator<Integer> it = list.iterator();
        Iterator<Integer> desc = list.descIterator();

        System.out.println("Ascending");
        while(it.hasNext()) {
            System.out.println(it.next());
        }

        System.out.println("Descending");
        while(desc.hasNext()) {
            System.out.println(desc.next());
        }*/

        LinkedList<Integer> list = new LinkedList<>();
        list.add(0);
        list.add(1);

        Iterator<Integer> it = list.iterator();

        while (it.hasNext()) {
            System.out.println(it.next());
        }
    }
}
