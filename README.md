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


GeoIPS Test Data Repository Template
====================================

This template repository contains everything necessary to create a test data repository for use with
the GeoIPS processing infrastructure.

Follow the 
[step by step instructions](https://github.com/NRLMMD-GEOIPS/template_basic_plugin/blob/dev/docs/template_instructions.rst)
for modifying the template files within this repo in order to create your own test data repository.

Once test data repository has been set up properly, you can remove the entire
"GeoIPS Test Data Repository Template" section
in the README.md, leaving the appropriate content for your test data repo's README file.


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

* geoips >= 1.5.3
* Test data repos contained in $GEOIPS_TESTDATA_DIR for tests to pass.
   * git lfs  (if using git to clone test repos)
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
    # Assuming you followed the fully supported installation,
    # using $GEOIPS_TESTDATA_DIR and $GEOIPS_CONFIG_FILE:
    source $GEOIPS_CONFIG_FILE
    git clone $GEOIPS_REPO_URL/test_data_@datatype@ $GEOIPS_TESTDATA_DIR/test_data_@datatype@
    $GEOIPS_TESTDATA_DIR/test_data_@datatype@/uncompress_test_data.sh  # required if compressed datasets
```

Run sample test scripts
-----------------------
```bash

    # Assuming you followed the fully supported installation,
    # using $GEOIPS_TESTDATA_DIR, $GEOIPS_PACKAGES_DIR, and $GEOIPS_CONFIG_FILE:
    source $GEOIPS_CONFIG_FILE

    # @ Identify an example test script (in any plugin) that will process these test datasets.
    # GeoIPS-based test scripts should successfully return 0 if everything is set up properly.
    $GEOIPS_PACKAGES_DIR/@package@/tests/scripts/@testscript@.sh
```
