
if( typeof module !== 'undefined' )
require( 'wPathBasic' );
var _ = wTools;

var name = _.path.nameJoin( '/a', './b/' ); // returns '/a/b'
console.log( 'name is ' + name );
