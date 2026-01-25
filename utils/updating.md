# Setup vendored files (on update; then included in repository)

git clone --depth 1 --branch v9.15 https://github.com/google/or-tools.git

cd or-tools/

## Get source of required libraries

git clone --depth 1 --branch 20250814.1 https://github.com/abseil/abseil-cpp.git
git clone --depth 1 --branch 2025-11-05 https://github.com/google/re2.git
git clone --depth 1 --branch v33.4 https://github.com/protocolbuffers/protobuf.git

## (optional) Remove unnecessary parts

rm -rf .git/ .github/
rm -rf abseil-cpp/.git abseil-cpp/.github abseil-cpp/ci
rm -rf re2/.git re2/.github
rm -rf protobuf/.git protobuf/.github

## Patch source

patch < or-tools.patch
patch < abseil-cpp.patch

