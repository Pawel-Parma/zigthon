import subprocess

failed = subprocess.call(["pip", "install", "-e", "."])
assert not failed

import simple

a = input("enter a: ")
b = input("enter b: ")
print("sum: ", simple.sum(int(a), int(b)))
print("multiple: ", simple.mul(int(a), int(b)))
print("type sum: ", type(simple.sum(int(a), int(b))))
simple.hello()
simple.printSt(input("enter something: "))
print(simple.returnArrayWithInput(100))
