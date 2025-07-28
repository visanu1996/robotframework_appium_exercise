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
    ${width}    Get Window Width
    ${height}    Get Window Height

    Set Global Variable    ${width}
    Set Global Variable    ${height}

    # Log To Console    Window Widht : ${width}
    # Log To Console    Window Height : ${height}


Wait Until Text Is Visible and Click
    [Documentation]    to wait until the text is visible and then click
    [Arguments]    ${text}

    ${is_exist}    Run Keyword And Return Status    AppiumLibrary.Wait Until Element Is Visible    android=UiSelector().text(${text})    ${global_variable['global_wait']}
    
    FOR    ${counter}    IN RANGE    1    ${global_variable['global_count']}
      
        IF    ${is_exist}

            AppiumLibrary.Click Element    android=UiSelector().text(${text})
            Exit For Loop

        ELSE

            ${is_exist}    Run Keyword And Return Status    AppiumLibrary.Wait Until Element Is Visible    android=UiSelector().textContains(${text})    ${global_variable['global_wait']}
            
        END      
    
    END    
    
    IF    not ${is_exist}    Log    Can't find text in Wait Until Text Is Visible and Click function.

Wait Until Id Visible and Click
    [Documentation]    to wait until id is visible and then click
    [Arguments]    ${id}

    ${is_exist}    Run Keyword And Return Status    AppiumLibrary.Wait Until Element Is Visible    id=${id}    ${global_variable['global_wait']}

    FOR    ${counter}    IN RANGE    1    ${global_variable['global_count']}
      
        IF    ${is_exist}

            AppiumLibrary.Click Element    id=${id}
            Exit For Loop

        ELSE

            ${is_exist}    Run Keyword And Return Status    AppiumLibrary.Wait Until Element Is Visible    id=${id}    ${global_variable['global_wait']}
            
        END      
    
    END    
    
    IF    not ${is_exist}    Log    Can't find element id in Wait Until Id Visible and Click function.


Swipe Until and Click
    [Documentation]    swipe up until find text.
    [Arguments]    ${text}
    
    ${x}    Evaluate    int(${width}/2)

    ${is_exist}    Run Keyword And Return Status    AppiumLibrary.Wait Until Element Is Visible    android=UiSelector().text(${text})    ${global_variable['global_wait']}
    
    FOR    ${counter}    IN RANGE    1    10
      
        IF    ${is_exist}

            AppiumLibrary.Click Element    android=UiSelector().text(${text})
            Sleep    2
            Screen Capture    # better use if you want to see the result as a picture.
            Exit For Loop

        ELSE
            AppiumLibrary.Swipe    ${x}    400    0    0
            ${is_exist}    Run Keyword And Return Status    AppiumLibrary.Wait Until Element Is Visible    android=UiSelector().text(${text})    ${global_variable['global_wait']}
        END      
    
    END    
    
    IF    not ${is_exist}    Log    Can't find text in Swipe Until and Click function.
    
Swipe Up
    [Documentation]    swipe up for specific value, use when need to click some subcate that get block by advertisement.
    [Arguments]    ${start_y}=0    ${offset_x}=0    ${offset_y}=0 
    ${x}    Evaluate    int(${width}/2)
    Sleep    1
    AppiumLibrary.Swipe    ${x}    ${start_y}    ${offset_x}    ${offset_y}
    
Verify Text Exist
    [Documentation]    to verify that the text you want to check is exist
    [Arguments]    ${text}
    ${is_exist}    Run Keyword And Return Status    AppiumLibrary.Wait Until Element Is Visible    android=UiSelector().text(${text})    ${global_variable['global_wait']}
    FOR    ${counter}    IN RANGE    1    5
            IF    ${is_exist}
                Log    ${text} is exist and already found.
                Exit For Loop
            ELSE
                ${is_exist}    Run Keyword And Return Status    AppiumLibrary.Wait Until Element Is Visible    android=UiSelector().text(${text})    ${global_variable['global_wait']}
            END              
    END
    IF    not ${is_exist}    Log    Can't find text in Verify Text Exist function.


Screen Capture
    [Documentation]    capture Screen
    AppiumLibrary.Capture Page Screenshot



    


