CC = gcc
CFLAGS = -Os

RUSTLIB = target/x86_64-unknown-linux-musl/release/libtiny.a

BINS = tiny-s tiny-c tiny-rs

all: $(BINS)

tiny-c: tiny-c.o
	ld -Bstatic -o tiny-c tiny-c.o /usr/lib/x86_64-linux-musl/libc.a

tiny-c.o: tiny.c
	$(CC) $(CFLAGS) -c -o tiny-c.o tiny.c

tiny-s: tiny-s.o
	ld -o tiny-s tiny-s.o

tiny-s.o: tiny.S
	as -o tiny-s.o tiny.S

tiny-rs: $(RUSTLIB)
	ld -o tiny-rs $(RUSTLIB) /usr/lib/x86_64-linux-musl/libc.a

$(RUSTLIB): tiny.rs Cargo.toml
	rustup run nightly cargo build \
	  --target x86_64-unknown-linux-musl --release

stats: $(BINS)
	@for b in $(BINS); do ls -l $$b; size $$b; echo ''; done

clean:
	cargo clean
	-rm -f Cargo.lock *.o $(BINS)
