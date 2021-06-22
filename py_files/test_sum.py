'''
               My Project For Github Actions
                        Unit Test
'''


import unittest
from .my_sum import sum1, sum2


class Testing(unittest.TestCase):
    """ high level support for doing this and that. """

    def test_sum1(self):
        """ high level support for doing this and that. """
        outcome = sum1()
        self.assertEqual(outcome, 42)

    def test_sum2(self):
        """ high level support for doing this and that. """
        outcome = sum2()
        self.assertEqual(outcome, 42)


if __name__ == "__main__":
    unittest.main()
