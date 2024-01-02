*** Settings ***
Library  Selenium2Library
Resource    Resource\\Action.robot
Resource    Resource\\Variables\\Variables.robot
Resource    Resource\\Login.robot

Resource    Resource\\Home_page_button.robot

Resource    Resource\\Stocktaking_plan.robot

Resource    Resource\\Asset_management.robot

Resource    Resource\\Download_excel.robot

Resource    Resource\\Management.robot

Resource    Resource\\Notify.robot

Resource    Resource\\Data_dropdown_list.robot

Suite Setup    Open Browser Chrome and use user
Suite Teardown    Close Browser 

*** Variables ***

*** Test Cases ***
送審迴圈
    Login Dep_Attention
    Wait And Click    //p-paginator[@styleclass='p-paginator-bottom']//span[@class='p-dropdown-trigger-icon pi pi-chevron-down']
    Wait And Click    //li[@aria-label='20']
    FOR    ${i}    IN RANGE    1    606
        Wait And Click    //tr[@class='ng-star-inserted']//div[@role='checkbox']
        Wait And Click    //*[text()='送審']
        Sleep    500ms
        Wait And Click    //*[text()='確定']
        Sleep    500ms
        Wait And Click    //*[text()='確定']
    END
*** Comments ***
單位主管盤點計畫-點擊盤點計畫驗證-準備工作
    Close Browser
    Open Browser Chrome and use user
    Login ISOAttention
    Create stocktaking plan    ${stocktaking_plan_name}
    Close Browser
#*** Test Cases ***
單位主管盤點計畫-點擊盤點計畫驗證-無資料狀態
    #Open Browser Chrome and use user
    Login Unit Head
    Click stocktaking plan    ${stocktaking_plan_name}
    Verify the testcase is pass (data is existed)    //label[contains(text(),' ${stocktaking_plan_not_access_message} ')]
    Wait And Click    //*[text()='確定']

*** Comments ***
ISO經辦盤點計畫-編輯盤點計畫驗證
    Update stocktaking plan    ${update_stocktaking_plan_note}
    Verify the testcase is pass (data is existed)    //*[text()=' ${update_stocktaking_plan_note} ']

ISO經辦盤點計畫-刪除盤點計畫驗證
    Delete stocktaking plan
    Verify the testcase is pass (data is not existed)    //*[text()=' ${update_stocktaking_plan_note} ']
#*** Test Cases ***
ISO經辦-盤點計畫-歷史計畫驗證
    Wait And Click  //i[@class='pi pi-list']
    Search history stocktaking plan
    Verify the testcase is pass (data is existed)    //*[text()='${history_stocktaking_plan}']
ISO經辦-盤點計畫-下載歷史計畫部門驗證
    Download history stocktaking plan
    Verify the testcase is pass (data is existed)    //*[text()='${history_stocktaking_table_name}']
#*** Test Cases ***


單位主管-工作區資產查詢-硬體資產-查看驗證
    Search hard data
    Verify the testcase is pass (data is existed)    //*[text()=' ${hard_data_name} ']
    Read data    ${hard_data_name}
    Verify the testcase is pass (data is existed)    //*[text()='${read_data_title}']
    Verify the testcase is pass (data is existed)    //*[text()=' ${hard_data_name} ']
    Read data change
    Verify the testcase is pass (data is existed)    //*[text()='${change_time_name}']
    Read data history
    Verify the testcase is pass (data is existed)    //*[text()='${history_time_name}']
    Wait And Click    //*[text()='確定']

#*** Comments ***
單位主管-已審核資產查詢-硬體資產-查看驗證
    Reload Page
    Search has review hard data
    Verify the testcase is pass (data is existed)    //*[text()=' ${has_review_hard_data_name} ']
    Read data    ${has_review_hard_data_name}
    Verify the testcase is pass (data is existed)    //*[text()='${read_data_title}']
    Verify the testcase is pass (data is existed)    //*[text()=' ${has_review_hard_data_name} ']
    Read data change
    Verify the testcase is pass (data is existed)    //*[text()='${change_time_name}']
    Read data history
    Verify the testcase is pass (data is existed)    //*[text()='${history_time_name}']
    Wait And Click    //*[text()='確定']

單位主管-報表列印-資產清冊驗證
    Download excel

*** Test Cases ***
*** Comments ***
單位主管-管理-代理人管理新增驗證
    Agent manage add
    Verify the testcase is pass (data is existed)    //*[text()='${agent_add}']    
    Agent manage add complete
    Verify the testcase is pass (data is existed)    //*[text()='${agent_add_reason}']
#*** Comments ***
單位主管-管理-代理人管理查詢驗證
    Agent manage search
    Verify the testcase is pass (data is existed)    //*[text()='${agent_add_reason}']
單位主管-管理-代理人管理更新驗證
    Agent manage update
    Verify the testcase is pass (data is existed)    //*[text()='${agent_update_reason}']
#*** Test Cases ***
#*** Comments ***
單位主管-管理-代理人管理刪除驗證
    Agent manage delete 
    Verify the testcase is pass (data is not existed)    //*[text()='${agent_update_reason}']

*** Test Cases ***
*** Comments ***
單位主管-通知驗證
    Notify 
    
*** Keywords ***

*** Comments ***
ISO經辦-工作區資產查詢-編輯硬體資產驗證
    Update data    ${update_hard_data_name}
    Search hard data
    Verify the testcase is pass (data is existed)    //*[text()=' ${update_hard_data_name} ']
#*** Comments ***
ISO經辦-工作區資產查詢-複製硬體資產驗證
    Wait And Click    //td[contains(text(),' ${update_hard_data_name} ')]
    Copy data    ${copy_hard_data_name} 
    Search hard data
    Verify the testcase is pass (data is existed)    //*[text()=' ${copy_hard_data_name} ']

ISO經辦-已審核頁面-複製硬體資產驗證
    Copy data    ${copy_has_review_hard_data_name}
    Search hard data
    #Wait And Click  //img[@class='img2 tab-icon ng-star-inserted']
    Verify the testcase is pass (data is existed)    //*[text()=' ${copy_has_review_hard_data_name} ']

ISO經辦-已審核頁面-編輯硬體資產驗證
    Search has review hard data
    Wait And Click    //td[contains(text(),' ${has_review_hard_data_name} ')]
    Update data    ${update_has_review_hard_data_name}
    Search hard data
    #Wait And Click  //img[@class='img2 tab-icon ng-star-inserted']
    Verify the testcase is pass (data is existed)    //*[text()=' ${update_has_review_hard_data_name} ']

ISO經辦-報表列印-資產清冊驗證
    Download excel
