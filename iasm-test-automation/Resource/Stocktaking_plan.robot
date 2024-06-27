*** Settings ***
Resource    Action.robot
Resource  IASMImportLib.robot

*** Variables ***


*** Keywords ***
Create stocktaking plan
#新增 盤點計畫
    [Arguments]  ${stocktaking_plan_name}
    Wait And Click  //i[@class='pi pi-list']
    Wait And Click  //div[@class='w-100 d-flex justify-content-end']/button[@class='p-element p-button action-button p-component']
    Wait And Input    //div[@class='field justify-content-center']/input[@type='text']    ${stocktaking_plan_name}
    Wait And Click  //div[contains(@class,'grid p-fluid d-flex flex-column')]/div[2]//p-calendar[2]
    Select calendar month and day    ${investigate_start_day}
    Wait And Click  //div[contains(@class,'grid p-fluid d-flex flex-column')]/div[2]//p-calendar[1]
    Select calendar month and day    ${investigate_end_day}
    Wait And Click  //div[contains(@class,'grid p-fluid d-flex flex-column')]/div[3]//p-calendar[2]
    Select calendar month and day    ${review_start_day}
    Wait And Click  //div[contains(@class,'grid p-fluid d-flex flex-column')]/div[3]//p-calendar[1]
    Select calendar month and day     ${review_end_day}
    Wait And Click  //div[contains(@class,'p-element p-multiselect-label-container')]
    Wait And Click  //div[contains(@class,'p-checkbox-box')]
    Wait And Click    //button[contains(@class,'p-multiselect-close')]
    #Wait And Click  //button[contains(@class,'p-ripple p-element p-multiselect-close p-link ng-star-inserted')]
    Wait And Input    //div[contains(@class,'grid p-fluid d-flex flex-column')]/div[5]/textarea   ${stocktaking_plan_note}
    Wait And Click  //button[contains(@class,'p-element p-button functional-button p-component')]
    Sleep    500ms

Create stocktaking plan again
#再一次新增 盤點計畫
    [Arguments]  ${stocktaking_plan_name}
    Wait And Click  //i[@class='pi pi-list']
    Wait And Click  //div[@class='w-100 d-flex justify-content-end']/button[@class='p-element p-button action-button p-component']
    Wait And Input    //div[@class='field justify-content-center']/input[@type='text']    ${stocktaking_plan_name}
    Wait And Click  //div[contains(@class,'grid p-fluid d-flex flex-column')]/div[2]//p-calendar[2]
    Select calendar month and day    ${investigate_start_day}
    Wait And Click  //div[contains(@class,'grid p-fluid d-flex flex-column')]/div[2]//p-calendar[1]
    Select calendar month and day    ${investigate_end_day}
    Wait And Click  //div[contains(@class,'grid p-fluid d-flex flex-column')]/div[3]//p-calendar[2]
    Select calendar month and day    ${review_start_day}
    Wait And Click  //div[contains(@class,'grid p-fluid d-flex flex-column')]/div[3]//p-calendar[1]
    Select calendar month and day     ${review_end_day}
    Wait And Click  //div[contains(@class,'p-element p-multiselect-label-container')]
    Wait And Click  //div[contains(@class,'p-checkbox-box')]
    Wait And Click    //button[contains(@class,'p-multiselect-close')]
    #Wait And Click  //button[contains(@class,'p-ripple p-element p-multiselect-close p-link ng-star-inserted')]
    Wait And Input    //div[contains(@class,'grid p-fluid d-flex flex-column')]/div[5]/textarea   ${stocktaking_plan_note}
    Wait And Click  //button[contains(@class,'p-element p-button functional-button p-component')]
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${agent_error_code_2024}')]
    Wait And Click  //*[contains(text(),'${ok}')]
    Sleep    500ms

Update stocktaking plan
#更新 盤點計畫
    [Arguments]    ${stocktaking_plan_name}    ${update_stocktaking_plan_note}
    ${ancestor_element_xpath} =    Get Ancestor XPath    //td[1]/*[contains(text(),'${stocktaking_plan_name}')]    ancestor::tr
    Mouse Over    ${ancestor_element_xpath}/td[8]
    Mouse Over    ${ancestor_element_xpath}/td[8]//*[contains(text(),'${edit}')]
    Sleep    1s
    Wait And Click    ${ancestor_element_xpath}/td[8]//*[contains(text(),'${edit}')]
    Wait And Input    //div[contains(@class,'grid p-fluid d-flex flex-column')]/div[5]/textarea   ${update_stocktaking_plan_note}
    Wait And Click  //button[contains(@class,'p-element p-button functional-button p-component')]
    Wait And Click  //*[contains(text(),'${ok}')]
    Sleep    500ms

Delete stocktaking plan
#刪除 盤點計畫
    [Arguments]  ${delete_stocktaking_plan_name}
    ${ancestor_element_xpath} =    Get Ancestor XPath    //td[1]/*[contains(text(),'${delete_stocktaking_plan_name}')]    ancestor::tr
    Mouse Over    ${ancestor_element_xpath}/td[8]
    Mouse Over    ${ancestor_element_xpath}/td[8]//*[contains(text(),'${delete}')]
    Sleep    1s
    Wait And Click    ${ancestor_element_xpath}/td[8]//*[contains(text(),'${delete}')]
    Wait And Click  //button[contains(@class,'p-element p-button functional-button p-component')]
    Wait And Click  //*[contains(text(),'${ok}')]
    Sleep    500ms

