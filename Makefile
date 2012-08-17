setup:
	@npm install

test:
	@mocha -t 5000 -R list -r should -u bdd --compilers coffee:coffee-script test/*.test.coffee

build:
	@find . -name '*.coffee' | xargs -n1 -P3 coffee -c

publish: test build
	@git push
	@npm prune
	@npm publish

link:
	@sudo npm link

.PHONY: setup test publish link
