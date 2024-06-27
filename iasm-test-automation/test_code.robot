*** Settings ***
Resource  Resource/IASMImportLib.robot

Suite Setup    Open Browser Chrome and use user
Test Teardown	Run Keyword If Test Failed	Capture Page Screenshot
Suite Teardown    Close Browser 

*** Variables ***

*** Test Cases ***
#*** Comments ***
    #Login Attention
    #Login ISOAttention
    #Login Operations Supervisor
    #Login System Admin
    #Login Unit Head
    #Login Cloud Attention
    #Login Cloud Operations Supervisor
    #Login Cloud Unit Head
    #Close Browser
    #Open Browser Chrome and use user

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

測試-登入
    Open Browser Chrome and use user
    Login Attention
經辦-首頁-雲端新資產下載
    ${cloud_new_data_status} =    Run Keyword And Return Status    Wait Until Element Is Visible    //div[@class="action-button-export"]
    Run Keyword If   '${cloud_new_data_status}' == '${true}'  Run Keywords  Wait And Click    //div[@class="action-button-export"]  AND  Sleep    5s  AND  Verify the testcase is pass (data is existed)    //div[@class="action-button-export"]/div[text()='${cloud_data_string}']
    ...    ELSE    Verify the testcase is pass (data is not existed)    //div[@class="action-button-export"]/div[text()='${cloud_data_string}'] 

    
*** Comments ***
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


*** Comments ***
雲端經辦-資產管理-雲端資產分派-準備工作-確認有兩筆有序號的軟體跟資料資產
    Wait And Click    //i[@class="pi pi-copy"]
    Wait And Click    //a[@href="/assetsManager/cloud/AssetAllocation"]
#確認有兩筆有序號的軟體跟資料資產
    Wait And Click    //thead/tr/th[6]/p-sorticon/i
    Wait And Click    //thead/tr/th[6]/p-sorticon/i
    Check_number_asset_on_software_data    ${list_software}    ${department_name}-${division_name}

    Wait And Click    //thead/tr/th[6]/p-sorticon/i
    Check_number_asset_on_software_data    ${list_data}    ${department_name}-${division_name}
    


*** Comments ***
雲端經辦-資產管理-雲端資產分派-準備工作-確認有兩筆有序號的軟體跟資料資產
    Wait And Click    //i[@class="pi pi-copy"]
    Wait And Click    //a[@href="/assetsManager/cloud/AssetAllocation"]
#確認有兩筆有序號的軟體跟資料資產
    Wait And Click    //thead/tr/th[6]/p-sorticon/i
    Wait And Click    //thead/tr/th[6]/p-sorticon/i
    Check_number_asset_on_software_data    ${list_software}    ${department_name}-${division_name}
    
    Wait And Click    //thead/tr/th[6]/p-sorticon/i
    Check_number_asset_on_software_data    ${list_data}    ${department_name}-${division_name}



