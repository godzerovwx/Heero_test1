*** Settings ***
Resource    Action.robot

*** Variables ***


*** Keywords ***
Send data
    [Arguments]  ${locator}
    Wait And Click  //td[contains(text(),'${locator}')]
    Wait And Click  //*[text()='送審']
    Wait And Click  //*[text()='確定']
    Wait And Click  //div[@class='p-dialog-footer']//span[@class='p-button-label']
    Wait And Click  //*[text()='送審中']
    Sleep    500ms

Stop data
    [Arguments]  ${locator}
    Wait And Click  //*[text()='編輯中/退回件']
    Wait And Click  //td[contains(text(),'${locator}')]
    Wait And Click  //*[text()='停用']
    Wait And Click  //*[text()='確定']
    Wait And Click  //div[@class='p-dialog-footer']//span[@class='p-button-label']
    Sleep    500ms

Delete data
    [Arguments]  ${locator}
    Wait And Click  //td[contains(text(),'${locator}')]
    Wait And Click  //*[contains(text(),'刪除')]
    Wait And Click    //*[text()='確定']
    Wait And Click    //button[contains(@class,'p-element p-button functional-button p-component ng-star-inserted')]
    Sleep    500ms

Cancel Send data
    Wait And Click  //*[text()='取消送審']
    Wait And Click  //*[text()='確定']
    Wait And Click  //button[@class='p-element p-button functional-button p-component ng-star-inserted']
    Wait And Click  //*[text()='送審中']

Return data
    Wait And Click  //*[text()='退件']
    Wait And Click  //button[@class='p-element p-button functional-button p-component ng-star-inserted']
    Wait And Click  //button[@class='p-element p-button functional-button p-component ng-star-inserted']

Review data
    [Arguments]  ${locator}
    Wait And Click  //td[contains(text(),'${locator}')]
    Wait And Click  //*[text()='覆核']
    Wait And Click  //*[text()='確定']
    Wait And Click  //*[text()='確定']


*** Comments ***
