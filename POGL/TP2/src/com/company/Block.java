package com.company;

public class Block<T> {
    protected T contents;
    protected Block<T> nextBlock = null;

    protected Block(T contents) {
        this.contents = contents;
    }
}
