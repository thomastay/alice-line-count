#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from setuptools import setup, Distribution

class BinDist(Distribution):
    def has_ext_modules(foo):
        return True


setup(
    name="alicelc",
    packages=["alicelc"],
    package_data={
        "alicelc": ["aliceLC.so"],
    },
    distclass=BinDist
)
