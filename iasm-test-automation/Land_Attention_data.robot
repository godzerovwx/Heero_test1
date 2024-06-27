*** Settings ***
Resource  Resource/IASMImportLib.robot

Suite Setup    Open Browser Chrome and use user
Test Teardown	Run Keyword If Test Failed	Capture Page Screenshot
Suite Teardown    Close Browser 

*** Variables ***

*** Test Cases ***
#*** Comments ***
地端角色登入確認
    Login Attention
    Close Browser
    Open Browser Chrome and use user
    Login Operations Supervisor
    Close Browser
    Open Browser Chrome and use user
    Login ISOAttention
    Close Browser
    Open Browser Chrome and use user
    Login Unit Head
    Close Browser
    Open Browser Chrome and use user
    Login System Admin
    Close Browser

經辦-資產管理-已審核頁面-全部資產-查看驗證-準備資料工作
    Open Browser Chrome and use user
    Login Attention
    Wait And Click  //img[contains(@src,'/assets/images/image 220.png')]
    ${has_review_hard_data_status} =    Run Keyword And Return Status    Wait Until Element Is Visible    //*[contains(text(),'${has_review_hard_data_name}')]
    Run Keyword If  '${has_review_hard_data_status}' != '${true}'    prereq to has review hard data
    
    Wait And Click  //img[contains(@src,'/assets/images/image 220.png')]
    ${has_review_soft_data_status} =    Run Keyword And Return Status    Wait Until Element Is Visible    //*[contains(text(),'${has_review_soft_data_name}')]
    Run Keyword If  '${has_review_soft_data_status}' != '${true}'    prereq to has review soft data
    
    Wait And Click  //img[contains(@src,'/assets/images/image 220.png')]
    ${has_review_data_data_status} =    Run Keyword And Return Status    Wait Until Element Is Visible    //*[contains(text(),'${has_review_data_data_name}')]
    Run Keyword If  '${has_review_data_data_status}' != '${true}'    prereq to has review data data
    
    Wait And Click  //img[contains(@src,'/assets/images/image 220.png')]
    ${has_review_paper_data_status} =    Run Keyword And Return Status    Wait Until Element Is Visible    //*[contains(text(),'${has_review_paper_data_name}')]
    Run Keyword If  '${has_review_paper_data_status}' != '${true}'    prereq to has review paper data
    
    Wait And Click  //img[contains(@src,'/assets/images/image 220.png')]
    ${has_review_people_data_status} =    Run Keyword And Return Status    Wait Until Element Is Visible    //*[contains(text(),'${has_review_people_data_name}')]
    Run Keyword If  '${has_review_people_data_status}' != '${true}'    prereq to has review people data

經辦-首頁-工作區資產查詢按鈕驗證
    Wait And Click  //button[contains(@class,'p-element p-button action-button p-component')]
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${work_search_button}')]

經辦-資產管理-單筆新增-硬體資產驗證
    Create hard data    ${hard_data_name}  ${department_name}  ${division_name}  ${department_name}  ${division_name}
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${hard_data_name}')]

經辦-資產管理-單筆新增-軟體資產驗證
    Create soft data    ${soft_data_name}  ${department_name}  ${division_name}  ${department_name}  ${division_name}
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${soft_data_name}')]

經辦-資產管理-單筆新增-資料資產驗證
    Create data data    ${data_data_name}  ${department_name}  ${division_name}  ${department_name}  ${division_name}
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${data_data_name}')]

經辦-資產管理-單筆新增-紙本資產驗證
    Create paper data    ${paper_data_name}  ${department_name}  ${division_name}  ${department_name}  ${division_name}
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${paper_data_name}')]

經辦-資產管理-單筆新增-人員資產驗證
    Create people data    ${people_data_name}  ${department_name}  ${division_name}  ${department_name}  ${division_name}
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${people_data_name}')]

經辦-資產管理-工作區資產查詢-硬體資產-查看驗證
    Search data    ${hard_data_name}
    Asset data dropdown list Read Verify    ${hard_data_name}

經辦-資產管理-工作區資產查詢-編輯硬體資產驗證
    Update data    ${update_hard_data_name}
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${update_hard_data_name}')]

經辦-資產管理-工作區資產查詢-複製硬體資產驗證
    Wait And Click    //td[contains(text(),' ${update_hard_data_name} ')]
    Copy data    ${copy_hard_data_name} 
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${copy_hard_data_name}')]

