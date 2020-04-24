package com.company;

public class AscendingIterator<E> implements Iterator<E> {
    protected FixedCapacityList<E> list;
    protected int nextIndex = 0;

    protected AscendingIterator(FixedCapacityList<E> list){
        this.list = list;
    }

    @Override
    public boolean hasNext() {
        return nextIndex < list.size;
    }

    @Override
    public E next() {
        E obj = list.get(nextIndex);
        nextIndex++;
        return obj;
    }
}
