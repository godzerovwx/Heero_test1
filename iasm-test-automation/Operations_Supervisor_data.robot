*** Settings ***
Resource  Resource/IASMImportLib.robot

Suite Setup    Open Browser Chrome and use user
Suite Teardown    Close Browser 
Test Teardown	Run Keyword If Test Failed	Capture Page Screenshot

*** Variables ***

*** Test Cases ***
#*** Comments ***
科級主管-首頁-送審中頁面-硬體資料驗證
    Login Operations Supervisor
    Asset data dropdown list Read Verify    ${update_has_review_hard_data_name}
    Wait And Click    //td[contains(text(),'${update_has_review_hard_data_name}')]

科級主管-首頁-送審中頁面-軟體資料驗證
    Asset data dropdown list Read Verify   ${update_has_review_soft_data_name}
    Wait And Click    //td[contains(text(),'${update_has_review_soft_data_name}')]

科級主管-首頁-送審中頁面-資料資料驗證
    Asset data dropdown list Read Verify    ${update_has_review_data_data_name}
    Wait And Click    //td[contains(text(),'${update_has_review_data_data_name}')]

科級主管-首頁-送審中頁面-紙本資料驗證
    Asset data dropdown list Read Verify    ${update_has_review_paper_data_name}
    Wait And Click    //td[contains(text(),'${update_has_review_paper_data_name}')]

科級主管-首頁-送審中頁面-人員資料驗證
    Asset data dropdown list Read Verify   ${update_has_review_people_data_name}
    Wait And Click    //td[contains(text(),'${update_has_review_people_data_name}')]

科級主管-復原全部資料步驟
    Wait And Click    //td[contains(text(),'${update_has_review_hard_data_name}')] 
    Wait And Click    //td[contains(text(),'${update_has_review_soft_data_name}')]
    Wait And Click    //td[contains(text(),'${update_has_review_data_data_name}')]
    Wait And Click    //td[contains(text(),'${update_has_review_paper_data_name}')]
    Wait And Click    //td[contains(text(),'${update_has_review_people_data_name}')]
    Return data
    Close Browser
    Open Browser Chrome and use user
    Login Attention
    Wait And Click    //td[contains(text(),'${update_has_review_hard_data_name}')]
    Update data    ${has_review_hard_data_name}
    Send data    ${has_review_hard_data_name}
    Wait And Click  //*[text()='${home_table_string_edit_return}']
    Wait And Click    //td[contains(text(),'${update_has_review_soft_data_name}')]
    Update data    ${has_review_soft_data_name}
    Send data    ${has_review_soft_data_name}
    Wait And Click  //*[text()='${home_table_string_edit_return}']
    Wait And Click    //td[contains(text(),'${update_has_review_data_data_name}')]
    Update data    ${has_review_data_data_name}
    Send data    ${has_review_data_data_name}
    Wait And Click  //*[text()='${home_table_string_edit_return}']
    Wait And Click    //td[contains(text(),'${update_has_review_paper_data_name}')]
    Update data    ${has_review_paper_data_name}
    Send data    ${has_review_paper_data_name}
    Wait And Click  //*[text()='${home_table_string_edit_return}']
    Wait And Click    //td[contains(text(),'${update_has_review_people_data_name}')]
    Update data    ${has_review_people_data_name}
    Send data    ${has_review_people_data_name}
    Close Browser

科級主管-首頁-送審中頁面-覆核資產驗證
    Open Browser Chrome and use user
    Login Operations Supervisor
    Review data    ${has_review_hard_data_name}
    Wait And Click  //img[@class='img1 tab-icon ng-star-inserted']
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${has_review_hard_data_name}')]
    Wait And Click    //*[contains(text(),'${home_table_string_send}')]
    Review data    ${has_review_soft_data_name}
    Wait And Click  //img[@class='img1 tab-icon ng-star-inserted']
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${has_review_soft_data_name}')]
    Wait And Click    //*[contains(text(),'${home_table_string_send}')]
    Review data    ${has_review_data_data_name}
    Wait And Click  //img[@class='img1 tab-icon ng-star-inserted']
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${has_review_data_data_name}')]
    Wait And Click    //*[contains(text(),'${home_table_string_send}')]
    Review data    ${has_review_paper_data_name}
    Wait And Click  //img[@class='img1 tab-icon ng-star-inserted']
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${has_review_paper_data_name}')]
    Wait And Click    //*[contains(text(),'${home_table_string_send}')]
    Review data    ${has_review_people_data_name}
    Wait And Click  //img[@class='img1 tab-icon ng-star-inserted']
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${has_review_people_data_name}')]

科級主管-首頁-已審核頁面-硬體資料驗證
    Asset data dropdown list Read Verify    ${has_review_hard_data_name}

科級主管-首頁-已審核頁面-軟體資料驗證
    Asset data dropdown list Read Verify   ${has_review_soft_data_name}

科級主管-首頁-已審核頁面-資料資料驗證
    Asset data dropdown list Read Verify    ${has_review_data_data_name}

科級主管-首頁-已審核頁面-紙本資料驗證
    Asset data dropdown list Read Verify   ${has_review_paper_data_name}

科級主管-首頁-已審核頁面-人員資料驗證
    Asset data dropdown list Read Verify   ${has_review_people_data_name}

