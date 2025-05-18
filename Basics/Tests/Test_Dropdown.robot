*** Settings ***
Library   SeleniumLibrary

*** Test Cases ***
select options in DropDown
    Open the Browser with url
    Select the dropdown options API by value
    Select the dropdown options Microsoft by index
    Select the dropdown options CSS by label
    Close Browser

*** Keywords ***
Open the Browser with url
    open Browser    https://demo.automationtesting.in/Register.html    chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    2

Select the dropdown options API by value
    Select From List By value                xpath://select[@id='Skills']    APIs

Select the dropdown options Microsoft by index
    Select From List By Index               xpath://select[@id='Skills']          43

Select the dropdown options CSS by label
    Select From List By Label              xpath://select[@id='Skills']         CSS

