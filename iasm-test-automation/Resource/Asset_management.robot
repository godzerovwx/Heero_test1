*** Settings ***
Resource    Action.robot
Library           Collections

*** Variables ***

*** Keywords ***
Search data
    [Arguments]    ${data_name}
    Wait And Click  //i[@class='pi pi-copy']
    Wait And Click  //a[@href='/assetsManager/search']
    Run Keyword If    '${data_name}' in ('${soft_data_name}', '${Verification_unit_soft_data_name}')    Wait And Click   //*[text()='${table_software}']
    ...    ELSE IF    '${data_name}' in ('${data_data_name}', '${Verification_unit_data_data_name}')    Wait And Click   //*[text()='${table_data}']
    ...    ELSE IF    '${data_name}' in ('${paper_data_name}', '${Verification_unit_paper_data_name}')    Wait And Click   //*[text()='${table_paper}']
    ...    ELSE IF    '${data_name}' in ('${people_data_name}', '${Verification_unit_people_data_name}')    Wait And Click   //*[text()='${table_people}']   
    Wait And Click    //span[@class='p-dropdown-label p-inputtext p-placeholder ng-star-inserted']
    Wait And Click    //li[@aria-label='${department_name}']
    Wait And Click   //div[@class ='p-multiselect-label p-placeholder']
    Wait And Click    //div/div[2][@role="checkbox"]
    #Wait And Click    //div[@class='p-checkbox p-component ng-star-inserted']
    Wait And Click    //button[contains(@class,'p-multiselect-close')]
    #Wait And Click    //button[@class='p-ripple p-element p-multiselect-close p-link ng-star-inserted']
    Run Keyword If    '${data_name}' in ('${hard_data_name}', '${soft_data_name}', '${paper_data_name}', '${Verification_unit_hard_data_name}', '${Verification_unit_soft_data_name}', '${Verification_unit_paper_data_name}')    Wait And Input    //input[@formcontrolname='nameOfAsset']    ${data_name}
    ...    ELSE IF    '${data_name}' in ('${data_data_name}', '${Verification_unit_data_data_name}')    Wait And Input    //input[@formcontrolname='nameOfAsset']    ${data_data_name}
    ...    ELSE IF    '${data_name}' in ('${people_data_name}', '${Verification_unit_people_data_name}')    Wait And Input    //input[@formcontrolname='nameOfPersonnel']    ${people_data_name} 
    Wait And Click    //div[@class='d-flex using-container']/div[3]/div/p-radiobutton/div/div[2]
    Wait And Click    //*[text()='${search}']
    Sleep    500ms
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${data_name}')]




Create hard data
    [Arguments]  ${hard_data_name}   ${inv_dep_name}   ${inv_div_name}   ${cus_dep_name}   ${cus_div_name} 
    Wait And Click  //i[@class='pi pi-copy']
    Wait And Click   //a[@href='/assetsManager/add']
    Wait And Click    //*[text()='${select_dep}']
    Wait And Click    //li[@aria-label='${inv_dep_name}']
    Wait And Click   //div[@class ='input-field units-dropdown p-dropdown p-component p-dropdown-clearable']
    Wait And Click    //li[@aria-label='${inv_div_name}']
    Wait And Click   //div[@class ='input-field p-dropdown p-component']
    Wait And Click    //li[text()=' ${hard_group_name} ']
    Wait And Input    //input[@formcontrolname='nameOfAsset']    ${hard_data_name}
    Wait And Input    //input[@formcontrolname='assetUsage']    hard_assetUsage
    Wait And Input    //input[@formcontrolname='physicalLocationOfTheAsset']    hard_physicalLocationOfTheAsset
    Wait And Input    //input[@formcontrolname='hostname']    hard_hostname
    Wait And Click   //div[@class ='p-multiselect-label p-placeholder']
    Wait And Click    //div[@class='p-checkbox-box']
    Wait And Click    //button[contains(@class,'p-multiselect-close')]
    #Wait And Click   //span[@class='p-multiselect-close-icon pi pi-times']
    Wait And Input    //textarea[@formcontrolname='brandOfDevice']    hard_brandOfDevice
    Wait And Input    //textarea[@formcontrolname='modelOfDevice']    hard_modelOfDevice
    Wait And Input    //input[@inputmode='decimal']    11
    Wait And Input    //textarea[@formcontrolname='serverRackNo']    hard_serverRackNo
    Wait And Click   //div[@class ='input-field w-140 p-dropdown p-component p-dropdown-clearable']
    Wait And Click    //li[@aria-label='正式(Prod)']
    Wait And Click    //*[text()='${select_dep}']
    Wait And Click    //li[@aria-label='${cus_dep_name}']
    Wait And Click   //*[text()='${select_div}']
    Wait And Click    //li[@aria-label='${cus_div_name}']
    Wait And Input    //input[@formcontrolname='custodian']    hard_custodian
    Wait And Click    //*[text()='${save}']
    Wait And Click    //*[text()='${cancel}']
    Sleep    500ms

