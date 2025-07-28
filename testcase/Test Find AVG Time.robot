*** Settings ***
Resource    ${CURDIR}/../import.robot

Library    OperatingSystem
Library    DateTime
Library    String

*** Keywords ***
Create File AVG
    ${PATH}    Set Variable    ${CURDIR}/../results/avg
    Normalize Path    ${PATH}
    ${FILE_PATH}    Set Variable    ${PATH}/avg.txt
    Set Suite Variable    ${FILE_PATH}

    ${IS_EXIST}    Run Keyword And Return Status    Should Exist    ${PATH}
    IF  not ${IS_EXIST}  
        Create Directory    ${PATH}
        Create File    ${FILE_PATH}
        
    END

Start Time
    ${S_TIME}    Get Current Date    result_format=epoch
    Set Suite Variable      ${S_TIME} 
End Time
    ${E_TIME}    Get Current Date    result_format=epoch
    Set Suite Variable        ${E_TIME}
    Cal Time   
Cal Time
    ${DIFF}=    Evaluate    round(${E_TIME} - ${S_TIME})
    Set Suite Variable    ${DIFF}
    Log To Console    Time difference is ${DIFF} seconds
Insert to file
    ${DIFF_STR}    Convert To String    ${DIFF}
    Append To File    ${FILE_PATH}    ${DIFF_STR}\n


Get file content
    ${CONTENT}    Get File    ${FILE_PATH}
    ${LINES}=    Split To Lines    ${CONTENT}  # Split the content into lines
    ${NUM_LINES}=    Get Length    ${LINES}  # Get the number of lines
    Set Suite Variable     ${LINES}
    Set Suite Variable     ${NUM_LINES}

Read file lines
    Get file content
    Set Suite Variable    ${NUM_LINES}
    ${TOTAL}    Set Variable    0
    

    IF    ${NUM_LINES} <= 4
        Insert to file    
    END

    Get file content

    Log To Console    Lines : ${NUM_LINES}
    
    IF     '${NUM_LINES}' == '5'
            FOR    ${COUNTER}    IN RANGE    0    5
                ${INT_VALUE}    Convert To Integer    ${LINES}[${COUNTER}]   
                ${TOTAL}=    Evaluate    int(${INT_VALUE}) + int(${TOTAL})
                # to sum all time diff from file
            END
            ${AVG}=    Evaluate    ${TOTAL} / ${NUM_LINES}
            Append To File    ${FILE_PATH}    AVG Time of testing ${NUM_LINES} times : ${AVG} Sec
            # Get average time then insert in file
    END


*** Test Cases ***
Find Time
    Create File AVG    
    Start Time    
    Sleep    3   
    End Time    
    Read file lines    