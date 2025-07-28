*** Keywords ***
Bottom Side Sheet Check
    [Documentation]    swipe up until find text, and close tag inside each bottom sheet.
    ...    in bottom sheet feature it will always show sheet at the bottom after you click sub-cate.
    [Arguments]    ${TEXT}
    
    ${X}    Evaluate    int(${WIDTH}/2)

    ${IS_EXIST}    Run Keyword And Return Status    AppiumLibrary.Wait Until Element Is Visible    android=UiSelector().text(${TEXT})    ${global_variable['global_wait']}
    # ------------------------- Start of for loop
    FOR    ${COUNTER}    IN RANGE    1    10
      
        IF    ${IS_EXIST}

            AppiumLibrary.Click Element    android=UiSelector().text(${TEXT})
            Exit For Loop

        ELSE
            AppiumLibrary.Swipe    ${X}    400    0    0
            ${IS_EXIST}    Run Keyword And Return Status    AppiumLibrary.Wait Until Element Is Visible    android=UiSelector().text(${TEXT})    ${global_variable['global_wait']}
            
        END      
    
    END    
    # ------------------------- End of for loop
    
    IF    not ${IS_EXIST}    Log    Can't find text within 10 swipe.    # If can't find text at all.

    Sleep    2
    common_keywords.Screen Capture
    Go Back 