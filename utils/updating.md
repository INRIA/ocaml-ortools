# Setup vendored files (on update; then included in repository)

To update for a new upstream release.

```
git clone --depth 1 --branch v9.15 https://github.com/google/or-tools.git
cd or-tools/
```

## Get source of required libraries

```
git clone --depth 1 --branch 20250814.1 https://github.com/abseil/abseil-cpp.git
git clone --depth 1 --branch 2025-11-05 https://github.com/google/re2.git
git clone --depth 1 --branch v33.4 https://github.com/protocolbuffers/protobuf.git

# git clone --depth 1 --branch 3.4.0 git@gitlab.com:libeigen/eigen.git
# prefer (otherwise be careful with ignored source files):
wget https://gitlab.com/libeigen/eigen/-/archive/3.4.0/eigen-3.4.0.tar.gz
tar xzvf eigen-3.4.0.tar.gz
mv eigen-3.4.0 eigen
```


## (optional) Remove unnecessary parts

```
rm -rf .git/ .github/
rm -rf abseil-cpp/.git abseil-cpp/.github abseil-cpp/ci
rm -rf re2/.git re2/.github
rm -rf protobuf/.git protobuf/.github
```

## Patch source

```
git apply or-tools.patch
git apply abseil-cpp.patch
git apply eigen.patch
git apply protobuf.patch
```

(if required, use `--check`, or `--3way`)

## TODO

Tidy up the modifications to `or-tools/CMakeLists.txt`, e.g., shift to 
separate files and use `include`.

Automate all of this.

