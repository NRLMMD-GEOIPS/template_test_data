# # # This source code is subject to the license referenced at
# # # https://github.com/NRLMMD-GEOIPS.

#!/bin/bash

# Please ensure folder names match tgz file names, as indicated below!
# uncompress_test_data.sh will not attempt to re-un-tar files if a folder already
# exists of the same name as the basename of the tgz file name (excluding .tgz).

# This is a generalized uncompression script that will uncompress any of the following:
# bg_data/subdir.tgz -> bg_data/subdir
# bg_data/fname.ext.bz2 -> data/fname.ext
# bg_data/subdir/fname.ext.bz2 -> data/subdir/fname.ext
# bg_data/subdir/subsubdir/fname.ext.bz2 -> data/subdir/subsubdir/fname.ext

# data/subdir.tgz -> data/subdir
# data/fname.ext.gz -> data/fname.ext
# data/subdir/fname.ext.gz -> data/subdir/fname.ext
# data/subdir/subsubdir/fname.ext.gz -> data/subdir/subsubdir/fname.ext

# If you have specific uncompression needs, you can update this script accordingly,
# but maintain the filename:
# uncompress_test_data.sh

testdata_dir=`dirname $0`

uncompress_script=$GEOIPS_PACKAGES_DIR/geoips/tests/utils/uncompress_test_data.sh
geo_data_path=$testdata_dir/bg_data/
primary_data_path=$testdata_dir/data/

$uncompress_script $geo_data_path tgz
$uncompress_script $geo_data_path bunzip2

$uncompress_script $primary_data_path tgz
$uncompress_script $primary_data_path gunzip
