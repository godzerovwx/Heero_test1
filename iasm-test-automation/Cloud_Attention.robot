*** Settings ***
Resource  Resource/IASMImportLib.robot

Suite Setup    Open Browser Chrome and use user
Suite Teardown    Close Browser 
Test Teardown	Run Keyword If Test Failed	Capture Page Screenshot

*** Variables ***
${FILE_PATH}    shared_data.txt

*** Test Cases ***
#*** Comments ***
雲端經辦-管理-清單顯示驗證
    Login Cloud Attention
    Wait And Click    //i[@class='pi pi-book']
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${agent_management_link}')]
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${cloud_asset_settings_link}')]
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${cloud_shared_menu_management_link}')]

雲端經辦-管理-雲端資產設定頁面驗證
    Wait And Click    //a[@href="/system/cloud/AssetSetting"]
    Verify the testcase is pass (data is existed)    //div[@class="col"]/button[1][@disabled]/span[2][contains(text(),'${sync_now}')]
    Verify the testcase is pass (data is existed)    //div[@class="col"]/button[2][@disabled]/span[2][contains(text(),'${cancel_now}')]
    Verify the testcase is pass (data is existed)    //div/button/span[2][contains(text(),'${Add_new_settings}')]

雲端經辦-管理-雲端資產設定新增頁面字串驗證
    Wait And Click    //a[@href="/system/cloud/AssetSetting"]
    Wait And Click    //div/button/span[2][contains(text(),'${Add_new_settings}')]
    Verify the testcase is pass (data is existed)    //span[contains(text(),'${Cloud_asset_settings_des_title}')]
    Verify the testcase is pass (data is existed)    //div[contains(text(),'${Cloud_asset_settings_des_1}')]
    Verify the testcase is pass (data is existed)    //p[contains(text(),'${Cloud_asset_settings_des_2}')]
    Verify the testcase is pass (data is existed)    //p[contains(text(),'${Cloud_asset_settings_des_3}')]
    Verify the testcase is pass (data is existed)    //p[contains(text(),'${Cloud_asset_settings_des_4}')]
    Verify the testcase is pass (data is existed)    //label[contains(text(),'${Cloud_asset_settings_field_1}')]
    Verify the testcase is pass (data is existed)    //label[contains(text(),'${Cloud_asset_settings_field_2}')]
    Verify the testcase is pass (data is existed)    //label[contains(text(),'${Cloud_asset_settings_field_3}')]
    Verify the testcase is pass (data is existed)    //label[contains(text(),'${Cloud_asset_settings_field_4}')]
    Wait And Click    //span[text()='${cancel}']    

雲端經辦-管理-雲端資產設定新增驗證
#建立測試用Resoure Type
    Wait And Click    //i[@class='pi pi-book']
    Wait And Click    //a[@href="/system/cloud/SharingMenu"]
    Wait And Click    //span[contains(text(),'${add}')]
    Wait And Input    //input[@formcontrolname="resourceType"]    ${test_resource_type}
    Wait And Click    //span[contains(text(),'${select_parameter}')]
    Wait And Click    //span[contains(text(),'${table_software}')]
    Wait And Click    //span[contains(text(),'${save}')]
    Wait And Click    //span[contains(text(),'${ok}')]

    Wait And Click    //a[@href="/system/cloud/AssetSetting"]
    Wait And Click    //span[2][contains(text(),'${Add_new_settings}')]
    Wait And Click    //div[contains(text(),'${select_parameter}')]
    Wait And Click    //span[contains(text(),'${test_resource_type}')]
    Wait And Input    //input[@id="ip-field-0"]    ${Org_ID_error}
    Wait And Click    //span[contains(text(),'${save}')]
    Verify the testcase is pass (data is existed)    //div[contains(text()[1],'${error_message_2110_des}')]
    Verify the testcase is pass (data is existed)    //div[contains(text()[2],'${error_message_2110_code}')]
    Wait And Click    //span[contains(text(),'${ok}')]

    Wait And Input    //input[@id="ip-field-0"]    ${Org_ID_right_1}
    Wait And Click    //span[contains(text(),'${save}')]
    Wait And Click    //span[contains(text(),'${ok}')]
    Verify the testcase is pass (data is existed)    //tbody/tr[1]/td[4]/ul/li[contains(text(),'${Org_ID_right_1}')]
    Verify the testcase is pass (data is existed)    //tbody/tr[1]/td[8]/span[contains(text(),'${Cloud_asset_settings_status_1}')]

