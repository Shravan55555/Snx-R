# add repo, dt, vt, kt etc.
repo init -u https://github.com/PixelOS-AOSP/manifest.git -b fourteen --git-lfs
# replace with your manifest
git clone https://github.com/Shravan55555/local_manifest.git -b main .repo/local_manifests
# sync script
repo sync -j$(nproc --all) --no-clone-bundle --no-tags --optimized-fetch --prune
source build/envsetup.sh
export TZ=Asia/Dhaka
# export USE_GAPPS=true
# export WITH_GAPPS=true
# export EXTRA_GAPPS=false
lunch aosp_RMX1901-ap2a-user
# export extra module
# export SELINUX_IGNORE_NEVERALLOWS=true
make api-stubs-docs || echo no problem
make system-api-stubs-docs || echo no problem
make test-api-stubs-docs || echo no problem
# vanilla build
mka bacon
export GAPPS_BUILD=false
export RELEASE=true
Snx-R
