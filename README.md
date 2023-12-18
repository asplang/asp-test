# Asp scripting platform tests

This repository contains regression tests and fuzz testing for [Asp scripting platform](https://bitbucket.org/asplang/asp)

## Build instructions

Clone both this repository and the main asp repository https://bitbucket.org/asplang/asp

```
$ mkdir build
$ cd build
$ cmake -DASP_SOURCE_DIR=<path_to_main_asp_repo> <path_to_asp_test_repo>
$ cmake --build .
```

Fuzz testing support is based on [libFuzzer](https://llvm.org/docs/LibFuzzer.html) and requires using clang (or clang-cl) to compile the project.

   ```
   $ cmake -DASP_SOURCE_DIR=<path_to_main_asp_repo> -DBUILD_FUZZ_TESTING=ON -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ <path_to_asp_test_repo>
   ```

## Running tests

Tests are compiled and registered for ctest and can be run by either "test" build target or by running ctest directly.

```
$ cd build
$ cmake --build . --target test
$ make test
$ ctest
```

## Running fuzz tests

```
$ cd build/fuzzing
$ mkdir fuzz-corpus
$ ./bytecode-fuzz-test -timeout=5 fuzz-corpus
```

See libFuzzer documentation https://llvm.org/docs/LibFuzzer.html for full list of command line options for bytecode-fuzz-test.
If fuzzer finds a crash, timeout or other issue, it will produce a file with the fuzz input data. To debug the issue
the fuzz test binary can be used directly or separate bytecode-fuzz-crash-reproducer can be given the fuzz crash file.
bytecode-fuzz-crash-reproducer is also compiled when the fuzzer isn't enabled and can be used on platforms and compilers
that are not supported by libFuzzer to debug issues.