經辦-首頁-編輯中/退回件頁面-送審硬體資產驗證
    Wait And Click  //i[@class='pi pi-home']
    Send data    ${copy_hard_data_name}
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${copy_hard_data_name}')] 

經辦-首頁-送審中頁面-硬體資產-查看驗證
    Wait And Click  //*[contains(text(),'${home_table_string_send}')]
    Asset data dropdown list Read Verify    ${copy_hard_data_name}

經辦-首頁-取消送審硬體資產驗證
    Cancel Send data
    Verify the testcase is pass (data is not existed)    //*[contains(text(),'${copy_hard_data_name}')]

經辦-首頁-停用硬體資產驗證
    Stop data    ${copy_hard_data_name}
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${copy_hard_data_name}')]

經辦-首頁-刪除硬體資產驗證
    Delete data    ${update_hard_data_name}
    Verify the testcase is pass (data is not existed)    //*[contains(text(),'${update_hard_data_name}')]
    Delete data    ${copy_hard_data_name}
    Verify the testcase is pass (data is not existed)    //*[contains(text(),'${copy_hard_data_name}')]

經辦-資產管理-工作區資產查詢-軟體資產-查看驗證
    Search data    ${soft_data_name}
    Asset data dropdown list Read Verify   ${soft_data_name}

經辦-資產管理-工作區資產查詢-編輯軟體資產驗證
    Update data    ${update_soft_data_name}
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${update_soft_data_name}')]

經辦-資產管理-工作區資產查詢-複製軟體資產驗證
    Wait And Click    //td[contains(text(),'${update_soft_data_name}')]
    Copy data    ${copy_soft_data_name} 
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${copy_soft_data_name}')]

經辦-首頁-編輯中/退回件頁面-送審軟體資產驗證
    Wait And Click  //i[@class='pi pi-home']
    Send data    ${copy_soft_data_name}
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${copy_soft_data_name}')] 

經辦-首頁-送審中頁面-軟體資產-查看驗證
    Wait And Click  //*[contains(text(),'${home_table_string_send}')]
    Asset data dropdown list Read Verify   ${copy_soft_data_name}

經辦-首頁-取消送審軟體資產驗證
    Cancel Send data
    Verify the testcase is pass (data is not existed)    //*[contains(text(),'${copy_soft_data_name}')]

經辦-首頁-停用軟體資產驗證
    Stop data    ${copy_soft_data_name}
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${copy_soft_data_name}')]

經辦-首頁-刪除軟體資產驗證
    Delete data    ${update_soft_data_name}
    Verify the testcase is pass (data is not existed)    //*[contains(text(),'${update_soft_data_name}')]
    Delete data    ${copy_soft_data_name}
    Verify the testcase is pass (data is not existed)    //*[contains(text(),'${copy_soft_data_name}')]

經辦-資產管理-工作區資產查詢-資料資產-查看驗證
    Search data    ${data_data_name}
    Asset data dropdown list Read Verify    ${data_data_name}

經辦-資產管理-工作區資產查詢-編輯資料資產驗證
    Update data    ${update_data_data_name}
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${update_data_data_name}')]

經辦-資產管理-工作區資產查詢-複製資料資產驗證
    Wait And Click    //td[contains(text(),'${update_data_data_name}')]
    Copy data    ${copy_data_data_name} 
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${copy_data_data_name}')]

經辦-首頁-編輯中/退回件頁面-送審資料資產驗證
    Wait And Click  //i[@class='pi pi-home']
    Send data    ${copy_data_data_name}
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${copy_data_data_name}')] 

經辦-首頁-送審中頁面-資料資產-查看驗證
    Wait And Click  //*[contains(text(),'${home_table_string_send}')]
    Asset data dropdown list Read Verify    ${copy_data_data_name}

經辦-首頁-取消送審資料資產驗證
    Cancel Send data
    Verify the testcase is pass (data is not existed)    //*[contains(text(),'${copy_data_data_name}')]

經辦-首頁-停用資料資產驗證
    Stop data    ${copy_data_data_name}
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${copy_data_data_name}')]

經辦-首頁-刪除資料資產驗證
    Delete data    ${update_data_data_name}
    Verify the testcase is pass (data is not existed)    //*[contains(text(),'${update_data_data_name}')]
    Delete data    ${copy_data_data_name}
    Verify the testcase is pass (data is not existed)    //*[contains(text(),'${copy_data_data_name}')]

