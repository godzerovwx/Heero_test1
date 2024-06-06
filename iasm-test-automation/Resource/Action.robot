*** Settings ***
Library  Selenium2Library    run_on_failure=Nothing
#Library    AutoItLibrary
Resource    Variables/Variables.robot
Resource    Asset_management.robot
Resource    Home_page_button.robot
Resource    Login.robot

*** Variables ***

*** Keywords ***
prereq to has review hard data
    Create hard data    ${has_review_hard_data_name}  ${department_name}  ${division_name}  ${department_name}  ${division_name}
    Send data    ${has_review_hard_data_name}
    Wait And Click  //*[text()='${home_table_string_edit_return}']
    Close Browser
    Open Browser Chrome and use user
    Login Operations Supervisor
    Review data    ${has_review_hard_data_name}
    Close Browser
    Open Browser Chrome and use user
    Login Attention

prereq to has review soft data
    Create soft data    ${has_review_soft_data_name}  ${department_name}  ${division_name}  ${department_name}  ${division_name}
    Send data    ${has_review_soft_data_name}
    Wait And Click  //*[text()='${home_table_string_edit_return}']
    Close Browser
    Open Browser Chrome and use user
    Login Operations Supervisor
    Review data    ${has_review_soft_data_name}
    Close Browser
    Open Browser Chrome and use user
    Login Attention

prereq to has review data data
    Create data data    ${has_review_data_data_name}  ${department_name}  ${division_name}  ${department_name}  ${division_name}
    Send data    ${has_review_data_data_name}
    Wait And Click  //*[text()='${home_table_string_edit_return}']
    Close Browser
    Open Browser Chrome and use user
    Login Operations Supervisor
    Review data    ${has_review_data_data_name}
    Close Browser
    Open Browser Chrome and use user
    Login Attention

prereq to has review paper data
    Create paper data    ${has_review_paper_data_name}  ${department_name}  ${division_name}  ${department_name}  ${division_name}
    Send data    ${has_review_paper_data_name}
    Wait And Click  //*[text()='${home_table_string_edit_return}']
    Close Browser
    Open Browser Chrome and use user
    Login Operations Supervisor
    Review data    ${has_review_paper_data_name}
    Close Browser
    Open Browser Chrome and use user
    Login Attention

prereq to has review people data
    Create people data    ${has_review_people_data_name}  ${department_name}  ${division_name}  ${department_name}  ${division_name}
    Send data    ${has_review_people_data_name}
    Wait And Click  //*[text()='${home_table_string_edit_return}']
    Close Browser
    Open Browser Chrome and use user
    Login Operations Supervisor
    Review data    ${has_review_people_data_name}
    Close Browser
    Open Browser Chrome and use user
    Login Attention

Wait And Input
    [Arguments]  ${locator}  ${text}
    Wait Until Element Is Visible   ${locator}   timeout=30s
    Wait Until Element Is Enabled   ${locator}    timeout=30s
    Wait Until Page Contains Element   ${locator}    timeout=30s
    Sleep    500ms
    Input Text  ${locator}  ${text}

Wait And Click
    [Arguments]  ${locator}
    Wait Until Element Is Visible   ${locator}     timeout=30s
    Wait Until Element Is Enabled   ${locator}    timeout=30s   
    Wait Until Page Contains Element   ${locator}    timeout=30s
    Sleep    500ms
    Click Element  ${locator}

Select calendar month and day
    [Arguments]  ${locator_day}
    Wait And Click    //div[contains(@class,'p-datepicker-header')]/button[2]
    Wait And Click    //span[not(contains(@class,'p-disabled')) and contains(text(),'${locator_day}')]

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