from setuptools import setup
import versioningit

setup(
  version = versioningit.get_version()
)

print(versioningit.get_version())
