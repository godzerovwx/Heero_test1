*** Settings ***
Library  Selenium2Library 
Library    AutoItLibrary
Resource    Variables\\Variables.robot
Resource    Asset_management.robot
Resource    Home_page_button.robot
Resource    Login.robot

*** Variables ***

*** Keywords ***
prereq to has review data
    Create hard data    ${has_review_hard_data_name}
    Create soft data    ${has_review_soft_data_name}
    Create data data    ${has_review_data_data_name}
    Create paper data    ${has_review_paper_data_name}
    Create people data    ${has_review_people_data_name}
    Send data    ${has_review_hard_data_name}
    Wait And Click  //*[text()='編輯中/退回件']
    Send data    ${has_review_soft_data_name}
    Wait And Click  //*[text()='編輯中/退回件']
    Send data    ${has_review_data_data_name}
    Wait And Click  //*[text()='編輯中/退回件']
    Send data    ${has_review_paper_data_name}
    Wait And Click  //*[text()='編輯中/退回件']
    Send data    ${has_review_people_data_name}
    Wait And Click  //*[text()='編輯中/退回件']
    Close Browser
    Open Browser Chrome and use user
    Login Operations Supervisor
    Review data    ${has_review_hard_data_name}
    Review data    ${has_review_soft_data_name}
    Review data    ${has_review_data_data_name}
    Review data    ${has_review_paper_data_name}
    Review data    ${has_review_people_data_name}
    Close Browser
    Open Browser Chrome and use user
    Login Attention
Wait And Input
  [Arguments]  ${locator}  ${text}
  Wait Until Element Is Visible   ${locator}   
  Wait Until Element Is Enabled   ${locator} 
  Wait Until Page Contains Element   ${locator}    10s
  Sleep    500ms
  Input Text  ${locator}  ${text}
  
Wait And Click
  [Arguments]  ${locator}
  Wait Until Element Is Visible   ${locator}   
  Wait Until Element Is Enabled   ${locator}   
  Wait Until Page Contains Element   ${locator}    10s
  Sleep    500ms
  Click Element  ${locator}

Select calendar month and day
    [Arguments]  ${locator_day}
    Wait And Click    //div[contains(@class,'p-datepicker-header')]/button[2]
    Wait And Click    //span[not(contains(@class,'p-disabled')) and contains(text(),'${locator_day}')]

Upload file
  SLEEP  1s
  Control Send     開啟    ${EMPTY}    [CLASS:Edit; INSTANCE:1]   ${path_to_update_excel_file}
  SLEEP  1s
  Control Click    開啟    ${EMPTY}    Button1
  SLEEP  1s

#找父節點Xpath
Get Ancestor XPath
    [Arguments]    ${child_xpath}    ${ancestor_expression}
    ${ancestor_xpath} =    Set Variable    ${child_xpath}/${ancestor_expression}
    [Return]    ${ancestor_xpath}
    SLEEP  500ms

Verify the testcase is pass (data is existed)
    [Arguments]      ${locator}
    Wait Until Element Is Visible    ${locator}    10s
    Sleep    1s

Verify the testcase is pass (data is not existed)
    [Arguments]      ${locator}
    Wait Until Element Is Not Visible    ${locator}    10s
    Sleep    1s
    
*** Comments ***