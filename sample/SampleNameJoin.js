
if( typeof module !== 'undefined' )
require( 'wPathFundamentals' );
var _ = wTools;

var name = _.path.nameJoin( '/pre1.x1/pre.x', 'a.y/b/c.name', 'd/post.z' );
console.log( 'name is ' + name );
