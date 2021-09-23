*** Settings ***
Library  SeleniumLibrary

*** Test Cases ***
Prihlaseni spravnym heslem
    Open Browser    https://app.dobronika.cz/    chrome
    Wait Until Element Is Visible    //*[@id="id_username"]
    Input text    //*[@id="id_username"]    samko_admin
    Wait Until Element Is Visible    //*[@id="id_password"]
    Input text    //*[@id="id_password"]    Admin1234.
    click element    //*[@type="submit"]
    sleep  3s
    Close Browser    


Prihlaseni spatnym heslem
    Open Browser    https://app.dobronika.cz/    chrome
    Wait Until Element Is Visible    //*[@id="id_username"]
    Input text    //*[@id="id_username"]    samko_admin
    Wait Until Element Is Visible    //*[@id="id_password"]
    Input text    //*[@id="id_password"]    Adin1234.
    click element    //*[@type="submit"]
    Wait Until Element Is Visible    //*[@id="id_password"]
    should be empty  //*[@id="id_password"]
    Close Browser
    #jak overit, ze se po zadani nespravneho hesla vymaze obsah z jednoho nebo druheho pole
    #open UERL pokud se prihlasim a chci navigovat dal bez klikani