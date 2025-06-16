    # # # This source code is subject to the license referenced at
    # # # https://github.com/NRLMMD-GEOIPS.

GeoIPS Test Data Repository Template
====================================

This template repository contains everything necessary to create a test data
repository for use with the GeoIPS processing infrastructure.

Follow the step by step instructions in the README below for modifying the template
files within this repository in order to create your own test data repository.

Once test data repository has been set up properly, you can remove the first four
sections in the README.md, leaving the appropriate content for your test data repo's
README file.

Instructions for setting up test data repository from templates
===============================================================

* Replace all instances of @mydatatype@ in README.md with your actual data type name
  (as in test_data_@mydatatype@)
* Identify any additional instances of @ within README.md, and replace with
  appropriate content.
* Create "data" subdirectory, and populate with appropriate datasets

  * Leave datasets uncompressed
* OPTIONAL Create "bg\_data" subdirectory, and populate with appropriate datasets
  (for background imagery - often coincident collocated geostationary data)

  * Leave datasets uncompressed
* Update docs/source/releases/latest/initial-commit.yaml with
  updates / description of datasets

  * See [geoips/CHANGELOG_TEMPLATE.rst](https://github.com/NRLMMD-GEOIPS/geoips/blob/main/CHANGELOG_TEMPLATE.rst)
    for instructions on generating release notes.
  * *vim docs/source/releases/latest/initial-commit.yaml*

Final contents within $GEOIPS_TESTDATA_DIR:
===========================================

* Directory: **test_data_mydatatype/data**
  * Populate with representative test datasets
  * Leave datasets uncompressed
  * Ie, good TC cases, or test datasets with appropriate meteorological features.
* Directory: **test_data_mydatatype/bg_data**
  * OPTIONAL
  * You can pull ABI, AHI, or AMI bg data from AWS using rclone,
  * see "$GEOIPS/scripts/download\_noaa\_aws\_data.sh" for associated rclone commands
  * Leave datasets uncompressed
* File: **test_data_mydatatype/README.md**
  * README for installing GeoIPS and running tests on this dataset
* File: **test_data_mydatatype/CHANGELOG.rst**
  * Standard CHANGELOG.rst
* File: **test_data_mydatatype/docs/source/releases/initial-commit.yaml**
  * Release note for the initial commit. 
  * Update with release notes relating to your initial functionality. 

Remove all contents this section and above
==========================================

Remove this section and all preceding sections once you have finalized the repo.


@datatype@ Test Datasets
==========================

This repository contains test datasets for use with the
Geolocated Information Processing System.

Please see the 
[GeoIPS Documentation](https://github.com/NRLMMD-GEOIPS/geoips#readme)
for more information on the GeoIPS plugin architecture and base infrastructure.

Sample Dataset Sources
-----------------------

@Please include information on where this test dataset originated.
Links, citation/acknowledgment information, and descriptions/details of the source.

4-5 bullets.

Dataset Details
---------------

@Please include information about the datasets themselves.  This should include:

* copy/paste of the full filenames
* description of meteorological feature contained in the dataset (ie, Tropical Cyclone
  name if it covers a storm, dust storm location if it contains a dust storm, etc)
* Date/time of the dataset
* Geographical location covered by the dataset
* Explanation of background datasets.
* Link to where sample imagery produced using these datasets can be found


System Requirements
---------------------

* geoips >= 1.14.2
* Test data repos contained in ``$GEOIPS_TESTDATA_DIR`` for tests to pass.
* GeoIPS Plugins:
  * @Include list of GeoIPS plugins that are required to read / process these datasets
  * @This should include plugin package name, as well as required version number


IF REQUIRED: Install base geoips package
------------------------------------------------------------
SKIP IF YOU HAVE ALREADY INSTALLED BASE GEOIPS ENVIRONMENT 

If GeoIPS Base is not yet installed, follow the
[installation instructions](https://github.com/NRLMMD-GEOIPS/geoips#installation)
within the geoips source repo documentation.

Additionally, install all GeoIPS plugins and other packages specified in
"System Requirements" above (follow installation instructions in the
respective packages).

Obtain test repo
----------------
```bash
    # Enable GeoIPS environment appropriately
    geoips config install test_data_@mydatatype@
```

Run sample test scripts
-----------------------
```bash
    # Enable GeoIPS environment appropriately

    # @ Identify example test script(s) (in one or more plugins) that will process
    # @ these test datasets.
    # GeoIPS-based test scripts successfully return 0 if everything is set up properly.
    $GEOIPS_PACKAGES_DIR/@package1@/tests/scripts/@testscript1@.sh
    $GEOIPS_PACKAGES_DIR/@package2@/tests/scripts/@testscript2@.sh
```
