*** Settings ***
Resource    Action.robot
Library  Selenium2Library    run_on_failure=Nothing

*** Variables ***

*** Keywords ***
#資產群組維護
Asset group maintenance add
#新增 資產群組維護的資料
    Wait And Click    //i[@class='pi pi-book']
    Wait And Click    //a[@href='/system/menus']
    Wait And Click    //*[text()='${select_asset_group}']
    Wait And Click    //*[text()=' ${list_hardware} ']
    Wait And Click    //*[text()='${add}']
    Wait And Input    //input[@formcontrolname='apCode']    ${Asset_group_hard_code}
    Wait And Input    //input[@formcontrolname='apNameZh']    ${Asset_group_hard_name_zh} 
    Wait And Input    //input[@formcontrolname='apNameEn']    ${Asset_group_hard_name_en} 
    Wait And Input    //textarea[@formcontrolname='apDescriptionZh']    ${Asset_group_hard_Description_zh}
    Wait And Input    //textarea[@formcontrolname='apDescriptionEn']    ${Asset_group_hard_Description_en}
    Wait And Input    //textarea[@formcontrolname='apExampleZh']    ${Asset_group_hard_Example_zh} 
    Wait And Input    //textarea[@formcontrolname='apExampleEn']    ${Asset_group_hard_Example_en} 
    Wait And Click    //*[text()='${save}']
    Wait And Click    //*[text()='${ok}']
    Sleep    500ms
Asset group maintenance update
#更新 資產群組維護的資料
    Wait And Click    //tbody[@class='p-element p-datatable-tbody']/tr[1]//span[text()='修改']
    Wait And Input    //input[@formcontrolname='apCode']    ${Asset_group_hard_code_update}
    Wait And Click    //*[text()='${save}']
    Wait And Click    //*[text()='${ok}']
    Sleep    500ms

Asset group maintenance enable and disable
#啟用停用 資產群組維護的資料
    Wait And Click    //tbody[@class='p-element p-datatable-tbody']/tr[1]//span[@class='p-inputswitch-slider']
    Wait And Click    //*[text()='${ok}']
    Wait And Click    //*[text()='${ok}']
    Sleep    500ms
Asset group maintenance delete
#刪除 資產群組維護的資料
    Wait And Click    //tbody[@class='p-element p-datatable-tbody']/tr[1]//span[text()='刪除']
    Wait And Click    //*[text()='${ok}']
    Wait And Click    //*[text()='${ok}']
    Sleep    500ms

#角色功能管理
Role function management add
#新增角色
    [Arguments]    ${Role_function_management_name_zh}    ${Role_function_management_name_en}    ${Role_function_management_scope}
    Wait And Click    //*[text()='${add_role_link}']
    Wait And Input    //input[@formcontrolname='nameTW']    ${Role_function_management_name_zh}
    Wait And Input    //input[@formcontrolname='nameEN']    ${Role_function_management_name_en}
    Wait And Click    //p-dropdown[@placeholder='${select_parameter}']
    Wait And Click    //li[contains(@aria-label,'${Role_function_management_scope}')]
    Wait And Click    //*[text()='${save}']
    Wait And Click    //*[text()='${ok}']
    Sleep    500ms

Role function management enable and disable
#啟用停用 角色
    [Arguments]    ${Role_function_management_name_zh} 
    ${ancestor_element_xpath} =    Get Ancestor XPath    //*[contains(text(),'${Role_function_management_name_zh}')]    ancestor::tr
    Wait And Click    ${ancestor_element_xpath}/td[2]/div/span/p-inputswitch/div/span
    Wait And Click    //*[text()='${ok}']
    Wait And Click    //*[text()='${ok}']
    Sleep    500ms

Role function management update
#更新角色
    [Arguments]    ${Role_function_management_name_zh} 
    #找父節點寫法
    ${ancestor_element_xpath} =    Get Ancestor XPath    //*[contains(text(),'${Role_function_management_name_zh}')]    ancestor::tr
    Wait And Click    ${ancestor_element_xpath}/td[2]//span[contains(text(),'修改')]
    ${ancestor_element_xpath} =    Get Ancestor XPath    //*[contains(text(),'${Role_function_management_update}')]    ancestor::div
    Wait And Click    ${ancestor_element_xpath}/p-inputswitch/div
    Wait And Click    //*[text()='${save}']
    Wait And Click    //*[text()='${ok}']
    Sleep    500ms