Create soft data
    [Arguments]  ${soft_data_name}   ${inv_dep_name}   ${inv_div_name}   ${cus_dep_name}   ${cus_div_name}  
    Wait And Click  //i[@class='pi pi-copy']
    Wait And Click   //a[@href='/assetsManager/add']
    Wait And Click   //*[text()='${table_software}']
    Wait And Click    //*[text()='${select_dep}']
    Wait And Click    //li[@aria-label='${inv_dep_name}']
    Wait And Click   //div[@class ='input-field units-dropdown p-dropdown p-component p-dropdown-clearable']
    Wait And Click    //li[@aria-label='${inv_div_name}']
    Wait And Click   //div[@class ='input-field p-dropdown p-component']
    Wait And Click    //li[text()=' ${soft_group_name} ']
    Wait And Input    //input[@formcontrolname='nameOfAsset']    ${soft_data_name}
    Wait And Input    //input[@formcontrolname='assetUsage']    soft_assetUsage
    Wait And Input    //input[@formcontrolname='operatingSystem']    soft_operatingSystem
    Wait And Input    //input[@formcontrolname='hostname']    soft_hostname
    Wait And Click    //*[text()='${select_dep}']
    Wait And Click    //li[@aria-label='${cus_dep_name}']
    Wait And Click   //*[text()='${select_div}']
    Wait And Click    //li[@aria-label='${cus_div_name}']
    Wait And Input    //input[@formcontrolname='custodian']    soft_custodian
    Wait And Click   //div[@class ='p-multiselect-label p-placeholder']
    Wait And Click    //div[@class='p-checkbox-box']
    Wait And Click    //button[contains(@class,'p-multiselect-close')]
    #Wait And Click   //span[@class='p-multiselect-close-icon pi pi-times']
    Wait And Click   //p-dropdown[@formcontrolname='processPersonalInformation']
    Wait And Click   //li[@aria-label='${yes}']
    Wait And Input    //textarea[@formcontrolname='databaseName']    soft_databaseName
    Wait And Input    //textarea[@formcontrolname='databaseServer']    soft_databaseServer
    Wait And Click   //p-dropdown[@formcontrolname='backupFrequency']
    Wait And Click   //li[@aria-label='每月']
    Wait And Input    //input[@formcontrolname='outsourceMaintenance']    soft_outsourceMaintenance
    Wait And Input    //input[@formcontrolname='systemApplication']    soft_systemApplication
    Wait And Click   //p-dropdown[@formcontrolname='customerSecurityData']
    Wait And Click   //li[@aria-label='${yes}']
    Wait And Click    //*[text()='${save}']
    Wait And Click    //*[text()='${cancel}']
    Sleep    500ms
