describe 'environment', ->
  describe 'check system properties', ->
    before ->
      @path = process.env.PATH
      delete process.env.PATH

    after ->
      process.env.PATH = @path

    it 'system path should be set', (done) ->
      locate 'ls', null, (err, cmd) ->
        assert.isNotNull err, 'expected error for missing system PATH'
        assert.equal 'system path not set', err.message, 'invalid error message'
        assert.isUndefined cmd
        do done
