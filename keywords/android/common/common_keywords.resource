*** Settings ***
Library    AppiumLibrary
Library    DateTime
*** Keywords ***
Open App
    Open Application  ${mob_config['host']}  automationName=${mob_config['automationName']}
    ...  platformName=${mob_config['platformName']}  platformVersion=${mob_config['platformVersion']}
    ...  appPackage=${mob_config['appPackage']}  appActivity=${mob_config['appActivity']}
    ...  noReset=${mob_config['noReset']}



############################# keywords #############################

Get Device Window
    [Documentation]    to get device Window
    ${WIDTH}    Get Window Width
    ${HEIGHT}    Get Window Height

    Set Global Variable    ${WIDTH}
    Set Global Variable    ${HEIGHT}

Wait Until Text Is Visible and Click
    [Documentation]    to wait until the text is visible and then click
    [Arguments]    ${TEXT}

    ${IS_EXIST}    Run Keyword And Return Status    AppiumLibrary.Wait Until Element Is Visible    android=new UiSelector().text(${TEXT})    ${global_variable['global_wait']}
    
    FOR    ${COUNTER}    IN RANGE    1    ${global_variable['global_count']}
      
        IF    ${IS_EXIST}

            AppiumLibrary.Click Element    android=new UiSelector().text(${TEXT})
            Exit For Loop

        ELSE

            ${IS_EXIST}    Run Keyword And Return Status    AppiumLibrary.Wait Until Element Is Visible    android=new UiSelector().textContains(${TEXT})    ${global_variable['global_wait']}
            
        END      
    
    END    
    
    IF    not ${IS_EXIST}    Log    Can't find text in Wait Until Text Is Visible and Click function.

Wait Until Id Visible and Click
    [Documentation]    to wait until id is visible and then click
    [Arguments]    ${ID}

    ${IS_EXIST}    Run Keyword And Return Status    AppiumLibrary.Wait Until Element Is Visible    id=${ID}    ${global_variable['global_wait']}

    FOR    ${COUNTER}    IN RANGE    1    ${global_variable['global_count']}
      
        IF    ${IS_EXIST}

            AppiumLibrary.Click Element    id=${ID}
            Exit For Loop

        ELSE

            ${IS_EXIST}    Run Keyword And Return Status    AppiumLibrary.Wait Until Element Is Visible    id=${ID}    ${global_variable['global_wait']}
            
        END      
    
    END    
    
    IF    not ${IS_EXIST}    Log    Can't find element id in Wait Until Id Visible and Click function.


Swipe Until and Click
    [Documentation]    swipe up until find text.
    [Arguments]    ${TEXT}
    
    ${X}    Evaluate    int(${WIDTH}/2)

    ${IS_EXIST}    Run Keyword And Return Status    AppiumLibrary.Wait Until Element Is Visible    android=new UiSelector().text(${TEXT})    ${global_variable['global_wait']}
    
    FOR    ${COUNTER}    IN RANGE    1    10
      
        IF    ${IS_EXIST}

            AppiumLibrary.Click Element    android=new UiSelector().text(${TEXT})
            Sleep    2
            Screen Capture    # better use if you want to see the result as a picture.
            Exit For Loop

        ELSE
            AppiumLibrary.Swipe    ${X}    400    0    0
            ${IS_EXIST}    Run Keyword And Return Status    AppiumLibrary.Wait Until Element Is Visible    android=new UiSelector().text(${TEXT})    ${global_variable['global_wait']}
        END      
    
    END    
    
    IF    not ${IS_EXIST}    Log    Can't find text in Swipe Until and Click function.
    
Swipe Up
    [Documentation]    swipe up for specific value, use when need to click some subcate that get block by advertisement.
    [Arguments]    ${START_Y}=0    ${OFFSET_X}=0    ${OFFSET_Y}=0 
    ${X}    Evaluate    int(${WIDTH}/2)
    Sleep    1
    AppiumLibrary.Swipe    ${X}    ${START_Y}    ${OFFSET_X}    ${OFFSET_Y}
    