Create data data
    [Arguments]  ${data_data_name}   ${inv_dep_name}   ${inv_div_name}   ${cus_dep_name}   ${cus_div_name}  
    Wait And Click  //i[@class='pi pi-copy']
    Wait And Click   //a[@href='/assetsManager/add']
    Wait And Click   //*[text()='${table_data}']
    Wait And Click    //*[text()='${select_dep}']
    Wait And Click    //li[@aria-label='${inv_dep_name}']
    Wait And Click   //div[@class ='input-field units-dropdown p-dropdown p-component p-dropdown-clearable']
    Wait And Click    //li[@aria-label='${inv_div_name}']
    Wait And Click   //div[@class ='input-field p-dropdown p-component']
    Wait And Click    //li[text()=' ${data_group_name} ']
    Wait And Click    //label[text()='系統資料 ']
    Wait And Input    //input[@formcontrolname='nameOfAsset2']    ${data_data_name}
    Wait And Input    //input[@formcontrolname='hostname']    data_hostname
    Wait And Click    //*[text()='${select_dep}']
    Wait And Click    //li[@aria-label='${cus_dep_name}']
    Wait And Click   //*[text()='${select_div}']
    Wait And Click    //li[@aria-label='${cus_div_name}']
    Wait And Input    //input[@formcontrolname='custodian']    data_custodian
    Wait And Click   //div[@class ='p-multiselect-label p-placeholder']
    Wait And Click    //div[@class='p-checkbox-box']
    Wait And Click    //button[contains(@class,'p-multiselect-close')]
    #Wait And Click   //span[@class='p-multiselect-close-icon pi pi-times']
    Wait And Click   //p-dropdown[@formcontrolname='personalGroup']
    Wait And Click   //li[@aria-label='含特種個資']
    Wait And Click   //p-multiselect[@formcontrolname='personalInformation']
    Wait And Click    //div[@class='p-checkbox-box']
    Wait And Click    //button[contains(@class,'p-multiselect-close')]
    #Wait And Click   //span[@class='p-multiselect-close-icon pi pi-times']
    Wait And Input    //input[@formcontrolname='dataRetentionPeriodC']    data_dataRetentionPeriodC
    Wait And Click   //p-dropdown[@formcontrolname='methodOfDataBackup']
    Wait And Click   //li[@aria-label='DISK']
    Wait And Click   //p-dropdown[@formcontrolname='backupFrequency']
    Wait And Click   //li[@aria-label='每月']
    Wait And Click    //*[text()='${save}']
    Wait And Click    //*[text()='${cancel}']
    SLEEP    500ms

Create paper data
    [Arguments]  ${paper_data_name}   ${inv_dep_name}   ${inv_div_name}   ${cus_dep_name}   ${cus_div_name} 
    Wait And Click  //i[@class='pi pi-copy']
    Wait And Click   //a[@href='/assetsManager/add']
    Wait And Click   //*[text()='${table_paper}']
    Wait And Click    //*[text()='${select_dep}']
    Wait And Click    //li[@aria-label='${inv_dep_name}']
    Wait And Click   //div[@class ='input-field units-dropdown p-dropdown p-component p-dropdown-clearable']
    Wait And Click    //li[@aria-label='${inv_div_name}']
    Wait And Click   //div[@class ='input-field p-dropdown p-component']
    Wait And Click    //li[contains(text(),' ${paper_group_name} ')]
    Wait And Input    //input[@formcontrolname='nameOfAsset']    ${paper_data_name}
    Wait And Click    //*[text()='${select_dep}']
    Wait And Click    //li[@aria-label='${cus_dep_name}']
    Wait And Click   //*[text()='${select_div}']
    Wait And Click    //li[@aria-label='${cus_div_name}']
    Wait And Input    //input[@formcontrolname='custodian']    data_custodian
    Wait And Click   //div[@class ='p-multiselect-label p-placeholder']
    Wait And Click    //div[@class='p-checkbox-box']
    Wait And Click    //button[contains(@class,'p-multiselect-close')]
    #Wait And Click   //span[@class='p-multiselect-close-icon pi pi-times']
    Wait And Click   //p-dropdown[@formcontrolname='personalGroup']
    Wait And Click   //li[@aria-label='含特種個資']
    Wait And Click   //p-multiselect[@formcontrolname='personalInformation']
    Wait And Click    //div[@class='p-checkbox-box']
    Wait And Click    //button[contains(@class,'p-multiselect-close')]
    #Wait And Click   //span[@class='p-multiselect-close-icon pi pi-times']
    Wait And Input    //input[@formcontrolname='dataRetentionPeriod']    paper_dataRetentionPeriod
    Wait And Input    //textarea[@formcontrolname='assetUsage']    paper_assetUsage
    Wait And Input    //textarea[@formcontrolname='storageLocation']    paper_assetUsage
    Wait And Click   //p-dropdown[@formcontrolname='alternateLocation']
    Wait And Click   //li[@aria-label='內湖資訊大樓']
    Wait And Click    //*[text()='${save}']
    Wait And Click    //*[text()='${cancel}']
    SLEEP    500ms

