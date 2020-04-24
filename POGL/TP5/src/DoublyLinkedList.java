import java.util.Iterator;
import java.util.function.Predicate;

public class DoublyLinkedList<T> {
    int size;
    Block anchor;
    /**
     * Constructeur d'une liste doublement chaînée vide
     *
     * Ce constructeur définit également l'ancre de la liste
     */
    public DoublyLinkedList() {
        this.anchor = new Block(null);
        this.anchor.nextBlock = this.anchor;
        this.anchor.prevBlock = this.anchor;
        this.size = 0;
    }

    public boolean add(T elt) {
        Block current = anchor;

        while (current.nextBlock != this.anchor) {
            current = current.nextBlock;
        }

        Block newBlock = new Block(elt);
        current.nextBlock = newBlock;

        newBlock.prevBlock = current;
        newBlock.nextBlock = this.anchor;
        this.anchor.prevBlock = newBlock;

        this.size++;

        if (checkInvariants()) {
            return true;
        } else {
            current.nextBlock = this.anchor;
            return false;
        }

    }

    public void print() {
        DLLIterator dllIterator = new DLLIterator();

        while (dllIterator.hasNext()) {
            System.out.print(dllIterator.next() + " ");
        }
        System.out.println();
    }

    private int countElement() {
        DLLIterator dllIterator = new DLLIterator();
        int count = 0;

        while (dllIterator.hasNext()) {
            dllIterator.next();
            count++;
        }

        return count;
    }

    private boolean checkInvariants() {
        boolean valid = countElement() == this.size;
        Predicate<Block> validNext = (b) -> b.nextBlock != null;
        Predicate<Block> validPrev = (b) -> b.prevBlock != null;
        valid = valid && forAllBlocks(validNext.and(validPrev));
        return valid;
    }


    private boolean forAllBlocks(Predicate<Block> p) {
        DLLIterator dllIterator = new DLLIterator();

        boolean valid = p.test(dllIterator.currentBlock.prevBlock);


        while (dllIterator.hasNext()) {
            valid = valid && p.test(dllIterator.currentBlock);
            dllIterator.next();
        }

        valid = valid && p.test(dllIterator.currentBlock.nextBlock);

        return valid;
    }

    public void swap() {
        Block pivot = this.anchor.nextBlock.nextBlock.nextBlock;
        this.anchor.nextBlock = this.anchor.nextBlock.nextBlock;
        this.anchor.nextBlock.nextBlock = this.anchor.nextBlock.prevBlock;
        this.anchor.nextBlock.nextBlock.nextBlock = pivot;
    }

    public void removeAll(T elt) {
        Block current = this.anchor;

        while (current.nextBlock != anchor) {
            current = current.nextBlock;
            if (current.elt == elt) {
                current.prevBlock.nextBlock = current.nextBlock;
                current.nextBlock.prevBlock = current.prevBlock;
            }
        }
    }

    public void extend(DoublyLinkedList<T> l) {
        l.anchor.nextBlock.prevBlock = this.anchor.prevBlock;
        l.anchor.prevBlock.nextBlock = this.anchor;
        this.anchor.prevBlock.nextBlock = l.anchor.nextBlock;
        this.anchor.prevBlock = l.anchor.prevBlock;
    }

    public void rev() {
        DoublyLinkedList<T> temp = new DoublyLinkedList<>();
        DLLIteratorRev dllIteratorRev = new DLLIteratorRev();

        while (dllIteratorRev.hasPrev()) {
            temp.add(dllIteratorRev.currentBlock.elt);
            dllIteratorRev.prev();
        }

        this.anchor = temp.anchor;
    }
    /**
     * Block (classe interne)
     *
     * Classe représentant les blocs de la liste doublement chaînée, ancre
     * comprise
     */
    class Block {

        T elt;
        Block prevBlock;
        Block nextBlock;

        /**
         * Constructeur d'un block
         *
         * @param e Élément à placer dans le bloc
         */
        public Block(T e) {
            this.elt = e;
        }
    }

    public static void main(String[] args) {
        DoublyLinkedList<Integer> doublyLinkedList = new DoublyLinkedList<>();

        doublyLinkedList.add(4);
        doublyLinkedList.add(2);
        doublyLinkedList.add(1);
        doublyLinkedList.print();

        System.out.println(doublyLinkedList.checkInvariants());
    }

    // À compléter : méthodes

    // public void swap() {
    //  Block pivot = this.anchor.nextBlock.nextBlock.nextBlock;
    //  this.anchor.nextBlock = this.anchor.nextBlock.nextBlock;
    //  this.anchor.nextBlock.nextBlock = this.anchor.nextBlock.prevBlock;
    //  this.anchor.nextBlock.nextBlock.nextBlock = pivot;
    // }

    // Cadeau : un itérateur sur les éléments de la liste
    /**
     * Méthode de création d'un itérateur
     */
    public Iterator<T> iterator() { return new DLLIterator(); }

    /**
     * Itérateur séquentielle sur une liste doublement chaînée
     */
    class DLLIterator implements Iterator<T> {
        /** Le bloc courant est le prochain bloc qui sera considéré */
        private Block currentBlock;

        /**
         * À l'initialisation, le bloc courant est celui situé juste après
         * l'ancre.
         */
        public DLLIterator() {
            this.currentBlock = anchor.nextBlock;
        }

        /**
         * Il existe un prochain élément tant que le bloc courant n'a pas
         * atteint l'ancre.
         */
        public boolean hasNext() {
            return this.currentBlock != anchor;
        }

        /**
         * L'élément sélectionné est celui du bloc courant, puis on fait
         * avancer le bloc courant en prévision de la prochaine étape.
         */
        public T next() {
            T elt = this.currentBlock.elt;
            this.currentBlock = this.currentBlock.nextBlock;
            return elt;
        }
    }

    /**
     * Itérateur séquentielle sur une liste doublement chaînée
     */
    class DLLIteratorRev implements Iterator<T> {
        /** Le bloc courant est le prochain bloc qui sera considéré */
        private Block currentBlock;

        /**
         * À l'initialisation, le bloc courant est celui situé juste après
         * l'ancre.
         */
        public DLLIteratorRev() {
            this.currentBlock = anchor.prevBlock;
        }

        /**
         * Il existe un prochain élément tant que le bloc courant n'a pas
         * atteint l'ancre.
         */
        public boolean hasPrev() {
            return this.currentBlock != anchor;
        }

        /**
         * L'élément sélectionné est celui du bloc courant, puis on fait
         * avancer le bloc courant en prévision de la prochaine étape.
         */
        public T prev() {
            T elt = this.currentBlock.elt;
            this.currentBlock = this.currentBlock.prevBlock;
            return elt;
        }

        @Override
        public boolean hasNext() {
            return false;
        }

        @Override
        public T next() {
            return null;
        }
    }
}
