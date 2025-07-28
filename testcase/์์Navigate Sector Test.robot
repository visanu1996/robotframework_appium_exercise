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
    common_keywords.Wait Until Id Visible and Click    ${COMMON_CLOSE}
    Sleep    3

Navigate check
    [Tags]    bottom-navigate
    common_keywords.Swipe Until and Click    "Bottom Navigation"
    
    common_keywords.Swipe Until and Click    "Basic"
    Go Back
    common_keywords.Swipe Until and Click    "Shifting"
    Go Back
    common_keywords.Swipe Until and Click    "Light"
    Go Back
    common_keywords.Swipe Until and Click    "Dark"
    Go Back
    common_keywords.Swipe Until and Click    "Icon"
    Go Back
    common_keywords.Swipe Until and Click    "Primary"
    Go Back
    common_keywords.Swipe Until and Click    "Map Blue"
    Go Back
    common_keywords.Swipe Until and Click    "Light Simple"
    Go Back
    common_keywords.Swipe Until and Click    "Article"
    Go Back