Create people data
    [Arguments]  ${people_data_name}   ${inv_dep_name}   ${inv_div_name}   ${aff_dep_name}   ${aff_div_name}  
    Wait And Click  //i[@class='pi pi-copy']
    Wait And Click   //a[@href='/assetsManager/add']
    Wait And Click   //*[text()='${table_people}']
    Wait And Click    //*[text()='${select_dep}']
    Wait And Click    //li[@aria-label='${inv_dep_name}']
    Wait And Click   //div[@class ='input-field units-dropdown p-dropdown p-component p-dropdown-clearable']
    Wait And Click    //li[@aria-label='${inv_div_name}']
    Wait And Click   //div[@class ='input-field p-dropdown p-component']
    Wait And Click    //li[contains(text(),' ${people_group_name} ')]
    Wait And Input    //input[@formcontrolname='nameOfPersonnel']    ${people_data_name}
    Wait And Input    //input[@formcontrolname='employeeNo']    people1111
    Wait And Click    //p-calendar[@formcontrolname='joinDate']
    Select calendar month and day    ${Arrival_day}
    Wait And Input    //input[@formcontrolname='backupPersonnel_1']    people_backupPersonnel_1
    Wait And Click    //*[text()='${select_dep}']
    Wait And Click    //li[@aria-label='${aff_dep_name}']
    Wait And Click   //*[text()='${select_div}']
    Wait And Click    //li[@aria-label='${aff_div_name}']
    Wait And Input    //input[@formcontrolname='phoneExtension']    pphone
    Wait And Input    //input[@formcontrolname='jobTitle']    people_jobTitle
    Wait And Input    //textarea[@formcontrolname='briefJobDesciption']    people_briefJobDesciption
    Wait And Click    //*[text()='${save}']
    Wait And Click    //*[text()='${cancel}']
    SLEEP    500ms

Import excel
    [Arguments]  ${excel_file}
    Wait And Click  //i[@class='pi pi-copy']
    Wait And Click  //a[@href='/assetsManager/import'] 
    Sleep  2s
    Choose File     //input[@type='file']    ${OUTPUT_DIR}\\${excel_file}

    Wait And Click  //button[@class='p-element p-button functional-button p-component']   
    Sleep    5s
    
Search has review data
    [Arguments]  ${has_review_data_name}
    Wait And Click  //i[@class='pi pi-copy']
    Wait And Click  //a[@href='/assetsManager/searchApproved']
    Run Keyword If    '${has_review_data_name}' == '${has_review_soft_data_name}'    Wait And Click   //*[text()='軟體']
    ...    ELSE IF    '${has_review_data_name}' == '${has_review_data_data_name}'    Wait And Click   //*[text()='${table_data}']
    ...    ELSE IF    '${has_review_data_name}' == '${has_review_paper_data_name}'    Wait And Click   //*[text()='${table_paper}']
    ...    ELSE IF    '${has_review_data_name}' == '${has_review_people_data_name}'    Wait And Click   //*[text()='${table_people}'] 
    Wait And Click    //span[@class='p-dropdown-label p-inputtext p-placeholder ng-star-inserted']
    Wait And Click    //li[@aria-label='${department_name}']
    Wait And Click   //div[@class ='p-multiselect-label p-placeholder']
    Wait And Click    //div/div[2][@role="checkbox"]
    #Wait And Click    //div[@class='p-checkbox p-component ng-star-inserted']
    Wait And Click    //button[contains(@class,'p-multiselect-close')]
    #Wait And Click    //button[@class='p-ripple p-element p-multiselect-close p-link ng-star-inserted']
    Run Keyword If    '${has_review_data_name}' == '${has_review_hard_data_name}' or '${has_review_data_name}' == '${has_review_soft_data_name}' or '${has_review_data_name}' == '${has_review_paper_data_name}'    Wait And Input    //input[@formcontrolname='nameOfAsset']    ${has_review_data_name}
    ...    ELSE IF    '${has_review_data_name}' == '${has_review_data_data_name}'    Wait And Input    //input[@formcontrolname='nameOfAsset']    ${has_review_data_name}
    ...    ELSE IF    '${has_review_data_name}' == '${has_review_people_data_name}'    Wait And Input    //input[@formcontrolname='nameOfPersonnel']    ${has_review_data_name}
    Wait And Click    //div[@class='d-flex using-container']/div[3]/div/p-radiobutton/div/div[2]
    Select has review people data calendar    ${has_review_data_name}
    Wait And Click    //*[text()=' 附加說明 ']
    Wait And Click    //*[text()='${search}']
    Sleep    500ms
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${has_review_data_name}')]
    
