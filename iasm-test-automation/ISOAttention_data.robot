*** Settings ***
Resource  Resource/IASMImportLib.robot

Suite Setup    Open Browser Chrome and use user
Suite Teardown    Close Browser 
Test Teardown	Run Keyword If Test Failed	Capture Page Screenshot

*** Variables ***

*** Test Cases ***
#*** Comments ***
ISO經辦-盤點計畫-建立盤點計畫驗證
    Login ISOAttention
    Create stocktaking plan    ${stocktaking_plan_name}

    ${stocktaking_plan_status} =    Run Keyword And Return Status    Wait Until Element Is Visible    //*[contains(text(),'${agent_error_code_2024}')]
    Run Keyword If  '${stocktaking_plan_status}' == '${true}'    Wait And Click  //*[contains(text(),'確定')]
    ...    ELSE    Run Keywords    Wait And Click  //*[contains(text(),'確定')]    AND    Verify the testcase is pass (data is existed)    //*[contains(text(),'${stocktaking_plan_name}')]
    
    #Verify the testcase is pass (data is existed)    //*[contains(text(),'${stocktaking_plan_name}')]

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
    Search data    ${soft_data_name}
    Asset data dropdown list Read Verify    ${soft_data_name}
    Search data    ${data_data_name}
    Asset data dropdown list Read Verify    ${data_data_name}
    Search data    ${paper_data_name}
    Asset data dropdown list Read Verify    ${paper_data_name}
    Search data    ${people_data_name}
    Asset data dropdown list Read Verify    ${people_data_name}

ISO經辦-資產管理-已審核資產查詢-全部資產-查看驗證
    Reload Page
    Search has review data    ${has_review_hard_data_name}
    Asset data dropdown list Read Verify    ${has_review_hard_data_name}
    Search has review data    ${has_review_soft_data_name}
    Asset data dropdown list Read Verify    ${has_review_soft_data_name}
    Search has review data    ${has_review_data_data_name}
    Asset data dropdown list Read Verify    ${has_review_data_data_name}
    Search has review data    ${has_review_paper_data_name}
    Asset data dropdown list Read Verify    ${has_review_paper_data_name}
    Search has review data    ${has_review_people_data_name}
    Asset data dropdown list Read Verify    ${has_review_people_data_name}

ISO經辦-管理-常用部門組織管理列表驗證
    Most used department management list
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${Most_used_department_list}')]   

ISO經辦-管理-常用部門組織管理編輯驗證
    Most used department management edit
    Verify the testcase is pass (data is not existed)    //*[contains(text(),'${Most_used_department_list}')]  

ISO經辦-管理-常用部門組織管理新增驗證
    Most used department management add
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${Most_used_department_list}')] 

ISO經辦-管理-代理人管理新增驗證  
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
    
*** Keywords ***
    

*** Comments ***

