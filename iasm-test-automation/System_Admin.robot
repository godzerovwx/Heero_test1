*** Settings ***
Resource  Resource/IASMImportLib.robot

Suite Setup    Open Browser Chrome and use user
Suite Teardown    Close Browser 
Test Teardown	Run Keyword If Test Failed	Capture Page Screenshot

*** Variables ***

*** Test Cases ***
#*** Comments ***
公司負責人-資產管理-工作區資產查詢-全部資產-查看驗證-準備資料工作
    Login Attention
    Create hard data    ${hard_data_name}  ${department_name}  ${division_name}  ${department_name}  ${division_name}
    Create soft data    ${soft_data_name}  ${department_name}  ${division_name}  ${department_name}  ${division_name}
    Create data data    ${data_data_name}  ${department_name}  ${division_name}  ${department_name}  ${division_name}
    Create paper data    ${paper_data_name}  ${department_name}  ${division_name}  ${department_name}  ${division_name}
    Create people data    ${people_data_name}  ${department_name}  ${division_name}  ${department_name}  ${division_name}
    Close Browser

公司負責人-資產管理-工作區資產查詢-全部資產-查看驗證
    Open Browser Chrome and use user
    Login System Admin
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
    Close Browser

公司負責人-資產管理-工作區資產查詢-資產-查看驗證-刪除資料工作
    Open Browser Chrome and use user
    Login Attention
    Delete data    ${hard_data_name}
    Delete data    ${soft_data_name}
    Delete data    ${data_data_name}
    Delete data    ${paper_data_name}
    Delete data    ${people_data_name}
    Close Browser

公司負責人-資產管理-已審核資產查詢-全部資產-查看驗證
    Open Browser Chrome and use user
    Login System Admin
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
    Reload Page

公司負責人-報表列印-資產清冊驗證
    Download excel

公司負責人-報表列印-角色權限表驗證
    Download role excel

公司負責人-管理-資產群組維護 - 新增驗證
    Asset group maintenance add
    Verify the testcase is pass (data is existed)    //*[text()=' ${Asset_group_hard_code} ']

公司負責人-管理-資產群組維護 - 修改驗證
    Asset group maintenance update
    Verify the testcase is pass (data is existed)    //*[text()=' ${Asset_group_hard_code_update} ']

公司負責人-管理-資產群組維護 - 功能開關驗證
    Asset group maintenance enable and disable

公司負責人-管理-資產群組維護 - 刪除驗證
    Asset group maintenance delete
    Verify the testcase is pass (data is not existed)    //*[text()=' ${Asset_group_hard_code_update} ']

公司負責人-管理-角色功能管理-新增驗證
    Wait And Click    //a[@href='/system/roles']
    Role function management add    ${Role_function_management_name_UH_zh}    ${Role_function_management_name_UH_en}    ${Role_function_management_scope_UH}
    Verify the testcase is pass (data is existed)    //*[text()='${Role_function_management_name_UH_zh}']
    Role function management add    ${Role_function_management_name_OS_zh}    ${Role_function_management_name_OS_en}    ${Role_function_management_scope_OS}
    Verify the testcase is pass (data is existed)    //*[text()='${Role_function_management_name_OS_zh}']

公司負責人-管理-角色功能管理-預設腳色驗證-經辦
    Role function management verify default roles    ${Attention}
    Verify the testcase is pass (data is existed)    //*[text()=' ${Role_permission_scope}']
    Verify the testcase is pass (data is existed)    //*[text()='${div_unit_scope}']
    Verify the testcase is pass (data is existed)    //*[text()='${home_page_link}']
    Verify the testcase is pass (data is existed)    //*[text()='${asset_management_link}']
    Verify the testcase is pass (data is existed)    //*[text()='${work_search_link}']
    Verify the testcase is pass (data is existed)    //*[text()='${single_new_addition_link}']
    Verify the testcase is pass (data is existed)    //*[text()='${import_in_bulk_link}']
    Verify the testcase is pass (data is existed)    //*[text()='${has_work_search_link}']
    Verify the testcase is pass (data is existed)    //*[text()='${report_printing_link}']
    Verify the testcase is pass (data is existed)    //*[text()='${asset_inventory_link}']
    Verify the testcase is pass (data is existed)    //*[text()='${management_link}']
    Verify the testcase is pass (data is existed)    //*[text()='${agent_management_link}']
    Wait And Click    //*[text()='${cancel}']
    
公司負責人-管理-角色功能管理-預設腳色驗證-單位主管
    Role function management verify default roles    ${Unit_Head}
    Verify the testcase is pass (data is existed)    //*[text()=' ${Role_permission_scope}']
    Verify the testcase is pass (data is existed)    //*[text()='${dep_unit_scope}']
    Verify the testcase is pass (data is existed)    //*[text()='${stocktaking_plan_link}']
    Verify the testcase is pass (data is existed)    //*[text()='${asset_management_link}']
    Verify the testcase is pass (data is existed)    //*[text()='${work_search_link}']
    Verify the testcase is pass (data is existed)    //*[text()='${has_work_search_link}']
    Verify the testcase is pass (data is existed)    //*[text()='${report_printing_link}']
    Verify the testcase is pass (data is existed)    //*[text()='${asset_inventory_link}']
    Verify the testcase is pass (data is existed)    //*[text()='${management_link}']
    Verify the testcase is pass (data is existed)    //*[text()='${user_rights_management_link}']
    Verify the testcase is pass (data is existed)    //*[text()='${agent_management_link}']
    Wait And Click    //*[text()='${cancel}']