Verify Text Exist
    [Documentation]    to verify that the text you want to check is exist
    [Arguments]    ${TEXT}
    ${IS_EXIST}    Run Keyword And Return Status    AppiumLibrary.Wait Until Element Is Visible    android=new UiSelector().text(${TEXT})    ${global_variable['global_wait']}
    FOR    ${COUNTER}    IN RANGE    1    5
            IF    ${IS_EXIST}
                Log    ${TEXT} is exist and already found.
                Exit For Loop
            ELSE
                ${IS_EXIST}    Run Keyword And Return Status    AppiumLibrary.Wait Until Element Is Visible    android=new UiSelector().text(${TEXT})    ${global_variable['global_wait']}
            END              
    END
    IF    not ${IS_EXIST}    Log    Can't find text in Verify Text Exist function.


Screen Capture
    [Documentation]    capture Screen
    AppiumLibrary.Capture Page Screenshot
    

Click Arrow instead of Text
    [Arguments]    ${TEXT}
    ${X}    Evaluate    int(${WIDTH}/2)

    ${IS_EXIST}    Run Keyword And Return Status    AppiumLibrary.Wait Until Element Is Visible    android=new UiSelector().text(${TEXT})    ${global_variable['global_wait']}
    
    FOR    ${COUNTER}    IN RANGE    1    10
      
        IF    ${IS_EXIST}
            AppiumLibrary.Click Element    //*[@text=${TEXT}]/parent::*//*[@resource-id="com.material.components:id/item_arrow"]
            Sleep    2
            Screen Capture    # better use if you want to see the result as a picture.
            Exit For Loop

        ELSE
            AppiumLibrary.Swipe    ${X}    400    0    0
            ${IS_EXIST}    Run Keyword And Return Status    AppiumLibrary.Wait Until Element Is Visible    android=new UiSelector().text(${TEXT})    ${global_variable['global_wait']}
        END      
    
    END    
    
    IF    not ${IS_EXIST}    Log    Can't find text in Swipe Until and Click function.












# ####################################### For testing

Wait Until Element Visible and Click
    [Documentation]    to wait until id is visible and then click
    [Arguments]    ${element}

    ${IS_EXIST}    Run Keyword And Return Status    AppiumLibrary.Wait Until Element Is Visible    ${element}    ${global_variable['global_wait']}

    FOR    ${COUNTER}    IN RANGE    1    ${global_variable['global_count']}
      
        IF    ${IS_EXIST}

            AppiumLibrary.Click Element    ${element}
            Exit For Loop

        ELSE

            ${IS_EXIST}    Run Keyword And Return Status    AppiumLibrary.Wait Until Element Is Visible    ${element}    ${global_variable['global_wait']}
            
        END      
    
    END    
    
    IF    not ${IS_EXIST}    Log    Can't find element id in Wait Until Id Visible and Click function.


Swipe Until Element Visible and Click
    [Documentation]    swipe up until find text.
    [Arguments]    ${element}
    
    ${X}    Evaluate    int(${WIDTH}/2)

    ${IS_EXIST}    Run Keyword And Return Status    AppiumLibrary.Wait Until Element Is Visible    ${element}    ${global_variable['global_wait']}
    
    FOR    ${COUNTER}    IN RANGE    1    10
      
        IF    ${IS_EXIST}

            AppiumLibrary.Click Element    ${element}
            Sleep    2
            Screen Capture    # better use if you want to see the result as a picture.
            Exit For Loop

        ELSE
            AppiumLibrary.Swipe    ${X}    400    0    0
            ${IS_EXIST}    Run Keyword And Return Status    AppiumLibrary.Wait Until Element Is Visible    ${element}    ${global_variable['global_wait']}
        END      
    
    END    
    
    IF    not ${IS_EXIST}    Log    Can't find text in Swipe Until and Click function.
    