
if( typeof module !== 'undefined' )
require( 'wPathFundamentals' );
var _ = wTools;

var file = '/a/b/c.x'
var name = _.path.name( file );
console.log( 'name of ' + file + ' is ' + name );