科級主管-資產管理-工作區資產查詢-全部資產-查看驗證-準備資料工作
    Close Browser
    Open Browser Chrome and use user
    Login Attention
    Create hard data    ${hard_data_name}  ${department_name}  ${division_name}  ${department_name}  ${division_name}
    Create soft data    ${soft_data_name}  ${department_name}  ${division_name}  ${department_name}  ${division_name}
    Create data data    ${data_data_name}  ${department_name}  ${division_name}  ${department_name}  ${division_name}
    Create paper data    ${paper_data_name}  ${department_name}  ${division_name}  ${department_name}  ${division_name}
    Create people data    ${people_data_name}  ${department_name}  ${division_name}  ${department_name}  ${division_name}
    Close Browser

科級主管-資產管理-工作區資產查詢-硬體資產-查看驗證
    Open Browser Chrome and use user
    Login Operations Supervisor
    Search data    ${hard_data_name}
    Asset data dropdown list Read Verify    ${hard_data_name}

科級主管-資產管理-工作區資產查詢-軟體資產-查看驗證
    Reload Page
    Search data    ${soft_data_name}
    Asset data dropdown list Read Verify    ${soft_data_name}

科級主管-資產管理-工作區資產查詢-資料資產-查看驗證
    Reload Page
    Search data    ${data_data_name}
    Asset data dropdown list Read Verify    ${data_data_name}

科級主管-資產管理-工作區資產查詢-紙本資產-查看驗證
    Reload Page
    Search data    ${paper_data_name}
    Asset data dropdown list Read Verify    ${paper_data_name}

科級主管-資產管理-工作區資產查詢-人員資產-查看驗證
    Reload Page
    Search data    ${people_data_name}
    Asset data dropdown list Read Verify    ${people_data_name}

科級主管-資產管理-已審核資產查詢-硬體資產-查看驗證
    Reload Page
    Search has review data    ${has_review_hard_data_name}
    Asset data dropdown list Read Verify    ${has_review_hard_data_name}

科級主管-資產管理-已審核資產查詢-軟體資產-查看驗證
    Reload Page
    Search has review data    ${has_review_soft_data_name}
    Asset data dropdown list Read Verify    ${has_review_soft_data_name}

科級主管-資產管理-已審核資產查詢-資料資產-查看驗證
    Reload Page
    Search has review data    ${has_review_data_data_name}
    Asset data dropdown list Read Verify    ${has_review_data_data_name}

科級主管-資產管理-已審核資產查詢-紙本資產-查看驗證
    Reload Page
    Search has review data    ${has_review_paper_data_name}
    Asset data dropdown list Read Verify    ${has_review_paper_data_name}
    
科級主管-資產管理-已審核資產查詢-人員資產-查看驗證
    Reload Page
    Search has review data    ${has_review_people_data_name}
    Asset data dropdown list Read Verify    ${has_review_people_data_name}

科級主管-報表列印-資產清冊驗證
    Reload Page
    Download excel

科級主管-管理-使用者權限管理搜尋驗證
    Wait And Click  //i[@class='pi pi-book']
    Wait And Click  //a[@href='/system/users']
    User permission management search    ${permission_management_Attention}
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${permission_management_Attention}')]

科級主管-管理-使用者權限管理新增驗證
    Wait And Click  //button[@icon='pi pi-file-edit']
    User permission management add - dep div    ${Attention}    ${permission_management_department_name}    ${permission_management_division_name}
    User permission management add - dep div    ${Attention}    ${permission_management_department_name}    ${permission_management_division_name}
    #User permission management add - dep div again    ${Attention}
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${permission_management_error_code_same_role}')]
    Wait And Click    //*[contains(text(),'${ok}')]
    User permission management save
    User permission management search    ${permission_management_Attention}
    Wait And Click    //button[@icon='pi pi-file-edit']
    Verify the testcase is pass (data is existed)    //*[contains(text()[1],'${permission_management_department_name}')]
    Verify the testcase is pass (data is existed)    //*[contains(text()[2],'${permission_management_division_name}')]

科級主管-管理-使用者權限管理刪除驗證
    User permission management delete    ${Attention}
    User permission management save
    User permission management search    ${permission_management_Attention}
    Wait And Click    //button[@icon='pi pi-file-edit']
    Verify the testcase is pass (data is not existed)    //*[contains(text()[1],' ${permission_management_department_name} ')]
    Verify the testcase is pass (data is not existed)    //*[contains(text()[2],' - ${permission_management_division_name} ')]

科級主管-管理-代理人管理新增驗證
    Agent manage add    ${agent_name_for_Operations_Supervisor}
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${agent_add_reason}')]

科級主管-管理-代理人管理新增重複代理人驗證
    Agent manage add again   ${agent_name_for_Operations_Supervisor}

科級主管-管理-代理人管理查詢驗證
    Agent manage search
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${agent_add_reason}')]

科級主管-管理-代理人管理更新驗證
    Agent manage update
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${agent_update_reason}')]

科級主管-管理-代理人管理刪除驗證
    Agent manage delete 
    Verify the testcase is pass (data is not existed)    //*[contains(text(),'${agent_update_reason}')]

科級主管-通知驗證
    Reload Page
    Notify

科級主管-資產管理-工作區資產查詢-全部資產-查看驗證-刪除資料工作
    Close Browser
    Open Browser Chrome and use user
    Login Attention
    Delete data    ${hard_data_name}
    Delete data    ${soft_data_name}
    Delete data    ${data_data_name}
    Delete data    ${paper_data_name}
    Delete data    ${people_data_name}

*** Keywords ***

*** Comments ***