Role function management delete
#刪除角色
    [Arguments]    ${Role_function_management_name_zh} 
    ${ancestor_element_xpath} =    Get Ancestor XPath    //*[contains(text(),'${Role_function_management_name_zh}')]    ancestor::tr
    Wait And Click    ${ancestor_element_xpath}/td[2]//span[contains(text(),'刪除')]
    Wait And Click    //*[text()='${ok}']
    Wait And Click    //*[text()='${ok}']
    Sleep    500ms

Role function management verify default roles
#驗證預設角色
    [Arguments]    ${Role_function_management_name_zh} 
    ${ancestor_element_xpath} =    Get Ancestor XPath    //*[contains(text(),'${Role_function_management_name_zh}')]    ancestor::tr
    Wait And Click    ${ancestor_element_xpath}/td[2]//span[contains(text(),'修改')]


#使用者權限管理
User permission management Search
#使用員工姓名搜尋
    [Arguments]    ${permission_management_name}
    Wait And Input    //div[contains(@class,'col-4')]/div[2]/input[contains(@type,'text')]    ${permission_management_name}
    Wait And Click    //*[contains(text(),'${search}')] 
    Sleep    500ms

User permission management Search default
#使用員工編號搜尋
    [Arguments]    ${permission_management_number}
    Wait And Input    //div[contains(@class,'col-4')]/div[1]/input[contains(@type,'text')]    ${permission_management_number}
    Wait And Click    //*[contains(text(),'${search}')]
    Wait And Click    //button[@icon='pi pi-file-edit']
    Sleep    500ms

User permission management add - dep
#新增角色-部門
    [Arguments]  ${role_name}    ${permission_management_dep_name}
    ${ancestor_element_xpath} =    Get Ancestor XPath    //*[contains(text(),'${role_name}')]    ancestor::tr
    Wait And Click  ${ancestor_element_xpath}/td[2]//p-dropdown[1]
    Wait And Click  //li[contains(@aria-label,'${permission_management_dep_name}')]
    Wait And Click    ${ancestor_element_xpath}/td[3]/div/button/span[contains(text(),'${add}')]

User permission management add - dep again
#再一次新增角色-部門
    [Arguments]  ${role_name}
    ${ancestor_element_xpath} =    Get Ancestor XPath    //*[contains(text(),'${role_name}')]    ancestor::tr
    Wait And Click    ${ancestor_element_xpath}/td[3]/div/button/span[contains(text(),'${add}')]

User permission management add - dep div
#新增角色-部門科別
    [Arguments]  ${role_name}    ${permission_management_dep_name}    ${permission_management_div_name}   
    ${ancestor_element_xpath} =    Get Ancestor XPath    //*[contains(text(),'${role_name}')]    ancestor::tr
    Wait And Click  ${ancestor_element_xpath}/td[2]//p-dropdown[1] 
    Wait And Click  //li[contains(@aria-label,'${permission_management_dep_name}')]
    Wait And Click  ${ancestor_element_xpath}/td[2]//p-dropdown[2] 
    Wait And Click  //li[contains(@aria-label,'${permission_management_div_name}')]
    Wait And Click    ${ancestor_element_xpath}/td[3]/div/button/span[contains(text(),'${add}')]
    Sleep    500ms

User permission management add - dep div again
#再一次新增角色-部門科別
    [Arguments]  ${role_name}    
    ${ancestor_element_xpath} =    Get Ancestor XPath    //*[contains(text(),'${role_name}')]    ancestor::tr
    Wait And Click    ${ancestor_element_xpath}/td[3]/div/button/span[contains(text(),'${add}')]
    Sleep    500ms

User permission management add - system admin
#新增角色-公司負責人
    [Arguments]  ${role_name}    
    ${ancestor_element_xpath} =    Get Ancestor XPath    //*[contains(text(),'${role_name}')]    ancestor::tr
    Wait And Click    ${ancestor_element_xpath}/td[3]/div/button/span[contains(text(),'${add}')]
    Sleep    500ms

User permission management save
#新增角色-儲存
    Wait And Click  //button[contains(@class,'p-element p-button functional-button p-component')]/span[contains(text(),'${save}')]
    Wait And Click  //button[contains(@class,'p-element p-button functional-button p-component ng-star-inserted')]/span[contains(text(),'${ok}')]
    Wait And Click  //button[contains(@class,'p-element p-button functional-button-sub')]/span[contains(text(),'取消')]
    Sleep    500ms