Select has review people data calendar
    [Arguments]  ${has_review_data_name}
    Run Keyword If    '${has_review_data_name}' == '${has_review_hard_data_name}' or '${has_review_data_name}' == '${has_review_soft_data_name}'     Wait And Click    //div/div[2]/div[8]/p-calendar/span
    ...    ELSE IF    '${has_review_data_name}' == '${has_review_data_data_name}' or '${has_review_data_name}' == '${has_review_paper_data_name}' or '${has_review_data_name}' == '${has_review_people_data_name}'  Wait And Click    //div/div[2]/div[6]/p-calendar/span
    Select calendar month and day    ${not_change_day}

Check cus aff dep div is unselected for stop dep
    [Arguments]  ${Verification_unit_name}
    Search data    ${Verification_unit_name}
    Wait And Click    //td[contains(text(),'${Verification_unit_name}')]
    Mouse Over    //tr[@class='p-element p-selectable-row ng-star-inserted p-highlight']//td[@class='dropdown']
    Mouse Over    //tr[@class='p-element p-selectable-row ng-star-inserted p-highlight']//li[2]//*[contains(text(),' 編輯 ')]
    Sleep    500ms
    Wait And Click    //tr[@class='p-element p-selectable-row ng-star-inserted p-highlight']//li[2]//*[contains(text(),' 編輯 ')]
    Wait And Click    //*[text()='${ok}']

Check_asset_status
    [Arguments]  ${place}    ${asset_type}    ${asset_unit}   
    ${asset_number_status} =    Run Keyword And Return Status    Wait Until Element Is Visible    //tbody/tr[${place}]/td[2][contains(text(),'DA') or contains(text(),'SW')]
    ${asset_type_status} =    Run Keyword And Return Status    Wait Until Element Is Visible    //tbody/tr[${place}]/td[6][contains(text(),'${asset_type}')]
    ${asset_unit_status} =    Run Keyword And Return Status    Wait Until Element Is Visible    //tbody/tr[${place}]/td[8]/p[1][contains(text(),'${asset_unit}')]
    [Return]   ${asset_number_status}  ${asset_type_status}  ${asset_unit_status}    

Check_asset_send_status
    [Arguments]  ${place}    ${asset_type}    ${asset_unit}   
    ${asset_number_status} =    Run Keyword And Return Status    Wait Until Element Is Visible    //table[@id="pr_id_2-table"]/tbody/tr[${place}]/td[2][contains(text(),'DA') or contains(text(),'SW')]
    ${asset_type_status} =    Run Keyword And Return Status    Wait Until Element Is Visible    //table[@id="pr_id_2-table"]/tbody/tr[${place}]/td[6][contains(text(),'${asset_type}')]
    ${asset_unit_status} =    Run Keyword And Return Status    Wait Until Element Is Visible    //table[@id="pr_id_2-table"]/tbody/tr[${place}]/td[8]/p[1][contains(text(),'${asset_unit}')]
    [Return]   ${asset_number_status}  ${asset_type_status}  ${asset_unit_status}

Asset_to_assign
    [Arguments]  ${place}    ${dep_name}    ${div_name}
    Wait And Click    //tbody/tr[${place}]/td[2]
    Wait And Click    //span[contains(text(),'${assign}')]
    Wait And Click    //span[contains(text(),'${ok}')]
    Wait And Click    //span[contains(text(),'${select_dep}')]
    Wait And Click    //li[@aria-label='${dep_name}']
    Wait And Click    //span[contains(text(),'${select_div}')]
    Wait And Click    //li[@aria-label='${div_name}']
    Wait And Click    //span[contains(text(),'${save}')]
    Wait And Click    //span[contains(text(),'${ok}')]
    
Asset_to_not_assign
    [Arguments]  ${place}
    Wait And Click    //tbody/tr[${place}]/td[2]
    Wait And Click    //span[contains(text(),'${not_assign}')]
    Wait And Click    //span[contains(text(),'${ok}')]
    Wait And Click    //span[contains(text(),'${ok}')]


