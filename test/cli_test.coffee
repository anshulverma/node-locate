describe 'cli tests', ->
  it "find 'ping'", (done) ->
    cli.exec 'ping', {}, (err, cmd) ->
      assert.isNull err
      assert.include cmd, 'ping'
      do done

  it 'find non-existent command', (done) ->
    cli.exec 'non-existent', {}, (err, cmd) ->
      assert.isNotNull err
      assert.equal err.message, "'non-existent' not found"
      assert.isUndefined cmd
      do done

  it 'no name given', (done) ->
    cli.exec {}.undefined, {}, (err, cmd) ->
      assert.isNotNull err
      assert.equal err.message, 'no command name given'
      assert.isUndefined cmd
      do done
