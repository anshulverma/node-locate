path = require 'path'

locate = require './main'

exec = (name, options, callback) ->
  try
    locate name, options, callback
  catch err
    callback err

module?.exports?.exec = exec
