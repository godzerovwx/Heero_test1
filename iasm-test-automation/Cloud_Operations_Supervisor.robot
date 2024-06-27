*** Settings ***
Resource  Resource/IASMImportLib.robot

Suite Setup    Open Browser Chrome and use user
Test Teardown	Run Keyword If Test Failed	Capture Page Screenshot
Suite Teardown    Close Browser 

*** Variables ***

*** Test Cases ***
#*** Comments ***
雲端科級主管-資產管理-雲端資產分派-退件準備工作
    Login Cloud Attention
    Wait And Click    //i[@class="pi pi-copy"]
    Wait And Click    //a[@href="/assetsManager/cloud/AssetAllocation"]
    Check_send_asset    ${false}     ${list_software}    ${department_name}-${division_name}
    Wait And Click    //i[@class="pi pi-copy"]
    Wait And Click    //a[@href="/assetsManager/cloud/AssetAllocation"]
    Check_send_asset    ${true}     ${list_software}    ${department_name}-${division_name}
    Wait And Click    //i[@class="pi pi-copy"]
    Wait And Click    //a[@href="/assetsManager/cloud/AssetAllocation"]
    Check_send_asset    ${true}     ${list_software}    ${not_assign}
    Wait And Click    //i[@class="pi pi-copy"]
    Wait And Click    //a[@href="/assetsManager/cloud/AssetAllocation"]
    Check_send_asset    ${false}     ${list_software}    ${not_assign}
    Close Browser
    
雲端科級主管-資產管理-雲端資產分派-退件-有序號的資產
    Open Browser Chrome and use user
    Login Cloud Operations Supervisor
    Check_return_asset    ${true}     ${list_software}    ${department_name}-${division_name}
    Close Browser

雲端科級主管-資產管理-雲端資產分派-退件-有序號的不指派資產
    Open Browser Chrome and use user
    Login Cloud Operations Supervisor
    Check_return_asset    ${true}     ${list_software}    ${not_assign}
    Close Browser

雲端科級主管-資產管理-雲端資產分派-退件-無序號的資產
    Open Browser Chrome and use user
    Login Cloud Operations Supervisor
    Check_return_asset    ${false}     ${list_software}    ${department_name}-${division_name}
    Close Browser
    
雲端科級主管-資產管理-雲端資產分派-退件-無序號的不指派資產
    Open Browser Chrome and use user
    Login Cloud Operations Supervisor
    Check_return_asset    ${false}     ${list_software}    ${not_assign}
    Close Browser

雲端科級主管-資產管理-雲端資產分派-覆核準備工作
    Open Browser Chrome and use user
    Login Cloud Attention
    Wait And Click    //i[@class="pi pi-copy"]
    Wait And Click    //a[@href="/assetsManager/cloud/AssetAllocation"]
    Check_send_asset    ${false}     ${list_software}    ${department_name}-${division_name}
    Wait And Click    //i[@class="pi pi-copy"]
    Wait And Click    //a[@href="/assetsManager/cloud/AssetAllocation"]
    Check_send_asset    ${true}     ${list_software}    ${department_name}-${division_name}
    Wait And Click    //i[@class="pi pi-copy"]
    Wait And Click    //a[@href="/assetsManager/cloud/AssetAllocation"]
    Check_send_asset    ${true}     ${list_software}    ${not_assign}
    Wait And Click    //i[@class="pi pi-copy"]
    Wait And Click    //a[@href="/assetsManager/cloud/AssetAllocation"]
    Check_send_asset    ${false}     ${list_software}    ${not_assign}
    Wait And Click    //i[@class="pi pi-copy"]
    Wait And Click    //a[@href="/assetsManager/cloud/AssetAllocation"]
    Wait And Click    //thead/tr/th[6]/p-sorticon/i
    Check_send_asset    ${false}     ${list_data}    ${department_name}-${division_name}
    Wait And Click    //i[@class="pi pi-copy"]
    Wait And Click    //a[@href="/assetsManager/cloud/AssetAllocation"]
    Check_send_asset    ${true}     ${list_data}    ${department_name}-${division_name}
    Wait And Click    //i[@class="pi pi-copy"]
    Wait And Click    //a[@href="/assetsManager/cloud/AssetAllocation"]
    Check_send_asset    ${true}     ${list_data}    ${not_assign}
    Wait And Click    //i[@class="pi pi-copy"]
    Wait And Click    //a[@href="/assetsManager/cloud/AssetAllocation"]
    Check_send_asset    ${false}     ${list_data}    ${not_assign}
    Close Browser

