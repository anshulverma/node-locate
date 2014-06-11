describe 'system', ->
  describe 'locate non node_module paths', ->
    it 'should return a valid path for "ls"', ->
      cmd = locate 'ls'
      assert.include ['/bin/ls', '/usr/local/bin/ls'], cmd, 'unable to find location of "ls"'

    it 'should not be able to locate a file that does not exist', ->
      try
        cmd = locate 'non-existent-command'
      catch err
        assert.equal '\'non-existent-command\' not found', err.message, 'unknown exception'
        return
      throw new Error 'somehow I found a non-existent command'
