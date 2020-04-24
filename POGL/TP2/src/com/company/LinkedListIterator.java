package com.company;

public class LinkedListIterator<E> implements Iterator<E> {
    protected Block<E> nextBlock;

    protected LinkedListIterator(LinkedList<E> list) {
        this.nextBlock = list.firstBlock;
    }

    @Override
    public boolean hasNext() {
        return nextBlock != null;
    }

    @Override
    public E next() {
        E obj = nextBlock.contents;
        nextBlock = nextBlock.nextBlock;
        return obj;
    }
}
