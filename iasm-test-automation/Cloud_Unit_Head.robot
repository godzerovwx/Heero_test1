*** Settings ***
Resource  Resource/IASMImportLib.robot

Suite Setup    Open Browser Chrome and use user
Suite Teardown    Close Browser 
Test Teardown	Run Keyword If Test Failed	Capture Page Screenshot

*** Variables ***

*** Test Cases ***
#*** Comments ***
雲端單位主管-管理-使用者權限管理搜尋驗證
    Login Cloud Unit Head
    Wait And Click  //i[@class='pi pi-book']
    Wait And Click  //a[@href='/system/users']
    User permission management search    ${permission_management_Cloud_Operations_Supervisor}
    Verify the testcase is pass (data is existed)    //*[text()='${permission_management_Cloud_Operations_Supervisor}']

雲端單位主管-管理-使用者權限管理新增驗證
    Wait And Click  //button[@icon='pi pi-file-edit']
    User permission management add - dep div    ${Cloud_Operations_Supervisor}    ${permission_management_cloud_department_name}  ${permission_management_cloud_division_name}
    User permission management add - dep div    ${Cloud_Operations_Supervisor}    ${permission_management_cloud_department_name}  ${permission_management_cloud_division_name}
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${permission_management_error_code_same_role}')]
    Wait And Click    //*[contains(text(),'${ok}')]
    User permission management save
    User permission management search    ${permission_management_Cloud_Operations_Supervisor}
    Wait And Click    //button[@icon='pi pi-file-edit']
    Verify the testcase is pass (data is existed)    //*[text()=' ${permission_management_cloud_department_name} ']
    Verify the testcase is pass (data is existed)    //*[text()=' - ${permission_management_cloud_division_name} ']

雲端單位主管-管理-使用者權限管理刪除驗證
    User permission management delete    ${Cloud_Operations_Supervisor}
    User permission management save
    User permission management search    ${permission_management_Cloud_Operations_Supervisor}
    Wait And Click    //button[@icon='pi pi-file-edit']
    Verify the testcase is pass (data is not existed)    //*[text()=' ${permission_management_cloud_department_name} ']
    Verify the testcase is pass (data is not existed)    //*[text()=' - ${permission_management_cloud_division_name} ']

雲端單位主管-管理-代理人管理新增驗證
    Agent manage add    ${agent_name_for_Cloud_Operations_Supervisor} 
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${agent_add_reason}')]

雲端單位主管-管理-代理人管理新增重複代理人訊息驗證
    Agent manage add again   ${agent_name_for_Cloud_Operations_Supervisor} 

雲端單位主管-管理-代理人管理查詢驗證
    Agent manage search
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${agent_add_reason}')]

雲端單位主管-管理-代理人管理更新驗證
    Agent manage update
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${agent_update_reason}')]

雲端單位主管-管理-代理人管理刪除驗證
    Agent manage delete 
    Verify the testcase is pass (data is not existed)    //*[contains(text(),'${agent_update_reason}')]

雲端單位主管-通知驗證
    Reload Page
    Notify
    
*** Comments ***

