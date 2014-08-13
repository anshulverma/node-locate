path = require 'path'

locate = require './main'

NOT_FOUND_ERROR = 1
UNKNOWN_ERROR = 2

showError = (message) ->
  console.error "ERROR: #{message}"

exec = (name, options) ->
  try
    locate name, options, (err, cmd) ->
      if err != null
        showError err.message
        process.exit NOT_FOUND_ERROR
      console.log cmd
  catch err
    showError err.message
    process.exit UNKNOWN_ERROR

module?.exports?.exec = exec
