technically
===========

[![npm version][npm-image]][npm-url]
[![Build Status][travis-image]][travis-url]
[![Dependency Status][david-image]][david-url]
[![devDependency Status][david-dev-image]][david-dev-url]
[![Greenkeeper badge](https://badges.greenkeeper.io/hakatashi/technically.svg)](https://greenkeeper.io/)

[npm-image]: https://img.shields.io/npm/v/technically.svg
[npm-url]: https://www.npmjs.com/package/technically
[travis-image]: https://travis-ci.org/hakatashi/technically.svg?branch=master
[travis-url]: https://travis-ci.org/hakatashi/technically
[david-image]: https://david-dm.org/hakatashi/technically.svg
[david-url]: https://david-dm.org/hakatashi/technically
[david-dev-image]: https://david-dm.org/hakatashi/technically/dev-status.svg
[david-dev-url]: https://david-dm.org/hakatashi/technically#info=devDependencies

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
