# Kind of paths

A string that identifies a file by enumerating files that contain it directly or indirectly is called a <code>path</code>.

Usually the path components are separated by a `/` slash, for example:

```
dir1/dir2/Terminal1.txt
```

The `dir1` directory contains the` dir2` directory, which contains (probably) the `Terminal.txt` terminal file.

A path could be:

- `global` / `local`
- `absolute` / `relative`
- `normal` / `canonical` / `abnormal` / `native`

### Global path

This is the absolute or relative path to the file that contains the protocol, in particular may contain an empty protocol.

The protocol is separated from the rest of the path by `://`. The general view of the global path is `{-protocol name-}://{-local path-}`. The protocol name can be an empty string, ie the path of the form - `://` is global and valid.

```
http://google.com
```

The protocol is `http` and the rest of the path is `google.com`.

### Local path

This is the absolute or relative path to the file that does not contain the protocol name.

```
/dir1/Termina.txt
```

Such a path is not global because it does not contain protocol information.

### Absolute path

This is the path that starts with the root directory.

The root directory is denoted as `/`. Paths that start with `/` are absolute.

```
/dir/Termina.txt
```

Such a path is absolute because it starts with `/`. It is also local.

```
file:///dir/Termina.txt
```

Another example of the absolute path. Unlike the previous one, this path is also global.

### Relative path

This is the path that determines the location of a file relative to another file, not relative to the root, and never starts from the root.

The relative path can be determined relative to the root. But even then, it doesn't start with a root token.

```
dir/Termina.txt
```

The first character in the string is not `/`, so the path is relative.

### Examples of paths

You need to point to the file - /home/doc/myFile.txt

||Absolute|Relative|
|:-:|:-:|:-:|
|Global|file:///home/doc/myFile.txt|file://doc/myFile.txt|
|Local|/home/doc/myFile.txt|doc/myFile.txt|

### Normal path

This is the path reduced to the form in which it uniquely identifies the file with the possibility of directory differentiation.

Two very different in form paths can point to the same file, for example:

```
dir1/dir2/Terminal.txt
./dir1/dir2/dir3/../Terminal.txt
```

This makes it impossible to answer the question of whether the paths identify the same file by comparing lines. Normalization solves this problem. Comparing the two normalized paths, it is possible to answer the question of whether they lead to the same file (provided that there are no links in the path). Normalization also removes platform- or operating-system-specific nuances, ensuring cross-platform nature of the program being developed.

Use the `_.path.normalize()` routine to normalize the path. In the process of normalization, '..' and '.' are removed from the path if possible, reverse slashes are replaced with regular ones, and special characters are escaped.

```js
let path1 = _.path.normalize( 'C:\\project\\index.html\\..\\.' );
console.log( path1 );
// log : /C/project

let path2 = _.path.normalize( '/C/dir1/../project' );
console.log( path2 );
// log : /C/project

console.log( path1 === path2 );
// log : true
```

As a result of the normalization of two different paths `C:\\project\\index.html\\..\\.` and `/C/dir1/../project` it became clear that they identify the same file.

### Canonical path

This is the path reduced to the form in which it uniquely identifies the file without the possibility of directory differentiation.

The `canonization` of the path is a process similar to normalization, but the path in canonical form is more strict and simple. The only difference between the canonization algorithm and the normalization algorithm is that the canonization takes an additional step of cleaning the slash at the end of the path, which makes it impossible to differentiate directories.

```js
let normal = _.path.normalize( 'foo/../bar/baz/' );
console.log( normal );
// bar/baz/

let cononical1 = _.path.canonize( 'foo/../bar/baz/' );
console.log( cononical1 );
// bar/baz

let cononical2 = _.path.canonize( 'foo/../bar/baz' );
console.log( cononical2 );
// bar/baz

console.log( cononical1 === cononical2 );
// log : true
```

The paths `cononical1` and` cononical2` became the same after canonization, while normalization retained the last slash for the path `foo/../bar/baz/`.

The slash after the path can be used as an additional channel of information, for example to differentiate those files that are directories.

### Native path

This is a path that has a form specific to a particular operating system, platform, or interpreter.

The purpose of the process of `nativation` is to convert the path into a form understandable to a particular operating system, platform or interpreter.

Use the `_.path.nativize()` procedure for nativization.

```js
// process.platform === 'win32'
let native = '/C/Newsletters/Summer2018.pdf';
console.log( _.path.nativize( native ) );
// C:\Newsletters\Summer2018.pdf
```

Converting the normal path `/C/Newsletters/Summer2018.pdf` to the form `C:\Newsletters\Summer2018.pdf` which is understandable for `Windows`.

[back to contents](../README.md#concepts)
