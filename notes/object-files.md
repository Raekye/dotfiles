## Object Files
### `nm` - lists symbols from object files
For each symbol, `nm` shows the symbol value, type, and name.
For the symbol type, a lowercase letter usually indicates a local symbol; if uppercase, the symbol is (usually?) global (external).

#### Common Flags
- `--extern-only`/`-g`: the symbol is available globally.
- `--defined-only`/`-U` and `--undefined-only`/`-u`: the symbol is/is not defined by the object file.
- `--dynamic`/`-D`: the symbol is dynamic.

#### Some common types and their letters
Source: [man page][nm-manual].

- `T/t`: the symbol is in the text (code) section.
- `U`: the symbol is undefined.
- `D/d`: the symbol is in the initialized data section.
- `G/g`: the symbol is in the initialized data section for small objects.

#### Example Output
```
# nm a.out # truncated
00000000001264d0 T main
                 U malloc@GLIBC_2.2.5
```

### `objdump` - display information from object files
Hmmm...

#### Common Flags
Source: [man page][objdump-manual].

- `--demangle`/`-C`: makes C++ function names readable.
- `--debugging`/`-g`: display debugging information.
- `--disassemble`/`-d`: display assembler mnemonics for machine instructions.

	Note: the long version of this flag can be given a specific symbol name like so: `--disassemble=<symbol>`.
	The symbol name to disassemble must be given after the equals sign as a single argument.
- `--source`/`-S`: display source code intermixed with assembly.
- `--line-numbers`/`-l`: display line numbers.
- `--syms`/`-t`: print the symbol table entries of the file (similar to the information provided by `nm`).
- `--dynamic-syms`/`-T`: print the dynamic symbol table entries of the file (similar to `nm --dynamic`).
- `--file-headers`/`-f`: display summary information from the overall header of the file.
- `--section-headers`/`--headers`/`-h`: display summary information from the section headers of the object file.
- `--private-headers`/`-p`: print information specific to the object file format.

	Note: this flag can be used to show shared library dependencies (under "Dynamic Section").

#### Example Output
```
# objdump --private-headers a.out # truncated
Dynamic Section:
  NEEDED               libgcc_s.so.1
  NEEDED               libm.so.6
  NEEDED               libc.so.6
  NEEDED               ld-linux-x86-64.so.2
```

### `readelf` - display information about ELF files
Hmmm...

#### Common Flags
Source: [man page][readelf-manual].

- `--demangle`/`-C`: makes C++ function names readable.
- `--symbols`/`--syms`/`-s`: displays the symbol table entries of the file.
- `--dyn-syms`: displays the dynamic symbol table entries of the file.
- `--file-header`/`-h`: displays the information in the ELF header at the start of the file.
- `--program-headers`/`--segments`/`-l`: displays information in the file's segment headers.
- `--section-headers`/`--sections`/`-S`: displays information in the file's section headers.
- `--headers`/`-e`: displays all headers in the file (equivalent to `-h -l -S`).
- `--relocs`/`-r`: displays the contents of the file's relocation section.
- `--dynamic`/`-d`: displays the contents of the file's dynamic section.

	Note: this flag can be used to show shared library dependencies.
- `--use-dynamic`/`-D`: TODO?

#### Example Output
```
# readelf --file-headers a.out
ELF Header:
  Magic:   7f 45 4c 46 02 01 01 00 00 00 00 00 00 00 00 00
  Class:                             ELF64
  Data:                              2's complement, little endian
  Version:                           1 (current)
  OS/ABI:                            UNIX - System V
  ABI Version:                       0
  Type:                              DYN (Position-Independent Executable file)
  Machine:                           Advanced Micro Devices X86-64
  Version:                           0x1
  Entry point address:               0x124550
  Start of program headers:          64 (bytes into file)
  Start of section headers:          139837776 (bytes into file)
  Flags:                             0x0
  Size of this header:               64 (bytes)
  Size of program headers:           56 (bytes)
  Number of program headers:         14
  Size of section headers:           64 (bytes)
  Number of section headers:         51
  Section header string table index: 50
```

```
# readelf --dynamic a.out
Dynamic section at offset 0x761178 contains 30 entries:
  Tag        Type                         Name/Value
 0x0000000000000001 (NEEDED)             Shared library: [libgcc_s.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libm.so.6]
 0x0000000000000001 (NEEDED)             Shared library: [libc.so.6]
 0x0000000000000001 (NEEDED)             Shared library: [ld-linux-x86-64.so.2]
 0x000000000000000c (INIT)               0xea000
 0x000000000000000d (FINI)               0x5518a8
 0x0000000000000019 (INIT_ARRAY)         0x6c1270
 0x000000000000001b (INIT_ARRAYSZ)       16 (bytes)
 0x000000000000001a (FINI_ARRAY)         0x6c1280
 0x000000000000001c (FINI_ARRAYSZ)       8 (bytes)
 0x000000006ffffef5 (GNU_HASH)           0x3d8
 0x0000000000000005 (STRTAB)             0x18a0
 0x0000000000000006 (SYMTAB)             0x778
 0x000000000000000a (STRSZ)              2932 (bytes)
 0x000000000000000b (SYMENT)             24 (bytes)
 0x0000000000000015 (DEBUG)              0x0
 0x0000000000000003 (PLTGOT)             0x761398
 0x0000000000000002 (PLTRELSZ)           72 (bytes)
 0x0000000000000014 (PLTREL)             RELA
 0x0000000000000017 (JMPREL)             0xe9120
 0x0000000000000007 (RELA)               0x26d8
 0x0000000000000008 (RELASZ)             944712 (bytes)
 0x0000000000000009 (RELAENT)            24 (bytes)
 0x000000000000001e (FLAGS)              BIND_NOW
 0x000000006ffffffb (FLAGS_1)            Flags: NOW PIE
 0x000000006ffffffe (VERNEED)            0x2588
 0x000000006fffffff (VERNEEDNUM)         4
 0x000000006ffffff0 (VERSYM)             0x2414
 0x000000006ffffff9 (RELACOUNT)          39281
 0x0000000000000000 (NULL)               0x0
```

[nm-manual]: https://man.archlinux.org/man/nm.1
[objdump-manual]: https://man.archlinux.org/man/objdump.1
[readelf-manual]: https://man.archlinux.org/man/readelf.1
