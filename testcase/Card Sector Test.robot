*** Settings ***
Resource    ${CURDIR}/../import.robot

# Settings

Suite Teardown     Close Application
Suite Setup    common_keywords.Open App

Library    SeleniumLibrary

*** Test Cases ***
Close unneccesary box
    [Tags]    1st-noti
    common_keywords.Get Device Window
    common_keywords.Wait Until Text Is Visible and Click    "Allow"
    common_keywords.Wait Until Id Visible and Click    ${COMMON_CLOSE}
    Sleep    3


Cards check
    [Tags]    Card-Buttons
    common_keywords.Swipe Until and Click    "Cards"

    common_keywords.Swipe Until and Click    "Basic"
    AppiumLibrary.Go Back
    common_keywords.Swipe Up    start_y=200        


    common_keywords.Swipe Until and Click    "Timeline"
    AppiumLibrary.Go Back
    common_keywords.Swipe Up    start_y=200   

    common_keywords.Swipe Until and Click    "Overlap"
    AppiumLibrary.Go Back
    common_keywords.Swipe Up    start_y=200   

    common_keywords.Swipe Until and Click    "Divider"
    AppiumLibrary.Go Back
    common_keywords.Swipe Up    start_y=200   

    common_keywords.Swipe Until and Click    "Scrolling"
    AppiumLibrary.Go Back