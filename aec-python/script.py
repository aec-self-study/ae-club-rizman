x = 2
y = 'hello'
z = x**2 + 5*x
print(x+3)
print(y)
print(z)

my_first_list = ['apple', 1, 'banana', 2]
my_fruit_list = ['apple','banana']
my_int_list = [1,2,3]

calorie_lookup = {'apple' : 95, 'banana' : 105, 'orange' : 45}
print (calorie_lookup)

for f in my_fruit_list:
    print(f)

def sq_int(x):
    y = x**2
    return y

def is_even(x):
    if x % 2 == 0:
        return True
    
def is_odd(x):
    if x % 2 != 0:
        return True


def describe_evenness(x):
    if is_even(x):
        print("It's even!")
    elif is_odd(x):
        print("It's odd!")
    else:
        print("It's neither!")

for list in calorie_lookup:
    print(list)

x = 1
while x <= 10:
    print(x**2)
    x+=1

for cal in calorie_lookup.keys():
    print(calorie_lookup[cal])

for fn in my_first_list:
    if type(fn) == int:
        print(fn**2)
    else:
        print(calorie_lookup[fn])

def testfn(x):
    for a in x.keys():
        print(x[a]**2)

testfn(calorie_lookup)