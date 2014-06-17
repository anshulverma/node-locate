{resolve} = require 'path'
{existsSync} = require 'fs'

SEPARATOR = ':'
DEFAULT_CALLBACK = (err, cmd) ->
  throw err if err?
  return cmd

module.exports = (name, options={}, callback=DEFAULT_CALLBACK) ->
  sysPath = process.env.PATH
  return callback(new Error 'system path not set') if !sysPath

  for searchPath in sysPath.split(SEPARATOR)
    cmd = resolve(searchPath, name)
    return callback(null, cmd) if existsSync cmd

  localPath = options.localPath || resolve __dirname, '../node_modules/.bin'
  cmdPath = resolve localPath, name
  return callback(null, cmdPath) if existsSync cmdPath

  return callback(new Error "'#{name}' not found")
