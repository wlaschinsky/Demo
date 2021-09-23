*** Settings ***
Library  SeleniumLibrary

Test Setup     open browser  ${URL}  ${BROWSER}
Test Teardown   close browser

*** Variables ***
${URL}  https:/app.dobronika.cz/
${BROWSER}  chrome


*** Keywords ***
User name
    [Arguments]  ${user_name}  ${nepovinny}=nejaky text
    wait until element is visible  ${XPATH_SEARCH_INPUT}  timeout=10s
    input text  ${XPATH_SEARCH_INPUT}  ${znacka}
    click element  ${XPATH_SEARCH_BTN}
    log  ${nepovinny}

Password
    [Arguments]  ${znacka}
    wait until element is visible  ${XPATH_RESULT_H1}
    element should contain  ${XPATH_RESULT_H1}  ${znacka}  V nadpisu není hledaná značka

*** Test Cases ***
TC_001 Login with right passsword
    [Documentation]  Zalogovani jako qa_samko se spravnym heslem.
    [Tags]  smoke
    maximize browser window
    User name    qa_samko
    Password  12345


TC_002 Login with incorrect passsword
    [Documentation]  Zalogovani jako qa_samko s nespravnym heslem.
    [Tags]  smoke
    maximize browser window
    Vyhledani znacky  Xiaomi
    Kontrola vysledku  Xiaomi
