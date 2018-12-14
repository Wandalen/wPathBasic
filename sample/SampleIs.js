
if( typeof module !== 'undefined' )
require( 'wPathFundamentals' );
require( 'wFiles' )
var _ = wTools;

var got = _.path.isSafe( 'c:/Windows/f/', 3 );
console.log( 'Result', got );
