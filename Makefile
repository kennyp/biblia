setup:
	npm install

test:
	mocha -R list -r should -u bdd --compilers coffee:coffee-script test/*.test.coffee

publish: test
	git push github master
	npm prune
	npm publish

link:
	sudo npm link

.PHONY: setup test publish link
