import os

from setuptools.command.build_ext import build_ext


class ZigBuilder(build_ext):
    def build_extension(self, ext):
        assert len(ext.sources) == 1, "Only one source file is supported"

        os.makedirs(self.build_lib, exist_ok=True)

        mode = "Debug" if self.debug else "ReleaseFast"
        self.spawn(
            [
                "zig",
                "build-lib",
                "-O",
                mode,
                "-lc",
                f"-femit-bin={self.get_ext_fullpath(ext.name)}",
                "-fallow-shlib-undefined",
                "-dynamic",
                *[f"-I{d}" for d in self.include_dirs],
                ext.sources[0],
            ]
        )