公司負責人-管理-角色功能管理-預設腳色驗證-科級主管
    Role function management verify default roles    ${Operations_Supervisor}
    Verify the testcase is pass (data is existed)    //*[text()=' ${Role_permission_scope}']
    Verify the testcase is pass (data is existed)    //*[text()='${div_unit_scope}']
    Verify the testcase is pass (data is existed)    //*[text()='${home_page_link}']
    Verify the testcase is pass (data is existed)    //*[text()='${asset_management_link}']
    Verify the testcase is pass (data is existed)    //*[text()='${work_search_link}']
    Verify the testcase is pass (data is existed)    //*[text()='${has_work_search_link}']
    Verify the testcase is pass (data is existed)    //*[text()='${report_printing_link}']
    Verify the testcase is pass (data is existed)    //*[text()='${asset_inventory_link}']
    Verify the testcase is pass (data is existed)    //*[text()='${management_link}']
    Verify the testcase is pass (data is existed)    //*[text()='${user_rights_management_link}']
    Verify the testcase is pass (data is existed)    //*[text()='${agent_management_link}']
    Wait And Click    //*[text()='${cancel}']

公司負責人-管理-角色功能管理-預設腳色驗證-公司負責人
    Role function management verify default roles    ${System_Admin}
    Verify the testcase is pass (data is existed)    //*[text()=' ${Role_permission_scope}']
    Verify the testcase is pass (data is existed)    //*[text()='${sub_company_scope}']
    Verify the testcase is pass (data is existed)    //*[text()='${asset_management_link}']
    Verify the testcase is pass (data is existed)    //*[text()='${work_search_link}']
    Verify the testcase is pass (data is existed)    //*[text()='${has_work_search_link}']
    Verify the testcase is pass (data is existed)    //*[text()='${report_printing_link}']
    Verify the testcase is pass (data is existed)    //*[text()='${asset_inventory_link}']
    Verify the testcase is pass (data is existed)    //*[text()='${management_link}']
    Verify the testcase is pass (data is existed)    //*[text()='${asset_group_maintenance_link}']
    Verify the testcase is pass (data is existed)    //*[text()='${role_function_management_link}']
    Verify the testcase is pass (data is existed)    //*[text()='${user_rights_management_link}']
    Verify the testcase is pass (data is existed)    //*[text()='${ISO_user_rights_management_link}']
    Verify the testcase is pass (data is existed)    //*[text()='${shared_menu_management_link}']
    Verify the testcase is pass (data is existed)    //*[text()='${field_description_management_link}']
    Wait And Click    //*[text()='${cancel}']

公司負責人-管理-角色功能管理-預設腳色驗證-ISO經辦
    Role function management verify default roles    ${ISOAttention}
    Verify the testcase is pass (data is existed)    //*[text()=' ${Role_permission_scope}']
    Verify the testcase is pass (data is existed)    //*[text()='${sub_company_scope}']
    Verify the testcase is pass (data is existed)    //*[text()='${stocktaking_plan_link}']
    Verify the testcase is pass (data is existed)    //*[text()='${asset_management_link}']
    Verify the testcase is pass (data is existed)    //*[text()='${work_search_link}']
    Verify the testcase is pass (data is existed)    //*[text()='${has_work_search_link}']
    Verify the testcase is pass (data is existed)    //*[text()='${management_link}']
    Verify the testcase is pass (data is existed)    //*[text()='${agent_management_link}']
    Wait And Click    //*[text()='${cancel}']

公司負責人-管理-角色功能管理-預設腳色驗證-雲端單位主管
    Role function management verify default roles    ${Cloud_Unit_Head}
    Verify the testcase is pass (data is existed)    //*[text()=' ${Role_permission_scope}']
    Verify the testcase is pass (data is existed)    //*[text()='${dep_unit_scope}']
    Verify the testcase is pass (data is existed)    //*[text()='${management_link}']
    Verify the testcase is pass (data is existed)    //*[text()='${user_rights_management_link}']
    Verify the testcase is pass (data is existed)    //*[text()='${agent_management_link}']
    Wait And Click    //*[text()='${cancel}']

公司負責人-管理-角色功能管理-預設腳色驗證-雲端科級主管
    Role function management verify default roles    ${Cloud_Operations_Supervisor}
    Verify the testcase is pass (data is existed)    //*[text()=' ${Role_permission_scope}']
    Verify the testcase is pass (data is existed)    //*[text()='${div_unit_scope}']
    Verify the testcase is pass (data is existed)    //*[text()='${asset_management_link}']
    Verify the testcase is pass (data is existed)    //*[text()='${cloud_asset_allocation_link}']
    Verify the testcase is pass (data is existed)    //*[text()='${management_link}']
    Verify the testcase is pass (data is existed)    //*[text()='${user_rights_management_link}']
    Verify the testcase is pass (data is existed)    //*[text()='${agent_management_link}']
    Wait And Click    //*[text()='${cancel}']