User permission management delete
#新增角色-刪除
    [Arguments]  ${role_name}
    ${ancestor_element_xpath} =    Get Ancestor XPath    //table[contains(@class,'table section-width')]//*[contains(text(),' ${role_name} ')]    ancestor::tr
    Wait And Click    ${ancestor_element_xpath}/td[3]/div/button/span[text()='${delete}']
    Sleep    500ms

attention role not add manager role permission
#經辦角色不能新增主管角色流程
    [Arguments]    ${number_attention}    ${O_S}   ${U_H}    
    ...    ${permission_dep_name}    ${permission_div_name}
    Wait And Click  //a[@href='/system/users']
    User permission management Search default    ${number_attention}
    User permission management add - dep div    ${O_S}    ${permission_dep_name}    ${permission_div_name}
    Verify the testcase is pass (data is existed)    //*[text()=' ${permission_management_error_code_add_manager_to_attention} ']
    Wait And Click    //*[text()='${ok}']
    User permission management add - dep    ${U_H}    ${permission_dep_name}
    Verify the testcase is pass (data is existed)    //*[text()=' ${permission_management_error_code_add_manager_to_attention} ']
    Wait And Click    //*[text()='${ok}']

manager role not add attention role permission
#主管角色不能新增經辦角色流程
    [Arguments]    ${number_operations_supervisor}    ${number_unit_head}   ${At}    ${permission_dep_name}    ${permission_div_name}
    Wait And Click  //a[@href='/system/users']
    User permission management Search default    ${number_operations_supervisor}
    User permission management add - dep div    ${At}    ${permission_dep_name}    ${permission_div_name}
    Verify the testcase is pass (data is existed)    //*[text()=' ${permission_management_error_code_add_attention_to_manager} ']
    Wait And Click    //*[text()='${ok}']
    Wait And Click  //a[@href='/system/users']
    User permission management Search default    ${number_unit_head}
    User permission management add - dep div    ${At}    ${permission_dep_name}    ${permission_div_name}
    Verify the testcase is pass (data is existed)    //*[text()=' ${permission_management_error_code_add_attention_to_manager} ']
    Wait And Click    //*[text()='${ok}']

attention agent role not add manager role permission
#經辦代理人不能新增主管角色流程
    [Arguments]    ${login_user}  ${agent_name_attention}  ${number_attention}    ${O_S}   ${U_H}     ${permission_dep_name}    ${permission_div_name}
    Open Browser Chrome and use user
    Run Keyword  ${login_user}
    Agent manage add    ${agent_name_attention} 
    Close Browser

    Open Browser Chrome and use user
    Login System Admin
    User permission management Search default    ${number_attention}
    User permission management add - dep div    ${O_S}    ${permission_dep_name}    ${permission_div_name}
    Wait And Click    //*[text()='${save}']
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${agent_error_code_add_manager_to_attention}')]
    Wait And Click    //*[text()='${ok}']
    Wait And Click    //*[text()='${cancel}']
    User permission management Search default    ${number_attention}
    User permission management add - dep    ${U_H}    ${permission_dep_name}
    Wait And Click    //*[text()='${save}']
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${agent_error_code_add_manager_to_attention}')]
    Wait And Click    //*[text()='${ok}']
    Wait And Click    //*[text()='${cancel}']
    Close Browser

    Open Browser Chrome and use user
    Run Keyword  ${login_user}
    Wait And Click  //i[@class='pi pi-book']
    Wait And Click  //a[@href='/system/substitute']
    Agent manage delete
    Close Browser

manager agent role not add attention role permission
#主管代理人不能新增經辦角色流程
    [Arguments]    ${login_user}  ${agent_name_Operations_Supervisor}    ${number_operations_supervisor}  ${At}    ${permission_dep_name}    ${permission_div_name}
    Open Browser Chrome and use user
    Run Keyword  ${login_user}
    Agent manage add    ${agent_name_Operations_Supervisor} 
    Close Browser
    
    Open Browser Chrome and use user
    Login System Admin
    User permission management Search default    ${number_operations_supervisor}
    User permission management add - dep div    ${At}    ${permission_dep_name}    ${permission_div_name}
    Wait And Click    //*[text()='${save}']
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${agent_error_code_add_attention_to_manager}')]
    Wait And Click    //*[text()='${ok}']
    Wait And Click    //*[text()='${cancel}']
    Close Browser

    Open Browser Chrome and use user
    Run Keyword  ${login_user}
    Wait And Click  //i[@class='pi pi-book']
    Wait And Click  //a[@href='/system/substitute']
    Agent manage delete
    Close Browser

