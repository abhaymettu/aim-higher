import unittest

from normalize import normalize


class NormalizeTest(unittest.TestCase):
    def test_plain(self):
        self.assertEqual(normalize("555 123 4567"), "+15551234567")

    def test_dashes(self):
        self.assertEqual(normalize("555-123-4567"), "+15551234567")

    def test_rejects_short(self):
        with self.assertRaises(ValueError):
            normalize("123-4567")


if __name__ == "__main__":
    unittest.main()
