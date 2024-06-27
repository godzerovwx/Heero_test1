*** Settings ***
Resource    Action.robot
Resource  IASMImportLib.robot

*** Variables ***


*** Keywords ***
Read data
#查看資產
    [Arguments]  ${locator}
    Wait And Click    //td[contains(text(),'${locator}')]
    Sleep    500ms 
    Mouse Over    //tr[@class='p-element p-selectable-row ng-star-inserted p-highlight']//td[@class='dropdown']
    Mouse Over    //tr[@class='p-element p-selectable-row ng-star-inserted p-highlight']//li[1]//*[contains(text(),' ${look} ')]
    Sleep    500ms
    Wait And Click    //tr[@class='p-element p-selectable-row ng-star-inserted p-highlight']//li[1]//*[contains(text(),' ${look} ')]
    Sleep    500ms

Read data change
#查看資產中的異動紀錄
    Wait And Click    //*[text()='${change_records_title}']
    Sleep    500ms

Read data history
#查看資產中的狀態歷程
    Wait And Click    //*[text()='${status_history_title}']
    Sleep    500ms

Read data edit project
#查看資產頁面中的顯示本次編輯項目
    Wait And Click    //div[@class='p-inputswitch p-component']
    
Update data
#更新資產
    [Arguments]    ${update_locator}
    Mouse Over    //tr[@class='p-element p-selectable-row ng-star-inserted p-highlight']//td[@class='dropdown']
    Mouse Over    //tr[@class='p-element p-selectable-row ng-star-inserted p-highlight']//li[2]//*[contains(text(),' ${edit} ')]
    Sleep    500ms
    Wait And Click    //tr[@class='p-element p-selectable-row ng-star-inserted p-highlight']//li[2]//*[contains(text(),' ${edit} ')]
    Wait And Click    //*[text()='${ok}']
    #變更科及  
    ${division_name_status} =     Run Keyword And Return Status    Wait Until Element Is Visible    //form/div[1][@class="detail-container"]/div[1]/div[1]//p-dropdown[2]//span[text()='${division_name}']
    Run Keyword If  '${division_name_status}' == '${true}'    Update Division    ${division_name_update}
    ...    ELSE     Update Division    ${division_name}

    Run Keyword If    '${update_locator}' == '${update_data_data_name}' or '${update_locator}' == '${update_has_review_data_data_name}' or '${update_locator}' == '${has_review_data_data_name}'   Wait And Input    //input[@formcontrolname='nameOfAsset2']    ${update_locator}
    ...    ELSE IF    '${update_locator}' == '${update_people_data_name}' or '${update_locator}' == '${update_has_review_people_data_name}' or '${update_locator}' == '${has_review_people_data_name}'    Wait And Input    //input[@formcontrolname='nameOfPersonnel']    ${update_locator}
    ...    ELSE    Wait And Input    //input[@formcontrolname='nameOfAsset']    ${update_locator}
    Wait And Click    //*[text()='${save}']
    Wait And Click    //app-confirm-dialog[contains(@class,'ng-star-inserted')]//span[contains(text(),'${cancel}')]
    Sleep    500ms

Update Division
#更新科別
    [Arguments]    ${update_division_name}
    Wait And Click   //div/p-dropdown[2]/div[@class ='input-field units-dropdown p-dropdown p-component p-dropdown-clearable']
    Wait And Click    //li[@aria-label='${update_division_name}']

Copy data
#複製資產
    [Arguments]    ${copy_locator}
    Mouse Over    //tr[@class='p-element p-selectable-row ng-star-inserted p-highlight']//td[@class='dropdown']
    Mouse Over    //tr[@class='p-element p-selectable-row ng-star-inserted p-highlight']//li[3]//*[contains(text(),' ${copy} ')]
    Sleep    500ms
    Wait And Click    //tr[@class='p-element p-selectable-row ng-star-inserted p-highlight']//li[3]//*[contains(text(),' ${copy} ')]
    Wait And Click    //*[text()='${ok}']
    Run Keyword If    '${copy_locator}' == '${copy_data_data_name}' or '${copy_locator}' == '${copy_has_review_data_data_name}'   Wait And Input    //input[@formcontrolname='nameOfAsset2']    ${copy_locator}
    ...    ELSE IF    '${copy_locator}' == '${copy_people_data_name}' or '${copy_locator}' == '${copy_has_review_people_data_name}'    Wait And Input    //input[@formcontrolname='nameOfPersonnel']    ${copy_locator}
    ...    ELSE    Wait And Input    //input[@formcontrolname='nameOfAsset']    ${copy_locator}
    Wait And Click    //*[text()='${save}']
    Wait And Click    //app-confirm-dialog[contains(@class,'ng-star-inserted')]//span[contains(text(),'${cancel}')]
    Sleep    500ms