雲端經辦-管理-雲端資產設定查看驗證
    Mouse Over    //tbody/tr[1]/td[10][@class="dropdown-container"]
    Sleep    500ms
    Mouse Over    //tbody/tr[1]/td[10][@class="dropdown-container"]/div/ul/li/a[contains(text(),'${look}')]
    Wait And Click    //tbody/tr[1]/td[10][@class="dropdown-container"]/div/ul/li/a[contains(text(),'${look}')]
    Verify the testcase is pass (data is existed)    //span[contains(text(),'${Cloud_asset_look_des_title}')]
    Verify the testcase is pass (data is existed)    //label[contains(text(),'${Cloud_asset_look_des_1}')]
    Verify the testcase is pass (data is existed)    //label[contains(text(),'${Cloud_asset_look_des_2}')]
    Verify the testcase is pass (data is existed)    //label[contains(text(),'${Cloud_asset_look_des_3}')]
    Verify the testcase is pass (data is existed)    //label[contains(text(),'${Cloud_asset_look_des_4}')]
    Wait And Click    //span[contains(text(),'${ok}')] 

雲端經辦-管理-雲端資產設定立即同步驗證-同步中
    Wait And Click    //tbody/tr[1]/td[4]/ul/li[contains(text(),'${Org_ID_right_1}')]
    Wait And Click    //span[contains(text(),'${sync_now}')]
    Wait And Click    //span[contains(text(),'${ok}')]
    Verify the testcase is pass (data is existed)    //tbody/tr[1]/td[8]/span[contains(text(),'${Cloud_asset_settings_status_2}')]

雲端經辦-管理-雲端資產設定立即同步驗證-同步失敗
    Sleep    90s
    Reload Page

    FOR    ${i}    IN RANGE    0    5
        ${sync_now_status} =    Run Keyword And Return Status    Wait Until Element Is Visible    //tbody/tr[1]/td[8]/span[contains(text(),'${Cloud_asset_settings_status_5}')]
        Run Keyword If  '${sync_now_status}' == '${true}'    Verify the testcase is pass (data is existed)    //tbody/tr[1]/td[8]/span[contains(text(),'${Cloud_asset_settings_status_5}')]
        ...    ELSE    Reload Page
        Sleep    30s
        Exit For Loop If    '${sync_now_status}' == '${true}'
    END

雲端經辦-管理-雲端資產設定修改驗證
    Mouse Over    //tbody/tr[1]/td[10][@class="dropdown-container"]
    Sleep    500ms
    Mouse Over    //tbody/tr[1]/td[10][@class="dropdown-container"]/div/ul/li/a[contains(text(),'${edit}')]
    Wait And Click    //tbody/tr[1]/td[10][@class="dropdown-container"]/div/ul/li/a[contains(text(),'${edit}')]
    Wait And Click    //span[contains(text(),'${ok}')]
    Wait And Click    //i[@class="p-multiselect-clear-icon pi pi-times ng-star-inserted"]
    Wait And Click    //div[contains(text(),'${select_parameter}')]
    Wait And Click    //p-multiselectitem[1]/li/span
    Wait And Click    //div[@class="p-radiobutton-box"]
    Sleep    500ms
    Wait And Input    //app-multi-input-control[@formcontrolname="folderId"]//input[@id="ip-field-0"]    ${Folder_ID_right_1}
    Wait And Click    //span[contains(text(),'${save}')]
    Wait And Click    //span[contains(text(),'${ok}')]
    Verify the testcase is pass (data is existed)    //tbody/tr[1]/td[5]/ul/li[contains(text(),'${Folder_ID_right_1}')]

