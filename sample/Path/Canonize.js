const _ = require( './node_modules/wTools' );
require( './node_modules/wuribasic' );

/* doc samples */

let normal = _.path.normalize( 'foo/../bar/baz/' );
console.log( normal );
// bar/baz/

let cononical1 = _.path.canonize( 'foo/../bar/baz/' );
console.log( cononical1 );
// bar/baz

let cononical2 = _.path.canonize( 'foo/../bar/baz' );
console.log( cononical2 );
// bar/baz

console.log( cononical1 === cononical2 );
// log : true

/* more samples */

let path = '/C:\\temp\\\\foo\\bar\\';
console.log( _.uri.canonize( path ) ); 
// /C:/temp//foo/bar

path = '/C:\\temp\\\\foo\\\\bar\\..\\';
console.log( _.uri.canonize( path ) ); 
// /C:/temp//foo

path = 'foo/././bar/././baz/';
console.log( _.uri.canonize( path ) ); 
// foo/bar/baz
