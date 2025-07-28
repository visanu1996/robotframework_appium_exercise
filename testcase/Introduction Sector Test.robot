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

Introduction Fade
    [Tags]    fade-instruction
    common_keywords.Swipe Until and Click    "Introduction"
    Introduction_keywords.Introduction Read    "Fade"

Introduction Zoom
    [Tags]    zoom-instruction
    Introduction_keywords.Introduction Read    "Zoom"

Introduction Close
    [Documentation]    to test close button
    [Tags]    close-instruction
    Introduction_keywords.Introduction Read    "Depth"    ${True}
    common_keywords.Screen Capture