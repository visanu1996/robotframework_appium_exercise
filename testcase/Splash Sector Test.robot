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

Splash check
    [Tags]    all-splash
    common_keywords.Swipe Until and Click    "Splash"
    
    common_keywords.Swipe Until and Click    "Instagram"
    Go Back
    common_keywords.Swipe Until and Click    "Facebook"
    Go Back
    common_keywords.Swipe Until and Click    "TikTok"
    Go Back
    common_keywords.Swipe Until and Click    "Twitter"
    Go Back