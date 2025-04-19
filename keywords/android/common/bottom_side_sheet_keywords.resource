*** Keywords ***
Bottom Side Sheet Check
    [Documentation]    swipe up until find text, and close tag inside each bottom sheet.
    ...    in bottom sheet feature it will always show sheet at the bottom after you click sub-cate.
    [Arguments]    ${text}
    
    ${x}    Evaluate    int(${width}/2)

    ${is_exist}    Run Keyword And Return Status    AppiumLibrary.Wait Until Element Is Visible    android=UiSelector().text(${text})    ${global_variable['global_wait']}
    # ------------------------- Start of for loop
    FOR    ${counter}    IN RANGE    1    10
      
        IF    ${is_exist}

            AppiumLibrary.Click Element    android=UiSelector().text(${text})
            Exit For Loop

        ELSE
            AppiumLibrary.Swipe    ${x}    400    0    0
            ${is_exist}    Run Keyword And Return Status    AppiumLibrary.Wait Until Element Is Visible    android=UiSelector().text(${text})    ${global_variable['global_wait']}
            
        END      
    
    END    
    # ------------------------- End of for loop
    
    IF    not ${is_exist}    Log    Can't find text within 10 swipe.    # If can't find text at all.

    Sleep    2
    common_keywords.Screen Capture
    Go Back 