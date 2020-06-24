const _ = require( 'wTools' );
require( 'wuribasic' );

/* doc samples */

let path1 = _.path.normalize( 'C:\\project\\index.html\\..\\.' );
console.log( path1 );
// log : /C/project

let path2 = _.path.normalize( '/C/dir1/../project' );
console.log( path2 );
// log : /C/project

console.log( path1 === path2 );
// log : true

/* more samples */

let path = '://some/staging/index.html/.';
console.log( _.uri.normalize( path ) ); 
// ://some/staging/index.html

path = ':///some/staging/./index.html/./';
console.log( _.uri.normalize( path ) ); 
// :///some/staging/index.html/

path = '/foo/bar//baz1/baz2//some/..';
console.log( _.uri.normalize( path ) ); 
// /foo/bar//baz1/baz2/

path = 'https://web.archive.org/web/*\/http://www.heritage.org/.././index/ranking/./.';
console.log( _.uri.normalize( path ) ); 
// https://web.archive.org/web/*\/http://index/ranking

path = 'C:\\Projects\\apilibrary\\index.html\\..\\';
console.log( _.uri.normalize( path ) ); 
// /C/Projects/apilibrary/
