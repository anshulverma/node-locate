{resolve} = require 'path'

describe 'local', ->
  describe 'locate paths within local node_modules', ->
    it 'locate path within local node_modules\'s bin folder', (done) ->
      cmd = locate 'test-command', { localPath: resourcePath }, (err, cmd) ->
        expectedPath = resolve resourcePath, 'test-command'
        assert.equal cmd, expectedPath, 'unable to find command in node_modules'
        do done

  describe 'locate local path using callback', ->
    it 'should be able to find path within node_modules', (done) ->
      locate 'test-command', { localPath: resourcePath }, (err, cmd) ->
        expectedPath = resolve resourcePath, 'test-command'
        assert.equal cmd, expectedPath, 'unable to find command in node_modules'
        assert.isNull err
        do done
