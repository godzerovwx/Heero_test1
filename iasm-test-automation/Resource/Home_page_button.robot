*** Settings ***
Resource    Action.robot
Resource  IASMImportLib.robot

*** Variables ***


*** Keywords ***
Send data
#經辦-送審功能
    [Arguments]  ${locator}
    Wait And Click  //td[contains(text(),'${locator}')]
    Wait And Click  //*[text()='${send_status}']
    Wait And Click  //*[text()='${ok}']
    Wait And Click  //div[@class='p-dialog-footer']//span[@class='p-button-label']
    Wait And Click  //*[text()='${home_table_string_send}']
    Sleep    500ms

Stop data
#經辦-停用功能
    [Arguments]  ${locator}
    Wait And Click  //*[text()='${home_table_string_edit_return}']
    Wait And Click  //td[contains(text(),'${locator}')]
    Wait And Click  //*[text()='${stop_status}']
    Wait And Click  //*[text()='${ok}']
    Wait And Click  //div[@class='p-dialog-footer']//span[@class='p-button-label']
    Sleep    500ms

Delete data
#經辦-刪除功能
    [Arguments]  ${locator}
    Wait And Click  //td[contains(text(),'${locator}')]
    Wait And Click  //*[contains(text(),'${delete_status}')]
    Wait And Click    //*[text()='${ok}']
    Wait And Click    //button[contains(@class,'p-element p-button functional-button p-component ng-star-inserted')]
    Sleep    500ms

Cancel Send data
#經辦-取消送審功能
    Wait And Click  //*[text()='${cancel_send_status}']
    Wait And Click  //*[text()='${ok}']
    Wait And Click  //button[@class='p-element p-button functional-button p-component ng-star-inserted']
    Wait And Click  //*[text()='${home_table_string_send}']

Return data
#科級主管-退件功能
    Wait And Click  //*[text()='${return_status}']
    Wait And Click  //button[@class='p-element p-button functional-button p-component ng-star-inserted']
    Wait And Click  //button[@class='p-element p-button functional-button p-component ng-star-inserted']

Review data
#科級主管-覆核功能
    [Arguments]  ${locator}
    Wait And Click  //td[contains(text(),'${locator}')]
    Wait And Click  //*[text()='${review_status}']
    Wait And Click  //*[text()='${ok}']
    Wait And Click  //*[text()='${ok}']


*** Comments ***