雲端經辦-管理-雲端資產設定立即同步驗證-已完成
    Wait And Click    //tbody/tr[1]/td[5]/ul/li[contains(text(),'${Folder_ID_right_1}')]
    Wait And Click    //span[contains(text(),'${sync_now}')]
    Wait And Click    //span[contains(text(),'${ok}')]
    Sleep    90s
    Reload Page

    FOR    ${i}    IN RANGE    0    5
        ${sync_now_status} =    Run Keyword And Return Status    Wait Until Element Is Visible    //tbody/tr[1]/td[8]/span[contains(text(),'${Cloud_asset_settings_status_4}')]
        Run Keyword If  '${sync_now_status}' == '${true}'    Verify the testcase is pass (data is existed)    //tbody/tr[1]/td[8]/span[contains(text(),'${Cloud_asset_settings_status_4}')]
        ...    ELSE    Reload Page
        Sleep    30s
        Exit For Loop If    '${sync_now_status}' == '${true}'
    END
    
雲端經辦-管理-雲端資產設定立即取消驗證-已取消
    Wait And Click    //tbody/tr[1]/td[5]/ul/li[contains(text(),'${Folder_ID_right_1}')]
    Wait And Click    //span[contains(text(),'${sync_now}')]
    Wait And Click    //span[contains(text(),'${ok}')]
    Wait And Click    //tbody/tr[1]/td[5]/ul/li[contains(text(),'${Folder_ID_right_1}')]
    Wait And Click    //span[contains(text(),'${cancel_now}')]
    Wait And Click    //span[contains(text(),'${ok}')]
    Verify the testcase is pass (data is existed)    //tbody/tr[1]/td[8]/span[contains(text(),'${Cloud_asset_settings_status_3}')]

雲端經辦-管理-雲端資產設定刪除驗證
    Mouse Over    //tbody/tr[1]/td[10][@class="dropdown-container"]
    Sleep    500ms
    Mouse Over    //tbody/tr[1]/td[10][@class="dropdown-container"]/div/ul/li/a[contains(text(),'${delete}')]
    Wait And Click    //tbody/tr[1]/td[10][@class="dropdown-container"]/div/ul/li/a[contains(text(),'${delete}')]
    Wait And Click    //span[contains(text(),'${ok}')]
    Wait And Click    //span[contains(text(),'${ok}')]
#刪除測試用Resoure Type    
    Wait And Click    //a[@href="/system/cloud/SharingMenu"]
    Wait And Click    //p-paginator[@styleclass='p-paginator-bottom']//span[@class='p-dropdown-trigger-icon pi pi-chevron-down']
    Wait And Click    //li[@aria-label='100']
    ${ancestor_element_xpath} =    Get Ancestor XPath    //*[contains(text(),'${test_resource_type}')]    ancestor::tr
    Wait And Click    ${ancestor_element_xpath}//button/span[contains(text(),'${delete}')]
    Wait And Click    //span[contains(text(),'${ok}')]
    Wait And Click    //span[contains(text(),'${ok}')]

雲端經辦-管理-雲端共用選單管理新增驗證
    Wait And Click    //i[@class='pi pi-book']
    Wait And Click    //a[@href="/system/cloud/SharingMenu"]
    Wait And Click    //span[contains(text(),'${add}')]
    Wait And Input   //input[@formcontrolname="resourceType"]    ${test_resource_type}
    Wait And Click    //span[contains(text(),'${select_parameter}')]
    Wait And Click    //span[contains(text(),'${table_software}')]
    Wait And Click    //span[contains(text(),'${save}')]
    Wait And Click    //span[contains(text(),'${ok}')]
    Wait And Click    //p-paginator[@styleclass='p-paginator-bottom']//span[@class='p-dropdown-trigger-icon pi pi-chevron-down']
    Wait And Click    //li[@aria-label='100']
    Verify the testcase is pass (data is existed)    //tbody//*[contains(text(),'${test_resource_type}')]