attention role not add manager agent role permission
#經辦角色不能新增主管代理人流程
    [Arguments]    ${login_user}  ${agent_name_attention}  ${number_attention}    ${At}    ${permission_dep_name}    ${permission_div_name}
    Open Browser Chrome and use user
    Login System Admin
    User permission management Search default    ${number_attention}
    User permission management add - dep div    ${At}    ${permission_dep_name}    ${permission_div_name}
    Wait And Click    //*[text()='${save}']
    Wait And Click    //*[text()='${ok}']
    Wait And Click    //*[text()='${cancel}']
    Close Browser

    Open Browser Chrome and use user
    Run Keyword    ${login_user}
    Wait And Click  //i[@class='pi pi-book']
    Wait And Click  //a[@href='/system/substitute']
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${agent_remind}')]
    Wait And Click  //span[@class='p-button-icon p-button-icon-left pi pi-plus']
    Wait And Click  //div[@class='drop-down sub p-dropdown p-component']//div[@class='p-dropdown-trigger']
    Wait And Click  //li[@aria-label='${agent_name_attention}']
    Wait And Click  //p-calendar[contains(@formcontrolname,'startDate')]
    Select calendar month and day    ${agent_start_day}   
    Wait And Click  //p-calendar[contains(@formcontrolname,'endDate')]
    Select calendar month and day   ${agent_end_day} 
    Wait And Input  //textarea[contains(@formcontrolname,'notes')]    ${agent_add_reason} 
    Wait And Click  //span[text()='${save}']
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${agent_error_code_add_attention_and_mamanger_conflict}')]
    Wait And Click  //button[@class='p-element p-button functional-button p-component ng-star-inserted'] 
    Close Browser

    Open Browser Chrome and use user
    Login System Admin
    User permission management Search default    ${number_attention}
    User permission management delete    ${At}
    User permission management save
    Close Browser

manager role not add attention agent role permission
#主管角色不能新增經辦代理人流程
    [Arguments]    ${login_user}  ${agent_name_attention}  ${number_attention}    ${OS}    ${UH}    ${permission_dep_name}    ${permission_div_name}
    Open Browser Chrome and use user
    Login System Admin
    User permission management Search default    ${number_attention}
    User permission management add - dep div    ${OS}    ${permission_dep_name}    ${permission_div_name}
    User permission management add - dep    ${UH}    ${permission_dep_name}
    Wait And Click    //*[text()='${save}']
    Wait And Click    //*[text()='${ok}']
    Wait And Click    //*[text()='${cancel}']
    Close Browser

    Open Browser Chrome and use user
    Run Keyword    ${login_user}
    Wait And Click  //i[@class='pi pi-book']
    Wait And Click  //a[@href='/system/substitute']
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${agent_remind}')]
    Wait And Click  //span[@class='p-button-icon p-button-icon-left pi pi-plus']
    Wait And Click  //div[@class='drop-down sub p-dropdown p-component']//div[@class='p-dropdown-trigger']
    Wait And Click  //li[@aria-label='${agent_name_attention}']
    Wait And Click  //p-calendar[contains(@formcontrolname,'startDate')]
    Select calendar month and day    ${agent_start_day}   
    Wait And Click  //p-calendar[contains(@formcontrolname,'endDate')]
    Select calendar month and day   ${agent_end_day} 
    Wait And Input  //textarea[contains(@formcontrolname,'notes')]    ${agent_add_reason} 
    Wait And Click  //span[text()='${save}']
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${agent_error_code_add_attention_and_mamanger_conflict}')]
    Wait And Click  //button[@class='p-element p-button functional-button p-component ng-star-inserted'] 
    Close Browser

    Open Browser Chrome and use user
    Login System Admin
    User permission management Search default    ${number_attention}
    User permission management delete    ${OS}
    User permission management delete    ${UH}
    User permission management save
    Close Browser

