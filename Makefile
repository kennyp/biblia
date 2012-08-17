setup:
	@npm install

build:
	@find . -name '*.coffee' | xargs -n1 -P2 coffee -c

test:
	@mocha -t 5000 -R list -r should -u bdd --compilers coffee:coffee-script test/*.test.coffee

publish: test build
	@git push
	@npm prune
	@npm publish

link:
	@sudo npm link

.PHONY: setup test publish link