Asset data dropdown list Read Verify
#驗證科級主管的查看頁面
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
    Wait And Click    //*[contains(text(),'${ok}')]

Asset data dropdown list Read Verify for Operations Supervisor
#驗證科級主管的查看頁面-資產資訊
    [Arguments]      ${data_name}
    Read data edit project
    Mouse Over    //span[@class='field-hover ng-star-inserted']
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${data_name}')]

Edit_cloud_data
#編輯雲端資產
    [Arguments]    ${data_number}
    Mouse Over    //table/tbody/tr[${data_number}]//td[@class='dropdown']
    Mouse Over    //table/tbody/tr[${data_number}]//li[2]//*[contains(text(),' ${edit} ')]
    Sleep    500ms
    Wait And Click    //table/tbody/tr[${data_number}]//li[2]//*[contains(text(),' ${edit} ')]
    Wait And Click    //*[text()='${ok}']

Edit_cloud_data_software
#編輯 未編輯過的雲端軟體資產
    [Arguments]  ${cus_dep_name}   ${cus_div_name} 
    Wait And Click    //p-dropdown[@formcontrolname="apId"]
    Wait And Click    //p-dropdownitem[1]/li
    Wait And Click    //p-dropdown[@formcontrolname="cloudComputingModel"]
    Wait And Click   //li[@aria-label='${cloud_service_IaaS}']
    Wait And Input    //input[@formcontrolname="assetUsage"]    cloud_soft_assetUsage
    Wait And Input    //input[@formcontrolname="operatingSystem"]    cloud_soft_operatingSystem
    Wait And Input    //textarea[@formcontrolname="databaseName"]    cloud_soft_databaseName
    Wait And Input    //textarea[@formcontrolname="databaseServer"]    cloud_soft_databaseServer
    Wait And Input    //input[@formcontrolname="systemApplication"]    cloud_soft_systemApplication
    Wait And Click   //p-dropdown[@formcontrolname='processPersonalInformation']
    Wait And Click   //li[@aria-label='${yes}']
    Wait And Click    //p-dropdown[@formcontrolname="customerSecurityData"]
    Wait And Click   //li[@aria-label='${yes}']
    Wait And Click   //p-dropdown[@formcontrolname='backupFrequency']
    Wait And Click   //li[@aria-label="${every_month}"]
    Wait And Input    //input[@formcontrolname="outsourceMaintenance"]    cloud_soft_outsourceMaintenance
    Wait And Click    //*[text()='${select_dep}']
    Wait And Click    //li[@aria-label='${cus_dep_name}']
    Wait And Click   //*[text()='${select_div}']
    Wait And Click    //li[@aria-label='${cus_div_name}']
    Wait And Input    //input[@formcontrolname="custodian"]    cloud_soft_custodian
    Wait And Click    //p-multiselect[@formcontrolname="departmentUsage"]
    Wait And Click    //div[@class='p-checkbox-box']
    Wait And Click    //span[@class="p-multiselect-close-icon pi pi-times"]

Edit_cloud_data_data
#編輯 未編輯過的雲端資料資產
    [Arguments]  ${cus_dep_name}   ${cus_div_name} 
    Wait And Click    //p-dropdown[@formcontrolname="apId"]
    Wait And Click    //p-dropdownitem[1]/li
    Wait And Click    //p-dropdown[@formcontrolname="cloudComputingModel"]
    Wait And Click   //li[@aria-label='${cloud_service_IaaS}']
    Wait And Click   //p-dropdown[@formcontrolname='personalGroup']
    Wait And Click    //p-dropdownitem[1]/li
    Wait And Click    //p-multiselect[@formcontrolname="personalInformation"]
    Wait And Click    //div[@class='p-checkbox-box']
    Wait And Click    //span[@class="p-multiselect-close-icon pi pi-times"]
    Wait And Input    //input[@formcontrolname="dataRetentionPeriodC"]    cloud_data_dataRetentionPeriodC
    Wait And Click    //p-dropdown[@formcontrolname="methodOfDataBackup"]
    Wait And Click    //p-dropdownitem[1]/li
    Wait And Click   //p-dropdown[@formcontrolname='backupFrequency']
    Wait And Click   //li[@aria-label="${every_month}"]
    Wait And Click    //*[text()='${select_dep}']
    Wait And Click    //li[@aria-label='${cus_dep_name}']
    Wait And Click   //*[text()='${select_div}']
    Wait And Click    //li[@aria-label='${cus_div_name}']
    Wait And Input    //input[@formcontrolname="custodian"]    cloud_data_custodian
    Wait And Click    //p-multiselect[@formcontrolname="departmentUsage"]
    Wait And Click    //div[@class='p-checkbox-box']
    Wait And Click    //span[@class="p-multiselect-close-icon pi pi-times"]

*** Comments ***