雲端經辦-管理-雲端共用選單管理編輯驗證
    Wait And Click    //i[@class='pi pi-book']
    Wait And Click    //a[@href="/system/cloud/SharingMenu"]
    Wait And Click    //p-paginator[@styleclass='p-paginator-bottom']//span[@class='p-dropdown-trigger-icon pi pi-chevron-down']
    Wait And Click    //li[@aria-label='100']
    ${ancestor_element_xpath} =    Get Ancestor XPath    //*[contains(text(),'${test_resource_type}')]    ancestor::tr
    Wait And Click    ${ancestor_element_xpath}//button/span[contains(text(),'${update}')]
    Wait And Click    //span[contains(text(),'${ok}')]
    Wait And Input    //input[@formcontrolname="resourceType"]    ${test_resource_type_update}
    Wait And Click    //span[contains(text(),'${save}')]
    Wait And Click    //span[contains(text(),'${ok}')]

    Wait And Click    //p-paginator[@styleclass='p-paginator-bottom']//span[@class='p-dropdown-trigger-icon pi pi-chevron-down']
    Wait And Click    //li[@aria-label='100']
    Verify the testcase is pass (data is existed)    //tbody//*[contains(text(),'${test_resource_type_update}')]

雲端經辦-管理-雲端共用選單管理被使用中無法刪除驗證
    Wait And Click    //i[@class='pi pi-book']
    Wait And Click    //a[@href="/system/cloud/AssetSetting"]
    Wait And Click    //span[2][contains(text(),'${Add_new_settings}')]
    Wait And Click    //div[contains(text(),'${select_parameter}')]
    Wait And Click    //span[contains(text(),'${test_resource_type_update}')]
    Wait And Input    //input[@id="ip-field-0"]    ${Org_ID_right_1}
    Wait And Click    //span[contains(text(),'${save}')]
    Wait And Click    //span[contains(text(),'${ok}')]

    Wait And Click    //a[@href="/system/cloud/SharingMenu"]
    Wait And Click    //p-paginator[@styleclass='p-paginator-bottom']//span[@class='p-dropdown-trigger-icon pi pi-chevron-down']
    Wait And Click    //li[@aria-label='100']
    ${ancestor_element_xpath} =    Get Ancestor XPath    //*[contains(text(),'${test_resource_type_update}')]    ancestor::tr
    Wait And Click    ${ancestor_element_xpath}//button/span[contains(text(),'${delete}')]
    Wait And Click    //span[contains(text(),'${ok}')]
    Verify the testcase is pass (data is existed)    //div[contains(text()[1],'${error_message_2118_des}')]
    Verify the testcase is pass (data is existed)    //div[contains(text()[2],'${error_message_2118_code}')]
    Wait And Click    //span[contains(text(),'${ok}')]

    Wait And Click    //a[@href="/system/cloud/AssetSetting"]
    Sleep    500ms
    Mouse Over    //tbody/tr[1]/td[10][@class="dropdown-container"]
    Sleep    500ms
    Mouse Over    //tbody/tr[1]/td[10][@class="dropdown-container"]/div/ul/li/a[contains(text(),'${delete}')]
    Wait And Click    //tbody/tr[1]/td[10][@class="dropdown-container"]/div/ul/li/a[contains(text(),'${delete}')]
    Wait And Click    //span[contains(text(),'${ok}')]
    Wait And Click    //span[contains(text(),'${ok}')]

雲端經辦-管理-雲端共用選單管理刪除驗證
    Wait And Click    //i[@class='pi pi-book']
    Wait And Click    //a[@href="/system/cloud/SharingMenu"]
    Wait And Click    //p-paginator[@styleclass='p-paginator-bottom']//span[@class='p-dropdown-trigger-icon pi pi-chevron-down']
    Wait And Click    //li[@aria-label='100']
    ${ancestor_element_xpath} =    Get Ancestor XPath    //*[contains(text(),'${test_resource_type_update}')]    ancestor::tr
    Wait And Click    ${ancestor_element_xpath}//button/span[contains(text(),'${delete}')]
    Wait And Click    //span[contains(text(),'${ok}')]
    Wait And Click    //span[contains(text(),'${ok}')]
    Verify the testcase is pass (data is not existed)    //tbody//*[contains(text(),'${test_resource_type_update}')]

雲端經辦-資產管理-雲端資產分派-準備工作-確認有兩筆有序號的軟體跟資料資產
    Wait And Click    //i[@class="pi pi-copy"]
    Wait And Click    //a[@href="/assetsManager/cloud/AssetAllocation"]
