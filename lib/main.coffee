{resolve} = require 'path'
{existsSync} = require 'fs'

SEPARATOR = ':'

module.exports = (name) ->
  sysPath = process.env.PATH
  throw new Error 'system path node set' if !sysPath

  for searchPath in sysPath.split(SEPARATOR)
    cmd = resolve(searchPath, name)
    return cmd if existsSync cmd
