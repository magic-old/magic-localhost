'use strict';
var d = document
  , s = d.createElement('script')
  , l = d.getElementById('load-js')
;
s.src = '/js/main.js';
d.body.appendChild(s);
if (l && l.parentNode) l.parentNode.removeChild(l);
