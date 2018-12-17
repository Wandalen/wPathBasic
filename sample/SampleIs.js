
if( typeof module !== 'undefined' )
require( 'wPathFundamentals' );
require( 'wFiles' )
var _ = wTools;


//Q1 - L358: should use instead isNormalized in assert? - The change throws many errors
logger.log( 'Q1 - normalized path');

var got = _.path.isAbsolute( 'c:/Windows/f/g' );
console.log( 'Result', got );

var got = _.path.normalize( 'c:/Windows/f/g');
console.log( 'Result', got );

var got = _.path.isAbsolute( got );
console.log( 'Result', got );
