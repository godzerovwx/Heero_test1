*** Settings ***
Resource    Action.robot
Library  Selenium2Library    run_on_failure=Nothing

*** Variables ***

*** Keywords ***
#資產群組維護
Asset group maintenance add
    Wait And Click    //i[@class='pi pi-book']
    Wait And Click    //a[@href='/system/menus']
    Wait And Click    //*[text()='請選擇資產群組']
    Wait And Click    //*[text()=' 硬體 ']
    Wait And Click    //*[text()='新增']
    Wait And Input    //input[@formcontrolname='apCode']    ${Asset_group_hard_code}
    Wait And Input    //input[@formcontrolname='apNameZh']    ${Asset_group_hard_name_zh} 
    Wait And Input    //input[@formcontrolname='apNameEn']    ${Asset_group_hard_name_en} 
    Wait And Input    //textarea[@formcontrolname='apDescriptionZh']    ${Asset_group_hard_Description_zh}
    Wait And Input    //textarea[@formcontrolname='apDescriptionEn']    ${Asset_group_hard_Description_en}
    Wait And Input    //textarea[@formcontrolname='apExampleZh']    ${Asset_group_hard_Example_zh} 
    Wait And Input    //textarea[@formcontrolname='apExampleEn']    ${Asset_group_hard_Example_en} 
    Wait And Click    //*[text()='儲存']
    Wait And Click    //*[text()='確定']
    Sleep    500ms
Asset group maintenance update
    Wait And Click    //tbody[@class='p-element p-datatable-tbody']/tr[1]//span[text()='修改']
    Wait And Input    //input[@formcontrolname='apCode']    ${Asset_group_hard_code_update}
    Wait And Click    //*[text()='儲存']
    Wait And Click    //*[text()='確定']
    Sleep    500ms

Asset group maintenance enable and disable
    Wait And Click    //tbody[@class='p-element p-datatable-tbody']/tr[1]//span[@class='p-inputswitch-slider']
    Wait And Click    //*[text()='確定']
    Wait And Click    //*[text()='確定']
    Sleep    500ms
Asset group maintenance delete
    Wait And Click    //tbody[@class='p-element p-datatable-tbody']/tr[1]//span[text()='刪除']
    Wait And Click    //*[text()='確定']
    Wait And Click    //*[text()='確定']
    Sleep    500ms

#角色功能管理
Role function management add
    [Arguments]    ${Role_function_management_name_zh}    ${Role_function_management_name_en}    ${Role_function_management_scope}
    Wait And Click    //a[@href='/system/roles']
    Wait And Click    //*[text()='新增角色']
    Wait And Input    //input[@formcontrolname='nameTW']    ${Role_function_management_name_zh}
    Wait And Input    //input[@formcontrolname='nameEN']    ${Role_function_management_name_en}
    Wait And Click    //p-dropdown[@placeholder='請選擇']
    Wait And Click    //li[contains(@aria-label,'${Role_function_management_scope}')]
    Wait And Click    //*[text()='儲存']
    Wait And Click    //*[text()='確定']
    Sleep    500ms

Role function management enable and disable
    [Arguments]    ${Role_function_management_name_zh} 
    ${ancestor_element_xpath} =    Get Ancestor XPath    //*[contains(text(),'${Role_function_management_name_zh}')]    ancestor::tr
    Wait And Click    ${ancestor_element_xpath}/td[2]/div/span/p-inputswitch/div/span
    Wait And Click    //*[text()='確定']
    Wait And Click    //*[text()='確定']
    Sleep    500ms

Role function management update
    [Arguments]    ${Role_function_management_name_zh} 
    #找父節點寫法
    ${ancestor_element_xpath} =    Get Ancestor XPath    //*[contains(text(),'${Role_function_management_name_zh}')]    ancestor::tr
    Wait And Click    ${ancestor_element_xpath}/td[2]//span[contains(text(),'修改')]
    ${ancestor_element_xpath} =    Get Ancestor XPath    //*[contains(text(),'${Role_function_management_update}')]    ancestor::div
    Wait And Click    ${ancestor_element_xpath}/p-inputswitch/div
    Wait And Click    //*[text()='儲存']
    Wait And Click    //*[text()='確定']
    Sleep    500ms

