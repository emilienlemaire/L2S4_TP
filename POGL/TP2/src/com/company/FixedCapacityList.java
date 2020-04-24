package com.company;

public class FixedCapacityList<E> implements List<E>, Iterable<E> {
    protected Object[] objects;
    protected int size;
    protected int nextIndex = 0;

    public FixedCapacityList(int capacity) {
        this.objects = new Object[capacity];
        this.size = capacity;
    }

    @Override
    @SuppressWarnings("unchecked")
    public E get(int i) {
        return (E) objects[i];
    }

    @Override
    public void add(E elt) {
        if (nextIndex < size) {
            objects[nextIndex] = elt;
            nextIndex++;
        } else {
            System.out.println("The list is already at full capacity");
        }
    }

    @Override
    public Iterator<E> iterator() {
        return new AscendingIterator<>(this);
    }

    public Iterator<E> descIterator() {
        return new DescendingIterator<>(this);
    }
}
