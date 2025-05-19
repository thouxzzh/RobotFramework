*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${dash_title}    xpath://h6[@class='oxd-text oxd-text--h6 oxd-topbar-header-breadcrumb-module']

*** Keywords ***
verify dashboard page opens
    Element Text Should Be    ${dash_title}    Dashboard