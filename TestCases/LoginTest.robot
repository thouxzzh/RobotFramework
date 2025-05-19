*** Settings ***
Library           SeleniumLibrary
Library           DataDriver    file=../Resources/Logindata.csv    encoding=utf_8    dialect=unix
Resource          ../Resources/GenericResource.robot
Test Template     Validate unsuccessful Login    

*** Variables ***
${username}    
${password}

*** Test Cases ***
Invalid Login with ${username}    ${password}

*** Keywords ***
Validate unsuccessful Login
    [Arguments]    ${username}    ${password}
    Open the Browser with URL
    Fill the login form    ${username}    ${password}

    IF    "${username}"=="locked_out_user"
        Page Should Contain    Epic sadface:
    ELSE
        Wait Until Location Is   https://www.saucedemo.com/v1/inventory.html    timeout=10
        Location Should Be       https://www.saucedemo.com/v1/inventory.html
    END
    Close Browser Session

Fill the login form
    [Arguments]    ${username}    ${password}
    Input Text    xpath://input[@name='user-name']    ${username}
    Input Password    xpath://input[@name='password']    ${password}
    Click Button    xpath=//input[@class='btn_action']




