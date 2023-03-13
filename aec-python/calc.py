# calc.py

import argparse

parser = argparse.ArgumentParser(description = "CLI calculator")

subparsers = parser.add_subparsers(help = "sub-command help", dest = "command")

add = subparsers.add_parser("add", help = "add integers")
add.add_argument("ints_to_sum", nargs='*', type=int)

subtract = subparsers.add_parser("subtract", help = "subtract int 1 from int 2")
subtract.add_argument("ints_to_sub", nargs=2, type=int)

subtract = subparsers.add_parser("multiply", help = "take product of 2 integers")
subtract.add_argument("ints_to_multiply", nargs=2, type=int)

subtract = subparsers.add_parser("divide", help = "divide 2 integers")
subtract.add_argument("ints_to_divide", nargs=2, type=int)

args = parser.parse_args()

if args.command == "add":
    our_sum = sum(args.ints_to_sum)
    print(f"the sum of values is: {our_sum}")
elif args.command == "subtract":
    sub_from = args.ints_to_sub[0]
    sub_sub = args.ints_to_sub[1]
    our_subtract = sub_from - sub_sub
    print(f"the difference of {sub_from} minus {sub_sub} is: {our_subtract}")
elif args.command == "multiply":
    product = (args.ints_to_multiply[0]) * (args.ints_to_multiply[1])
    print(f"the product of values is: {product}")
elif args.command == "divide":
    div_from = args.ints_to_divide[0]
    divide = args.ints_to_divide[1]
    if divide == 0:
        print("Cannot divide by 0")
    else: 
        division = div_from / divide
        print(f"{div_from} divided by {divide} is {division}")