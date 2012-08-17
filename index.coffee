request = require 'superagent'


BASE_URL="http://api.biblia.com/v1/bible"


Biblia = (apiKey) ->
    @apiKey = apiKey

Biblia::find = (callback) ->
    request
        .get("#{BASE_URL}/find")
        .send(key: @apiKey)
        .end (err, res) ->
            callback(JSON.parse(res.text).bibles)

Biblia::lookup = (version, reference, callback) ->
    request
        .get("#{BASE_URL}/content/#{version}.js")
        .send(key: @apiKey)
        .send(passage: reference.replace(':', '.'))
        .end (err, res) ->
            callback(JSON.parse(res.text).text)

module.exports = (apiKey) ->
    new Biblia(apiKey)
