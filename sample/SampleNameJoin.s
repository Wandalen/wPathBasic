
if( typeof module !== 'undefined' )
require( 'wPathBasic' );
let _ = wTools;

var name = _.path.nameJoin( '/a', './b/' ); // returns '/a/b'
console.log( 'name is ' + name );