雲端科級主管-資產管理-雲端資產分派-覆核-有序號的資產-軟體
    Open Browser Chrome and use user
    Login Cloud Operations Supervisor
    Check_review_asset    ${true}     ${list_software}    ${department_name}-${division_name}
    Close Browser

雲端科級主管-資產管理-雲端資產分派覆核後-編輯-有序號的資產-軟體
    Open Browser Chrome and use user
    Login Attention
    Search_cloud_data    ${list_software}
    FOR    ${j}    IN RANGE    1    101 
        ${cell_text}=    Get Text    //table/tbody/tr[${j}]/td[4][text()]
        ${group_name_status} =    Run Keyword And Return Status    Should Be Equal As Strings    ${cell_text}    ${EMPTY}
        Run Keyword If    '${group_name_status}'=='${false}'    Edit_cloud_data    ${j}
        Exit For Loop If    '${group_name_status}'=='${false}'
    END
    ${division_name_status} =     Run Keyword And Return Status    Wait Until Element Is Visible    //div[@class='section1 scroll']/div[1]//div/p-dropdown[2]/div/span[text()='${division_name}']
    Run Keyword If  '${division_name_status}' == '${true}'    Update Division    ${division_name_update}
    ...    ELSE     Update Division    ${division_name}
    Wait And Click    //*[text()='${save}']
    Wait And Click    //*[text()='${ok}']
    Close Browser

雲端科級主管-資產管理-雲端資產分派覆核後-送審-有序號的資產-軟體
    Check_cloud_data_to_review

雲端科級主管-資產管理-雲端資產分派-覆核-有序號的不指派資產-軟體
    Open Browser Chrome and use user
    Login Cloud Operations Supervisor
    Check_review_asset    ${true}     ${list_software}    ${not_assign}
    Close Browser

雲端科級主管-資產管理-雲端資產分派-覆核-無序號的資產-軟體
    Open Browser Chrome and use user
    Login Cloud Operations Supervisor
    Check_review_asset    ${false}     ${list_software}    ${department_name}-${division_name}
    Close Browser

雲端科級主管-資產管理-雲端資產分派覆核後-編輯-無序號的資產-軟體
    Open Browser Chrome and use user
    Login Attention
    Search_cloud_data    ${list_software}
    FOR    ${j}    IN RANGE    1    101 
        ${cell_text}=    Get Text    //table/tbody/tr[${j}]/td[4][text()]
        ${group_name_status} =    Run Keyword And Return Status    Should Be Equal As Strings    ${cell_text}    ${EMPTY}
        Run Keyword If    '${group_name_status}'=='${true}'    Edit_cloud_data    ${j}
        Exit For Loop If    '${group_name_status}'=='${true}'
    END
    Edit_cloud_data_software    ${department_name}     ${division_name} 
    Wait And Click    //*[text()='${save}']
    Wait And Click    //*[text()='${ok}']
    Close Browser

雲端科級主管-資產管理-雲端資產分派覆核後-送審-無序號的資產-軟體
    Check_cloud_data_to_review

雲端科級主管-資產管理-雲端資產分派-覆核-無序號的不指派資產-軟體
    Open Browser Chrome and use user
    Login Cloud Operations Supervisor
    Check_review_asset    ${false}     ${list_software}    ${not_assign}
    Close Browser

雲端科級主管-資產管理-雲端資產分派-覆核-有序號的資產-資料
    Open Browser Chrome and use user
    Login Cloud Operations Supervisor
    Wait And Click    //thead/tr/th[6]/p-sorticon/i
    Check_review_asset    ${true}     ${list_data}    ${department_name}-${division_name}
    Close Browser

雲端科級主管-資產管理-雲端資產分派覆核後-編輯-有序號的資產-資料
    Open Browser Chrome and use user
    Login Attention
    Search_cloud_data    ${list_data}
    FOR    ${j}    IN RANGE    1    101 
        ${cell_text}=    Get Text    //table/tbody/tr[${j}]/td[4][text()]
        ${group_name_status} =    Run Keyword And Return Status    Should Be Equal As Strings    ${cell_text}    ${EMPTY}
        Run Keyword If    '${group_name_status}'=='${false}'    Edit_cloud_data    ${j}
        Exit For Loop If    '${group_name_status}'=='${false}'
    END
    ${division_name_status} =     Run Keyword And Return Status    Wait Until Element Is Visible    //div[@class='section1 scroll']/div[1]//div/p-dropdown[2]/div/span[text()='${division_name}']
    Run Keyword If  '${division_name_status}' == '${true}'    Update Division    ${division_name_update}
    ...    ELSE     Update Division    ${division_name}
    Wait And Click    //*[text()='${save}']
    Wait And Click    //*[text()='${ok}']
    Close Browser

