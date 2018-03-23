type Link<T> = Option<Box<Node<T>>>;

pub struct SimpleLinkedList<T> {
    head: Link<T>,
}

struct Node<T> {
    data: T,
    next: Link<T>,
}

impl<T> Node<T> {
    pub fn link(data: T, next: Link<T>) -> Link<T> {
        Some(Box::new(Node { data, next }))
    }
}

impl<T> SimpleLinkedList<T> {
    pub fn new() -> Self {
        Self { head: None }
    }

    pub fn len(&self) -> usize {
        let mut n = 0;
        let mut current = &self.head;

        while let &Some(ref node) = current {
            n += 1;
            current = &node.next;
        }
        n
    }

    pub fn push(&mut self, data: T) {
        self.head = Node::link(data, self.head.take());
    }

    pub fn pop(&mut self) -> Option<T> {
        self.head.take().map(|mut node| {
            self.head = node.next.take();
            node.data
        })
    }

    pub fn peek(&self) -> Option<&T> {
        self.head.as_ref().map(|node| &node.data)
    }
}

impl<T: Clone> SimpleLinkedList<T> {
    pub fn rev(&mut self) -> SimpleLinkedList<T> {
        let mut list = SimpleLinkedList::new();
        while let Some(x) = self.pop() {
            list.push(x);
        }
        list
    }
}

impl<'a, T: Clone> From<&'a [T]> for SimpleLinkedList<T> {
    fn from(slice: &[T]) -> Self {
        let mut list = SimpleLinkedList::new();
        for x in slice {
            list.push(x.clone());
        }
        list
    }
}

impl<T> Into<Vec<T>> for SimpleLinkedList<T> {
    fn into(mut self) -> Vec<T> {
        let mut v = Vec::new();
        while let Some(x) = self.pop() {
            v.push(x);
        }
        v.reverse();
        v
    }
}