經辦-資產管理-工作區資產查詢-紙本資產-查看驗證
    Search data    ${paper_data_name}
    Asset data dropdown list Read Verify    ${paper_data_name}

經辦-資產管理-工作區資產查詢-編輯紙本資產驗證
    Update data    ${update_paper_data_name}
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${update_paper_data_name}')]

經辦-資產管理-工作區資產查詢-複製紙本資產驗證
    Wait And Click    //td[contains(text(),'${update_paper_data_name}')]
    Copy data    ${copy_paper_data_name} 
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${copy_paper_data_name}')]

經辦-首頁-編輯中/退回件頁面-送審紙本資產驗證
    Wait And Click  //i[@class='pi pi-home']
    Send data    ${copy_paper_data_name}
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${copy_paper_data_name}')] 

經辦-首頁-送審中頁面-紙本資產-查看驗證
    Wait And Click  //*[contains(text(),'${home_table_string_send}')]
    Asset data dropdown list Read Verify   ${copy_paper_data_name}

經辦-首頁-取消送審紙本資產驗證
    Cancel Send data
    Verify the testcase is pass (data is not existed)    //*[contains(text(),'${copy_paper_data_name}')]

經辦-首頁-停用紙本資產驗證
    Stop data    ${copy_paper_data_name}
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${copy_paper_data_name}')]

經辦-首頁-刪除紙本資產驗證
    Delete data    ${update_paper_data_name}
    Verify the testcase is pass (data is not existed)    //*[contains(text(),'${update_paper_data_name}')]
    Delete data    ${copy_paper_data_name}
    Verify the testcase is pass (data is not existed)    //*[contains(text(),'${copy_paper_data_name}')]

經辦-資產管理-工作區資產查詢-人員資產-查看驗證
    Search data    ${people_data_name}
    Asset data dropdown list Read Verify    ${people_data_name}

經辦-資產管理-工作區資產查詢-編輯人員資產驗證
    Update data    ${update_people_data_name}
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${update_people_data_name}')]

經辦-資產管理-工作區資產查詢-複製人員資產驗證
    Wait And Click    //td[contains(text(),'${update_people_data_name}')]
    Copy data    ${copy_people_data_name} 
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${copy_people_data_name}')]

經辦-首頁-編輯中/退回件頁面-送審人員資產驗證
    Wait And Click  //i[@class='pi pi-home']
    Send data    ${copy_people_data_name}
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${copy_people_data_name}')] 

經辦-首頁-送審中頁面-人員資產-查看驗證
    Wait And Click  //*[contains(text(),'${home_table_string_send}')]
    Asset data dropdown list Read Verify    ${copy_people_data_name}

經辦-首頁-取消送審人員資產驗證
    Cancel Send data    
    Verify the testcase is pass (data is not existed)    //*[contains(text(),'${copy_people_data_name}')]

經辦-首頁-停用人員資產驗證
    Stop data    ${copy_people_data_name}
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${copy_people_data_name}')]

經辦-首頁-刪除人員資產驗證
    Delete data    ${update_people_data_name}
    Verify the testcase is pass (data is not existed)    //*[contains(text(),'${update_people_data_name}')]
    Delete data    ${copy_people_data_name}
    Verify the testcase is pass (data is not existed)    //*[contains(text(),'${copy_people_data_name}')]

經辦-資產管理-已審核資產查詢-硬體資產-查看驗證
    Reload Page
    Search has review data    ${has_review_hard_data_name}
    Asset data dropdown list Read Verify    ${has_review_hard_data_name}

經辦-資產管理-已審核頁面-複製硬體資產驗證
    Reload Page
    Wait And Click  //i[@class='pi pi-home']
    Wait And Click  //img[@class='img2 tab-icon ng-star-inserted']
    Wait And Click    //td[contains(text(),'${has_review_hard_data_name}')]
    Copy data    ${copy_has_review_hard_data_name}
    Wait And Click  //img[@class='img2 tab-icon ng-star-inserted']
    Verify the testcase is pass (data is not existed)    //*[contains(text(),'${copy_has_review_hard_data_name}')]

經辦-資產管理-已審核頁面-編輯硬體資產驗證
    Wait And Click  //i[@class='pi pi-home']
    Wait And Click  //img[@class='img2 tab-icon ng-star-inserted']
    Wait And Click    //td[contains(text(),'${has_review_hard_data_name}')]
    Update data    ${update_has_review_hard_data_name}
    Wait And Click  //img[@class='img2 tab-icon ng-star-inserted']
    Verify the testcase is pass (data is not existed)    //*[contains(text(),'${update_has_review_hard_data_name}')]

