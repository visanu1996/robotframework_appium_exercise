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

Buttons check
    [Tags]    Check-Buttons
    common_keywords.Swipe Until and Click    "Buttons"
    
    common_keywords.Swipe Until and Click    "Basic"
    Go Back
    common_keywords.Swipe Until and Click    "Button In Utilities"
    Go Back
    common_keywords.Swipe Until and Click    "Fab More"
    Go Back
    common_keywords.Swipe Until and Click    "Toggle Basic"
    Go Back
    common_keywords.Swipe Until and Click    "Outlined"
    Go Back
    common_keywords.Swipe Until and Click    "Fab Expand"
    Go Back