*** Settings ***
Documentation  For practicing automation skill with appium.

# Libraries Section

Library           AppiumLibrary

# Resources Section
Resource    ${CURDIR}/keywords/android/common/common_keywords.resource
Resource    ${CURDIR}/keywords/android/common/bottom_side_sheet_keywords.resource
Resource    ${CURDIR}/keywords/android/common/Introduction_keywords.resource

Resource    ${CURDIR}/resources/common_variables.resource
Resource    ${CURDIR}/resources/instructor_variables.resource


# Variables Section
Variables    ${CURDIR}/resources/config/android/env_config.yml