*** Settings ***
Resource    ${CURDIR}/../import.robot

# Settings

Suite Teardown     Close Application
Suite Setup    common_keywords.Open App

*** Variables ***
${BUTTONS}                    android=new UiSelector().text("Buttons")
${BASIC}                      android=new UiSelector().text("Basic")
${BUTTON_IN_UTILITIES}        android=new UiSelector().text("Button In Utilities")
${FAB_MORE}                   android=new UiSelector().text("Fab More")
${TOGGLE_BASIC}               android=new UiSelector().text("Toggle Basic")
${OUTLINED}                   android=new UiSelector().text("Outlined")
${FAB_EXPAND}                 android=new UiSelector().text("Fab Expand")




*** Test Cases ***

Close unneccesary box
    [Tags]    1st-noti
    common_keywords.Get Device Window
    common_keywords.Wait Until Text Is Visible and Click    "Allow"
    common_keywords.Wait Until Id Visible and Click    ${COMMON_CLOSE}
    Sleep    3


Buttons check
    common_keywords.Swipe Until Element Visible and Click    ${BUTTONS} 
    
    common_keywords.Swipe Until Element Visible and Click    ${BASIC} 
    Go Back
    common_keywords.Swipe Until Element Visible and Click    ${BUTTON_IN_UTILITIES}
    Go Back
    common_keywords.Swipe Until Element Visible and Click    ${FAB_MORE}
    Go Back
    common_keywords.Swipe Until Element Visible and Click    ${TOGGLE_BASIC} 
    Go Back
    common_keywords.Swipe Until Element Visible and Click    ${OUTLINED} 
    Go Back
    common_keywords.Swipe Until Element Visible and Click    ${FAB_EXPAND} 
    Go Back