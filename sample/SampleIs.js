
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

//Q2 - seveal args? - L375: missinig assert?

var got = _.path.isGlobal( '//', '://' );
console.log( 'Result', got );
