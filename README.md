    # # # This source code is protected under the license referenced at
    # # # https://github.com/NRLMMD-GEOIPS.

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

  * MAYBE, if you really want to use git lfs:

    * git lfs track \*.@ext@  # Ensure all large data files are tracked with git lfs
  * If you compress any datasets, ensure the "uncompress\_test\_data.sh" script will uncompress them.

    * Note when using `uncompress_test_data.sh` you will want to name any folders within a tgz file
      with the same base name as the tgz file (see uncompress_test_data.sh for more details).
* OPTIONAL Create "bg\_data" subdirectory, and populate with appropriate datasets
  (for background imagery - often coincident collocated geostationary data)

  * MAYBE, if you really want to use git lfs:

    * git lfs track \*.@ext@  # Ensure all large data files are tracked with git lfs
  * If you compress any datasets, ensure the "uncompress\_test\_data.sh" script will uncompress them.
* Update docs/source/releases/latest/initial-commit.yaml with updates / description of datasets

  * See [geoips/CHANGELOG_TEMPLATE.rst](https://github.com/NRLMMD-GEOIPS/geoips/blob/main/CHANGELOG_TEMPLATE.rst)
    for instructions on generating release notes.
  * *vim docs/source/releases/latest/initial-commit.yaml*

Final contents within $GEOIPS_TESTDATA_DIR:
===========================================

* Directory: **test_data_mydatatype/data**
  * Populate with representative test datasets
  * Ie, good TC cases, or test datasets with appropriate meteorological features.
* Directory: **test_data_mydatatype/bg_data**
  * OPTIONAL
  * You can pull ABI or AHI bg data from AWS using rclone,
  * see "$GEOIPS/scripts/download\_noaa\_aws\_data.sh" for associated rclone commands
* File: **test_data_mydatatype/uncompress_test_data.sh**
  * Required if any test datasets are compressed - will automatically run during standard installation.
  * Default setup will likely work (see comments in script for details on what 
    files it will decompress) - modify the script if required.
  * Ensure if you tgz a folder that the tgz base filename matches the folder name
    (see `uncompress_test_data.sh` script for more details)
* File: **test_data_mydatatype/README.md**
  * README for installing GeoIPS and running tests on this dataset
* File: **test_data_mydatatype/CHANGELOG.rst**
  * Standard CHANGELOG.rst
* File: **test_data_mydatatype/docs/source/releases/initial-commit.yaml**
  * Release note for the initial commit. 
  * Update with release notes relating to your initial functionality. 
* MAYBE File: **.gitattributes**
  * Only created if you are tracking with git lfs.
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

* geoips >= 1.14.2
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