Asset_to_send
    [Arguments]  ${place}
    Wait And Click    //tbody/tr[${place}]/td[2]
    Wait And Click    //span[text()='${send_status}']
    Wait And Click    //span[text()='${ok}']
    ${send_status_result} =    Run Keyword And Return Status    Wait Until Element Is Visible    //div/label[contains(text(),'${send_success}')]  
    Wait And Click    //span[text()='${ok}']
    [Return]    ${send_status_result}

Asset_to_cancel
    [Arguments]  ${place}
    Wait And Click    //table[@id="pr_id_2-table"]/tbody/tr[${place}]/td[2]
    Wait And Click    //span[text()='${cancel_send_status}']
    Wait And Click    //span[text()='${ok}']
    Wait And Click    //span[text()='${ok}']

Asset_to_return
    [Arguments]  ${place}
    Wait And Click    //table[@id="pr_id_2-table"]/tbody/tr[${place}]/td[2]
    Wait And Click    //span[text()='${return_status}']
    Wait And Click    //span[text()='${ok}']
    Wait And Click    //span[text()='${ok}']

Asset_to_review
    [Arguments]  ${place}
    Wait And Click    //table[@id="pr_id_2-table"]/tbody/tr[${place}]/td[2]
    Wait And Click    //span[text()='${review_status}']
    Wait And Click    //span[text()='${ok}']
    Wait And Click    //span[text()='${ok}']

Check_send_asset
    [Arguments]  ${asset_number_yesorno}     ${asset_type}    ${asset_unit}
    FOR    ${i}    IN RANGE    1    101
        ${asset_number_status}  ${asset_type_status}  ${asset_unit_status} =  Check_asset_status     ${i}    ${asset_type}    ${asset_unit}
        ${save_hostname} =  Get Text   //table[@id="pr_id_3-table"]/tbody//tr[${i}]/td[10][text()] 
        ${send_status_result} =  Run Keyword If  '${asset_number_status}'=='${asset_number_yesorno}' and '${asset_type_status}'=='${true}' and '${asset_unit_status}'=='${true}'     Asset_to_send  ${i}
        
        Exit For Loop If    '${asset_number_status}'=='${asset_number_yesorno}' and '${asset_type_status}'=='${true}' and '${asset_unit_status}'=='${true}'
    END
    Run Keyword If    '${send_status_result}'=='${asset_number_yesorno}'   Check_send_data    ${save_hostname}

Check_send_data 
    [Arguments]  ${save_hostname_par} 
    Wait And Click    //img[@src="/assets/images/image 218.png"]
    FOR    ${j}    IN RANGE    1    101 
        ${save_hostname_status} =    Run Keyword And Return Status    Wait Until Element Is Visible    //table[@id="pr_id_2-table"]/tbody//tr[${j}]/td[10][text()=' ${save_hostname_par} ']
        Run Keyword If    '${save_hostname_status}'=='${true}'    Verify the testcase is pass (data is existed)    //table[@id="pr_id_2-table"]/tbody//tr[${j}]/td[10][text()=' ${save_hostname_par} ']
        Exit For Loop If    '${save_hostname_status}'=='${true}'
    END

Check_cancel_asset
    [Arguments]  ${asset_number_yesorno}     ${asset_type}    ${asset_unit}
    FOR    ${i}    IN RANGE    1    101
        ${asset_number_status}  ${asset_type_status}  ${asset_unit_status} =  Check_asset_send_status     ${i}    ${asset_type}    ${asset_unit}
        ${save_hostname} =  Get Text   //table[@id="pr_id_2-table"]/tbody//tr[${i}]/td[10][text()] 
        ${send_status_result} =  Run Keyword If  '${asset_number_status}'=='${asset_number_yesorno}' and '${asset_type_status}'=='${true}' and '${asset_unit_status}'=='${true}'     Asset_to_cancel  ${i}
        
        Exit For Loop If    '${asset_number_status}'=='${asset_number_yesorno}' and '${asset_type_status}'=='${true}' and '${asset_unit_status}'=='${true}'
    END
    Run Keyword If    '${send_status_result}'=='${true}'   Check_cancel_data    ${save_hostname}