#ISO使用者權限管理
User permission management add - ISO Attention
#新增 ISO經辦
    Wait And Click  //button[@icon='pi pi-file-edit']
    ${ancestor_element_xpath} =    Get Ancestor XPath    //div[3]/span[contains(text(),'${permission_management_now_role}')]    ancestor::div
    ${ISO_Attention_status} =    Run Keyword And Return Status    Wait Until Element Is Visible    ${ancestor_element_xpath}/div[3]//td[contains(text(),'${ISOAttention}')]
    Run Keyword If  '${ISO_Attention_status}' == '${false}'   Wait And Click  //*[text()='${add}']
    ...    ELSE    Run Keywords  
    ...  Wait And Click  //*[text()='${delete}']  AND  Wait And Click  //*[text()='${save}']  
    ...  AND  Wait And Click  //*[text()='${ok}']  AND  Wait And Click  //*[text()='${add}']
    Sleep    500ms

User permission management add - ISO Attention again
#再一次新增 ISO經辦
    Wait And Click  //*[text()='${add}']
    Sleep    500ms

#共用選單管理
Shared menu management add
#新增 共用選單管理
    Wait And Click    //p-dropdown[@styleclass='drop-down no-outlined'] 
    Wait And Click  //*[text()='${Shared_menu_management_list}']
    Wait And Click  //*[text()='${add}']
    Wait And Input    //div[3]/form/div/div[1]/div/div/input    ${Shared_menu_management_list_code}
    Wait And Input    //div[3]/form/div/div[2]/div/div/input    ${Shared_menu_management_list_name_zh}
    Wait And Input    //div[3]/form/div/div[3]/div/div/input    ${Shared_menu_management_list_name_en}
    Wait And Click  //*[text()='${save}']
    Wait And Click  //*[text()='${ok}']
    Sleep    500ms

Shared menu management update
#更新 共用選單管理
    ${ancestor_element_xpath} =    Get Ancestor XPath    //*[contains(text(),'${Shared_menu_management_list_code}')]    ancestor::tr
    Wait And Click    ${ancestor_element_xpath}//*[text()='${update}']
    Wait And Input    ${ancestor_element_xpath}//td[2]//p-celleditor/input    ${Shared_menu_management_list_name_zh_update} 
    Wait And Click    ${ancestor_element_xpath}//*[text()='${save}']
    Wait And Click    //*[text()='${ok}']
    Sleep    500ms
Shared menu management delete
#刪除 共用選單管理
    ${ancestor_element_xpath} =    Get Ancestor XPath    //*[contains(text(),'${Shared_menu_management_list_code}')]    ancestor::tr
    Wait And Click    ${ancestor_element_xpath}//*[text()='${update}']
    Wait And Click    ${ancestor_element_xpath}//*[text()='${delete}']
    Wait And Click    //*[text()='${ok}']
    Sleep    500ms

#代理人管理
Agent manage add
#新增 代理人
    [Arguments]  ${agent_name}
    Wait And Click  //i[@class='pi pi-book']
    Wait And Click  //a[@href='/system/substitute']
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${agent_remind}')]
    Wait And Click  //span[@class='p-button-icon p-button-icon-left pi pi-plus']
    Wait And Click  //div[@class='drop-down sub p-dropdown p-component']//div[@class='p-dropdown-trigger']
    Wait And Click  //li[@aria-label='${agent_name}']
    Wait And Click  //p-calendar[contains(@formcontrolname,'startDate')]
    Select calendar month and day    ${agent_start_day}   
    Wait And Click  //p-calendar[contains(@formcontrolname,'endDate')]
    Select calendar month and day   ${agent_end_day} 
    Wait And Input  //textarea[contains(@formcontrolname,'notes')]    ${agent_add_reason} 
    Wait And Click  //span[text()='${save}']
    Wait And Click  //button[@class='p-element p-button functional-button p-component ng-star-inserted']
    Sleep    500ms    

Agent manage add again
#再一次新增 代理人
    [Arguments]  ${agent_name}
    Wait And Click  //span[@class='p-button-icon p-button-icon-left pi pi-plus']
    Wait And Click  //div[@class='drop-down sub p-dropdown p-component']//div[@class='p-dropdown-trigger']
    Wait And Click  //li[@aria-label='${agent_name}']
    Wait And Click  //p-calendar[contains(@formcontrolname,'startDate')]
    Select calendar month and day    ${agent_start_day}   
    Wait And Click  //p-calendar[contains(@formcontrolname,'endDate')]
    Select calendar month and day   ${agent_end_day} 
    Wait And Input  //textarea[contains(@formcontrolname,'notes')]    ${agent_add_reason} 
    Wait And Click  //span[text()='${save}']
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${agent_error_code_2084}')]
    Wait And Click  //button[@class='p-element p-button functional-button p-component ng-star-inserted']
    Sleep    500ms  

