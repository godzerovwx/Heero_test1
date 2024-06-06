*** Settings ***
Resource    Action.robot
Library  Selenium2Library    run_on_failure=Nothing

*** Variables ***

*** Keywords ***
Notify
    Wait And Click  //i[@class='pi pi-bell']
    #回傳布林值, 判斷xpath(小鈴鐺的紅點)是否存在
    ${notify_status} =     Run Keyword And Return Status    Wait Until Element Is Visible    //div[contains(@class,'login-info')]//i[contains(@class,'p-overlay-badge')]
    Run Keyword If  '${notify_status}' == '${true}'    Select user for notify 
    ...    ELSE     Verify the testcase is pass (data is existed)    //*[text()=' ${empty_string} ']  
    Sleep    500ms

Select user for notify
    ${user_name} =    Get Text    //div[@loadingsize='small']//span[contains(@class,'p-element p-dropdown-label p-inputtext ng-star-inserted')]
    Run Keyword If    ' ${user_name} ' == ' ${Attention} '    Notify for Attention action
    ...    ELSE IF    ' ${user_name} ' == ' ${Operations_Supervisor} '    Notify for Operations Supervisor action
    ...    ELSE    Verify the testcase is pass (data is existed)    //*[contains(text(),'${start_string}')]         

Notify for Attention action
    Wait And Click  //h5[contains(text(),'${start_string}')]
    Verify the testcase is pass (data is existed)    //*[text()='${home_table_string_edit_return}'] 

Notify for Operations Supervisor action
    Wait And Click  //h5[text()='${have_assets_review}']
    Verify the testcase is pass (data is existed)    //*[text()='${home_table_string_send}'] 

*** Comments ***

