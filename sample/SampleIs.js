
if( typeof module !== 'undefined' )
require( 'wPathFundamentals' );
require( 'wFiles' )
var _ = wTools;


//Q1 - L358: should use instead isNormalized in assert?
logger.log( 'Q1 - normalized path');

var got = _.path.isAbsolute( 'c:/Windows/f/g');
console.log( 'Result', got );

var got = _.path.normalize( 'c:/Windows/f/g');
console.log( 'Result', got );

var got = _.path.isAbsolute( got );
console.log( 'Result', got );

logger.log( '' );

//Q2 - isGlobal, isDotted, isTrailed, begins, ends don´t have several args assert
logger.log( 'Q2 - Several arguments');

var got = _.path.isGlobal( '//', '://' );
console.log( 'Result', got );

var got = _.path.isDotted( '//', '.' );
console.log( 'Result', got );

var got = _.path.isTrailed( '//.', './' );
console.log( 'Result', got );

var got = _.path.begins( 'a/b', 'a', 'c' );
console.log( 'Result', got );

var got = _.path.ends( 'a/b', 'a', 'c' );
console.log( 'Result', got );

logger.log( '' );

//Q3 - begins L2179 test file
logger.log( 'Q3 - Wrong input arguments');
