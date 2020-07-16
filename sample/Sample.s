
if( typeof module !== 'undefined' )
require( '..' /* 'wpathfunamentals' */ );
let _ = wTools;

var joined = _.path.join( '/dir1', 'dir2', '/dir3/dir4', 'dir5' );
console.log( joined );
/*
/dir3/dir4/dir5
*/
