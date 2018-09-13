( function _Paths_s_() {

'use strict';

/**
 * @file Paths.s.
 */

if( typeof module !== 'undefined' )
{

  if( typeof _global_ === 'undefined' || !_global_.wBase )
  {
    let toolsPath = '../../../dwtools/Base.s';
    let toolsExternal = 0;
    try
    {
      toolsPath = require.resolve( toolsPath );
    }
    catch( err )
    {
      toolsExternal = 1;
      require( 'wTools' );
    }
    if( !toolsExternal )
    require( toolsPath );
  }

  let _ = _global_.wTools;

  require( './Path.s' );

}

//

let _global = _global_;
let _ = _global_.wTools;
let Parent = _.path;
let Self = _.paths = _.paths || Object.create( Parent );

//

function _keyEndsPathFilter( e,k,c )
{
  if( _.strIs( k ) )
  {
    if( _.strEnds( k,'Path' ) )
    return true;
    else
    return false
  }
  return this.is( e );
}

//

function _isPathFilter( e )
{
  return this.is( e[ 0 ] )
}

//

function vectorize( routine, select )
{
  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.strIs( routine ) );
  select = select || 1;
  return _.routineVectorize_functor
  ({
    routine : [ 'path', routine ],
    vectorizingArray : 1,
    vectorizingMap : 1,
    select : select,
  });
}

//

function vectorizeOnly( routine )
{
  _.assert( arguments.length === 1 );
  _.assert( _.strIs( routine ) );
  return _.routineVectorize_functor
  ({
    routine : [ 'path', routine ],
    fieldFilter : _keyEndsPathFilter,
    vectorizingArray : 1,
    vectorizingMap : 1,
  });
}

// --
// path transformer
// --

let from = vectorize( 'from' );
let relative = vectorize( 'relative', 2 );
let common = vectorize( 'common', Infinity );

// --
// fields
// --

let Fields =
{
  path : Parent,
}

// --
// routines
// --

let Routines =
{

  _keyEndsPathFilter : _keyEndsPathFilter,
  _isPathFilter : _isPathFilter,

  // normalizer

  refine : vectorize( 'refine' ),
  normalize : vectorize( 'normalize' ),
  dot : vectorize( 'dot' ),
  undot : vectorize( 'undot' ),

  onlyRefine : vectorizeOnly( 'refine' ),
  onlyNormalize : vectorizeOnly( 'normalize' ),
  onlyDot : vectorizeOnly( 'dot' ),
  onlyUndot : vectorizeOnly( 'undot' ),

  // path join

  join : vectorize( 'join', Infinity ),
  reroot : vectorize( 'join', Infinity ),
  resolve : vectorize( 'join', Infinity ),

  // path cut off

  dir : vectorize( 'dir' ),
  prefixGet : vectorize( 'prefixGet' ),
  name : vectorize( 'name' ),
  withoutExt : vectorize( 'withoutExt' ),
  changeExt : vectorize( 'changeExt' ),
  ext : vectorize( 'ext' ),
  exts : vectorize( 'exts' ),

  // path transformer

  from : from,
  relative : relative,
  common : common,

}

_.mapSupplementOwn( Self, Fields );
_.mapSupplementOwn( Self, Routines );

_.assert( _.path.s === null );
_.path.s = Self;

// --
// export
// --

if( typeof module !== 'undefined' )
if( _global_.WTOOLS_PRIVATE )
delete require.cache[ module.id ];

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
