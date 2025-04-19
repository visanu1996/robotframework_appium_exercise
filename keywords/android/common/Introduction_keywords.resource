*** Keywords ***
Introduction Read
    [Documentation]    use this in Introduction sector, to click next and done.
    [Arguments]    ${toSelect}    ${toClose}=${False}    

    Swipe Until and Click    ${toSelect}
    ${is_exist}    Run Keyword And Return Status    AppiumLibrary.Wait Until Element Is Visible    id=${next_btn}    ${global_variable['global_wait']}
    
    IF    '${toClose}' == '${True}'
        common_keywords.Screen Capture
        Wait Until Id Visible and Click    ${Instruction_close}
        Sleep    3
    ELSE
        # Start of for loop
        FOR    ${counter}    IN RANGE    1    10

            # Check if it see next button or not
            IF    ${is_exist}
                
                # Check if the button is still next or done
                ${is_done}    Run Keyword And Return Status    AppiumLibrary.Wait Until Element Is Visible    android=UiSelector().text("DONE")    timeout=3
                IF    ${is_done}
                    common_keywords.Screen Capture
                    AppiumLibrary.Click Element    id=${next_btn}
                    Exit For Loop
                END
                common_keywords.Screen Capture
                AppiumLibrary.Click Element    id=${next_btn}

            ELSE

                common_keywords.Screen Capture
                Fail   Can't find next button nor done.
                Go Back

            END


        END
        # End of for loop

        
    END