雲端科級主管-資產管理-雲端資產分派覆核後-送審-有序號的資產-資料
    Check_cloud_data_to_review

雲端科級主管-資產管理-雲端資產分派-覆核-有序號的不指派資產-資料
    Open Browser Chrome and use user
    Login Cloud Operations Supervisor
    Wait And Click    //thead/tr/th[6]/p-sorticon/i
    Check_review_asset    ${true}     ${list_data}    ${not_assign}
    Close Browser

雲端科級主管-資產管理-雲端資產分派-覆核-無序號的資產-資料
    Open Browser Chrome and use user
    Login Cloud Operations Supervisor
    Wait And Click    //thead/tr/th[6]/p-sorticon/i
    Check_review_asset    ${false}     ${list_data}    ${department_name}-${division_name}
    Close Browser

雲端科級主管-資產管理-雲端資產分派覆核後-編輯-無序號的資產-資料
    Open Browser Chrome and use user
    Login Attention
    Search_cloud_data    ${list_data}
    FOR    ${j}    IN RANGE    1    101 
        ${cell_text}=    Get Text    //table/tbody/tr[${j}]/td[4][text()]
        ${group_name_status} =    Run Keyword And Return Status    Should Be Equal As Strings    ${cell_text}    ${EMPTY}
        Run Keyword If    '${group_name_status}'=='${true}'    Edit_cloud_data    ${j}
        Exit For Loop If    '${group_name_status}'=='${true}'
    END
    Edit_cloud_data_data    ${department_name}     ${division_name} 
    Wait And Click    //*[text()='${save}']
    Wait And Click    //*[text()='${ok}']
    Close Browser

雲端科級主管-資產管理-雲端資產分派覆核後-送審-無序號的資產-資料
    Check_cloud_data_to_review

雲端科級主管-資產管理-雲端資產分派-覆核-無序號的不指派資產-資料
    Open Browser Chrome and use user
    Login Cloud Operations Supervisor
    Wait And Click    //thead/tr/th[6]/p-sorticon/i
    Check_review_asset    ${false}     ${list_data}    ${not_assign}
    
雲端科級主管-管理-使用者權限管理搜尋驗證
    Wait And Click  //i[@class='pi pi-book']
    Wait And Click  //a[@href='/system/users']
    User permission management search    ${permission_management_Cloud_Attention}
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${permission_management_Cloud_Attention}')]

雲端科級主管-管理-使用者權限管理新增驗證
    Wait And Click  //button[@icon='pi pi-file-edit']
    User permission management add - dep div    ${Cloud_Attention}    ${permission_management_cloud_department_name}    ${permission_management_cloud_division_name}
    User permission management add - dep div    ${Cloud_Attention}    ${permission_management_cloud_department_name}    ${permission_management_cloud_division_name}
    #User permission management add - dep div again    ${Attention}
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${permission_management_error_code_same_role}')]
    Wait And Click    //*[contains(text(),'${ok}')]
    User permission management save
    User permission management search    ${permission_management_Cloud_Attention}
    Wait And Click    //button[@icon='pi pi-file-edit']
    Verify the testcase is pass (data is existed)    //*[contains(text()[1],'${permission_management_cloud_department_name}')]
    Verify the testcase is pass (data is existed)    //*[contains(text()[2],'${permission_management_cloud_division_name}')]

雲端科級主管-管理-使用者權限管理刪除驗證
    User permission management delete    ${Cloud_Attention}
    User permission management save
    User permission management search    ${permission_management_Cloud_Attention}
    Wait And Click    //button[@icon='pi pi-file-edit']
    Verify the testcase is pass (data is not existed)    //*[contains(text()[1],' ${permission_management_cloud_department_name} ')]
    Verify the testcase is pass (data is not existed)    //*[contains(text()[2],' - ${permission_management_cloud_division_name} ')]

雲端科級主管-管理-代理人管理新增驗證
    Agent manage add    ${agent_name_for_Cloud_Attention} 
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${agent_add_reason}')]

雲端科級主管-管理-代理人管理新增重複代理人訊息驗證
    Agent manage add again   ${agent_name_for_Cloud_Attention} 

雲端科級主管-管理-代理人管理查詢驗證
    Agent manage search
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${agent_add_reason}')]

雲端科級主管-管理-代理人管理更新驗證
    Agent manage update
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${agent_update_reason}')]

雲端科級主管-管理-代理人管理刪除驗證
    Agent manage delete 
    Verify the testcase is pass (data is not existed)    //*[contains(text(),'${agent_update_reason}')]

雲端科級主管-通知驗證
    Reload Page
    Notify
    
*** Comments ***

