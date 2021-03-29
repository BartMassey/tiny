#![no_std]
#![feature(lang_items)]

#[lang = "eh_personality"]
extern "C" fn eh_personality() {}

#[panic_handler]
fn panic_handler(_:&core::panic::PanicInfo) -> ! {
    unsafe { libc::_exit(1) }
}

#[no_mangle]
pub fn _start(_argc: isize, _argv: *const *const u8) -> isize {
    unsafe { libc::_exit(0) };
}