Role function management delete
    [Arguments]    ${Role_function_management_name_zh} 
    ${ancestor_element_xpath} =    Get Ancestor XPath    //*[contains(text(),'${Role_function_management_name_zh}')]    ancestor::tr
    Wait And Click    ${ancestor_element_xpath}/td[2]//span[contains(text(),'刪除')]
    Wait And Click    //*[text()='確定']
    Wait And Click    //*[text()='確定']
    Sleep    500ms

Role function management verify default roles
    [Arguments]    ${Role_function_management_name_zh} 
    ${ancestor_element_xpath} =    Get Ancestor XPath    //*[contains(text(),'${Role_function_management_name_zh}')]    ancestor::tr
    Wait And Click    ${ancestor_element_xpath}/td[2]//span[contains(text(),'修改')]
    

#常用部門組織管理
Most used department management list
    Wait And Click  //i[@class='pi pi-book']
    Wait And Click  //a[@href='/system/most-used']
    Sleep    500ms

Most used department management edit
    Wait And Click  //span[@class='label-function clickable']
    Wait And Click  //p-checkbox[@inputid='all']
    Wait And Click  //*[text()='儲存']
    Wait And Click  //*[text()='確定']
    Sleep    500ms

Most used department management add
    Wait And Click  //span[@class='label-function']
    Wait And Click  //p-checkbox[@inputid='all']
    Wait And Click  //*[text()='儲存']
    Wait And Click  //*[text()='確定']
    Sleep    500ms

#使用者權限管理
User permission management Search    
    [Arguments]    ${permission_management_name}
    Wait And Click  //p-dropdown[@classname='units-dropdown']//*[contains(text(),'請選擇(部)')] 
    Wait And Click  //li[contains(@aria-label,'${department_name}')]
    Wait And Click  //div[@class='p-multiselect-label p-placeholder' and contains(text(),'請選擇(科)')]
    Wait And Click    //div[@class='p-checkbox p-component ng-star-inserted']
    Wait And Click    //span[@class='p-multiselect-close-icon pi pi-times']
    Wait And Input    //div[contains(@class,'col-4')]/div[2]/input[contains(@type,'text')]    ${permission_management_name}
    Wait And Click    //*[contains(text(),'搜尋')] 
    Sleep    500ms

User permission management Search default
    [Arguments]    ${permission_management_number}
    #Wait And Click  //p-dropdown[@classname='units-dropdown']//*[contains(text(),'請選擇(部)')] 
    #Wait And Click  //li[contains(@aria-label,'${department_name}')]
    #Wait And Click  //div[@class='p-multiselect-label p-placeholder' and contains(text(),'請選擇(科)')]
    #Wait And Click    //div[@class='p-checkbox p-component ng-star-inserted']
    #Wait And Click    //span[@class='p-multiselect-close-icon pi pi-times']
    Wait And Input    //div[contains(@class,'col-4')]/div[1]/input[contains(@type,'text')]    ${permission_management_number}
    Wait And Click    //*[contains(text(),'搜尋')]
    Wait And Click    //button[@icon='pi pi-file-edit']
    Sleep    500ms

User permission management add - dep
    [Arguments]  ${role_name}
    ${ancestor_element_xpath} =    Get Ancestor XPath    //*[contains(text(),'${role_name}')]    ancestor::tr
    Wait And Click  ${ancestor_element_xpath}/td[2]//p-dropdown[@classname='units-dropdown']//*[contains(text(),'請選擇(部)')] 
    Wait And Click  //li[contains(@aria-label,'${permission_management_department_name}')]
    Wait And Click    ${ancestor_element_xpath}/td[3]/div/button/span[contains(text(),'新增')]

