*** Settings ***
Documentation   This file contains testcases of add valid employee

Resource    ../resource/base/common_functionalities.resource

Library     DataDriver  file=../test_data/orange_data.xlsx      sheet_name=Addvalueemployeetest
Test Setup  Launch Browser And Navigate To Url
Test Teardown   Close Browser
Test Template   Add Valid Employee Template

*** Test Cases ***
Add Valid Employee Test_${test_case}


*** Keywords ***
Add Valid Employee Template
    [Arguments]     ${username}     ${password}      ${firstName}    ${middleName}   ${lastName}    ${expected_1}  ${expected_2}
    Input Text    xpath=//input[@name='username']    ${username}
    Input Text      xpath=//input[@name='password']      ${password}
    Click Element    xpath=//button[@type='submit']
    Click Element    xpath=//a[@href='/web/index.php/pim/viewPimModule']
    Click Element    link=Add Employee
    Input Text      name=firstName     ${firstName}
    Input Text      name=middleName    ${middleName}
    Input Text      name=lastName      ${lastName}
    Sleep    5s
    Click Element    xpath=//button[normalize-space()='Save']
#    Sleep    10s
    Wait Until Page Contains Element    xpath=//h6[normalize-space()='${expected_1}']       30s
    Element Should Contain    xpath=//h6[normalize-space()='${expected_1}']     ${expected_1}  #incase we use class atrribute put some delay for loading[wait until page contains  john ken]

    Element Attribute Value Should Be    name=firstName    value     ${expected_2}