#確認有兩筆有序號的軟體跟資料資產
    

雲端經辦-資產管理-雲端資產分派-指派-尚未指派的資產
    Wait And Click    //i[@class="pi pi-copy"]
    Wait And Click    //a[@href="/assetsManager/cloud/AssetAllocation"]
    FOR    ${i}    IN RANGE    1    101
        ${asset_number_status}  ${asset_type_status}  ${asset_unit_status} =  Check_asset_status     ${i}    ${list_software}    ${not_assign_yet}
        Run Keyword If  '${asset_number_status}'=='${false}' and '${asset_type_status}'=='${true}' and '${asset_unit_status}'=='${true}'  Asset_to_assign    ${i}   ${department_name}  ${division_name}
        
        Exit For Loop If    '${asset_number_status}'=='${false}' and '${asset_type_status}'=='${true}' and '${asset_unit_status}'=='${true}'
    END
    Verify the testcase is pass (data is existed)    //tbody//tr[${i}]/td[8]/p[1][text()='${department_name}-${division_name}']

雲端經辦-資產管理-雲端資產分派-不指派-尚未指派的資產
    Wait And Click    //i[@class="pi pi-copy"]
    Wait And Click    //a[@href="/assetsManager/cloud/AssetAllocation"]
    FOR    ${i}    IN RANGE    1    101
        ${asset_number_status}  ${asset_type_status}  ${asset_unit_status} =  Check_asset_status     ${i}    ${list_software}    ${not_assign_yet}
        Run Keyword If  '${asset_number_status}'=='${false}' and '${asset_type_status}'=='${true}' and '${asset_unit_status}'=='${true}'  Asset_to_not_assign    ${i}

        Exit For Loop If    '${asset_number_status}'=='${false}' and '${asset_type_status}'=='${true}' and '${asset_unit_status}'=='${true}'
    END
    Verify the testcase is pass (data is existed)    //tbody//tr[${i}]/td[8]/p[1][text()='${not_assign}']

雲端經辦-資產管理-雲端資產分派-不指派-無序號不指派的資產
    Wait And Click    //i[@class="pi pi-copy"]
    Wait And Click    //a[@href="/assetsManager/cloud/AssetAllocation"]
    FOR    ${i}    IN RANGE    1    101
        ${asset_number_status}  ${asset_type_status}  ${asset_unit_status} =  Check_asset_status     ${i}    ${list_software}    ${not_assign}
        Run Keyword If  '${asset_number_status}'=='${false}' and '${asset_type_status}'=='${true}' and '${asset_unit_status}'=='${true}'  Asset_to_not_assign    ${i}

        Exit For Loop If    '${asset_number_status}'=='${false}' and '${asset_type_status}'=='${true}' and '${asset_unit_status}'=='${true}'
    END
    Verify the testcase is pass (data is existed)    //tbody//tr[${i}]/td[8]/p[1][text()='${not_assign}']

雲端經辦-資產管理-雲端資產分派-指派-無序號不指派的資產
    Wait And Click    //i[@class="pi pi-copy"]
    Wait And Click    //a[@href="/assetsManager/cloud/AssetAllocation"]
    FOR    ${i}    IN RANGE    1    101
        ${asset_number_status}  ${asset_type_status}  ${asset_unit_status} =  Check_asset_status     ${i}    ${list_software}    ${not_assign}
        Run Keyword If  '${asset_number_status}'=='${false}' and '${asset_type_status}'=='${true}' and '${asset_unit_status}'=='${true}'  Asset_to_assign    ${i}   ${department_name}  ${division_name}

        Exit For Loop If    '${asset_number_status}'=='${false}' and '${asset_type_status}'=='${true}' and '${asset_unit_status}'=='${true}'
    END
    Verify the testcase is pass (data is existed)    //tbody//tr[${i}]/td[8]/p[1][text()='${department_name}-${division_name}']

