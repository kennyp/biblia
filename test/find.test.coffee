should = require 'should'
biblia = require '..'
apiInfo = require '../key'

describe 'Biblia', ->
    before ->
        @client = biblia(apiInfo.key)

    describe 'when getting a list of bibles', ->

        it 'should include kjv', (done) ->
            @client.find (bibles) ->
                (b.bible for b in bibles).should.includeEql('kjv')
                done()

    describe 'when looking up John 3:16', ->

        it 'when using kjv', (done) ->
            @client.lookup 'kjv', 'John 3:16', (verse) ->
                verse.should.eql 'For God so loved the world, that he gave his only begotten Son, that whosoever believeth in him should not perish, but have everlasting life.'
                done()
