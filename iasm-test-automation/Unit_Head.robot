*** Settings ***
Resource  Resource/IASMImportLib.robot

Suite Setup    Open Browser Chrome and use user
Suite Teardown    Close Browser 
Test Teardown	Run Keyword If Test Failed	Capture Page Screenshot

*** Variables ***

*** Test Cases ***
#*** Comments ***
單位主管-盤點計畫-點擊盤點計畫驗證-準備資料工作
    Close Browser
    Open Browser Chrome and use user
    Login ISOAttention
    Create stocktaking plan    ${stocktaking_plan_name}
    Close Browser

單位主管-盤點計畫-點擊盤點計畫驗證-無資料狀態
    Open Browser Chrome and use user
    Login Unit Head
    Click stocktaking plan    ${stocktaking_plan_name}
    Close Browser

單位主管-盤點計畫-點擊盤點計畫驗證-刪除資料工作
    Open Browser Chrome and use user
    Login ISOAttention
    Wait And Click  //i[@class='pi pi-list']
    Sleep    500ms
    Delete stocktaking plan    ${stocktaking_plan_name}
    Close Browser
*** Test Cases ***
單位主管-盤點計畫-歷史計畫驗證
    Open Browser Chrome and use user
    Login Unit Head
    Wait And Click  //i[@class='pi pi-list']
    Wait And Click  //img[@src='/assets/images/history_records_icon.svg']
    Sleep    3s
    ${history_stocktaking_plan_status} =    Run Keyword And Return Status    Wait Until Element Is Enabled   //div[@aria-hidden='false']//td[contains(text(),'${uncheck_history_stocktaking_plan_for_UH}') or contains(text(),'${check_history_stocktaking_plan_for_UH}')]
    Run Keyword If    '${history_stocktaking_plan_status}' == '${true}'    Search history stocktaking plan for Unit Head

單位主管-資產管理-工作區資產查詢-全部資產-查看驗證
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

單位主管-資產管理-已審核資產查詢-全部資產-查看驗證
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

單位主管-報表列印-資產清冊驗證
    Download excel

單位主管-管理-使用者權限管理搜尋驗證
    Wait And Click  //i[@class='pi pi-book']
    Wait And Click  //a[@href='/system/users']
    User permission management search    ${permission_management_Operations_Supervisor}
    Verify the testcase is pass (data is existed)    //*[text()='${permission_management_Operations_Supervisor}']

單位主管-管理-使用者權限管理新增驗證
    Wait And Click  //button[@icon='pi pi-file-edit']
    User permission management add - dep div    ${Operations_Supervisor}
    User permission management add - dep div again    ${Operations_Supervisor}
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${permission_management_error_code_same_role}')]
    Wait And Click    //*[contains(text(),'${ok}')]
    User permission management save
    User permission management search    ${permission_management_Operations_Supervisor}
    Wait And Click    //button[@icon='pi pi-file-edit']
    Verify the testcase is pass (data is existed)    //*[text()=' ${permission_management_department_name} ']
    Verify the testcase is pass (data is existed)    //*[text()=' - ${permission_management_division_name} ']

單位主管-管理-使用者權限管理刪除驗證
    User permission management delete    ${Operations_Supervisor}
    User permission management save
    User permission management search    ${permission_management_Operations_Supervisor}
    Wait And Click    //button[@icon='pi pi-file-edit']
    Verify the testcase is pass (data is not existed)    //*[text()=' ${permission_management_department_name} ']
    Verify the testcase is pass (data is not existed)    //*[text()=' - ${permission_management_division_name} ']

單位主管-管理-代理人管理新增驗證   
    Agent manage add    ${agent_name_for_Unit_Head}
    Verify the testcase is pass (data is existed)    //*[text()='${agent_add_reason}']

單位主管-管理-代理人管理新增重複代理人驗證
    Agent manage add again   ${agent_name_for_Unit_Head}

單位主管-管理-代理人管理查詢驗證
    Agent manage search
    Verify the testcase is pass (data is existed)    //*[text()='${agent_add_reason}']

單位主管-管理-代理人管理更新驗證
    Agent manage update
    Verify the testcase is pass (data is existed)    //*[text()='${agent_update_reason}']

單位主管-管理-代理人管理刪除驗證
    Agent manage delete 
    Verify the testcase is pass (data is not existed)    //*[text()='${agent_update_reason}']

單位主管-通知驗證
    Reload Page
    Notify 
    
*** Keywords ***

*** Comments ***

