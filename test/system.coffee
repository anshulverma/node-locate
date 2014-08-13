describe 'system', ->
  describe 'locate non node_module paths', ->
    it 'should return a valid path for "ping"', (done) ->
      locate 'ping', {}, (err, cmd) ->
        assert.include cmd, 'ping', 'unable to find location of "ping"'
        do done

    it 'should not be able to locate a file that does not exist', (done) ->
      cmd = locate 'non-existent-command', {}, (err, cmd) ->
        assert.equal '\'non-existent-command\' not found',
                     err.message,
                     'should not be able to find non exitent command'
        do done
