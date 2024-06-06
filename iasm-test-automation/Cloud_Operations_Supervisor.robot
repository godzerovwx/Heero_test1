*** Settings ***
Resource  Resource/IASMImportLib.robot

Suite Setup    Open Browser Chrome and use user
Suite Teardown    Close Browser 
Test Teardown	Run Keyword If Test Failed	Capture Page Screenshot

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
    
雲端科級主管-資產管理-雲端資產分派-退件準備工作
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

雲端科級主管-資產管理-雲端資產分派-覆核準備工作
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

雲端科級主管-資產管理-雲端資產分派-覆核-有序號的資產
    Open Browser Chrome and use user
    Login Cloud Operations Supervisor
    Check_review_asset    ${true}     ${list_software}    ${department_name}-${division_name}
    Close Browser

雲端科級主管-資產管理-雲端資產分派-覆核-有序號的不指派資產
    Open Browser Chrome and use user
    Login Cloud Operations Supervisor
    Check_review_asset    ${true}     ${list_software}    ${not_assign}
    Close Browser

雲端科級主管-資產管理-雲端資產分派-覆核-無序號的資產
    Open Browser Chrome and use user
    Login Cloud Operations Supervisor
    Check_review_asset    ${false}     ${list_software}    ${department_name}-${division_name}
    Close Browser
    
雲端科級主管-資產管理-雲端資產分派-覆核-無序號的不指派資產
    Open Browser Chrome and use user
    Login Cloud Operations Supervisor
    Check_review_asset    ${false}     ${list_software}    ${not_assign}

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

