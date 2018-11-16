
if( typeof module !== 'undefined' )
require( 'wPathFundamentals' );
var _ = wTools;

var name = _.path.nameJoin( 'c/pre.x', 'a.y/b/c.name', 'd/post.z' );
console.log( 'name is ' + name );
