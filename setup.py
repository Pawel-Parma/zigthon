from setuptools import setup, Extension
from builder import ZigBuilder

simple = Extension("zigthon", sources=["src/main.zig"])

setup(
    name="zigthon",
    version="0.0.1",
    description="Zig plus Python experiment",
    ext_modules=[simple],
    cmdclass={"build_ext": ZigBuilder},
)
