import subprocess

failed = subprocess.call(["pip", "install", "-e", "."])
assert not failed

import zigthon

a = int(input("enter a: "))
b = int(input("enter b: "))

print("sum: ", zigthon.sum(a, b))
print("multiple: ", zigthon.mul(a, b))
zigthon.hello()
zigthon.printSt(input("enter something: "))
print(zigthon.returnArrayWithInput(100))
