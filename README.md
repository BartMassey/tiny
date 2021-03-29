# tiny: demos of tiny Linux programs in various languages
Bart Massey 2021

This repo was inspired by a Reddit
[discussion](https://www.reddit.com/r/rust/comments/mf16qk/i_was_nerdsniped_into_demonstrating_that_you_can/)
about building small ELF binaries on Linux. The code here is
my attempt to build smallest static-linked Linux ELF
binaries that actually work (on my Debian x86_64 box) for
several languages: assembly, C and Rust. The binary merely
exits with status 0. Not that exciting.

## Building

To get the Rust binary, you will need to have installed
enough Rust cruft on your box. Go get
[`rustup`](http://rustup.rs) and get that working. You will
then need to

    rustup install nightly
    rustup target add --toolchain nightly x86_64-unknown-linux-musl

You will also need `musl-dev` or the equivalent package
installed on your box.

Take a look at the `Makefile` for all the gory details of
everything. Comment `tiny-rs` out of `BIN` there if you
don't want to mess with Rust.

# Running

Run via `make stats`. That should build everything and
print some stats. On my box it shows

    -rwxr-xr-x 1 bart bart 4640 Mar 29 16:25 tiny-s
       text	   data	    bss	    dec	    hex	filename
         16	      0	      0	     16	     10	tiny-s

    -rwxr-xr-x 1 bart bart 9280 Mar 29 16:25 tiny-c
       text	   data	    bss	    dec	    hex	filename
        164	      0	      4	    168	     a8	tiny-c

    -rwxr-xr-x 1 bart bart 9264 Mar 29 16:25 tiny-rs
       text	   data	    bss	    dec	    hex	filename
         55	     32	      0	     87	     57	tiny-rs

Stripping the executables doesn't reduce the filesize much.

## Caveats

I was surprised that the C binary was so much code,
especially compared to the Rust binary. I may still be doing
something wrong.

In general, this code is a bletcherous mess of
kludges. You'll probably have to mess with it to get it to
work at all. You may also find that mistakes have been made.
Corrections welcome.

## Acknowledgements

Thanks to Reddit's
[/u/FormalFerret](https://www.reddit.com/user/FormalFerret/)for
the initial impetus and Keith Packard for kicking this
around with me.

## License

This work is made available under the "MIT License". Please
see the file `LICENSE` in this distribution for license
terms.
