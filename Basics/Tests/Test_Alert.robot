*** Settings ***
Library     SeleniumLibrary

*** Test Cases ***
Verify the simple alert
    Open the browser with url
    Verify and accept the alert
    Verify and dismiss the alert
    Click an alert with TextBox

*** Keywords ***
Open the browser with url
    Open Browser    https://demo.automationtesting.in/Alerts.html    chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    5

Verify and accept the alert
    Click Element    xpath=(//a[@class='analystic'])[1]
    Click Button     xpath=//button[@class='btn btn-danger']
    Sleep    1s
    Alert Should Be Present   I am an alert box!   


Verify and dismiss the alert
    Click Element    xpath:(//a[@class='analystic'])[2]    
    Click Button    xpath://button[@class='btn btn-primary']
    Sleep    5s
    Alert Should Be Present    Press a Button !    DISMISS

Click an alert with Textbox
   Click Element    xpath:(//a[@class='analystic'])[3]
   Click Button     xpath://button[@class='btn btn-info']
   Sleep   3s
   Input Text Into Alert    Tester
   Sleep   3s
   Page Should Contain   Tester
  


