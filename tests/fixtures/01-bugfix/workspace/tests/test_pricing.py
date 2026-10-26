import unittest

from pricing import order_total


class OrderTotalTest(unittest.TestCase):
    def test_small_order_full_price(self):
        self.assertEqual(order_total(500, 3), 1500)

    def test_large_order_discounted(self):
        self.assertEqual(order_total(500, 20), 9000)


if __name__ == "__main__":
    unittest.main()
