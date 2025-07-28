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

Keyword Testing
    common_keywords.Click Arrow instead of Text    "Splash"
    common_keywords.Click Arrow instead of Text    "Cards"
    common_keywords.Click Arrow instead of Text    "Bottom Sheet"
    common_keywords.Click Arrow instead of Text    "Introduction"