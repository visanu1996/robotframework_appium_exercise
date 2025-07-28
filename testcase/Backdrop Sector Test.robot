*** Settings ***
Resource    ${CURDIR}/../import.robot

# Settings

Suite Teardown     Close Application
Suite Setup    common_keywords.Open App


*** Test Cases ***
Close unneccesary box
    [Tags]    1st-noti
    common_keywords.Get Device Window
    common_keywords.Wait Until Text Is Visible and Click    "Allow"
    common_keywords.Wait Until Id Visible and Click    ${common_close}
    Sleep    3


Backdrop sheet check
    [Tags]    backdrop-sheet
    common_keywords.Swipe Until and Click    "Backdrop"
    bottom_side_sheet_keywords.Bottom Side Sheet Check    "Basic"
    Go Back
    bottom_side_sheet_keywords.Bottom Side Sheet Check    "Filter"
    Go Back
    bottom_side_sheet_keywords.Bottom Side Sheet Check    "Navigation"
    Go Back
    bottom_side_sheet_keywords.Bottom Side Sheet Check    "Steppers"
    Go Back