公司負責人-管理-角色功能管理-預設腳色驗證-雲端經辦
    Role function management verify default roles    ${Cloud_Attention}
    Verify the testcase is pass (data is existed)    //*[text()=' ${Role_permission_scope}']
    Verify the testcase is pass (data is existed)    //*[text()='${div_unit_scope}']
    Verify the testcase is pass (data is existed)    //*[text()='${asset_management_link}']
    Verify the testcase is pass (data is existed)    //*[text()='${cloud_asset_allocation_link}']
    Verify the testcase is pass (data is existed)    //*[text()='${management_link}']
    Verify the testcase is pass (data is existed)    //*[text()='${agent_management_link}']
    Verify the testcase is pass (data is existed)    //*[text()='${cloud_asset_settings_link}']
    Verify the testcase is pass (data is existed)    //*[text()='${cloud_shared_menu_management_link}']
    Wait And Click    //*[text()='${cancel}']

公司負責人-管理-角色功能管理-新增客製化腳色到無任何腳色驗證
    Wait And Click  //a[@href='/system/users']
    User permission management search    ${Role_function_management_no_role}
    Wait And Click  //button[@icon='pi pi-file-edit']
    User permission management add - dep    ${Role_function_management_name_UH_zh}    ${permission_management_department_name}
    User permission management add - dep div    ${Role_function_management_name_OS_zh}    ${permission_management_department_name}    ${permission_management_division_name} 
    User permission management save
    User permission management search    ${Role_function_management_no_role}
    Wait And Click    //button[@icon='pi pi-file-edit']
    Verify the testcase is pass (data is existed)    //*[text()=' ${permission_management_department_name} ']
    Verify the testcase is pass (data is existed)    //*[text()[1]=' ${permission_management_department_name} ']
    Verify the testcase is pass (data is existed)    //*[text()[2]=' - ${permission_management_division_name} ']
    User permission management delete    ${Role_function_management_name_UH_zh}
    User permission management delete    ${Role_function_management_name_OS_zh}
    User permission management save

公司負責人-管理-角色功能管理-新增客製化腳色到經辦腳色驗證
    User permission management search    ${Role_function_management_no_role}
    Wait And Click    //button[@icon='pi pi-file-edit']
    User permission management add - dep div    ${Attention}    ${permission_management_department_name}    ${permission_management_division_name} 
    User permission management add - dep    ${Role_function_management_name_UH_zh}    ${permission_management_department_name}
    User permission management add - dep div    ${Role_function_management_name_OS_zh}    ${permission_management_department_name}    ${permission_management_division_name} 
    User permission management save
    User permission management search    ${Role_function_management_no_role}
    Wait And Click    //button[@icon='pi pi-file-edit']
    Verify the testcase is pass (data is existed)    //*[text()=' ${permission_management_department_name} ']
    Verify the testcase is pass (data is existed)    //*[text()[1]=' ${permission_management_department_name} ']
    Verify the testcase is pass (data is existed)    //*[text()[2]=' - ${permission_management_division_name} ']
    User permission management delete    ${Attention}
    User permission management delete    ${Role_function_management_name_UH_zh}
    User permission management delete    ${Role_function_management_name_OS_zh}
    User permission management save

公司負責人-管理-角色功能管理-新增客製化腳色到科級腳色驗證
    User permission management search    ${Role_function_management_no_role}
    Wait And Click    //button[@icon='pi pi-file-edit']
    User permission management add - dep div    ${Operations_Supervisor}    ${permission_management_department_name}    ${permission_management_division_name}
    User permission management add - dep    ${Role_function_management_name_UH_zh}    ${permission_management_department_name}
    User permission management add - dep div    ${Role_function_management_name_OS_zh}    ${permission_management_department_name}    ${permission_management_division_name}
    User permission management save
    User permission management search    ${Role_function_management_no_role}
    Wait And Click    //button[@icon='pi pi-file-edit']
    Verify the testcase is pass (data is existed)    //*[text()=' ${permission_management_department_name} ']
    Verify the testcase is pass (data is existed)    //*[text()[1]=' ${permission_management_department_name} ']
    Verify the testcase is pass (data is existed)    //*[text()[2]=' - ${permission_management_division_name} ']
    User permission management delete    ${Operations_Supervisor}
    User permission management delete    ${Role_function_management_name_UH_zh}
    User permission management delete    ${Role_function_management_name_OS_zh}
    User permission management save

公司負責人-管理-角色功能管理-新增客製化腳色到單位腳色驗證
    User permission management search    ${Role_function_management_no_role}
    Wait And Click    //button[@icon='pi pi-file-edit']
    User permission management add - dep    ${Unit_Head}    ${permission_management_department_name}
    User permission management add - dep    ${Role_function_management_name_UH_zh}    ${permission_management_department_name}
    User permission management add - dep div    ${Role_function_management_name_OS_zh}    ${permission_management_department_name}    ${permission_management_division_name}
    User permission management save
    User permission management search    ${Role_function_management_no_role}
    Wait And Click    //button[@icon='pi pi-file-edit']
    Verify the testcase is pass (data is existed)    //*[text()=' ${permission_management_department_name} ']
    Verify the testcase is pass (data is existed)    //*[text()[1]=' ${permission_management_department_name} ']
    Verify the testcase is pass (data is existed)    //*[text()[2]=' - ${permission_management_division_name} ']
    User permission management delete    ${Unit_Head}
    User permission management delete    ${Role_function_management_name_UH_zh}
    User permission management delete    ${Role_function_management_name_OS_zh}
    User permission management save

