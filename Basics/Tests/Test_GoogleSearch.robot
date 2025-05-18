*** Settings ***
Library  SeleniumLibrary
*** Test Cases ***
Sending the values and asserting it
  Open Browser  url=https://www.google.com/      browser=chrome
  Input Text    //textarea[@class='gLFyf']    Selenium
  Sleep   2s
  Click Button    xpath:(//input[@class='gNO89b'])[1]
  Element Should Contain    xpath=//*[text()="Selenium WebDriver:"]    Selenium WebDriver:
  Close Browser

Sending the values and asserting the values
  Open Browser  url=https://www.google.com/      browser=chrome
  Sleep    2s
  Input Text    //textarea[@class='gLFyf']    RobotFramework
  Sleep   2s
  Click Button    xpath:(//input[@class='gNO89b'])[1]
  Element Should Contain    xpath=(//span[text()='Robot Framework'])[1]    Robotframework
  Close Browser      

