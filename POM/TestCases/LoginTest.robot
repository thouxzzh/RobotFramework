*** Settings ***
Library    SeleniumLibrary
Test Template    validate unsuccessfull login

*** Variables ***
${URL}       https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${BROWSER}   chrome

*** Test Cases ***
Invalid username                 abc     admin123
Invalid password                 Admin   abc
Special char                     @#$     %^$*
Invalid username and password    abc     abc123

*** Keywords ***
validate unsuccessfull login
    [Arguments]    ${username}    ${password}
    Open the browser with url
    Fill the login form    ${username}    ${password}
    verify the error message is correct
    Close the browser session

Open the browser with url
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Implicit Wait    5s

Fill the login form
    [Arguments]    ${username}    ${password}
    Input Text    name:username    ${username}
    Input Password    name:password    ${password}
    Click Button    xpath://button[@type='submit']
    Sleep    2s

verify the error message is correct
    Element Should Be Visible    xpath://p[@class='oxd-text oxd-text--p oxd-alert-content-text']
    Element Text Should Be    xpath://p[@class='oxd-text oxd-text--p oxd-alert-content-text']    Invalid credentials

Close the browser session
    Close Browser
