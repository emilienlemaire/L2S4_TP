package com.company;

public class LinkedList<E> implements List<E>, Iterable<E> {
    protected Block<E> firstBlock = null;
    protected Block<E> lastBlock = null;


    @Override
    public E get(int i) {
        Block<E> block = firstBlock;
        for (int j = 0; j < i; j++) {
            block = block.nextBlock;
        }

        return block.contents;
    }

    @Override
    public void add(E elt) {
        if(firstBlock == null){
            firstBlock = new Block<>(elt);
            lastBlock = firstBlock;
        } else {
            Block<E> newBlock = new Block<>(elt);
            lastBlock.nextBlock = newBlock;
            lastBlock = newBlock;
        }

    }

    @Override
    public Iterator<E> iterator() {
        return new LinkedListIterator<>(this);
    }
}
