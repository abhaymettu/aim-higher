import unittest

from report import summary


class ReportTest(unittest.TestCase):
    def test_summary(self):
        self.assertEqual(summary([1, 2, 3]), "total=6")


if __name__ == "__main__":
    unittest.main()