User permission management add - dep again
    [Arguments]  ${role_name}
    ${ancestor_element_xpath} =    Get Ancestor XPath    //*[contains(text(),'${role_name}')]    ancestor::tr
    Wait And Click    ${ancestor_element_xpath}/td[3]/div/button/span[contains(text(),'新增')]

User permission management add - dep div
    [Arguments]  ${role_name}    
    ${ancestor_element_xpath} =    Get Ancestor XPath    //*[contains(text(),'${role_name}')]    ancestor::tr
    Wait And Click  ${ancestor_element_xpath}/td[2]//p-dropdown[@classname='units-dropdown']//*[contains(text(),'請選擇(部)')] 
    Wait And Click  //li[contains(@aria-label,'${permission_management_department_name}')]
    Wait And Click  ${ancestor_element_xpath}/td[2]//p-dropdown[@styleclass='input-field units-dropdown']//*[contains(text(),'請選擇(科)')] 
    Wait And Click  //li[contains(@aria-label,'${permission_management_division_name}')]
    Wait And Click    ${ancestor_element_xpath}/td[3]/div/button/span[contains(text(),'新增')]
    Sleep    500ms

User permission management add - dep div again
    [Arguments]  ${role_name}    
    ${ancestor_element_xpath} =    Get Ancestor XPath    //*[contains(text(),'${role_name}')]    ancestor::tr
    Wait And Click    ${ancestor_element_xpath}/td[3]/div/button/span[contains(text(),'新增')]
    Sleep    500ms

User permission management add - system admin
    [Arguments]  ${role_name}    
    ${ancestor_element_xpath} =    Get Ancestor XPath    //*[contains(text(),'${role_name}')]    ancestor::tr
    Wait And Click    ${ancestor_element_xpath}/td[3]/div/button/span[contains(text(),'新增')]
    Sleep    500ms

User permission management save
    Wait And Click  //button[contains(@class,'p-element p-button functional-button p-component')]/span[contains(text(),'儲存')]
    Wait And Click  //button[contains(@class,'p-element p-button functional-button p-component ng-star-inserted')]/span[contains(text(),'確定')]
    Wait And Click  //button[contains(@class,'p-element p-button functional-button-sub')]/span[contains(text(),'取消')]
    Sleep    500ms

User permission management delete
    [Arguments]  ${role_name}
    ${ancestor_element_xpath} =    Get Ancestor XPath    //table[contains(@class,'table section-width')]//*[contains(text(),' ${role_name} ')]    ancestor::tr
    Wait And Click    ${ancestor_element_xpath}/td[3]/div/button/span[text()='${delete}']
    Sleep    500ms

#ISO使用者權限管理
User permission management add - ISO Attention
    Wait And Click  //button[@icon='pi pi-file-edit']
    Wait And Click  //*[text()='${add}']
    Sleep    500ms

User permission management add - ISO Attention again
    Wait And Click  //*[text()='${add}']
    Sleep    500ms

#共用選單管理
Shared menu management add
    Wait And Click    //p-dropdown[@styleclass='drop-down no-outlined'] 
    Wait And Click  //*[text()='${Shared_menu_management_list}']
    Wait And Click  //*[text()='${add}']
    Wait And Input    //div[@role='dialog']/div[3]/div[2]/div[1]/input    ${Shared_menu_management_list_code}
    Wait And Input    //div[@role='dialog']/div[3]/div[2]/div[2]/input    ${Shared_menu_management_list_name_zh}
    Wait And Input    //div[@role='dialog']/div[3]/div[2]/div[3]/input    ${Shared_menu_management_list_name_en}
    Wait And Click  //*[text()='${save}']
    Wait And Click  //*[text()='${ok}']
    Sleep    500ms

