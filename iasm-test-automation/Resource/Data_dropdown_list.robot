*** Settings ***
Resource    Action.robot

*** Variables ***


*** Keywords ***
Read data
    [Arguments]  ${locator}
    Wait And Click    //td[contains(text(),'${locator}')]
    Sleep    500ms 
    Mouse Over    //tr[@class='p-element p-selectable-row ng-star-inserted p-highlight']//td[@class='dropdown']
    Mouse Over    //tr[@class='p-element p-selectable-row ng-star-inserted p-highlight']//li[1]//*[contains(text(),' 查看 ')]
    Sleep    500ms
    Wait And Click    //tr[@class='p-element p-selectable-row ng-star-inserted p-highlight']//li[1]//*[contains(text(),' 查看 ')]
    Sleep    500ms

Read data change
    Wait And Click    //*[text()='異動紀錄']
    Sleep    500ms

Read data history
    Wait And Click    //*[text()='狀態歷程']
    Sleep    500ms

Read data edit project
    Wait And Click    //div[@class='p-inputswitch p-component']
    
Update data
    [Arguments]    ${update_locator}
    Mouse Over    //tr[@class='p-element p-selectable-row ng-star-inserted p-highlight']//td[@class='dropdown']
    Mouse Over    //tr[@class='p-element p-selectable-row ng-star-inserted p-highlight']//li[2]//*[contains(text(),' 編輯 ')]
    Sleep    500ms
    Wait And Click    //tr[@class='p-element p-selectable-row ng-star-inserted p-highlight']//li[2]//*[contains(text(),' 編輯 ')]
    Wait And Click    //*[text()='確定']
    Run Keyword If    '${update_locator}' == '${update_data_data_name}' or '${update_locator}' == '${update_has_review_data_data_name}' or '${update_locator}' == '${has_review_data_data_name}'   Wait And Input    //input[@formcontrolname='assetNameType2']    ${update_locator}
    ...    ELSE IF    '${update_locator}' == '${update_people_data_name}' or '${update_locator}' == '${update_has_review_people_data_name}' or '${update_locator}' == '${has_review_people_data_name}'    Wait And Input    //input[@formcontrolname='nameOfPersonnel']    ${update_locator}
    ...    ELSE    Wait And Input    //input[@formcontrolname='nameOfAsset']    ${update_locator}
    Wait And Click    //*[text()='儲存']
    Wait And Click    //app-confirm-dialog[contains(@class,'ng-star-inserted')]//span[contains(text(),'取消')]
    Sleep    500ms

Copy data
    [Arguments]    ${copy_locator}
    Mouse Over    //tr[@class='p-element p-selectable-row ng-star-inserted p-highlight']//td[@class='dropdown']
    Mouse Over    //tr[@class='p-element p-selectable-row ng-star-inserted p-highlight']//li[3]//*[contains(text(),' 複製 ')]
    Sleep    500ms
    Wait And Click    //tr[@class='p-element p-selectable-row ng-star-inserted p-highlight']//li[3]//*[contains(text(),' 複製 ')]
    Wait And Click    //*[text()='確定']
    Run Keyword If    '${copy_locator}' == '${copy_data_data_name}' or '${copy_locator}' == '${copy_has_review_data_data_name}'   Wait And Input    //input[@formcontrolname='assetNameType2']    ${copy_locator}
    ...    ELSE IF    '${copy_locator}' == '${copy_people_data_name}' or '${copy_locator}' == '${copy_has_review_people_data_name}'    Wait And Input    //input[@formcontrolname='nameOfPersonnel']    ${copy_locator}
    ...    ELSE    Wait And Input    //input[@formcontrolname='nameOfAsset']    ${copy_locator}
    Wait And Click    //*[text()='儲存']
    Wait And Click    //app-confirm-dialog[contains(@class,'ng-star-inserted')]//span[contains(text(),'取消')]
    Sleep    500ms

Asset data dropdown list Read Verify
    [Arguments]      ${data_name}
    Read data    ${data_name}
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${read_data_title}')]
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${data_name}')]
    ${user_status} =     Run Keyword And Return Status    Wait Until Element Is Visible    //*[contains(text(),'${read_data_edit_project}')]
    Run Keyword If  '${user_status}' == '${true}'    Asset data dropdown list Read Verify for Operations Supervisor    ${data_name}
    Read data change
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${change_time_name}')]
    Read data history
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${history_time_name}')]
    Wait And Click    //*[contains(text(),'確定')]

Asset data dropdown list Read Verify for Operations Supervisor
    [Arguments]      ${data_name}
    Read data edit project
    Mouse Over    //span[@class='field-hover ng-star-inserted']
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${data_name}')]
*** Comments ***