公司負責人-管理-角色功能管理-新增客製化腳色到公司負責人腳色驗證
    User permission management search    ${Role_function_management_no_role}
    Wait And Click    //button[@icon='pi pi-file-edit']
    User permission management add - system admin    ${System_Admin}
    User permission management add - dep    ${Role_function_management_name_UH_zh}    ${permission_management_department_name}
    User permission management add - dep div    ${Role_function_management_name_OS_zh}    ${permission_management_department_name}    ${permission_management_division_name}
    User permission management save
    User permission management search    ${Role_function_management_no_role}
    Wait And Click    //button[@icon='pi pi-file-edit']
    Verify the testcase is pass (data is existed)    //*[text()=' ${permission_management_department_name} ']
    Verify the testcase is pass (data is existed)    //*[text()[1]=' ${permission_management_department_name} ']
    Verify the testcase is pass (data is existed)    //*[text()[2]=' - ${permission_management_division_name} ']
    User permission management delete    ${System_Admin}
    User permission management delete    ${Role_function_management_name_UH_zh}
    User permission management delete    ${Role_function_management_name_OS_zh}
    User permission management save

公司負責人-管理-角色功能管理-新增客製化腳色到ISO經辦腳色驗證
    Wait And Click  //a[@href='/system/specialUsers']
    User permission management search    ${Role_function_management_no_role}
    User permission management add - ISO Attention
    User permission management save
    Wait And Click  //a[@href='/system/users']
    User permission management search    ${Role_function_management_no_role}
    Wait And Click    //button[@icon='pi pi-file-edit']
    User permission management add - dep    ${Role_function_management_name_UH_zh}    ${permission_management_department_name}
    User permission management add - dep div    ${Role_function_management_name_OS_zh}    ${permission_management_department_name}    ${permission_management_division_name}
    User permission management save
    User permission management search    ${Role_function_management_no_role}
    Wait And Click    //button[@icon='pi pi-file-edit']
    Verify the testcase is pass (data is existed)    //*[text()=' ${permission_management_department_name} ']
    Verify the testcase is pass (data is existed)    //*[text()[1]=' ${permission_management_department_name} ']
    Verify the testcase is pass (data is existed)    //*[text()[2]=' - ${permission_management_division_name} ']
    User permission management delete    ${Role_function_management_name_UH_zh}
    User permission management delete    ${Role_function_management_name_OS_zh}
    User permission management save
    Wait And Click  //a[@href='/system/specialUsers']
    User permission management search    ${Role_function_management_no_role}
    Wait And Click    //button[@icon='pi pi-file-edit']
    User permission management delete    ${ISOAttention}
    User permission management save

公司負責人-管理-角色功能管理-功能開關驗證
    Wait And Click  //a[@href='/system/roles']
    Role function management enable and disable    ${Role_function_management_name_UH_zh}

公司負責人-管理-角色功能管理-修改驗證
    Role function management update    ${Role_function_management_name_UH_zh}
    ${ancestor_element_xpath} =    Get Ancestor XPath    //*[contains(text(),'${Role_function_management_name_UH_zh}')]    ancestor::tr
    Wait And Click    ${ancestor_element_xpath}/td[2]//span[contains(text(),'修改')]
    ${ancestor_element_xpath} =    Get Ancestor XPath    //*[contains(text(),'${Role_function_management_update}')]    ancestor::div
    Verify the testcase is pass (data is existed)    ${ancestor_element_xpath}//div[@class='p-inputswitch p-component p-inputswitch-checked']
    Wait And Click    //*[text()='${cancel}']

公司負責人-管理-角色功能管理-刪除驗證
    Role function management delete    ${Role_function_management_name_UH_zh}
    Verify the testcase is pass (data is not existed)    //*[text()='${Role_function_management_name_UH_zh}']
    Role function management delete    ${Role_function_management_name_OS_zh}
    Verify the testcase is pass (data is not existed)    //*[text()='${Role_function_management_name_OS_zh}']

公司負責人-管理-使用者權限管理-預設經辦驗證
    Wait And Click  //a[@href='/system/users']
    User permission management Search default    ${permission_management_number_Attention}
    Verify the testcase is pass (data is existed)    //*[text()=' ${permission_management_department_name} ']
    Verify the testcase is pass (data is existed)    //*[text()=' - ${permission_management_division_name} ']
    Wait And Click  //button[contains(@class,'p-element p-button functional-button-sub')]/span[contains(text(),'${cancel}')]

公司負責人-管理-使用者權限管理-預設科級主管驗證
    User permission management Search default    ${permission_management_number_Operations_Supervisor}
    Verify the testcase is pass (data is existed)    //*[text()=' ${permission_management_department_name} ']
    Verify the testcase is pass (data is existed)    //*[text()=' - ${permission_management_division_name} ']
    Wait And Click  //button[contains(@class,'p-element p-button functional-button-sub')]/span[contains(text(),'${cancel}')]

