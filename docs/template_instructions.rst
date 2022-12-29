 | # # # Distribution Statement A. Approved for public release. Distribution unlimited.
 | # # #
 | # # # Author:
 | # # # Naval Research Laboratory, Marine Meteorology Division
 | # # #
 | # # # This program is free software: you can redistribute it and/or modify it under
 | # # # the terms of the NRLMMD License included with this program. This program is
 | # # # distributed WITHOUT ANY WARRANTY; without even the implied warranty of
 | # # # MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the included license
 | # # # for more details. If you did not receive the license, for more information see:
 | # # # https://github.com/U-S-NRL-Marine-Meteorology-Division/

###############################################################
Instructions for setting up test data repository from templates
###############################################################

#. Replace all instances of @mydatatype@ in README.md with your actual data type name
   (as in test_data_@mydatatype@)

#. Identify any additional instances of @ within README.md, and replace with appropriate content.

#. Update VERSION with desired version number
   
   ```
   vim $GEOIPS_TESTDATA_DIR/test_data_@mydatatype@/VERSION
   ```
   
   *No comments of other contents allowed within VERSION file*
   
   *GeoIPS as a whole follows PEP-440 semantic versioning: https://peps.python.org/pep-0440/*
   
#. Create "data" subdirectory, and populate with appropriate datasets

   `git lfs track \*.@ext@  # Ensure all large data files are tracked with git lfs`
   
   *If you compress any datasets, ensure the "uncompress\_test\_data.sh" script will uncompress them.*
   
#. Create "bg\_data" subdirectory, and populate with appropriate datasets

   `git lfs track \*.@ext@  # Ensure all large data files are tracked with git lfs`
   
   *If you compress any datasets, ensure the "uncompress\_test\_data.sh" script will uncompress them.*
   
#. Update CHANGELOG.md with updates / description of datasets

   `vim $GEOIPS_TESTDATA_DIR/test_data_@mydatatype@/CHANGELOG.md`


#############################################################
Final contents within $GEOIPS_TESTDATA_DIR:
#############################################################

* Directory: **test_data_mydatatype/data**
    * Populate with representative test datasets
    * Ie, good TC cases, or test datasets with appropriate meteorological features.
* Directory: **test_data_mydatatype/bg_data**
    * You can pull ABI or AHI bg data from AWS using rclone,
    * see "$GEOIPS/scripts/download\_noaa\_aws\_data.sh" for associated rclone commands
* File: **test_data_mydatatype/uncompress_test_data.sh**
    * Required if any test datasets are compressed - will automatically run during standard installation.
* File: **test_data_mydatatype/VERSION**
    * In the event datasets are updated - include a VERSION number for this repo (can match geoips VERSION,
        or you can come up with your own)
* File: **test_data_mydatatype/README.md**
    * README for installing GeoIPS and running tests on this dataset
* File: **test_data_mydatatype/CHANGELOG.md**
    * Track any changes made to the repository
* File: **.gitattributes**
    * This ensure git repository is tracked using Large File Storage (LFS)
    * This file can be automatically created by running "git lfs track"
    * git lfs track \*.tgz
    * git lfs track \*.nc
    * Additional file extensions as needed

