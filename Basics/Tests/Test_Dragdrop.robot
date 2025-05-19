*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Verify that the user can drag and drop elements
    Open the Browser with url
    Verify the element text before drag
    Drag the element and drop
    Verify the element Text after drag

*** Variables ***
${browser_name}  

*** Keywords ***
Open the Browser with url
    Open Browser    https://demoqa.com/droppable    ${browser_name}
    Maximize Browser Window
    Set Browser Implicit Wait    5

Verify the element text before drag
    Sleep    2s
    Element Text Should Be    id:droppable    Drop here

Drag the element and drop
    Drag and Drop    id:draggable    id:droppable
    Sleep    2s

Verify the element Text after drag
    Element Text Should Be    id:droppable    Dropped!
    Sleep     2s

    