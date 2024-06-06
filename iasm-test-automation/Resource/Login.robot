*** Settings ***
Resource    Action.robot

*** Variables ***
${ZOOM_LEVEL}    0.75

*** Keywords ***
Open Browser Chrome and use user
#下載路徑寫法
    ${prefs}    Create Dictionary    download.default_directory=${OUTPUT_DIR}
    ${chrome_options}    evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}   add_experimental_option    prefs    ${prefs}
    
    Open Browser  ${URL}  chrome    options=${chrome_options}
    Maximize Browser Window
    #Set Zoom Level    ${ZOOM_LEVEL}
    #Open Browser  ${URL}  headlesschrome    options=${chrome_options}
    #Set Window Size    1920    1080

Set Zoom Level
    [Arguments]    ${zoom_level}
    Execute JavaScript    document.body.style.zoom="${zoom_level}"

Login Attention
    Wait And Click  //button[contains(@label,'${Attention}')]
    Wait Until Element Is Not Visible    //*[contains(text(),'loading')]    timeout=90
    Sleep    500ms

Login Dep Attention
    Wait And Click  //button[contains(@label,'${dep_Attention}')]
    Wait Until Element Is Not Visible    //*[contains(text(),'loading')]    timeout=90
    Sleep    500ms

Login ISOAttention
    Wait And Click  //button[contains(@label,'${ISOAttention}')]
    Wait Until Element Is Not Visible    //*[contains(text(),'loading')]    timeout=90
    Sleep    500ms

Login Operations Supervisor
    Wait And Click  //button[contains(@label,'${Operations_Supervisor}')]
    Wait Until Element Is Not Visible    //*[contains(text(),'loading')]    timeout=90
    Sleep    500ms

Login System Admin
    Wait And Click  //button[contains(@label,'${System_Admin}')]
    Wait Until Element Is Not Visible    //*[contains(text(),'loading')]    timeout=90
    Sleep    500ms

Login Unit Head
    Wait And Click  //button[contains(@label,'${Unit_Head}')]
    Wait Until Element Is Not Visible    //*[contains(text(),'loading')]    timeout=90
    Sleep    500ms

Login Dep Unit Head
    Wait And Click  //button[contains(@label,'${dep_Unit_Head}')]
    Wait Until Element Is Not Visible    //*[contains(text(),'loading')]    timeout=90
    Sleep    500ms

Login Cloud Attention
    Wait And Click  //button[contains(@label,'${Cloud_Attention}')]
    Wait Until Element Is Not Visible    //*[contains(text(),'loading')]    timeout=90
    Sleep    500ms

Login Cloud Operations Supervisor
    Wait And Click  //button[contains(@label,'${Cloud_Operations_Supervisor}')]
    Wait Until Element Is Not Visible    //*[contains(text(),'loading')]    timeout=90
    Sleep    500ms

Login Cloud Unit Head
    Wait And Click  //button[contains(@label,'${Cloud_Unit_Head}')]
    Wait Until Element Is Not Visible    //*[contains(text(),'loading')]    timeout=90
    Sleep    500ms
*** Comments ***
