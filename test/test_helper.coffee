global.assert = require('chai').assert

# We need to execute annotated source for coverage report generation. This can
# be determined using `NODE_ENV`.
coverageMode = process.env['NODE_ENV'] is 'coverage'
srcPath = if coverageMode then '../coverage/src' else '../src'
global.locate = require "#{srcPath}/main"
global.cli = require "#{srcPath}/cli"

global.resourcePath = require('path').resolve __dirname, 'resources'
