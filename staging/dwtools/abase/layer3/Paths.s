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
// normalizer
// --

let refine = vectorize( 'refine' );
let normalize = vectorize( 'normalize' );
let dot = vectorize( 'dot' );
let undot = vectorize( 'undot' );

let onlyRefine = vectorizeOnly( 'refine' );
let onlyNormalize = vectorizeOnly( 'normalize' );
let onlyDot = vectorizeOnly( 'dot' );
let onlyUndot = vectorizeOnly( 'undot' );

// --
// path join
// --

let join = vectorize( 'join', Infinity );
let reroot = vectorize( 'join', Infinity );
let resolve = vectorize( 'join', Infinity );

// --
// path cut off
// --

let dir = vectorize( 'dir' );
let prefixGet = vectorize( 'prefixGet' );
let name = vectorize( 'name' );
let withoutExt = vectorize( 'withoutExt' );
let changeExt = vectorize( 'changeExt' );
let ext = vectorize( 'ext' );
let exts = vectorize( 'exts' );

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

  refine : refine,
  onlyRefine : onlyRefine,

  normalize : normalize,
  onlyNormalize : onlyNormalize,

  dot : dot,
  onlyDot : onlyDot,

  undot : undot,
  onlyUndot : onlyUndot,

  // path join

  join : join,
  reroot : reroot,
  resolve : resolve,

  // path cut off

  dir : dir,
  prefixGet : prefixGet,
  name : name,
  withoutExt : withoutExt,
  changeExt : changeExt,
  ext : ext,
  exts : exts,

  // path transformer

  from : from,
  relative : relative,
  common : common,

}

_.mapSupplementOwn( Self, Fields );
_.mapSupplementOwn( Self, Routines );

// --
// export
// --

if( typeof module !== 'undefined' )
if( _global_.WTOOLS_PRIVATE )
delete require.cache[ module.id ];

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
