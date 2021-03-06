import ceylon.collection { ... }
import ceylon.test { ... }

void testList(){
    MutableList<String> l = LinkedList<String>();
    assertEquals("[]", l.string);
    assertEquals(0, l.size);
    assertTrue(!l.contains("fu"));
    
    l.add("fu");
    assertEquals("[fu]", l.string);
    assertEquals(1, l.size);
    assertEquals("fu", l[0]);
    assertTrue(l.contains("fu"));

    l.add("bar");
    assertEquals("[fu, bar]", l.string);
    assertEquals(2, l.size);
    assertTrue(l.contains("fu"));
    assertTrue(l.contains("bar"));
    assertTrue(!l.contains("stef"));
    assertEquals("fu", l[0]);
    assertEquals("bar", l[1]);

    l.set(0, "foo");
    assertEquals("[foo, bar]", l.string);
    assertEquals(2, l.size);
    assertTrue(l.contains("foo"));
    assertTrue(l.contains("bar"));
    assertTrue(!l.contains("fu"));
    assertEquals("foo", l[0]);
    assertEquals("bar", l[1]);

    l.set(5, "empty");
    assertEquals("[foo, bar, empty, empty, empty, empty]", l.string);
    assertEquals(6, l.size);
    assertTrue(l.contains("foo"));
    assertTrue(l.contains("bar"));
    assertTrue(l.contains("empty"));
    assertTrue(!l.contains("fu"));
    assertEquals("foo", l[0]);
    assertEquals("bar", l[1]);
    assertEquals("empty", l[5]);

    l.insert(1, "stef");
    assertEquals("[foo, stef, bar, empty, empty, empty, empty]", l.string);
    assertEquals(7, l.size);
    assertTrue(l.contains("foo"));
    assertTrue(l.contains("stef"));
    assertTrue(l.contains("bar"));
    assertTrue(l.contains("empty"));
    assertTrue(!l.contains("fu"));
    assertEquals("foo", l[0]);
    assertEquals("stef", l[1]);
    assertEquals("bar", l[2]);
    assertEquals("empty", l[6]);

    l.insert(0, "first");
    assertEquals("[first, foo, stef, bar, empty, empty, empty, empty]", l.string);
    assertEquals(8, l.size);
    assertTrue(l.contains("first"));
    assertTrue(l.contains("foo"));
    assertTrue(l.contains("stef"));
    assertTrue(l.contains("bar"));
    assertTrue(l.contains("empty"));
    assertTrue(!l.contains("fu"));
    assertEquals("first", l[0]);
    assertEquals("foo", l[1]);
    assertEquals("stef", l[2]);
    assertEquals("bar", l[3]);
    assertEquals("empty", l[7]);

    l.insert(10, "last");
    assertEquals("[first, foo, stef, bar, empty, empty, empty, empty, last, last, last]", l.string);
    assertEquals(11, l.size);
    assertTrue(l.contains("first"));
    assertTrue(l.contains("foo"));
    assertTrue(l.contains("stef"));
    assertTrue(l.contains("bar"));
    assertTrue(l.contains("empty"));
    assertTrue(l.contains("last"));
    assertTrue(!l.contains("fu"));
    assertEquals("first", l[0]);
    assertEquals("foo", l[1]);
    assertEquals("stef", l[2]);
    assertEquals("bar", l[3]);
    assertEquals("empty", l[7]);
    assertEquals("last", l[10]);
    
    l.remove(0);
    assertEquals("[foo, stef, bar, empty, empty, empty, empty, last, last, last]", l.string);
    assertEquals(10, l.size);
    assertTrue(!l.contains("first"));
    assertTrue(l.contains("foo"));
    assertTrue(l.contains("stef"));
    assertTrue(l.contains("bar"));
    assertTrue(l.contains("empty"));
    assertTrue(l.contains("last"));
    assertTrue(!l.contains("fu"));
    assertEquals("foo", l[0]);
    assertEquals("stef", l[1]);
    assertEquals("bar", l[2]);
    assertEquals("empty", l[6]);
    assertEquals("last", l[9]);

    l.remove(1);
    assertEquals("[foo, bar, empty, empty, empty, empty, last, last, last]", l.string);
    assertEquals(9, l.size);
    assertTrue(!l.contains("first"));
    assertTrue(l.contains("foo"));
    assertTrue(!l.contains("stef"));
    assertTrue(l.contains("bar"));
    assertTrue(l.contains("empty"));
    assertTrue(l.contains("last"));
    assertTrue(!l.contains("fu"));
    assertEquals("foo", l[0]);
    assertEquals("bar", l[1]);
    assertEquals("empty", l[5]);
    assertEquals("last", l[8]);

    l.remove(8);
    assertEquals(8, l.size);
    assertEquals("[foo, bar, empty, empty, empty, empty, last, last]", l.string);

    l.add("end");
    assertEquals("[foo, bar, empty, empty, empty, empty, last, last, end]", l.string);
    assertEquals(9, l.size);

    l.removeElement("empty");
    assertEquals("[foo, bar, last, last, end]", l.string);
    assertEquals(5, l.size);

    l.clear();
    assertEquals("[]", l.string);
    assertEquals(0, l.size);
    assertTrue(!l.contains("foo"));
    
    // equality tests
    assertEquals(LinkedList{"a", "b"}, LinkedList{"a", "b"});
    assertNotEquals(LinkedList{"a", "b"}, LinkedList{"b", "a"});
    assertNotEquals(LinkedList{"a", "b"}, LinkedList{"a", "b", "c"});
    assertNotEquals(LinkedList{"a", "b", "c"}, LinkedList{"a", "b"});
    assertEquals(LinkedList{}, LinkedList{});

    // rest
    assertEquals(LinkedList{"b", "c"}, LinkedList{"a", "b", "c"}.rest);

    // reversed
    assertEquals(LinkedList{"c", "b", "a"}, LinkedList{"a", "b", "c"}.reversed);

    // span
    assertEquals(LinkedList{}, LinkedList{"a", "b", "c"}.spanFrom(3));
    assertEquals(LinkedList{"c"}, LinkedList{"a", "b", "c"}.spanFrom(2));
    assertEquals(LinkedList{"b", "c"}, LinkedList{"a", "b", "c"}.spanFrom(1));
    assertEquals(LinkedList{"a"}, LinkedList{"a", "b", "c"}.spanTo(0));
    assertEquals(LinkedList{"a", "b"}, LinkedList{"a", "b", "c"}.spanTo(1));
    assertEquals(LinkedList{"a", "b", "c"}, LinkedList{"a", "b", "c"}.spanTo(20));
    assertEquals(LinkedList{"b", "c"}, LinkedList{"a", "b", "c", "d"}.span(1, 2));
    assertEquals(LinkedList{"b", "c", "d"}, LinkedList{"a", "b", "c", "d"}.span(1, 20));

    // segment
    assertEquals(LinkedList{}, LinkedList{"a", "b", "c"}.segment(0, 0));
    assertEquals(LinkedList{"a", "b"}, LinkedList{"a", "b", "c"}.segment(0, 2));
    assertEquals(LinkedList{"b", "c"}, LinkedList{"a", "b", "c"}.segment(1, 20));
}

void testListConstructor(){
    List<String> list = LinkedList{"a", "b"};
    assertEquals(2, list.size);
    assertEquals("a", list[0]);
    assertEquals("b", list[1]);
}