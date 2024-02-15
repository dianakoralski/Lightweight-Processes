# Lightweight Processes
 LWP Scheduling program for CSC 453 at Cal Poly SLO by Russ Sobti and Diana Koralski

Contents of this directory

demos:
    This includes a few small programs that use the LWP library.
    Bear in mind that these are, in fact, fairly gentle on the
    library, but they give something to link against.

lib64:
    This includes archive versions of my LWP library and
    of the snakes library. You can use them or sub in your
    own.

    Remember, to run the demos, you'll have to include this
    directory in your LD_LIBRARY_PATH

include:
    This has the headers you'll need:
    
    fp.h:     everything you need to save the floating point state
    lwp.h:    header for the LWP library
    snakes.h: header for the snakes library