雲端經辦-資產管理-雲端資產分派-指派-無序號已指派的資產-原單位
    Wait And Click    //i[@class="pi pi-copy"]
    Wait And Click    //a[@href="/assetsManager/cloud/AssetAllocation"]
    FOR    ${i}    IN RANGE    1    101
        ${asset_number_status}  ${asset_type_status}  ${asset_unit_status} =  Check_asset_status     ${i}    ${list_software}    ${department_name}-${division_name}
        Run Keyword If  '${asset_number_status}'=='${false}' and '${asset_type_status}'=='${true}' and '${asset_unit_status}'=='${true}'  Asset_to_assign    ${i}   ${department_name}  ${division_name}

        Exit For Loop If    '${asset_number_status}'=='${false}' and '${asset_type_status}'=='${true}' and '${asset_unit_status}'=='${true}'
    END
    Verify the testcase is pass (data is existed)    //tbody//tr[${i}]/td[8]/p[1][text()='${department_name}-${division_name}']


雲端經辦-資產管理-雲端資產分派-指派-無序號已指派的資產-別單位
    Wait And Click    //i[@class="pi pi-copy"]
    Wait And Click    //a[@href="/assetsManager/cloud/AssetAllocation"]
    FOR    ${i}    IN RANGE    1    101
        ${asset_number_status}  ${asset_type_status}  ${asset_unit_status} =  Check_asset_status     ${i}    ${list_software}    ${department_name}-${division_name}
        Run Keyword If  '${asset_number_status}'=='${false}' and '${asset_type_status}'=='${true}' and '${asset_unit_status}'=='${true}'  Asset_to_assign   ${i}   ${department_name}  ${division_name_update}

        Exit For Loop If    '${asset_number_status}'=='${false}' and '${asset_type_status}'=='${true}' and '${asset_unit_status}'=='${true}'
    END
    Verify the testcase is pass (data is existed)    //tbody//tr[${i}]/td[8]/p[1][text()='${department_name}-${division_name_update}']

雲端經辦-資產管理-雲端資產分派-不指派-無序號已指派的資產
    Wait And Click    //i[@class="pi pi-copy"]
    Wait And Click    //a[@href="/assetsManager/cloud/AssetAllocation"]
    FOR    ${i}    IN RANGE    1    101
        ${asset_number_status}  ${asset_type_status}  ${asset_unit_status} =  Check_asset_status     ${i}    ${list_software}    ${department_name}-${division_name_update}
        Run Keyword If  '${asset_number_status}'=='${false}' and '${asset_type_status}'=='${true}' and '${asset_unit_status}'=='${true}'  Asset_to_not_assign   ${i}

        Exit For Loop If    '${asset_number_status}'=='${false}' and '${asset_type_status}'=='${true}' and '${asset_unit_status}'=='${true}'
    END
    Verify the testcase is pass (data is existed)    //tbody//tr[${i}]/td[8]/p[1][text()='${not_assign}']

雲端經辦-資產管理-雲端資產分派-指派-有序號的資產-原單位
    Wait And Click    //i[@class="pi pi-copy"]
    Wait And Click    //a[@href="/assetsManager/cloud/AssetAllocation"]
    FOR    ${i}    IN RANGE    1    101
        ${asset_number_status}  ${asset_type_status}  ${asset_unit_status} =  Check_asset_status     ${i}    ${list_software}    ${department_name}-${division_name}
        Run Keyword If  '${asset_number_status}'=='${true}' and '${asset_type_status}'=='${true}' and '${asset_unit_status}'=='${true}'  Asset_to_assign   ${i}   ${department_name}  ${division_name}

        Exit For Loop If    '${asset_number_status}'=='${true}' and '${asset_type_status}'=='${true}' and '${asset_unit_status}'=='${true}'
    END
    Verify the testcase is pass (data is existed)    //tbody//tr[${i}]/td[8]/p[1][text()='${department_name}-${division_name}']

雲端經辦-資產管理-雲端資產分派-指派-有序號的資產-別單位
    Wait And Click    //i[@class="pi pi-copy"]
    Wait And Click    //a[@href="/assetsManager/cloud/AssetAllocation"]
    FOR    ${i}    IN RANGE    1    101
        ${asset_number_status}  ${asset_type_status}  ${asset_unit_status} =  Check_asset_status     ${i}    ${list_software}    ${department_name}-${division_name}
        Run Keyword If  '${asset_number_status}'=='${true}' and '${asset_type_status}'=='${true}' and '${asset_unit_status}'=='${true}'  Asset_to_assign   ${i}   ${department_name}  ${division_name_update}

        Exit For Loop If    '${asset_number_status}'=='${true}' and '${asset_type_status}'=='${true}' and '${asset_unit_status}'=='${true}'
    END
    Verify the testcase is pass (data is existed)    //tbody//tr[${i}]/td[8]/p[1][text()='${department_name}-${division_name}']

