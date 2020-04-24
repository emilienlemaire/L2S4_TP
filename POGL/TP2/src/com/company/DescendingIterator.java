package com.company;

public class DescendingIterator<E> implements Iterator<E> {
    protected FixedCapacityList<E> list;
    protected int nextIndex;

    protected DescendingIterator(FixedCapacityList<E> list){
        this.list = list;
        this.nextIndex = list.size - 1;
    }

    @Override
    public boolean hasNext() {
        return nextIndex >= 0;
    }

    @Override
    public E next() {
        E obj = list.get(nextIndex);
        nextIndex--;
        return obj;
    }
}
