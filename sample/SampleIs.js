
if( typeof module !== 'undefined' )
require( 'wPathFundamentals' );
require( 'wFiles' )
var _ = wTools;

var got = _.path.isAbsolute( '/c:/Windows/f');
console.log( 'Result', got );
var got = _.path.isAbsolute( 'c:/Windows/f/g');
console.log( 'Result', got );
var got = _.path.isAbsolute( 'C:/Windows/f');
console.log( 'Result', got );
var got = _.path.isAbsolute( '/C/Windows/f');
console.log( 'Result', got );

var got = _.path.normalize( '/C:/temp/foo/bar/../');
console.log( 'Result', got );

var got = _.path.isNormalized( 'c://temp/foo/bar/');
console.log( 'Result', got );
