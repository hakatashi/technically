technically
===========

[![npm version][npm-image]][npm-url]
[![test][actions-image]][actions-url]

[npm-image]: https://img.shields.io/npm/v/technically.svg
[npm-url]: https://www.npmjs.com/package/technically
[actions-image]: https://github.com/hakatashi/technically/actions/workflows/test.yml/badge.svg
[actions-url]: https://github.com/hakatashi/technically/actions/workflows/test.yml

> Get the “exact value” of the number

This module works basically like Number.prototype.toString(), but more *technically*.

[![](http://imgs.xkcd.com/comics/technically.png)](http://xkcd.com/1475/)

```js
const technically = require('technically');

technically(100); //=> '100'

(1e24).toString(); //=> '1e+24'
technically(1e24); //=> '999999999999999983222784'

(0.1).toString(); //=> '0.1'
technically(0.1); //=> '0.1000000000000000055511151231257827021181583404541015625'

(-0).toString(); //=> '0'
technically(-0); //=> '-0'
```