公司負責人-管理-使用者權限管理-預設單位主管驗證
    User permission management Search default    ${permission_management_number_Unit_Head}
    Verify the testcase is pass (data is existed)    //*[text()=' ${permission_management_department_name} ']
    Verify the testcase is pass (data is existed)    //*[text()=' - ${permission_management_department_name} ']
    Wait And Click  //button[contains(@class,'p-element p-button functional-button-sub')]/span[contains(text(),'${cancel}')]

公司負責人-管理-使用者權限管理-搜尋驗證
    User permission management search    ${permission_management_Unit_Head}
    Verify the testcase is pass (data is existed)    //*[text()='${permission_management_Unit_Head}']

公司負責人-管理-使用者權限管理-新增驗證
    Wait And Click    //button[@icon='pi pi-file-edit']
    User permission management add - dep    ${Unit_Head}    ${permission_management_department_name}
    User permission management add - dep    ${Unit_Head}    ${permission_management_department_name}
    #User permission management add - dep again    ${Unit_Head}
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${permission_management_error_code_same_role}')]
    Wait And Click    //*[contains(text(),'${ok}')]
    User permission management save
    User permission management search    ${permission_management_Unit_Head}
    Wait And Click    //button[@icon='pi pi-file-edit']
    Verify the testcase is pass (data is existed)    //*[text()=' ${permission_management_department_name} ']

公司負責人-管理-使用者權限管理-刪除驗證
    User permission management delete    ${Unit_Head}
    User permission management save
    User permission management search    ${permission_management_Unit_Head}
    Wait And Click    //button[@icon='pi pi-file-edit']
    Verify the testcase is pass (data is not existed)    //*[text()=' ${permission_management_department_name} ']

公司負責人-管理-使用者權限管理-經辦不可新增主管腳色驗證
    attention role not add manager role permission    ${permission_management_number_Attention}    ${Operations_Supervisor}   ${Unit_Head}    
    ...    ${permission_management_department_name}    ${permission_management_division_name}

公司負責人-管理-使用者權限管理-主管不可新增經辦腳色驗證
    manager role not add attention role permission    ${permission_management_number_Operations_Supervisor}    ${permission_management_number_Unit_Head}    ${Attention}   
    ...    ${permission_management_department_name}    ${permission_management_division_name}

公司負責人-管理-使用者權限管理-雲端經辦不可新增雲端主管腳色驗證
    attention role not add manager role permission    ${permission_management_number_Cloud_Attention}    ${Cloud_Operations_Supervisor}   ${Cloud_Unit_Head}   
    ...    ${permission_management_department_name}    ${permission_management_division_name}

公司負責人-管理-使用者權限管理-雲端主管不可新增雲端經辦腳色驗證
    manager role not add attention role permission    ${permission_management_number_Cloud_Operations_Supervisor}    ${permission_management_number_Cloud_Unit_Head}    ${Cloud_Attention}   
    ...    ${permission_management_department_name}    ${permission_management_division_name}

公司負責人-管理-使用者權限管理-雲端經辦不可新增主管腳色驗證
    attention role not add manager role permission    ${permission_management_number_Cloud_Attention}    ${Operations_Supervisor}   ${Unit_Head}   
    ...    ${permission_management_department_name}    ${permission_management_division_name}

公司負責人-管理-使用者權限管理-雲端主管不可新增經辦腳色驗證
    manager role not add attention role permission    ${permission_management_number_Cloud_Operations_Supervisor}    ${permission_management_number_Cloud_Unit_Head}    ${Attention}   
    ...    ${permission_management_department_name}    ${permission_management_division_name}

公司負責人-管理-使用者權限管理-經辦不可新增雲端主管腳色驗證
    attention role not add manager role permission    ${permission_management_number_Attention}    ${Cloud_Operations_Supervisor}   ${Cloud_Unit_Head}   
    ...    ${permission_management_department_name}    ${permission_management_division_name}

公司負責人-管理-使用者權限管理-主管不可新增雲端經辦腳色驗證
    manager role not add attention role permission    ${permission_management_number_Operations_Supervisor}    ${permission_management_number_Unit_Head}    ${Cloud_Attention}   
    ...    ${permission_management_department_name}    ${permission_management_division_name}

公司負責人-管理-使用者權限管理-經辦代理人不可新增科級主管腳色驗證 
    attention agent role not add manager role permission  Login Attention  ${agent_name_for_Attention}  ${agent_name_for_number_Attention}    ${Operations_Supervisor}   ${Unit_Head}     
    ...    ${permission_management_department_name}    ${permission_management_division_name}

公司負責人-管理-使用者權限管理-科級主管代理人不可新增經辦腳色驗證
    manager agent role not add attention role permission  Login Operations Supervisor   ${agent_name_for_Operations_Supervisor}  ${agent_name_for_number_Operations_Supervisor}  ${Attention}    
    ...    ${permission_management_department_name}    ${permission_management_division_name}

公司負責人-管理-使用者權限管理-雲端經辦代理人不可新增雲端科級主管腳色驗證
    attention agent role not add manager role permission  Login Cloud Attention  ${agent_name_for_Cloud_Attention}  ${agent_name_for_number_Cloud_Attention}    ${Cloud_Operations_Supervisor}   ${Cloud_Unit_Head}     
    ...    ${permission_management_department_name}    ${permission_management_division_name}

