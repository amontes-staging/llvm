// RUN: llvm-mc -triple=aarch64 -show-encoding -mattr=+sve < %s \
// RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INST
// RUN: not llvm-mc -triple=aarch64 -show-encoding < %s 2>&1 \
// RUN:        | FileCheck %s --check-prefix=CHECK-ERROR
// RUN: llvm-mc -triple=aarch64 -filetype=obj -mattr=+sve < %s \
// RUN:        | llvm-objdump -d -mattr=+sve - | FileCheck %s --check-prefix=CHECK-INST
// RUN: llvm-mc -triple=aarch64 -filetype=obj -mattr=+sve < %s \
// RUN:        | llvm-objdump -d - | FileCheck %s --check-prefix=CHECK-UNKNOWN

bic     z5.b, z5.b, #0xf9
// CHECK-INST: and     z5.b, z5.b, #0x6
// CHECK-ENCODING: [0x25,0x3e,0x80,0x05]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: 25 3e 80 05 <unknown>

bic     z23.h, z23.h, #0xfff9
// CHECK-INST: and     z23.h, z23.h, #0x6
// CHECK-ENCODING: [0x37,0x7c,0x80,0x05]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: 37 7c 80 05 <unknown>

bic     z0.s, z0.s, #0xfffffff9
// CHECK-INST: and     z0.s, z0.s, #0x6
// CHECK-ENCODING: [0x20,0xf8,0x80,0x05]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: 20 f8 80 05 <unknown>

bic     z0.d, z0.d, #0xfffffffffffffff9
// CHECK-INST: and     z0.d, z0.d, #0x6
// CHECK-ENCODING: [0x20,0xf8,0x83,0x05]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: 20 f8 83 05 <unknown>

bic     z5.b, z5.b, #0x6
// CHECK-INST: and     z5.b, z5.b, #0xf9
// CHECK-ENCODING: [0xa5,0x2e,0x80,0x05]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: a5 2e 80 05 <unknown>

bic     z23.h, z23.h, #0x6
// CHECK-INST: and     z23.h, z23.h, #0xfff9
// CHECK-ENCODING: [0xb7,0x6d,0x80,0x05]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: b7 6d 80 05 <unknown>

bic     z0.s, z0.s, #0x6
// CHECK-INST: and     z0.s, z0.s, #0xfffffff9
// CHECK-ENCODING: [0xa0,0xeb,0x80,0x05]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: a0 eb 80 05 <unknown>

bic     z0.d, z0.d, #0x6
// CHECK-INST: and     z0.d, z0.d, #0xfffffffffffffff9
// CHECK-ENCODING: [0xa0,0xef,0x83,0x05]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: a0 ef 83 05 <unknown>

bic     z0.d, z0.d, z0.d
// CHECK-INST: bic     z0.d, z0.d, z0.d
// CHECK-ENCODING: [0x00,0x30,0xe0,0x04]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: 00 30 e0 04 <unknown>

bic     z23.d, z13.d, z8.d
// CHECK-INST: bic     z23.d, z13.d, z8.d
// CHECK-ENCODING: [0xb7,0x31,0xe8,0x04]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: b7 31 e8 04 <unknown>

bic     z31.b, p7/m, z31.b, z31.b
// CHECK-INST: bic     z31.b, p7/m, z31.b, z31.b
// CHECK-ENCODING: [0xff,0x1f,0x1b,0x04]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: ff 1f 1b 04 <unknown>

bic     z31.h, p7/m, z31.h, z31.h
// CHECK-INST: bic     z31.h, p7/m, z31.h, z31.h
// CHECK-ENCODING: [0xff,0x1f,0x5b,0x04]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: ff 1f 5b 04 <unknown>

bic     z31.s, p7/m, z31.s, z31.s
// CHECK-INST: bic     z31.s, p7/m, z31.s, z31.s
// CHECK-ENCODING: [0xff,0x1f,0x9b,0x04]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: ff 1f 9b 04 <unknown>

bic     z31.d, p7/m, z31.d, z31.d
// CHECK-INST: bic     z31.d, p7/m, z31.d, z31.d
// CHECK-ENCODING: [0xff,0x1f,0xdb,0x04]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: ff 1f db 04 <unknown>
