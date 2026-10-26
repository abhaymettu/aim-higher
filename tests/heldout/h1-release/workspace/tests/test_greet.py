import unittest
from greet import greet

class T(unittest.TestCase):
    def test_greet(self):
        self.assertEqual(greet("a"), "hello a")

if __name__ == "__main__":
    unittest.main()