Check_cancel_data 
    [Arguments]  ${save_hostname_par} 
    Wait And Click    //span[contains(text(),"${home_table_string_edit_return}")]
    FOR    ${j}    IN RANGE    1    101 
        ${save_hostname_status} =    Run Keyword And Return Status    Wait Until Element Is Visible    //table[@id="pr_id_3-table"]/tbody//tr[${j}]/td[10][text()=' ${save_hostname_par} ']
        Run Keyword If    '${save_hostname_status}'=='${true}'    Verify the testcase is pass (data is existed)    //table[@id="pr_id_3-table"]/tbody//tr[${j}]/td[10][text()=' ${save_hostname_par} ']
        Exit For Loop If    '${save_hostname_status}'=='${true}'
    END

Check_return_asset
    [Arguments]  ${asset_number_yesorno}     ${asset_type}    ${asset_unit}
    FOR    ${i}    IN RANGE    1    101
        ${asset_number_status}  ${asset_type_status}  ${asset_unit_status} =  Check_asset_send_status     ${i}    ${asset_type}    ${asset_unit}
        ${save_hostname} =  Get Text   //table[@id="pr_id_2-table"]/tbody//tr[${i}]/td[10][text()] 
        ${send_status_result} =  Run Keyword If  '${asset_number_status}'=='${asset_number_yesorno}' and '${asset_type_status}'=='${true}' and '${asset_unit_status}'=='${true}'     Asset_to_return  ${i}
        
        Exit For Loop If    '${asset_number_status}'=='${asset_number_yesorno}' and '${asset_type_status}'=='${true}' and '${asset_unit_status}'=='${true}'
    END
    Check_return_data    ${save_hostname}

Check_return_data 
    [Arguments]  ${save_hostname_par} 
    Open Browser Chrome and use user
    Login Cloud Attention
    FOR    ${j}    IN RANGE    1    101 
        ${save_hostname_status} =    Run Keyword And Return Status    Wait Until Element Is Visible    //table[@id="pr_id_3-table"]/tbody//tr[${j}]/td[10][text()=' ${save_hostname_par} ']
        Run Keyword If    '${save_hostname_status}'=='${true}'    Verify the testcase is pass (data is existed)    //table[@id="pr_id_3-table"]/tbody//tr[${j}]/td[10][text()=' ${save_hostname_par} ']
        Exit For Loop If    '${save_hostname_status}'=='${true}'
    END
    Close Browser

Check_review_asset
    [Arguments]  ${asset_number_yesorno}     ${asset_type}    ${asset_unit}
    FOR    ${i}    IN RANGE    1    101
        ${asset_number_status}  ${asset_type_status}  ${asset_unit_status} =  Check_asset_send_status     ${i}    ${asset_type}    ${asset_unit}
        ${save_hostname} =  Get Text   //table[@id="pr_id_2-table"]/tbody//tr[${i}]/td[10][text()] 
        ${save_asset_number} =  Run Keyword If  '${asset_number_status}'=='${true}'    Get Text   //table[@id="pr_id_2-table"]/tbody//tr[${i}]/td[2][text()] 
        ${send_status_result} =  Run Keyword If  '${asset_number_status}'=='${asset_number_yesorno}' and '${asset_type_status}'=='${true}' and '${asset_unit_status}'=='${true}'     Asset_to_review  ${i}
        
        Exit For Loop If    '${asset_number_status}'=='${asset_number_yesorno}' and '${asset_type_status}'=='${true}' and '${asset_unit_status}'=='${true}'
    END

    Run Keyword If  '${asset_number_status}'=='${true}' and '${asset_unit}'!='${not_assign}'   Check_review_data    ${save_asset_number}
    ...     ELSE IF  '${asset_unit}'!='${not_assign}'    Check_review_no_number_data    ${asset_type}    ${save_hostname}
    
Check_review_data 
    [Arguments]  ${save_hostname_par} 
    Open Browser Chrome and use user
    Login Attention
    Search_cloud_data
    FOR    ${j}    IN RANGE    1    11 
        ${save_hostname_status} =    Run Keyword And Return Status    Wait Until Element Is Visible    //table[@id="pr_id_2-table"]/tbody//tr[${j}]/td[3][text()=' ${save_hostname_par} ']
        Run Keyword If    '${save_hostname_status}'=='${true}'    Verify the testcase is pass (data is existed)    //table[@id="pr_id_2-table"]/tbody//tr[${j}]/td[3][text()=' ${save_hostname_par} ']
        Exit For Loop If    '${save_hostname_status}'=='${true}'
    END
    Close Browser

