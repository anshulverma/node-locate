{resolve} = require 'path'
{exists} = require 'fs'
{checkDefined} = require 'node-preconditions'

SEPARATOR = ':'
DEFAULT_CALLBACK = (err, cmd) ->
  if err? then console.error err.message
  else console.log cmd

module.exports = (name, options={}, callback=DEFAULT_CALLBACK) ->
  checkDefined process.env.PATH, 'system path not set', (err) ->
    if err? then callback err
    else locate name, options, callback

locate = (name, options, callback) ->
  pathList = process.env.PATH.split(SEPARATOR)

  errorCount = 0
  foundCommands = []
  handleCommand = (cmd) ->
    unless ~foundCommands.indexOf(cmd)
      callback null, cmd
      foundCommands.push cmd

  handleError = ->
    if errorCount++ is pathList.length
      callback new Error "'#{name}' not found"

  checkExistance = (cmd) ->
    exists cmd, (found) -> if found then handleCommand(cmd) else do handleError

  for searchPath in pathList
    cmd = resolve searchPath, name
    checkExistance cmd

  localPath = options.localPath || resolve __dirname, '../node_modules/.bin'
  cmdPath = resolve localPath, name
  exists cmdPath, (found) ->
    if found then handleCommand(cmdPath) else do handleError
