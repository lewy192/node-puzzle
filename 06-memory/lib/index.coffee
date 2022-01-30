fs = require 'fs'
readline = require 'readline'


exports.countryIpCounter = (countryCode, cb) ->
  return cb() unless countryCode
  counter = 0
    # create read stream
  fileStream = fs.createReadStream "#{__dirname}/../data/geo.txt"
  fileStreamInterface = readline.createInterface { input: fileStream }
  fileStreamInterface.on 'line', (line) -> 
  # destructures the array created by splitting the line string
    [start,end,_,ISOcode] = line.split '\t'
    if ISOcode == countryCode then counter+= +end - +start 
  fileStream.on 'end', () ->  cb null, counter


#Acknowledgements: 
# https://stackabuse.com/reading-a-file-line-by-line-in-node-js/