Check_review_no_number_data
    [Arguments]  ${asset_type}    ${save_hostname_par} 
    Open Browser Chrome and use user
    Login Attention

    Wait And Click    //table[@id="pr_id_2-table"]/tbody//tr[1]
    Sleep    500ms 
    Mouse Over    //tr[@class='p-element p-selectable-row ng-star-inserted p-highlight']//td[@class='dropdown']
    Mouse Over    //tr[@class='p-element p-selectable-row ng-star-inserted p-highlight']//li[1]//*[contains(text(),' ${look} ')]
    Sleep    500ms
    Wait And Click    //tr[@class='p-element p-selectable-row ng-star-inserted p-highlight']//li[1]//*[contains(text(),' ${look} ')]
    Sleep    500ms
    Run Keyword If    '${asset_type}'=='${list_data}'    Verify the testcase is pass (data is existed)    //div[2]/div[2]/div[3][contains(text(),'${save_hostname_par} ')]
    ...    ELSE  Verify the testcase is pass (data is existed)    //div[2]/div[2]/div[7][contains(text(),'${save_hostname_par} ')]
    Close Browser

Search_cloud_data
    Wait And Click  //i[@class='pi pi-copy']
    Wait And Click  //a[@href='/assetsManager/search']
    Wait And Click   //*[text()='${table_software}']
    Wait And Click    //span[@class='p-dropdown-label p-inputtext p-placeholder ng-star-inserted']
    Wait And Click    //li[@aria-label='${department_name}']
    Wait And Click   //div[@class ='p-multiselect-label p-placeholder']
    Wait And Click    //div/div[2][@role="checkbox"]
    Wait And Click    //span[contains(text(),'${all}')]
    Wait And Click    //span[contains(text(),'${Cloud_assets}')]
    Wait And Click    //*[text()='${search}']

Check_number_asset_on_software_data
    [Arguments]   ${asset_type}    ${asset_unit}
    ${total_count}  Set Variable    0
    FOR    ${i}    IN RANGE    1    5
    #FOR    ${i}    IN RANGE    1    101
        ${asset_number_status}  ${asset_type_status}  ${asset_unit_status} =  Check_asset_status     ${i}    ${asset_type}    ${asset_unit}
        ${total_count} =  Run Keyword If  '${asset_number_status}'=='${true}' and '${asset_type_status}'=='${true}' and '${asset_unit_status}'=='${true}'     Evaluate    int(${total_count}) + 1 
        ...    ELSE    Evaluate    int(${total_count}) 
        Exit For Loop If    '${total_count}'=='2'
    END
    Run Keyword If    '${total_count}'!='2'    Create_number_asset    ${total_count}    ${asset_type}    ${not_assign_yet}
    

Create_number_asset
    [Arguments]   ${total_count}    ${asset_type}    ${asset_unit}
    FOR    ${need_create_asset_number}    IN RANGE    0    2-${total_count}
        FOR    ${i}    IN RANGE    1    101
            ${asset_number_status}  ${asset_type_status}  ${asset_unit_status} =  Check_asset_status     ${i}    ${asset_type}    ${asset_unit}
            ${save_hostname} =  Get Text   //table[@id="pr_id_3-table"]/tbody//tr[${i}]/td[10][text()] 
            Run Keyword If  '${asset_number_status}'=='${false}' and '${asset_type_status}'=='${true}' and '${asset_unit_status}'=='${true}'     Asset_to_assign  ${i}    ${department_name}    ${division_name}
            Check_send_asset    ${false}     ${asset_type}    ${department_name}-${division_name}
            Open Browser Chrome and use user
            Login Cloud Operations Supervisor
            Check_review_asset    ${false}     ${asset_type}    ${department_name}-${division_name}

            Exit For Loop If    '${asset_number_status}'=='${false}' and '${asset_type_status}'=='${true}' and '${asset_unit_status}'=='${true}'
        END
    END
