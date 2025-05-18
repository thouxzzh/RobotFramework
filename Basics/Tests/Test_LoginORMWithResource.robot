*** Settings ***
Documentation    Tests to login to Login Page
Library     SeleniumLibrary
Resource    resources.robot

*** Variables ***
${Login_Error_Message}    xpath://div[@class='oxd-alert-content oxd-alert-content--error']
${Dashboard_Text}     xpath://h6[text()="Dashboard"]

*** Test Cases ***

Validate Unsuccessul Login
     [Tags]   Smoke Regression
     Open the Browser with URL
     Fill the login form     ${invalid_username}    ${invalid_password}
     verify error message is correct 
     Close Browser Session

Validate successful Login
    [Tags]   UIT
    Open the Browser with URL
    Fill the login form    ${valid_username}     ${valid_password}
    verify Dashboard page opens
    Close Browser Session

*** Keywords ***
Fill the login form
    [Arguments]     ${username}     ${password}
    Input Text     css:input[name=username]    ${username}
    Input Password    css:input[name=password]    ${password}
    Click Button    xpath://button[@class="oxd-button oxd-button--medium oxd-button--main orangehrm-login-button"]

verify error message is correct
    Element Text Should be    ${Login_Error_Message}    Invalid credentials

verify Dashboard page opens
    Element Text Should be    ${Dashboard_Text}    Dashboard

