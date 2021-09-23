*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}  https://app.dobronika.cz/

*** Test Cases ***
Prihlaseni spatnym heslem
    Open Browser    ${URL}    chrome
    Wait Until Element Is Visible    //*[@id="id_username"]
    Input text    //*[@id="id_username"]    samko_admin
    Wait Until Element Is Visible    //*[@id="id_password"]
    Input text    //*[@id="id_password"]    aidiawdef2d4.
    click element    //*[@type="submit"]
    Wait Until Element Is Visible    //*[@id="id_password"]
    should be empty  //*[@id="id_password"]
    Close Browser
    #jak overit, ze se po zadani nespravneho hesla vymaze obsah z jednoho nebo druheho pole
 