import subprocess

failed = subprocess.call(["pip", "install", "-e", "."])
assert not failed

import zigthon as z

a = int(input("enter a: "))
b = int(input("enter b: "))

print("sum: ", z.sum(a, b))
print("multiple: ", z.mul(a, b))
z.hello()
z.printSt(input("enter something: "))
print(z.returnArrayWithInput(z.sum(a, z.mul(b, b))))
