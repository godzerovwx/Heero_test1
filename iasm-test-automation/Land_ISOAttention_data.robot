*** Settings ***
Resource  Resource/IASMImportLib.robot

Suite Setup    Open Browser Chrome and use user
Test Teardown	Run Keyword If Test Failed	Capture Page Screenshot
Suite Teardown    Close Browser 

*** Variables ***

*** Test Cases ***
#*** Comments ***
ISO經辦-資產管理-工作區資產查詢-全部資產-查看驗證-準備資料工作
    Login Attention
    Create hard data    ${hard_data_name}  ${department_name}  ${division_name}  ${department_name}  ${division_name}
    Create soft data    ${soft_data_name}  ${department_name}  ${division_name}  ${department_name}  ${division_name}
    Create data data    ${data_data_name}  ${department_name}  ${division_name}  ${department_name}  ${division_name}
    Create paper data    ${paper_data_name}  ${department_name}  ${division_name}  ${department_name}  ${division_name}
    Create people data    ${people_data_name}  ${department_name}  ${division_name}  ${department_name}  ${division_name}
    Close Browser

ISO經辦-盤點計畫-建立盤點計畫驗證
    Open Browser Chrome and use user
    Login ISOAttention
    Create stocktaking plan    ${stocktaking_plan_name}
    ${stocktaking_plan_status} =    Run Keyword And Return Status    Wait Until Element Is Visible    //*[contains(text(),'${agent_error_code_2024}')]
    Run Keyword If  '${stocktaking_plan_status}' == '${true}'    Wait And Click  //*[contains(text(),'${ok}')]
    ...    ELSE    Run Keywords    Wait And Click  //*[contains(text(),'${ok}')]    AND    Verify the testcase is pass (data is existed)    //*[contains(text(),'${stocktaking_plan_name}')]

ISO經辦-盤點計畫-建立盤點計畫重複訊息驗證
    Create stocktaking plan again   ${stocktaking_plan_name}

ISO經辦-盤點計畫-編輯盤點計畫驗證
    ${stocktaking_plan_status} =    Run Keyword And Return Status    Wait Until Element Is Visible    //*[contains(text(),'${stocktaking_plan_name}')]
    Run Keyword If  '${stocktaking_plan_status}' == '${true}'    Run Keywords    Update stocktaking plan    ${stocktaking_plan_name}    ${update_stocktaking_plan_note} 
    ...    AND    Verify the testcase is pass (data is existed)    //*[contains(text(),'${update_stocktaking_plan_note}')]
    
ISO經辦-盤點計畫-刪除盤點計畫驗證
    ${stocktaking_plan_status} =    Run Keyword And Return Status    Wait Until Element Is Visible    //*[contains(text(),'${stocktaking_plan_name}')]
    Run Keyword If  '${stocktaking_plan_status}' == '${true}'    Run Keywords    Delete stocktaking plan    ${stocktaking_plan_name}   
    ...    AND    Verify the testcase is pass (data is not existed)    //*[contains(text(),'${update_stocktaking_plan_note}')]

ISO經辦-盤點計畫-歷史計畫驗證&下載歷史計畫部門驗證
    Wait And Click  //img[@src='/assets/images/history_records_icon.svg']
    ${history_stocktaking_plan_status} =    Run Keyword And Return Status    Verify the testcase is pass (data is existed)   //*[contains(text(),' ${check_history_stocktaking_plan_for_IOS} ')]
    Run Keyword If    '${history_stocktaking_plan_status}' == '${true}'    Run Keywords    Search history stocktaking plan for ISOAttention    AND    Download history stocktaking plan for ISOAttention

ISO經辦-資產管理-工作區資產查詢-全部資產-查看驗證
    Search data    ${hard_data_name}
    Asset data dropdown list Read Verify    ${hard_data_name}
    Reload Page
    Search data    ${soft_data_name}
    Asset data dropdown list Read Verify    ${soft_data_name}
    Reload Page
    Search data    ${data_data_name}
    Asset data dropdown list Read Verify    ${data_data_name}
    Reload Page
    Search data    ${paper_data_name}
    Asset data dropdown list Read Verify    ${paper_data_name}
    Reload Page
    Search data    ${people_data_name}
    Asset data dropdown list Read Verify    ${people_data_name}

ISO經辦-資產管理-已審核資產查詢-全部資產-查看驗證
    Reload Page
    Search has review data    ${has_review_hard_data_name}
    Asset data dropdown list Read Verify    ${has_review_hard_data_name}
    Reload Page
    Search has review data    ${has_review_soft_data_name}
    Asset data dropdown list Read Verify    ${has_review_soft_data_name}
    Reload Page
    Search has review data    ${has_review_data_data_name}
    Asset data dropdown list Read Verify    ${has_review_data_data_name}
    Reload Page
    Search has review data    ${has_review_paper_data_name}
    Asset data dropdown list Read Verify    ${has_review_paper_data_name}
    Reload Page
    Search has review data    ${has_review_people_data_name}
    Asset data dropdown list Read Verify    ${has_review_people_data_name}

ISO經辦-管理-代理人管理新增驗證
    Reload Page
    Agent manage add    ${agent_name_for_ISOAttention}
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${agent_add_reason}')]

ISO經辦-管理-代理人管理新增重複代理人驗證
    Agent manage add again   ${agent_name_for_ISOAttention}

ISO經辦-管理-代理人管理查詢驗證
    Agent manage search
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${agent_add_reason}')]

ISO經辦-管理-代理人管理更新驗證
    Agent manage update
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${agent_update_reason}')]

ISO經辦-管理-代理人管理刪除驗證
    Agent manage delete 
    Verify the testcase is pass (data is not existed)    //*[contains(text(),'${agent_update_reason}')]

ISO經辦-通知驗證
    Reload Page
    Notify 
    Close Browser
    
ISO經辦-資產管理-工作區資產查詢-全部資產-查看驗證-刪除資料工作
    Open Browser Chrome and use user
    Login Attention
    Delete data    ${hard_data_name}
    Delete data    ${soft_data_name}
    Delete data    ${data_data_name}
    Delete data    ${paper_data_name}
    Delete data    ${people_data_name}

*** Keywords ***
    

*** Comments ***