經辦-復原硬體資料步驟
    Wait And Click  //span[@class='tab-icon p-button-icon pi pi-user-edit ng-star-inserted']
    Delete data    ${copy_has_review_hard_data_name}
    Send data    ${update_has_review_hard_data_name}

經辦-資產管理-已審核資產查詢-軟體資產-查看驗證
    Reload Page
    Search has review data    ${has_review_soft_data_name}
    Asset data dropdown list Read Verify   ${has_review_soft_data_name}

經辦-資產管理-已審核頁面-複製軟體資產驗證
    Reload Page
    Wait And Click  //i[@class='pi pi-home']
    Wait And Click  //img[@class='img2 tab-icon ng-star-inserted']
    Wait And Click    //td[contains(text(),'${has_review_soft_data_name}')]
    Copy data    ${copy_has_review_soft_data_name}
    Wait And Click  //img[@class='img2 tab-icon ng-star-inserted']
    Verify the testcase is pass (data is not existed)    //*[contains(text(),'${copy_has_review_soft_data_name}')]

經辦-資產管理-已審核頁面-編輯軟體資產驗證
    Wait And Click  //i[@class='pi pi-home']
    Wait And Click  //img[@class='img2 tab-icon ng-star-inserted']
    Wait And Click    //td[contains(text(),'${has_review_soft_data_name}')]
    Update data    ${update_has_review_soft_data_name}
    Wait And Click  //img[@class='img2 tab-icon ng-star-inserted']
    Verify the testcase is pass (data is not existed)    //*[contains(text(),'${update_has_review_soft_data_name}')]

經辦-復原軟體資料步驟
    Wait And Click  //span[@class='tab-icon p-button-icon pi pi-user-edit ng-star-inserted']
    Delete data    ${copy_has_review_soft_data_name}
    Send data    ${update_has_review_soft_data_name}

經辦-資產管理-已審核資產查詢-資料資產-查看驗證
    Reload Page
    Search has review data    ${has_review_data_data_name}
    Asset data dropdown list Read Verify    ${has_review_data_data_name}

經辦-資產管理-已審核頁面-複製資料資產驗證
    Reload Page
    Wait And Click  //i[@class='pi pi-home']
    Wait And Click  //img[@class='img2 tab-icon ng-star-inserted']
    Wait And Click    //td[contains(text(),'${has_review_data_data_name}')]
    Copy data    ${copy_has_review_data_data_name}
    Wait And Click  //img[@class='img2 tab-icon ng-star-inserted']
    Verify the testcase is pass (data is not existed)    //*[contains(text(),'${copy_has_review_data_data_name}')]

經辦-資產管理-已審核頁面-編輯資料資產驗證
    Wait And Click  //i[@class='pi pi-home']
    Wait And Click  //img[@class='img2 tab-icon ng-star-inserted']
    Wait And Click    //td[contains(text(),'${has_review_data_data_name}')]
    Update data    ${update_has_review_data_data_name}
    Wait And Click  //img[@class='img2 tab-icon ng-star-inserted']
    Verify the testcase is pass (data is not existed)    //*[contains(text(),'${update_has_review_data_data_name}')]

經辦-復原資料資料步驟
    Wait And Click  //span[@class='tab-icon p-button-icon pi pi-user-edit ng-star-inserted']
    Delete data    ${copy_has_review_data_data_name}
    Send data    ${update_has_review_data_data_name}

經辦-資產管理-已審核資產查詢-紙本資產-查看驗證
    Reload Page
    Search has review data    ${has_review_paper_data_name}
    Asset data dropdown list Read Verify    ${has_review_paper_data_name}

經辦-資產管理-已審核頁面-複製紙本資產驗證
    Reload Page
    Wait And Click  //i[@class='pi pi-home']
    Wait And Click  //img[@class='img2 tab-icon ng-star-inserted']
    Wait And Click    //td[contains(text(),'${has_review_paper_data_name}')]
    Copy data    ${copy_has_review_paper_data_name}
    Wait And Click  //img[@class='img2 tab-icon ng-star-inserted']
    Verify the testcase is pass (data is not existed)    //*[contains(text(),'${copy_has_review_paper_data_name}')]

