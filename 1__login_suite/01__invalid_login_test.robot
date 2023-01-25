*** Settings ***
Documentation   This file contains invalid logins

Resource    ../resource/base/common_functionalities.resource

Library     DataDriver  file=../test_data/orange_data.xlsx      sheet_name=Invalidlogintest

Test Setup  Launch Browser And Navigate To Url
Task Teardown   Close Browser

Test Template   Invalid Login Template

*** Test Cases ***
TC1

*** Keywords ***
Invalid Login Template
    [Arguments]     ${username}  ${password}   ${expected_error}
    Input Text    name=username    ${username}
    Input Password    name=password    ${password}
    Click Element    xpath=//button[normalize-space()='Login']
    Element Should Contain    xpath=//p[normalize-space()='Invalid credentials']    Invalid credentials
     #Launch Browser And Navigate To Url
    #Input Text    xpath=//input[@name='username']    john
    #Input Text    xpath=//input[@name='password']    jack123
    #Click Element    xpath=//button[@type='submit']
    #Click Element    xpath=//button[normalize-space()='Login']  #Can be used in case of text containing spaces[trims the unwanted spces]
    #Element Should Contain    xpath=//p[@class='oxd-text oxd-text--p oxd-alert-content-text']    Invalid credentials
    #Element Should Contain    xpath=//p[normalize-space()='Invalid credentials']    Invalid credentials
    #[Teardown]  Close Browser
    [Teardown]  Close Browser












