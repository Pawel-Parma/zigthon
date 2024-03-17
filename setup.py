from setuptools import setup, Extension
from builder import ZigBuilder

simple = Extension("zigthon", sources=["src/main.zig"])

setup(
    name="zigthon",
    version="0.0.1",
    description="Zig and Python",
    ext_modules=[simple],
    cmdclass={"build_ext": ZigBuilder},
)
