import unittest

from calc import aec_divide

class TestSubtract(unittest.TestCase):

    def test_divide(self):
        arg_ints = [20,5]
        sub_result = aec_divide(arg_ints)
        self.assertEqual(sub_result, 4)
    
    def test_cant_divide_by_zero(self):
        arg_ints = [20, 0]
        sub_result = aec_divide(arg_ints)
        self.assertEqual(sub_result, 0)

    def test_divide_three_inputs(self):
        arg_ints = [20, 4, 5]
        with self.assertRaisesRegex(Exception, "More than two arguments") as context:
            aec_divide(arg_ints)


if __name__ == "__main__":
    unittest.main()