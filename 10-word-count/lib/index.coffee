through2 = require 'through2'


module.exports = ->
  words = 0
  lines = 1

  transform = (chunk, encoding, cb) ->
    tokens = chunk.split(' ')
    words = tokens.length
    if chunk[0] == '"' || chunk[0] =="'" then words = 1
    return cb()

  flush = (cb) ->
    this.push {words, lines}
    this.push null
    return cb()

  return through2.obj transform, flush
