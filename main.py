import time

import subprocess
failed = subprocess.call(["pip", "install", "-e", "."])
assert not failed
import zigthon as z

x = 10000000
long_size = 2**64
spc = 16

print("Pure Zig:", end="")
pz_start = time.perf_counter_ns()
pz_res = z.sqr_sum(x)
pz_end = time.perf_counter_ns()
pz_time = (pz_end - pz_start) * 1e-9
print(f"\r{'Pure Zig:':<{spc}}Result: {pz_res} | {pz_time:.2f} s")

print("Pure Python:", end="")
pp_start = time.perf_counter_ns()
pp_res = 0
for i in range(x):
    pp_res += i * i

pp_res %= long_size
pp_end = time.perf_counter_ns()
pp_time = (pp_end - pp_start) * 1e-9
print(f"\r{'Pure Python:':<{spc}}Result: {pp_res} | {pp_time:.2f} s")

print("Zig and Python:", end="")
zp_start = time.perf_counter_ns()
zp_res = 0
for i in range(x):
    zp_res += z.sqr(i)

zp_res %= long_size
zp_end = time.perf_counter_ns()
zp_time = (zp_end - zp_start) * 1e-9
print(f"\r{'Zig and Python:':<{spc}}Result: {zp_res} | {zp_time:.2f} s")
