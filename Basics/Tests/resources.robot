*** Settings ***
Documentation     A resource file with reusable keywords and variables
Library    SeleniumLibrary


*** Variables ***
${valid_username}    Admin
${valid_password}      admin123
${invalid_username}    1234
${invalid_password}    56789
${url}             https://opensource-demo.orangehrmlive.com/web/index.php/auth/login


*** Keywords ***

Open the Browser with URL
   Create Webdriver   Chrome
   Go To     ${url}
   Maximize Browser Window
   Set Selenium Implicit Wait    5

Close Browser Session
   Close Browser