雲端經辦-資產管理-雲端資產分派-不指派-有序號的資產
    Wait And Click    //i[@class="pi pi-copy"]
    Wait And Click    //a[@href="/assetsManager/cloud/AssetAllocation"]
    FOR    ${i}    IN RANGE    1    101
        ${asset_number_status}  ${asset_type_status}  ${asset_unit_status} =  Check_asset_status     ${i}    ${list_software}    ${department_name}-${division_name}
        Run Keyword If  '${asset_number_status}'=='${true}' and '${asset_type_status}'=='${true}' and '${asset_unit_status}'=='${true}'  Asset_to_not_assign   ${i}

        Exit For Loop If    '${asset_number_status}'=='${true}' and '${asset_type_status}'=='${true}' and '${asset_unit_status}'=='${true}'
    END
    Verify the testcase is pass (data is existed)    //tbody//tr[${i}]/td[8]/p[1][text()='${not_assign}']
    Verify the testcase is pass (data is existed)    //tbody//tr[${i}]/td[8]/p[2][text()='${department_name}-${division_name}']

雲端經辦-資產管理-雲端資產分派-不指派-有序號不指派的資產
    Wait And Click    //i[@class="pi pi-copy"]
    Wait And Click    //a[@href="/assetsManager/cloud/AssetAllocation"]
    FOR    ${i}    IN RANGE    1    101
        ${asset_number_status}  ${asset_type_status}  ${asset_unit_status} =  Check_asset_status     ${i}    ${list_software}    ${not_assign}
        Run Keyword If  '${asset_number_status}'=='${true}' and '${asset_type_status}'=='${true}' and '${asset_unit_status}'=='${true}'  Asset_to_not_assign   ${i}

        Exit For Loop If    '${asset_number_status}'=='${true}' and '${asset_type_status}'=='${true}' and '${asset_unit_status}'=='${true}'
    END
    Verify the testcase is pass (data is existed)    //tbody//tr[${i}]/td[8]/p[1][text()='${not_assign}']

雲端經辦-資產管理-雲端資產分派-指派-有序號不指派的資產-別單位
    Wait And Click    //i[@class="pi pi-copy"]
    Wait And Click    //a[@href="/assetsManager/cloud/AssetAllocation"]
    FOR    ${i}    IN RANGE    1    101
        ${asset_number_status}  ${asset_type_status}  ${asset_unit_status} =  Check_asset_status     ${i}    ${list_software}    ${not_assign}
        Run Keyword If  '${asset_number_status}'=='${true}' and '${asset_type_status}'=='${true}' and '${asset_unit_status}'=='${true}'  Asset_to_assign   ${i}   ${department_name}  ${division_name_update}

        Exit For Loop If    '${asset_number_status}'=='${true}' and '${asset_type_status}'=='${true}' and '${asset_unit_status}'=='${true}'
    END
    Verify the testcase is pass (data is existed)    //tbody//tr[${i}]/td[8]/p[1][text()='${not_assign}']

雲端經辦-資產管理-雲端資產分派-指派-有序號不指派的資產-原單位
    Wait And Click    //i[@class="pi pi-copy"]
    Wait And Click    //a[@href="/assetsManager/cloud/AssetAllocation"]
    FOR    ${i}    IN RANGE    1    101
        ${asset_number_status}  ${asset_type_status}  ${asset_unit_status} =  Check_asset_status     ${i}    ${list_software}    ${not_assign}
        Run Keyword If  '${asset_number_status}'=='${true}' and '${asset_type_status}'=='${true}' and '${asset_unit_status}'=='${true}'  Asset_to_assign   ${i}   ${department_name}  ${division_name}

        Exit For Loop If    '${asset_number_status}'=='${true}' and '${asset_type_status}'=='${true}' and '${asset_unit_status}'=='${true}'
    END
    Verify the testcase is pass (data is existed)    //tbody//tr[${i}]/td[8]/p[1][text()='${department_name}-${division_name}']

