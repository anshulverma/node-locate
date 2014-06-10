describe 'main', ->
  describe 'locate non node_module paths', ->
    it 'should return a valid path for "ls"', ->
      cmd = locate 'ls'
      assert.include ['/bin/ls', 'usr/local/bin/ls'], cmd, 'unable to find location of "ls"'

    it 'should not be able to locate a file that does not exist', ->
      cmd = locate 'non-existent-command'
      assert.isUndefined cmd, 'I should be able to find this command'
