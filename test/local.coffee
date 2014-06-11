{resolve} = require 'path'

describe 'local', ->
  describe 'locate paths within local node_modules', ->
    it 'should be able to locate path within local node_modules\'s bin folder', ->
      cmd = locate 'test-command', { localPath: resourcePath }
      actualPath = resolve resourcePath, 'test-command'
      # assert.equal actualPath, cmd, 'unable to find command in node_modules'
