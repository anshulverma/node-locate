{exec} = require 'child_process'

REPORTER = "spec"

task "test", "run tests", ->
  exec "NODE_ENV=test 
    ./node_modules/.bin/mocha 
      --compilers coffee:coffee-script/register test
      --reporter #{REPORTER}
      --require coffee-script 
      --require test/test_helper.coffee
      --colors
    ", (err, output) ->
      throw err if err
      console.log output

