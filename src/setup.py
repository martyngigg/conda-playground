from setuptools import find_packages, setup

setup(
    name="playground",
    version="0.0.0",
    packages=find_packages(exclude=["*.test", "plugins*"])
)
