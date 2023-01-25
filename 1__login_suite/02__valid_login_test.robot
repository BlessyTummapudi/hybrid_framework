*** Settings ***
Documentation   This file contains valid logins

Resource    ../resource/base/common_functionalities.resource
Test Setup  Launch Browser And Navigate To Url
Test Teardown   Close Browser
Test Template   Valid Login Template

#*** Test Cases ***
#Valid Login Test
 #     Launch Browser And Navigate To Url
  #    Input Text      xpath=//input[@name='password']     admin123
   #   Click Element    xpath=//button[@type='submit']
    #  Element Should Contain    xpath=//div[@class='oxd-topbar-header']    Dashboard

*** Test Cases ***
Valid Login Test1    admin  admin123    Dashboard



*** Keywords ***
Valid Login Template
      [Arguments]    ${username}    ${password}   ${expected_header}
      Input Text      xpath=//input[@name='username']     admin
      Input Text      xpath=//input[@name='password']     admin123
      Click Element    xpath=//button[@type='submit']
      Element Should Contain    xpath=//div[@class='oxd-topbar-header']    Dashboard
