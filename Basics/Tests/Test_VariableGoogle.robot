*** Settings ***
Documentation    To validate the Login Form with valid credentials
Library    SeleniumLibrary
Library     Collections
Test Teardown    Close Browser

*** Variables ***
${valid_usname}    Admin
${valid_pass}      admin123
${url}             https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${visible_element}    Forgot your password?

*** Test Cases ***

validate the elements on the login page
    open the browser with url
    verify element on login page

validate successful login
    open the browser with url
    fill the login form
    verify dashboard page open
    verify items in dashboard page

*** Keywords ***

open the browser with url
    Open Browser    ${url}    chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    5s

verify element on login page
    Element Should Contain    xpath=//div[@class='orangehrm-login-forgot']    ${visible_element}

fill the login form
    Input Text    xpath=//input[@name='username']    ${valid_usname}
    Input Text    xpath=//input[@name='password']    ${valid_pass}
    Click Button    xpath=//button[contains(@class,'orangehrm-login-button')]

verify dashboard page open
    Element Should Contain    xpath=//h6[@class='oxd-text oxd-text--h6 oxd-topbar-header-breadcrumb-module']    Dashboard

verify items in dashboard page
    
    @{expectedlist}=    Create List   Admin    PIM    Leave   Time   Recruitment    My Info   Performance  Dashboard   Directory  Maintenance  Claim   Buzz
    Sleep     5s
    ${ele}=    Get WebElements    css:.oxd-main-menu-item
    Sleep     5s
    @{act}=    Create List
    Sleep     5s
    FOR    ${el}    IN    @{ele}
        LOG    ${el.text}
        Append To List    ${act}    ${el.text}  
    END
    Sleep     5s
    Lists Should Be Equal    ${act}     ${expectedlist}


