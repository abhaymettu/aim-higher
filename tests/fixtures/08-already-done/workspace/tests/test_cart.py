import unittest

from cart import Cart


class CartTest(unittest.TestCase):
    def test_add(self):
        c = Cart()
        c.add_item("A", 2)
        self.assertEqual(c.items, {"A": 2})

    def test_rejects_non_positive(self):
        c = Cart()
        for bad in (0, -1):
            with self.assertRaises(ValueError):
                c.add_item("A", bad)


if __name__ == "__main__":
    unittest.main()
