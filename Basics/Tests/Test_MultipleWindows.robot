*** Settings ***
Library    SeleniumLibrary
*** Test Cases ***
verify the windows
    open the browser with url
    select the button to swtich to child window
    # verify the child window is opened
    # verify the user is switched back to parent window

*** Keywords ***
open the browser with url
    Open Browser    url=https://demo.automationtesting.in/Windows.html    browser=chrome
    Maximize Browser Window
    Set Browser Implicit Wait    5

select the button to swtich to child window
    Click Element    xpath=//ul[@class='nav nav-tabs nav-stacked']/li[2]/a
    Click Button     css:.btn-primary
    Sleep    2s
    ${childs}=    Get Window Handles
    ${count}=     Get Length    ${childs}
    Log To Console    Number of open windows: ${count}

    FOR    ${window}    IN    @{childs}
        Switch Window    ${window}
        ${title}=    Get Title
        Log To Console    Window Title: ${title}
        Sleep    1s
    END

    
verify the child window is opened
    Switch Window    NEW
    Page Should Contain      Selenium automates browsers
    Sleep    5s
verify the user is switched back to parent window
    Switch Window    MAIN
    Page Should Contain    Automation Demo Site
    Sleep    5s






# *** Settings ***
# Documentation     To access the dropdown and print number of options
# Library           SeleniumLibrary
# Task Teardown    close browser session

# *** Variables ***
# ${url}            https://demo.automationtesting.in/Windows.html
# @{main}
# @{child}

# *** Test Cases ***
# Select Option In The Dropdown
#     Open The Browser With URL
#     select the button to switch to child window
#     # verify the child window is opened
#     # verify the user switched back to parent window
#     # verify the user is switched back to child window


# *** Keywords ***
# Open The Browser With URL
#     Open Browser    ${url}    chrome
#     Maximize Browser Window
#     Set Selenium Implicit Wait    5

# select the button to switch to child window
#     ${main}=   Get Window Titles
#     ${main_id}=    Get Window Handles
#     Log To Console    ${main}
#     Log To Console    ${main_id}
#     Click Element     xpath://*[@id="Tabbed"]/a/button
#     ${child}=    Get Window Handles
#     Log To Console    ${child}

   
# # verify the child window is opened


    
# # verify the user switched back to parent window

# # verify the user is switched back to child window

# Close Browser session
#     Close Browser