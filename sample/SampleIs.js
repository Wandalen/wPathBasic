
if( typeof module !== 'undefined' )
require( 'wPathFundamentals' );
require( 'wFiles' )
var _ = wTools;

  var got = _.path.isSafe( 'c/ProgramFiles/f/g', 3 );
console.log( 'Result', got );
