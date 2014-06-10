describe 'main', ->
  describe 'locate non node-module paths', ->
    it 'should return a valid path for "ls"', ->
      cmd = nlocate('ls')
      assert.include cmd, 'ls', 'unable to find location of "ls"'