公司負責人-管理-使用者權限管理-雲端科級主管代理人不可新增雲端經辦腳色驗證
    manager agent role not add attention role permission  Login Cloud Operations Supervisor   ${agent_name_for_Cloud_Operations_Supervisor}  ${agent_name_for_number_Cloud_Operations_Supervisor}  ${Cloud_Attention}    
    ...    ${permission_management_department_name}    ${permission_management_division_name}

公司負責人-管理-使用者權限管理-經辦代理人不可新增雲端科級主管腳色驗證
    attention agent role not add manager role permission  Login Attention  ${agent_name_for_Attention}  ${agent_name_for_number_Attention}    ${Cloud_Operations_Supervisor}   ${Cloud_Unit_Head}     
    ...    ${permission_management_department_name}    ${permission_management_division_name}

公司負責人-管理-使用者權限管理-科級主管代理人不可新增雲端經辦腳色驗證
    manager agent role not add attention role permission  Login Operations Supervisor   ${agent_name_for_Operations_Supervisor}  ${agent_name_for_number_Operations_Supervisor}  ${Cloud_Attention}    
    ...    ${permission_management_department_name}    ${permission_management_division_name}

公司負責人-管理-使用者權限管理-雲端經辦代理人不可新增科級主管腳色驗證
    attention agent role not add manager role permission  Login Cloud Attention  ${agent_name_for_Cloud_Attention}  ${agent_name_for_number_Cloud_Attention}    ${Operations_Supervisor}   ${Unit_Head}     
    ...    ${permission_management_department_name}    ${permission_management_division_name}

公司負責人-管理-使用者權限管理-雲端科級主管代理人不可新增經辦腳色驗證
    manager agent role not add attention role permission  Login Cloud Operations Supervisor   ${agent_name_for_Cloud_Operations_Supervisor}  ${agent_name_for_number_Cloud_Operations_Supervisor}  ${Attention}    
    ...    ${permission_management_department_name}    ${permission_management_division_name}

公司負責人-管理-使用者權限管理-經辦代理人不可新增科級主管代理人驗證
    attention and manager agent role are conflict    Login Attention  Login Operations Supervisor  ${agent_name_for_Attention}

公司負責人-管理-使用者權限管理-科級主管代理人不可新增經辦代理人驗證
    attention and manager agent role are conflict     Login Operations Supervisor  Login Attention  ${agent_name_for_Attention}

公司負責人-管理-使用者權限管理-雲端經辦代理人不可新增雲端科級主管代理人驗證
    attention and manager agent role are conflict    Login Cloud Attention  Login Cloud Operations Supervisor  ${agent_name_for_Cloud_Attention}

公司負責人-管理-使用者權限管理-雲端科級主管代理人不可新增雲端經辦代理人驗證
    attention and manager agent role are conflict    Login Cloud Operations Supervisor  Login Cloud Attention  ${agent_name_for_Cloud_Attention}

公司負責人-管理-使用者權限管理-經辦代理人不可新增雲端科級主管代理人驗證
#科級主管加上雲端科級主管權限
    attention and manager agent role are cross conflict    Login Attention  Login Operations Supervisor  ${agent_name_for_Attention}    ${permission_management_number_Operations_Supervisor}    ${Cloud_Operations_Supervisor}

公司負責人-管理-使用者權限管理-科級主管代理人不可新增雲端經辦代理人驗證
    attention and manager agent role are cross conflict    Login Operations Supervisor   Login Attention   ${agent_name_for_Attention}    ${permission_management_number_Attention}    ${Cloud_Attention}

公司負責人-管理-使用者權限管理-雲端經辦代理人不可新增科級主管代理人驗證
    attention and manager agent role are cross conflict    Login Cloud Attention   Login Cloud Operations Supervisor   ${agent_name_for_Cloud_Attention}    ${permission_management_number_Cloud_Operations_Supervisor}   ${Operations_Supervisor}

公司負責人-管理-使用者權限管理-雲端科級主管代理人不可新增經辦代理人驗證
    attention and manager agent role are cross conflict    Login Cloud Operations Supervisor    Login Cloud Attention   ${agent_name_for_Cloud_Attention}    ${permission_management_number_Cloud_Attention}    ${Attention}

公司負責人-管理-使用者權限管理-經辦腳色不可新增科級主管代理人驗證
    attention role not add manager agent role permission    Login Operations Supervisor  ${agent_name_for_Attention}  ${agent_name_for_number_Attention}    ${Attention}    ${permission_management_department_name}    ${permission_management_division_name}

公司負責人-管理-使用者權限管理-科級主管腳色不可新增經辦代理人驗證
    manager role not add attention agent role permission    Login Attention  ${agent_name_for_Attention}  ${agent_name_for_number_Attention}  ${Operations_Supervisor}  ${Unit_Head}  ${permission_management_department_name}    ${permission_management_division_name}

公司負責人-管理-使用者權限管理-雲端經辦腳色不可新增雲端科級主管代理人驗證
    attention role not add manager agent role permission    Login Cloud Operations Supervisor  ${agent_name_for_Cloud_Attention}  ${agent_name_for_number_Cloud_Attention}    ${Cloud_Attention}    ${permission_management_department_name}    ${permission_management_division_name}

