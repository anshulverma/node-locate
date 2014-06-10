describe 'main', ->
  describe 'locate non node-module paths', ->
    it 'should return a valid path for "ls"', ->
      cmd = nlocate('ls')
      assert.include ['/bin/ls', 'usr/local/bin/ls'], cmd, 'unable to find location of "ls"'
