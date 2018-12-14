
if( typeof module !== 'undefined' )
require( 'wPathFundamentals' );
require( 'wFiles' )
var _ = wTools;


//Q1 - L358: should use instead isNormalized in assert?

var got = _.path.isAbsolute( 'c:/Windows/f/g');
console.log( 'Result', got );

var got = _.path.normalize( 'c:/Windows/f/g');
console.log( 'Result', got );

var got = _.path.isAbsolute( got );
console.log( 'Result', got );

//Q2 - isGlobal, isDotted, isTrailed, begins, ends don´t have several args assert

var got = _.path.isGlobal( '//', '://' );
console.log( 'Result', got );


var got = _.path.isDotted( '//', '.' );
console.log( 'Result', got );

var got = _.path.isTrailed( '//.', './' );
console.log( 'Result', got );


var got = _.path.begins( 'a/b', 'a', 'c' );
console.log( 'Result', got );

//Q3 - begins L2179 test file