公司負責人-管理-使用者權限管理-雲端科級主管腳色不可新增雲端經辦代理人驗證
    manager role not add attention agent role permission    Login Cloud Attention  ${agent_name_for_Cloud_Attention}  ${agent_name_for_number_Cloud_Attention}  ${Cloud_Operations_Supervisor}  ${Cloud_Unit_Head}  ${permission_management_department_name}    ${permission_management_division_name}

公司負責人-管理-使用者權限管理-經辦腳色不可新增雲端科級主管代理人驗證
    attention role not add manager agent role permission    Login Cloud Operations Supervisor  ${agent_name_for_Cloud_Attention}  ${agent_name_for_number_Cloud_Attention}    ${Attention}    ${permission_management_department_name}    ${permission_management_division_name}

公司負責人-管理-使用者權限管理-科級主管腳色不可新增雲端經辦代理人驗證
    manager role not add attention agent role permission    Login Cloud Attention  ${agent_name_for_Cloud_Attention}  ${agent_name_for_number_Cloud_Attention}  ${Operations_Supervisor}  ${Unit_Head}  ${permission_management_department_name}    ${permission_management_division_name}

公司負責人-管理-使用者權限管理-雲端經辦腳色不可新增科級主管代理人驗證
    attention role not add manager agent role permission    Login Operations Supervisor  ${agent_name_for_Attention}  ${agent_name_for_number_Attention}    ${Cloud_Attention}    ${permission_management_department_name}    ${permission_management_division_name}

公司負責人-管理-使用者權限管理-雲端科級主管腳色不可新增經辦代理人驗證
    manager role not add attention agent role permission    Login Attention  ${agent_name_for_Attention}  ${agent_name_for_number_Attention}  ${Cloud_Operations_Supervisor}  ${Cloud_Unit_Head}  ${permission_management_department_name}    ${permission_management_division_name}

公司負責人-管理-ISO使用者權限管理-預設ISO經辦驗證
    Wait And Click  //a[@href='/system/specialUsers']
    User permission management Search default    ${permission_management_number_ISOAttention}
    ${ancestor_element_xpath} =    Get Ancestor XPath    //div[3]/span[contains(text(),'${permission_management_now_role}')]    ancestor::div
    Verify the testcase is pass (data is existed)    ${ancestor_element_xpath}/div[3]//td[contains(text(),'${ISOAttention}')]
    Wait And Click  //button[contains(@class,'p-element p-button functional-button-sub')]/span[contains(text(),'${cancel}')]

公司負責人-管理-ISO使用者權限管理-搜尋驗證
    User permission management search    ${permission_management_Unit_Head}
    Verify the testcase is pass (data is existed)    //*[text()='${permission_management_Unit_Head}']

公司負責人-管理-ISO使用者權限管理-新增驗證
    User permission management add - ISO Attention
    User permission management add - ISO Attention again
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${permission_management_error_code_same_role}')]
    Wait And Click    //*[contains(text(),'${ok}')]
    User permission management save
    User permission management search    ${permission_management_Unit_Head}
    Wait And Click    //button[@icon='pi pi-file-edit']
    ${ancestor_element_xpath} =    Get Ancestor XPath    //div[3]/span[contains(text(),'${permission_management_now_role}')]    ancestor::div
    Verify the testcase is pass (data is existed)    ${ancestor_element_xpath}/div[3]//td[contains(text(),'${ISOAttention}')]

公司負責人-管理-ISO使用者權限管理-刪除驗證
    User permission management delete    ${ISOAttention}
    User permission management save
    User permission management search    ${permission_management_Unit_Head}
    Wait And Click    //button[@icon='pi pi-file-edit']
    ${ancestor_element_xpath} =    Get Ancestor XPath    //div[3]/span[contains(text(),'${permission_management_now_role}')]    ancestor::div
    Verify the testcase is pass (data is not existed)    ${ancestor_element_xpath}/div[3]//td[contains(text(),'${ISOAttention}')]

公司負責人-管理-共用選單管理-新增驗證
    Wait And Click  //a[@href='/system/shares']
    Shared menu management add
    Verify the testcase is pass (data is existed)    //*[text()='${Shared_menu_management_list_code}']
    Verify the testcase is pass (data is existed)    //*[text()=' ${Shared_menu_management_list_name_zh} ']
    Verify the testcase is pass (data is existed)    //*[text()=' ${Shared_menu_management_list_name_en} ']

公司負責人-管理-共用選單管理-修改驗證
    Shared menu management update
    Verify the testcase is pass (data is existed)    //*[text()=' ${Shared_menu_management_list_name_zh_update} ']

公司負責人-管理-共用選單管理-刪除驗證
    Shared menu management delete
    Verify the testcase is pass (data is not existed)    //*[text()='${Shared_menu_management_list_code}']
    Verify the testcase is pass (data is not existed)    //*[text()=' ${Shared_menu_management_list_name_zh} ']
    Verify the testcase is pass (data is not existed)    //*[text()=' ${Shared_menu_management_list_name_en} ']

公司負責人-管理-欄位說明管理-修改驗證
    Wait And Click  //a[@href='/system/description']
    Field description management update
    Verify the testcase is pass (data is existed)    //*[text()='${Field_description_management_list_software_name}']

