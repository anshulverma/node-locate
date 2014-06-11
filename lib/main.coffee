{resolve} = require 'path'
{existsSync} = require 'fs'

SEPARATOR = ':'

module.exports = (name, options) ->
  options = options || {}
  
  sysPath = process.env.PATH
  throw new Error 'system path node set' if !sysPath

  for searchPath in sysPath.split(SEPARATOR)
    cmd = resolve(searchPath, name)
    return cmd if existsSync cmd

  localPath = options.localPath || resolve __dirname, '../node_modules/.bin'
  cmdPath = resolve localPath, name
  return cmdPath if existsSync cmdPath

  throw new Error "'#{name}' not found"