Agent manage update
#更新 代理人
    Wait And Click  //button[@class='p-element p-button functional-button me-2 p-component ng-star-inserted']
    Wait And Input  //textarea[contains(@formcontrolname,'notes')]    ${agent_update_reason} 
    Wait And Click  //span[text()='${save}']
    Wait And Click  //button[@class='p-element p-button functional-button p-component ng-star-inserted']
    Sleep    500ms  

Agent manage search
#搜尋 代理人
    Wait And Click    //*[contains(text(),'${clear}')]
    Wait And Click    //*[contains(text(),'${ok}')]
    Wait And Click    //*[contains(text(),'${ok}')]
    Wait And Click  //p-calendar[contains(@inputid,'basic')]
    Select calendar month and day    ${agent_start_day}
    Wait And Click  //div[contains(@class,'w-100 d-flex justify-content-start searchbar pt-5 pb-2')]//p-calendar[2]
    Select calendar month and day    ${agent_end_day}
    Wait And Click  //button[contains(@class,'p-element p-button functional-button ml-5 p-component')]
    Sleep    500ms   

Agent manage delete
#刪除 代理人
    Wait And Click  //button[@class='p-element p-button functional-button-sub me-2 p-component ng-star-inserted']
    Wait And Click  //button[@class='p-element p-button functional-button p-component ng-star-inserted']
    Wait And Click  //button[@class='p-element p-button functional-button p-component ng-star-inserted']
    Sleep    500ms  

attention and manager agent role are conflict
#經辦,科級主管代理人不可互加流程
    [Arguments]    ${login_user_first}  ${login_user_second}  ${agent_name}
    Open Browser Chrome and use user
    Run Keyword    ${login_user_first}
    Agent manage add    ${agent_name} 
    Close Browser

    Open Browser Chrome and use user
    Run Keyword    ${login_user_second}
    Wait And Click  //i[@class='pi pi-book']
    Wait And Click  //a[@href='/system/substitute']
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${agent_remind}')]
    Wait And Click  //span[@class='p-button-icon p-button-icon-left pi pi-plus']
    Wait And Click  //div[@class='drop-down sub p-dropdown p-component']//div[@class='p-dropdown-trigger']
    Wait And Click  //li[@aria-label='${agent_name}']
    Wait And Click  //p-calendar[contains(@formcontrolname,'startDate')]
    Select calendar month and day    ${agent_start_day}   
    Wait And Click  //p-calendar[contains(@formcontrolname,'endDate')]
    Select calendar month and day   ${agent_end_day} 
    Wait And Input  //textarea[contains(@formcontrolname,'notes')]    ${agent_add_reason} 
    Wait And Click  //span[text()='${save}']
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${agent_error_code_add_attention_and_mamanger_conflict}')]
    Wait And Click  //button[@class='p-element p-button functional-button p-component ng-star-inserted'] 
    Sleep    500ms
    Close Browser

    Open Browser Chrome and use user
    Run Keyword    ${login_user_first}
    Wait And Click  //i[@class='pi pi-book']
    Wait And Click  //a[@href='/system/substitute']
    Agent manage delete
    Close Browser

