.PHONY: dist test

test:
	@python -m unittest

dist:
	@python setup.py sdist bdist_wheel

# Usage: make testpypi version=0.2.0
testpypi: dist/libiap-$(version).tar.gz
	@twine upload --repository testpypi --sign dist/libiap-$(version)*

pypi: dist/libiap-$(version).tar.gz
	@twine upload --sign dist/libiap-$(version)*