雲端經辦-資產管理-雲端資產分派-送審-無序號的資產
    Wait And Click    //i[@class="pi pi-copy"]
    Wait And Click    //a[@href="/assetsManager/cloud/AssetAllocation"]
    Check_send_asset    ${false}     ${list_software}    ${department_name}-${division_name}

雲端經辦-資產管理-雲端資產分派-送審-有序號的資產
    Wait And Click    //i[@class="pi pi-copy"]
    Wait And Click    //a[@href="/assetsManager/cloud/AssetAllocation"]
    Check_send_asset    ${true}     ${list_software}    ${department_name}-${division_name}
    
雲端經辦-資產管理-雲端資產分派-送審-有序號的不指派資產
    Wait And Click    //i[@class="pi pi-copy"]
    Wait And Click    //a[@href="/assetsManager/cloud/AssetAllocation"]
    Check_send_asset    ${true}     ${list_software}    ${not_assign}

雲端經辦-資產管理-雲端資產分派-送審-無序號的不指派資產
    Wait And Click    //i[@class="pi pi-copy"]
    Wait And Click    //a[@href="/assetsManager/cloud/AssetAllocation"]
    Check_send_asset    ${false}     ${list_software}    ${not_assign}

雲端經辦-資產管理-雲端資產分派-送審-尚未指派的資產
    Wait And Click    //i[@class="pi pi-copy"]
    Wait And Click    //a[@href="/assetsManager/cloud/AssetAllocation"]
    Check_send_asset    ${false}     ${list_software}    ${not_assign_yet}

雲端經辦-資產管理-雲端資產分派-取消送審-有序號的資產
    Wait And Click    //i[@class="pi pi-copy"]
    Wait And Click    //a[@href="/assetsManager/cloud/AssetAllocation"]
    Wait And Click    //img[@src="/assets/images/image 218.png"]
    Check_cancel_asset    ${true}     ${list_software}    ${department_name}-${division_name}

雲端經辦-資產管理-雲端資產分派-取消送審-有序號的不指派資產
    Wait And Click    //i[@class="pi pi-copy"]
    Wait And Click    //a[@href="/assetsManager/cloud/AssetAllocation"]
    Wait And Click    //img[@src="/assets/images/image 218.png"]
    Check_cancel_asset    ${true}     ${list_software}    ${not_assign}

雲端經辦-資產管理-雲端資產分派-取消送審-無序號的資產
    Wait And Click    //i[@class="pi pi-copy"]
    Wait And Click    //a[@href="/assetsManager/cloud/AssetAllocation"]
    Wait And Click    //img[@src="/assets/images/image 218.png"]
    Check_cancel_asset    ${false}     ${list_software}    ${department_name}-${division_name}
    
雲端經辦-資產管理-雲端資產分派-取消送審-無序號的不指派資產
    Wait And Click    //i[@class="pi pi-copy"]
    Wait And Click    //a[@href="/assetsManager/cloud/AssetAllocation"]
    Wait And Click    //img[@src="/assets/images/image 218.png"]
    Check_cancel_asset    ${false}     ${list_software}    ${not_assign}

雲端經辦-管理-代理人管理新增驗證
    Agent manage add    ${agent_name_for_Cloud_Attention} 
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${agent_add_reason}')]

雲端經辦-管理-代理人管理新增重複代理人訊息驗證
    Agent manage add again   ${agent_name_for_Cloud_Attention} 

雲端經辦-管理-代理人管理查詢驗證
    Agent manage search
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${agent_add_reason}')]

雲端經辦-管理-代理人管理更新驗證
    Agent manage update
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${agent_update_reason}')]

雲端經辦-管理-代理人管理刪除驗證
    Agent manage delete 
    Verify the testcase is pass (data is not existed)    //*[contains(text(),'${agent_update_reason}')]

雲端經辦-通知驗證
    Reload Page
    Notify
    
*** Comments ***