經辦-資產管理-已審核頁面-編輯紙本資產驗證
    Wait And Click  //i[@class='pi pi-home']
    Wait And Click  //img[@class='img2 tab-icon ng-star-inserted']
    Wait And Click    //*[contains(text(),'${has_review_paper_data_name}')]
    Update data    ${update_has_review_paper_data_name}
    Wait And Click  //img[@class='img2 tab-icon ng-star-inserted']
    Verify the testcase is pass (data is not existed)    //*[contains(text(),'${update_has_review_paper_data_name}')]

經辦-復原紙本資料步驟
    Wait And Click  //span[@class='tab-icon p-button-icon pi pi-user-edit ng-star-inserted']
    Delete data    ${copy_has_review_paper_data_name}
    Send data    ${update_has_review_paper_data_name}

經辦-資產管理-已審核資產查詢-人員資產-查看驗證
    Reload Page
    Search has review data    ${has_review_people_data_name}
    Asset data dropdown list Read Verify    ${has_review_people_data_name}

經辦-資產管理-已審核頁面-複製人員資產驗證
    Reload Page
    Wait And Click  //i[@class='pi pi-home']
    Wait And Click  //img[@class='img2 tab-icon ng-star-inserted']
    Wait And Click    //td[contains(text(),'${has_review_people_data_name}')]
    Copy data    ${copy_has_review_people_data_name}
    Wait And Click  //img[@class='img2 tab-icon ng-star-inserted']
    Verify the testcase is pass (data is not existed)    //*[contains(text(),'${copy_has_review_people_data_name}')]

經辦-資產管理-已審核頁面-編輯人員資產驗證
    Wait And Click  //i[@class='pi pi-home']
    Wait And Click  //img[@class='img2 tab-icon ng-star-inserted']
    Wait And Click    //td[contains(text(),'${has_review_people_data_name}')]
    Update data    ${update_has_review_people_data_name}
    Wait And Click  //img[@class='img2 tab-icon ng-star-inserted']
    Verify the testcase is pass (data is not existed)    //*[contains(text(),'${update_has_review_people_data_name}')]

經辦-復原人員資料步驟
    Wait And Click  //span[@class='tab-icon p-button-icon pi pi-user-edit ng-star-inserted']
    Delete data    ${copy_has_review_people_data_name}
    Send data    ${update_has_review_people_data_name}

*** Comments ***
經辦-資產管理-整批匯入-錯誤檔案驗證
    Import excel    ${path_to_update_excel_wrong_file}
    Verify the testcase is pass (data is existed)    //button/span[1][@aria-hidden='true'] 
    ${ancestor_element_xpath} =    Get Ancestor XPath    //button/span[1][@aria-hidden='true']    ancestor::button
    Wait And Click    ${ancestor_element_xpath}/span[2][contains(text(),'${path_to_update_download_link}')] 
    Wait And Click    //*[contains(text(),'${cancel}')]

經辦-資產管理-整批匯入-正確檔案驗證
    Import excel    ${path_to_update_excel_right_file}
    Verify the testcase is pass (data is existed)    //button[@disabled]
    Wait And Click    //*[contains(text(),'${ok}')]   
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${upload_successfully}')]
    Wait And Click    //div[@role='dialog']//div[2]//span[contains(text(),'${ok}')]
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${upload_result}')]
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${total_numbers}')]
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${add_numbers}')]
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${upload_numbers}')]
    Wait And Click    //div[@role='dialog']/div[4]//span[contains(text(),'${ok}')]
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${home_table_string_edit_return}')]
*** Test Cases ***

經辦-報表列印-資產清冊驗證
    Download excel

經辦-管理-代理人管理新增驗證
    Agent manage add    ${agent_name_for_Attention} 
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${agent_add_reason}')]

經辦-管理-代理人管理新增重複代理人訊息驗證
    Agent manage add again   ${agent_name_for_Attention} 

經辦-管理-代理人管理查詢驗證
    Agent manage search
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${agent_add_reason}')]

經辦-管理-代理人管理更新驗證
    Agent manage update
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${agent_update_reason}')]

經辦-管理-代理人管理刪除驗證
    Agent manage delete 
    Verify the testcase is pass (data is not existed)    //*[contains(text(),'${agent_update_reason}')]

經辦-通知驗證
    Reload Page
    Notify


*** Keywords ***


*** Comments ***

