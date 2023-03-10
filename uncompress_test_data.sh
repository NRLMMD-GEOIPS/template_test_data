# # # Distribution Statement A. Approved for public release. Distribution unlimited.
# # #
# # # Author:
# # # Naval Research Laboratory, Marine Meteorology Division
# # #
# # # This program is free software: you can redistribute it and/or modify it under
# # # the terms of the NRLMMD License included with this program. This program is
# # # distributed WITHOUT ANY WARRANTY; without even the implied warranty of
# # # MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the included license
# # # for more details. If you did not receive the license, for more information see:
# # # https://github.com/U-S-NRL-Marine-Meteorology-Division/

#!/bin/bash

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

$uncompress_script $data_path tgz
$uncompress_script $data_path gunzip
