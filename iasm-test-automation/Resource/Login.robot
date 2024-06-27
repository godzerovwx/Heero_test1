*** Settings ***
Resource    Action.robot
Resource  IASMImportLib.robot

*** Variables ***


*** Keywords ***
Open Browser Chrome and use user
    #下載路徑寫法
    ${prefs}    Create Dictionary    download.default_directory=${OUTPUT_DIR}
    ${chrome_options}    evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}   add_experimental_option    prefs    ${prefs}
    
    #瀏覽器模式
    Open Browser  ${URL}  chrome    options=${chrome_options}
    Maximize Browser Window
    
    #無瀏覽器模式
    #Open Browser  ${URL}  headlesschrome    options=${chrome_options}
    #Set Window Size    1920    1080

Check_panel_is_ready
#判斷角色登入後頁面是否loading完畢
    FOR    ${i}    IN RANGE    1    10
        ${loading_status} =    Run Keyword And Return Status    Wait Until Element Is Visible    //svg[@class="p-progress-spinner-svg"]    timeout=3
        Run Keyword If  '${loading_status}' == '${true}'    Reload Page
        Exit For Loop If    '${loading_status}' == '${false}'
    END

Login Attention
    Wait And Click  //button[contains(@label,'${Attention}')]
    Check_panel_is_ready
    Sleep    500ms

Login ISOAttention
    Wait And Click  //button[contains(@label,'${ISOAttention}')]
    Check_panel_is_ready
    Sleep    500ms

Login Operations Supervisor
    Wait And Click  //button[contains(@label,'${Operations_Supervisor}')]
    Check_panel_is_ready
    Sleep    500ms

Login System Admin
    Wait And Click  //button[contains(@label,'${System_Admin}')]
    Check_panel_is_ready
    Sleep    500ms

Login Unit Head
    Wait And Click  //button[contains(@label,'${Unit_Head}')]
    Check_panel_is_ready
    Sleep    500ms

Login Cloud Attention
    Wait And Click  //button[contains(@label,'${Cloud_Attention}')]
    Check_panel_is_ready
    Sleep    500ms

Login Cloud Operations Supervisor
    Wait And Click  //button[contains(@label,'${Cloud_Operations_Supervisor}')]
    Check_panel_is_ready
    Sleep    500ms

Login Cloud Unit Head
    Wait And Click  //button[contains(@label,'${Cloud_Unit_Head}')]
    Check_panel_is_ready
    Sleep    500ms
*** Comments ***