Click stocktaking plan
#點擊 盤點計畫
    [Arguments]  ${stocktaking_plan_name}
    Wait And Click    //i[@class='pi pi-list']
    Wait And Click    //tbody[@class='p-element p-datatable-tbody']//div[contains(text(),' ${stocktaking_plan_name} ')]
    ${stocktaking_plan_status} =    Run Keyword And Return Status    Wait Until Element Is Visible    //label[contains(text(),' ${stocktaking_plan_not_access_message} ')]
    Run Keyword If  '${stocktaking_plan_status}' == '${true}'    Click stocktaking plan to Verify the plan not access
    ...    ELSE     Click stocktaking plan to review     
    Sleep    500ms

Click stocktaking plan to Verify the plan not access
#點擊 尚未到審核期間，無法覆核 的盤點計畫
    Verify the testcase is pass (data is existed)    //label[contains(text(),' ${stocktaking_plan_not_access_message} ')] 
    Wait And Click    //*[text()='${ok}']
    Sleep    500ms
Click stocktaking plan to review
#點擊 已在審核期間的 盤點計畫
    Wait And Click    //div[@class='input-field p-dropdown p-component']//span[contains(text(),'${select_parameter}')]
    Wait And Click    //ul[@role='listbox']//li[contains(text(),' ${department_name} ')]
    ${stocktaking_plan_review_all_data_status} =    Run Keyword And Return Status    Wait Until Element Is Visible    //span[contains(text(),'${stocktaking_plan_review_all_data}')]
    Run Keyword If  '${stocktaking_plan_review_all_data_status}' == '${true}'    Check all data of stocktaking plan to review 
    ...    ELSE    Wait And Click    //span[text()='${stocktaking_download_excel}']
    Sleep    500ms
Check all data of stocktaking plan to review 
#驗證 覆核部門所有資產流程
    Wait And Click    //button[@icon='pi pi-check-circle']//span[contains(text(),'${stocktaking_plan_review_all_data}')]
    ${stocktaking_plan_data_status} =    Run Keyword And Return Status    Wait Until Element Is Visible    //div[contains(text(),' ${stocktaking_plan_review_all_data_not_access_message}')]
    Run Keyword If  '${stocktaking_plan_data_status}' == '${true}'    Click not all data of stocktaking plan to review
    ...    ELSE     Click all data of stocktaking plan to review first
    Sleep    500ms

Click all data of stocktaking plan to review first
#覆核部門所有資產成功, 下載excel
    Wait And Click    //span[text()='${ok}']
    Wait And Click    //span[text()='${stocktaking_download_excel}']
    Sleep    500ms

Click not all data of stocktaking plan to review
#覆核部門所有資產失敗, 點擊訊息
    Verify the testcase is pass (data is existed)    //div[contains(text(),' ${stocktaking_plan_review_all_data_not_access_message}')]
    Wait And Click    //app-confirm-dialog[@class='ng-star-inserted']//*[text()='${ok}']
    Sleep    500ms

Search history stocktaking plan for Unit Head
#驗證歷史盤點計畫流程
    Wait And Click  //div[@aria-hidden='false']//div[@class='p-datatable-wrapper']//tbody/tr[1]
    Wait And Click    //div[@class='input-field p-dropdown p-component']//span[contains(text(),'${select_parameter}')]
    Wait And Click    //ul[@role='listbox']/p-dropdownitem[1]/li
    Sleep    3s
    ${stocktaking_plan_download_status} =    Run Keyword And Return Status    Element Should Be Disabled    //button[@icon='pi pi-file']
    Run Keyword If  '${stocktaking_plan_download_status}' == '${true}'   History stocktaking plan has not approved for Unit Head
    ...    ELSE    Download history stocktaking plan for Unit Head
    Sleep    500ms

History stocktaking plan has not approved for Unit Head
#驗證歷史盤點計畫無法下載
    Element Should Be Disabled    //button[@icon='pi pi-file']
    Sleep    500ms
Download history stocktaking plan for Unit Head
#驗證歷史盤點計畫可以下載
    Wait And Click    //span[text()='${stocktaking_download_excel}']
    Sleep    3s

Search history stocktaking plan for ISOAttention
#驗證ISO經辦歷史盤點計畫可以下載流程
    Wait And Click  //div[@aria-hidden='false']//div[@class='p-datatable-wrapper']//tbody/tr[1]
    Sleep    500ms
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${history_stocktaking_plan}')]

Download history stocktaking plan for ISOAttention
#驗證ISO經辦歷史盤點計畫可以下載
    Wait And Click  //button[@icon='pi pi-download']
    Wait And Click  //button/span[contains(@class,'p-dialog-header-close-icon')]
    Sleep    500ms
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${history_stocktaking_table_name}')]


*** Comments ***