Shared menu management update
    ${ancestor_element_xpath} =    Get Ancestor XPath    //*[contains(text(),'${Shared_menu_management_list_code}')]    ancestor::tr
    Wait And Click    ${ancestor_element_xpath}//*[text()='${update}']
    Wait And Input    ${ancestor_element_xpath}//td[2]/p-celleditor/input    ${Shared_menu_management_list_name_zh_update} 
    Wait And Click    ${ancestor_element_xpath}//*[text()='${save}']
    Wait And Click    //*[text()='${ok}']
    Sleep    500ms
Shared menu management delete
    ${ancestor_element_xpath} =    Get Ancestor XPath    //*[contains(text(),'${Shared_menu_management_list_code}')]    ancestor::tr
    Wait And Click    ${ancestor_element_xpath}//*[text()='${update}']
    Wait And Click    ${ancestor_element_xpath}//*[text()='${delete}']
    Wait And Click    //*[text()='${ok}']
    Sleep    500ms

#代理人管理
Agent manage add
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
    Wait And Click  //span[text()='儲存']
    Wait And Click  //button[@class='p-element p-button functional-button p-component ng-star-inserted']
    Sleep    500ms    

Agent manage add again
    [Arguments]  ${agent_name}
    Wait And Click  //span[@class='p-button-icon p-button-icon-left pi pi-plus']
    Wait And Click  //div[@class='drop-down sub p-dropdown p-component']//div[@class='p-dropdown-trigger']
    Wait And Click  //li[@aria-label='${agent_name}']
    Wait And Click  //p-calendar[contains(@formcontrolname,'startDate')]
    Select calendar month and day    ${agent_start_day}   
    Wait And Click  //p-calendar[contains(@formcontrolname,'endDate')]
    Select calendar month and day   ${agent_end_day} 
    Wait And Input  //textarea[contains(@formcontrolname,'notes')]    ${agent_add_reason} 
    Wait And Click  //span[text()='儲存']
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${agent_error_code_2084}')]
    Wait And Click  //button[@class='p-element p-button functional-button p-component ng-star-inserted']
    Sleep    500ms  

Agent manage update
    Wait And Click  //button[@class='p-element p-button functional-button me-2 p-component ng-star-inserted']
    Wait And Input  //textarea[contains(@formcontrolname,'notes')]    ${agent_update_reason} 
    Wait And Click  //span[text()='儲存']
    Wait And Click  //button[@class='p-element p-button functional-button p-component ng-star-inserted']
    Sleep    500ms  
Agent manage search
    Wait And Click  //p-calendar[contains(@inputid,'basic')]
    Select calendar month and day    ${agent_start_day}
    Wait And Click  //div[contains(@class,'w-100 d-flex justify-content-start searchbar pt-5 pb-2')]//p-calendar[2]
    Select calendar month and day    ${agent_end_day}
    Wait And Click  //button[contains(@class,'p-element p-button functional-button ml-5 p-component')]
    Sleep    500ms   

Agent manage delete
    Wait And Click  //button[@class='p-element p-button functional-button-sub me-2 p-component ng-star-inserted']
    Wait And Click  //button[@class='p-element p-button functional-button p-component ng-star-inserted']
    Wait And Click  //button[@class='p-element p-button functional-button p-component ng-star-inserted']
    Sleep    500ms  

#欄位說明管理
Field description management update
    Wait And Click    //p-dropdown[@styleclass='drop-down no-outlined']
    Wait And Click  //*[text()='${Field_description_management_list}']
    Wait And Click  //*[text()='${update}']
    Wait And Input  //div[@role='dialog']//div[3]/div[2]/div[5]/input    ${Field_description_management_list_software_name} 
    Wait And Click  //*[text()='${save}']
    Wait And Click  //*[text()='${ok}']
    Sleep    500ms 

Field description management delete
    Wait And Click  //*[text()='${update}']
    Wait And Input  //div[@role='dialog']//div[3]/div[2]/div[5]/input    ${space}
    Wait And Click  //*[text()='${save}']
    Wait And Click  //*[text()='${ok}']
    Sleep    500ms 

*** Comments ***