公司負責人-管理-欄位說明管理-刪除驗證
    Field description management delete
    Verify the testcase is pass (data is not existed)    //*[text()='${Field_description_management_list_software_name}']

公司負責人-管理-驗證單位管理-準備工作
    ##給予會被停用跟啟用的部門權限
    Wait And Click  //a[@href='/system/unit-validation']
    Verification unit management check start    ${Verification_unit_management_dep}
    Wait And Click  //a[@href='/system/users']
    User permission management Search default    ${permission_management_number_Attention}
    User permission management add - dep div    ${Attention}    ${Verification_unit_management_dep}    ${Verification_unit_management_div}
    Wait And Click  //*[text()='${save}']
    Wait And Click  //*[text()='${ok}'] 
    Close Browser
    
    Open Browser Chrome and use user
    Login Attention
    Create hard data    ${Verification_unit_hard_data_name}  ${department_name}  ${division_name}  ${Verification_unit_management_dep}  ${Verification_unit_management_div}
    Create soft data    ${Verification_unit_soft_data_name}  ${department_name}  ${division_name}  ${Verification_unit_management_dep}  ${Verification_unit_management_div}
    Create data data    ${Verification_unit_data_data_name}  ${department_name}  ${division_name}  ${Verification_unit_management_dep}  ${Verification_unit_management_div}
    Create paper data    ${Verification_unit_paper_data_name}  ${department_name}  ${division_name}  ${Verification_unit_management_dep}  ${Verification_unit_management_div}
    Create people data    ${Verification_unit_people_data_name}  ${department_name}  ${division_name}  ${Verification_unit_management_dep}  ${Verification_unit_management_div}
    Close Browser
    Open Browser Chrome and use user
    Login System Admin

公司負責人-管理-驗證單位管理-停用部門
    Wait And Click  //a[@href='/system/unit-validation']
    Verification unit management stop/start    ${Verification_unit_management_dep}
    Wait And Click  //a[@href='/system/users']
    Wait And Click  //p-dropdown[@classname='units-dropdown']//*[contains(text(),'${select_dep}')]
    Wait And Input  //input[@autocomplete='off']    ${Verification_unit_management_dep} 
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${no_data}')]
    User permission management Search default    ${permission_management_number_Attention}
    Verify the testcase is pass (data is not existed)    //*[text()[1]=' ${Verification_unit_management_dep} ']
    Verify the testcase is pass (data is not existed)    //*[text()[2]=' - ${Verification_unit_management_div} ']
    Close Browser

公司負責人-管理-驗證單位管理-停用部門-驗證已使用停用的保管或隸屬單位資產   
    Open Browser Chrome and use user
    Login Attention
    Check cus aff dep div is unselected for stop dep    ${Verification_unit_hard_data_name}
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${select_dep}')]
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${select_div}')]
    Wait And Click  //*[text()='${cancel}']
    Wait And Click  //i[@class='pi pi-home']
    Delete data    ${Verification_unit_hard_data_name}

    Check cus aff dep div is unselected for stop dep    ${Verification_unit_soft_data_name}
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${select_dep}')]
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${select_div}')]
    Wait And Click  //*[text()='${cancel}']
    Wait And Click  //i[@class='pi pi-home']
    Delete data    ${Verification_unit_soft_data_name}

    Check cus aff dep div is unselected for stop dep    ${Verification_unit_data_data_name}
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${select_dep}')]
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${select_div}')]
    Wait And Click  //*[text()='${cancel}']
    Wait And Click  //i[@class='pi pi-home']
    Delete data    ${Verification_unit_data_data_name}

    Check cus aff dep div is unselected for stop dep    ${Verification_unit_paper_data_name}
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${select_dep}')]
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${select_div}')]
    Wait And Click  //*[text()='${cancel}']
    Wait And Click  //i[@class='pi pi-home']
    Delete data    ${Verification_unit_paper_data_name}

    Check cus aff dep div is unselected for stop dep    ${Verification_unit_people_data_name}
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${select_dep}')]
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${select_div}')]
    Wait And Click  //*[text()='${cancel}']
    Wait And Click  //i[@class='pi pi-home']
    Delete data    ${Verification_unit_people_data_name}
    Close Browser

公司負責人-管理-驗證單位管理-啟用部門
    Open Browser Chrome and use user
    Login System Admin
    Wait And Click  //a[@href='/system/unit-validation']
    Verification unit management stop/start    ${Verification_unit_management_dep}
    Wait And Click  //a[@href='/system/users']
    Wait And Click  //p-dropdown[@classname='units-dropdown']//*[contains(text(),'${select_dep}')]
    Wait And Input  //input[@autocomplete='off']    ${Verification_unit_management_dep} 
    Verify the testcase is pass (data is existed)    //li[contains(@aria-label,'${Verification_unit_management_dep}')]
    User permission management Search default    ${permission_management_number_Attention}
    Verify the testcase is pass (data is not existed)    //*[text()[1]=' ${Verification_unit_management_dep} ']
    Verify the testcase is pass (data is not existed)    //*[text()[2]=' - ${Verification_unit_management_div} ']

公司負責人-通知驗證
    Reload Page
    Notify 
    
*** Keywords ***


*** Comments ***

