describe 'environment', ->
  describe 'check system properties', ->
    it 'system path should be set', ->
      path = process.env.PATH
      delete process.env.PATH
      locate 'ls', null, (err, cmd) ->
        assert.equal 'system path not set', err.message, 'invalid error message'
        assert.isUndefined cmd
      process.env.PATH = path
