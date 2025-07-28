*** Keywords ***
Introduction Read
    [Documentation]    use this in Introduction sector, to click next and done.
    [Arguments]    ${TO_SELECT}    ${TO_CLOSE}=${False}    

    Swipe Until and Click    ${TO_SELECT}
    ${IS_EXIST}    Run Keyword And Return Status    AppiumLibrary.Wait Until Element Is Visible    id=${NEXT_BTN}    ${global_variable['global_wait']}
    
    IF    '${TO_CLOSE}' == '${True}'
        common_keywords.Screen Capture
        Wait Until Id Visible and Click    ${INSTUCTION_CLOSE}
        Sleep    3
    ELSE
        # Start of for loop
        FOR    ${COUNTER}    IN RANGE    1    10

            # Check if it see next button or not
            IF    ${IS_EXIST}
                
                # Check if the button is still next or done
                ${IS_DONE}    Run Keyword And Return Status    AppiumLibrary.Wait Until Element Is Visible    android=UiSelector().text("DONE")    timeout=3
                IF    ${IS_DONE}
                    common_keywords.Screen Capture
                    AppiumLibrary.Click Element    id=${NEXT_BTN}
                    Exit For Loop
                END
                common_keywords.Screen Capture
                AppiumLibrary.Click Element    id=${NEXT_BTN}

            ELSE

                common_keywords.Screen Capture
                Fail   Can't find next button nor done.
                Go Back

            END


        END
        # End of for loop

        
    END