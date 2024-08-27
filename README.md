    # # # Distribution Statement A. Approved for public release. Distribution is unlimited.
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

GeoIPS Test Data Repository Template
====================================

This template repository contains everything necessary to create a test data repository for use with
the GeoIPS processing infrastructure.

Follow the 
step by step instructions in the README below
for modifying the template files within this repo in order to create your own test data repository.

Once test data repository has been set up properly, you can remove the first four
sections in the README.md, leaving the appropriate content for your test data repo's README file.

Instructions for setting up test data repository from templates
===============================================================

* Replace all instances of @mydatatype@ in README.md with your actual data type name
  (as in test_data_@mydatatype@)
* Identify any additional instances of @ within README.md, and replace with appropriate content.
* Create "data" subdirectory, and populate with appropriate datasets
  * git lfs track \*.@ext@  # Ensure all large data files are tracked with git lfs
  * If you compress any datasets, ensure the "uncompress\_test\_data.sh" script will uncompress them.
* Create "bg\_data" subdirectory, and populate with appropriate datasets
  * git lfs track \*.@ext@  # Ensure all large data files are tracked with git lfs
  * If you compress any datasets, ensure the "uncompress\_test\_data.sh" script will uncompress them.
* Rename docs/source/releases/v0_0_1.rst with the appropriate version
  * See [geoips/update_this_release_note](https://github.com/NRLMMD-GEOIPS/geoips/blob/main/update_this_release_note)
    for the current version
  * *git mv docs/source/releases/v0_0_1.rst docs/source/releases/vX_Y_Z.rst*
* Update docs/source/releases/v_X_Y_Z.rst with updates / description of datasets
  * *vim $GEOIPS_TESTDATA_DIR/test_data_@mydatatype@/docs/source/releases/vX_Y_Z.rst*
* Update index.rst with the updated version
  * *vim $GEOIPS_TESTDATA_DIR/test_data_@mydatatype@/docs/source/releases/index.rst*


Final contents within $GEOIPS_TESTDATA_DIR:
===========================================

* Directory: **test_data_mydatatype/data**
    * Populate with representative test datasets
    * Ie, good TC cases, or test datasets with appropriate meteorological features.
* Directory: **test_data_mydatatype/bg_data**
    * You can pull ABI or AHI bg data from AWS using rclone,
    * see "$GEOIPS/scripts/download\_noaa\_aws\_data.sh" for associated rclone commands
* File: **test_data_mydatatype/uncompress_test_data.sh**
    * Required if any test datasets are compressed - will automatically run during standard installation.
* File: **test_data_mydatatype/README.md**
    * README for installing GeoIPS and running tests on this dataset
* File: **test_data_mydatatype/CHANGELOG.rst**
    * Standard CHANGELOG.rst
* File: **test_data_mydatatype/docs/source/releases/vX_Y_Z.rst**
    * Release note for the current version.
    * Ensure matches version found in geoips/update_this_release_note
    * Remove v0_0_1.rst
* File: **test_data_mydatatype/docs/source/releases/index.rst**
    * Update with the version you just added.
    * Remove v0_0_1
* File: **.gitattributes**
    * This ensure git repository is tracked using Large File Storage (LFS)
    * This file can be automatically created by running "git lfs track"
    * git lfs track \*.tgz
    * git lfs track \*.nc
    * Additional file extensions as needed

Remove all contents this section and above
==========================================

Remove this section and all preceding sections once you have finalized the repo.


@datatype@ Test Datasets
==========================

This repository contains test datasets for use with the Geolocated Information Processing System.

Please see the 
[GeoIPS Documentation](https://github.com/NRLMMD-GEOIPS/geoips/blob/main/README.md)
for more information on the GeoIPS plugin architecture and base infrastructure.

Sample Dataset Sources
-----------------------

@Please include information on where this test dataset originated.  Links, citation information,
and descriptions. 4-5 bullets.


System Requirements
---------------------

* geoips >= 1.12.3
* Test data repos contained in $GEOIPS_TESTDATA_DIR for tests to pass.
* GeoIPS Plugins:
   * @Include list of GeoIPS plugins that are required to read / process these datasets
   * @This should include plugin package name, as well as required version number


IF REQUIRED: Install base geoips package
------------------------------------------------------------
SKIP IF YOU HAVE ALREADY INSTALLED BASE GEOIPS ENVIRONMENT 

If GeoIPS Base is not yet installed, follow the
[installation instructions](https://github.com/NRLMMD-GEOIPS/geoips/blob/main/docs/installation.rst)
within the geoips source repo documentation.

Additionally, install all GeoIPS plugins and other packages specified in "System Requirements" above
(follow the installation instructions in their respective README files).

Obtain test repo
----------------
```bash
    # Enable GeoIPS environment appropriately
    git clone $GEOIPS_REPO_URL/test_data_@datatype@ $GEOIPS_TESTDATA_DIR/test_data_@datatype@
```

Run sample test scripts
-----------------------
```bash

    # Enable GeoIPS Environment appropriately

    # @ Identify an example test script (in any plugin) that will process these test datasets.
    # GeoIPS-based test scripts should successfully return 0 if everything is set up properly.
    $GEOIPS_PACKAGES_DIR/@package@/tests/scripts/@testscript@.sh
```
