node-locate
===========

[![Build Status](https://travis-ci.org/anshulverma/node-locate.svg?branch=master)](https://travis-ci.org/anshulverma/node-locate)
[![Dependency Status](https://gemnasium.com/anshulverma/node-locate.svg)](https://gemnasium.com/anshulverma/node-locate)
[![Coverage Status](https://coveralls.io/repos/anshulverma/node-locate/badge.png?branch=master)](https://coveralls.io/r/anshulverma/node-locate?branch=master)
[![NPM version](https://badge.fury.io/js/node-locate.svg)](http://badge.fury.io/js/node-locate)

[![NPM](https://nodei.co/npm/node-locate.png?stars=true&downloads=true)](https://nodei.co/npm/node-locate/)

<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc/generate-toc again -->
**Table of Contents**

- [node-locate](#node-locate)
    - [Usage](#usage)
        - [As a command line tool](#as-a-command-line-tool)
        - [As a module within another](#as-a-module-within-another)
    - [Contributing](#contributing)
    - [Author](#author)
    - [License](#license)

<!-- markdown-toc end -->

Locate path to a command in your system. This module also keeps track of
commands in `node_modules` folder.

## Usage

### As a command line tool

If you just want to use this utility as a command line tool, simply
install this module with the `-g` flag:

``` bash
$ npm install -g node-locate
```

Then you can use it as:

``` bash
$ nlocate ls
/usr/local/bin/ls
$ nlocate non-existent  # this command does not exist
'non-existent' not found
```

### As a module within another

In some cases you may need to use `node-locate` within some other
module. This is as simple as:

``` js
var locate = require('node-locate');

try {
  var cmdPath = locate('some-command');
  console.log('found command at: ' + cmdPath);
} catch (e) {
  console.error('Unable to find command');
}
```

`node-locate` also supports the callback pattern which lets you avoid
the ugly try-catch block:

``` js
locate('some-command', function(err, cmdPath) {
  if (err) {
    console.err('unable to find command');
  } else {
    console.log('found command at: ' + cmdPath);
  }
});
```

## Contributing

Feel free to make a change and issue a pull request if you have a patch.

If you have a feature request or if you find a bug, please open a issue.

## Author

[Anshul Verma](http://anshulverma.github.io/) ::
[anshulverma](https://github.com/anshulverma) ::
[@anshulverma](http://twitter.com/anshulverma)

## License
The MIT License (MIT)

Copyright (c) 2014 Anshul Verma

Permission is hereby granted, free of charge, to any person obtaining a
copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be included
in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
