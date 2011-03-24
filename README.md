string_score
=============

Ported from version 0.1.10 of Joshaven Potter's [string_score][0] JS code to C.

`string_score` is a string ranking algorithm that produced a number between 0 and 1 representing the similarity between two strings.

Usage
-----

    #include "string_score.h"
    #include <string.h>
    #include <stdio.h>

    int main( int argc, char** argv )
    {
        char* a = argv[1];
        char* b = argv[2];
        printf( "normal match: %1.10lf\n", string_score( a, b ) );
        printf( "fuzzy match:  %1.10lf\n", string_fuzzy_score( a, b, 0.5 ) );
        return 0;
    }

(See the original [string_score][0] javascript code for details on the algorithm.)

TODO
----

- Speed improvements (Currently it's just a direct translation from JS, but with no further optimization.)
- Tests
- Benchmarks

License
-------
Licensed under the [MIT license](http://www.opensource.org/licenses/mit-license.php).

[0]: http://github.com/joshaven/string_score