attention and manager agent role are cross conflict
#其中一個為雲端的經辦,科級主管代理人不可互加流程
    [Arguments]    ${login_user_first}  ${login_user_second}  ${agent_name}    ${permission_number}    ${add_permission}
    Open Browser Chrome and use user
    Run Keyword    ${login_user_first}
    Agent manage add    ${agent_name} 
    Close Browser

    #加權限
    Open Browser Chrome and use user
    Login System Admin
    User permission management Search default    ${permission_number}
    User permission management add - dep div    ${add_permission}    ${permission_management_department_name}    ${permission_management_division_name}
    User permission management save
    Close Browser

    Open Browser Chrome and use user
    Run Keyword    ${login_user_second}
    Wait And Click    //app-header/div/div[2]/div/p-dropdown/div/span
    Wait And Click    //ul/p-dropdownitem/li[text()=' ${add_permission} ']
    Sleep    1s  
    Reload Page
    Wait And Click  //i[@class='pi pi-book']
    Wait And Click  //a[@href='/system/substitute']
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${agent_remind}')]
    Wait And Click  //span[@class='p-button-icon p-button-icon-left pi pi-plus']
    Wait And Click  //div[@class='drop-down sub p-dropdown p-component']//div[@class='p-dropdown-trigger']
    Wait And Click  //li[@aria-label='${agent_name}']
    Wait And Click  //p-calendar[contains(@formcontrolname,'startDate')]
    Select calendar month and day    ${agent_start_day}   
    Wait And Click  //p-calendar[contains(@formcontrolname,'endDate')]
    Select calendar month and day   ${agent_end_day} 
    Wait And Input  //textarea[contains(@formcontrolname,'notes')]    ${agent_add_reason} 
    Wait And Click  //span[text()='${save}']
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${agent_error_code_add_attention_and_mamanger_conflict}')]
    Wait And Click  //button[@class='p-element p-button functional-button p-component ng-star-inserted'] 
    Sleep    500ms
    Close Browser

    #刪除權限
    Open Browser Chrome and use user
    Login System Admin
    User permission management Search default    ${permission_number}
    User permission management delete    ${add_permission}
    User permission management save
    Close Browser

    Open Browser Chrome and use user
    Run Keyword    ${login_user_first}
    Wait And Click  //i[@class='pi pi-book']
    Wait And Click  //a[@href='/system/substitute']
    Agent manage delete
    Close Browser

#欄位說明管理
Field description management update
#更新 欄位說明管理內容
    Wait And Click    //p-dropdown[@styleclass='drop-down no-outlined']
    Wait And Click  //*[text()='${Field_description_management_list}']
    Wait And Click  //*[text()='${update}']
    Wait And Input  //div[@role='dialog']//div[3]/div[2]/div[5]/input    ${Field_description_management_list_software_name} 
    Wait And Click  //*[text()='${save}']
    Wait And Click  //*[text()='${ok}']
    Sleep    500ms 

Field description management delete
#刪除 欄位說明管理內容
    Wait And Click  //*[text()='${update}']
    Wait And Input  //div[@role='dialog']//div[3]/div[2]/div[5]/input    ${space}
    Wait And Click  //*[text()='${save}']
    Wait And Click  //*[text()='${ok}']
    Sleep    500ms 

Verification unit management stop/start
#啟動停用 驗證單位管理部門
    [Arguments]  ${agent_name}
    ${ancestor_element_xpath} =    Get Ancestor XPath    //*[contains(text(),'${agent_name}')]    ancestor::tr
    Wait And Click    ${ancestor_element_xpath}//span[@class='p-inputswitch-slider']
    Wait And Click  //*[text()='${ok}']   
    Wait And Click  //*[text()='${ok}'] 

Verification unit management check start
#確認 驗證單位管理部門為啟用
    [Arguments]  ${agent_name}
    ${ancestor_element_xpath} =    Get Ancestor XPath    //*[contains(text(),'${agent_name}')]    ancestor::tr
    ${Verification_unit_status} =     Run Keyword And Return Status    Wait Until Element Is Visible    ${ancestor_element_xpath}//div[@class='p-inputswitch p-component p-inputswitch-checked']
    Run Keyword If  '${Verification_unit_status}' != '${true}'  Run Keywords    Wait And Click    ${ancestor_element_xpath}//span[@class='p-inputswitch-slider']  AND  Wait And Click  //*[text()='${ok}']  AND  Wait And Click  //*[text()='${ok}']


*** Comments ***
#常用部門組織管理
Most used department management list
    Wait And Click  //i[@class='pi pi-book']
    Wait And Click  //a[@href='/system/most-used']
    Sleep    500ms

Most used department management edit
    Wait And Click  //span[@class='label-function clickable']
    Wait And Click  //p-checkbox[@inputid='all']
    Wait And Click  //*[text()='${save}']
    Wait And Click  //*[text()='${ok}']
    Sleep    500ms

Most used department management add
    Wait And Click  //span[@class='label-function']
    Wait And Click  //p-checkbox[@inputid='all']
    Wait And Click  //*[text()='${save}']
    Wait And Click  //*[text()='${ok}']
    Sleep    500ms

