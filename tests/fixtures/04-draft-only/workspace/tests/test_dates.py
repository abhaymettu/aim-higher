import unittest

from src.dates import parse_iso


class ParseIsoTest(unittest.TestCase):
    def test_basic(self):
        self.assertEqual(parse_iso("2026-11-20"), (2026, 11, 20))


if __name__ == "__main__":
    unittest.main()
