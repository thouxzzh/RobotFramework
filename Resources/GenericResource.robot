*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}      https://www.saucedemo.com/v1/index.html
${browser}  chrome

*** Keywords ***
Open the Browser with URL
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Set Selenium Implicit Wait    5

Close Browser Session
    Close Browser
