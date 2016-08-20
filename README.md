technically
===========

> Get the “exact value” of the number

This module works basically like Number.prototype.toString(), but more *technically*.

![](http://imgs.xkcd.com/comics/technically.png)

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
