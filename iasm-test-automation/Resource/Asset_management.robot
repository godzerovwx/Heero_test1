*** Settings ***
Resource    Action.robot

*** Variables ***


*** Keywords ***
Search data
    [Arguments]    ${data_name}
    Wait And Click  //i[@class='pi pi-copy']
    Wait And Click  //a[@href='/assetsManager/search']
    Run Keyword If    '${data_name}' == '${soft_data_name}'    Wait And Click   //*[text()='軟體']
    ...    ELSE IF    '${data_name}' == '${data_data_name}'    Wait And Click   //*[text()='資料']
    ...    ELSE IF    '${data_name}' == '${paper_data_name}'    Wait And Click   //*[text()='紙本']
    ...    ELSE IF    '${data_name}' == '${people_data_name}'    Wait And Click   //*[text()='人員']   
    Wait And Click    //span[@class='p-dropdown-label p-inputtext p-placeholder ng-star-inserted']
    Wait And Click    //li[@aria-label='${department_name}']
    Wait And Click   //div[@class ='p-multiselect-label p-placeholder']
    Wait And Click    //div[@class='p-checkbox p-component ng-star-inserted']
    Wait And Click    //button[@class='p-ripple p-element p-multiselect-close p-link ng-star-inserted']
    Run Keyword If    '${data_name}' == '${hard_data_name}' or '${data_name}' == '${soft_data_name}' or '${data_name}' == '${paper_data_name}'    Wait And Input    //input[@formcontrolname='nameOfAsset']    ${data_name}
    ...    ELSE IF    '${data_name}' == '${data_data_name}'    Wait And Input    //input[@formcontrolname='nameOfAsset2']    ${data_data_name}
    ...    ELSE IF    '${data_name}' == '${people_data_name}'    Wait And Input    //input[@formcontrolname='nameOfPersonnel']    ${people_data_name} 
    Wait And Click    //div[@class='d-flex using-container']/div[3]/div/p-radiobutton/div/div[2]
    Wait And Click    //*[text()='搜尋']
    Sleep    500ms
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${data_name}')]



Create hard data
    [Arguments]  ${hard_data_name}
    Wait And Click  //i[@class='pi pi-copy']
    Wait And Click   //a[@href='/assetsManager/add']
    Wait And Click    //*[text()='請選擇(部)']
    Wait And Click    //li[@aria-label='${department_name}']
    Wait And Click   //div[@class ='input-field units-dropdown p-dropdown p-component p-dropdown-clearable']
    Wait And Click    //li[@aria-label='${division_name}']
    Wait And Click   //div[@class ='input-field p-dropdown p-component']
    Wait And Click    //li[text()=' ${hard_group_name} ']
    Wait And Input    //input[@formcontrolname='nameOfAsset']    ${hard_data_name}
    Wait And Input    //input[@formcontrolname='assetUsage']    hard_assetUsage
    Wait And Input    //input[@formcontrolname='physicalLocationOfTheAsset']    hard_physicalLocationOfTheAsset
    Wait And Input    //input[@formcontrolname='hostname']    hard_hostname
    Wait And Click   //div[@class ='p-multiselect-label p-placeholder']
    Wait And Click    //div[@class='p-checkbox-box']
    Wait And Click   //span[@class='p-multiselect-close-icon pi pi-times']
    Wait And Input    //textarea[@formcontrolname='brandOfDevice']    hard_brandOfDevice
    Wait And Input    //textarea[@formcontrolname='modelOfDevice']    hard_modelOfDevice
    Wait And Input    //input[@inputmode='decimal']    11
    Wait And Input    //textarea[@formcontrolname='serverRackNo']    hard_serverRackNo
    Wait And Click   //div[@class ='input-field w-140 p-dropdown p-component p-dropdown-clearable']
    Wait And Click    //li[@aria-label='正式(Prod)']
    Wait And Click    //*[text()='請選擇(部)']
    Wait And Click    //li[@aria-label='${department_name}']
    Wait And Click   //*[text()='請選擇(科)']
    Wait And Click    //li[@aria-label='${division_name}']
    Wait And Input    //input[@formcontrolname='custodian']    hard_custodian
    Wait And Click    //*[text()='儲存']
    Wait And Click    //*[text()='取消']
    Sleep    500ms

Create soft data
    [Arguments]  ${soft_data_name}
    Wait And Click  //i[@class='pi pi-copy']
    Wait And Click   //a[@href='/assetsManager/add']
    Wait And Click   //*[text()='軟體']
    Wait And Click    //*[text()='請選擇(部)']
    Wait And Click    //li[@aria-label='${department_name}']
    Wait And Click   //div[@class ='input-field units-dropdown p-dropdown p-component p-dropdown-clearable']
    Wait And Click    //li[@aria-label='${division_name}']
    Wait And Click   //div[@class ='input-field p-dropdown p-component']
    Wait And Click    //li[text()=' ${soft_group_name} ']
    Wait And Input    //input[@formcontrolname='nameOfAsset']    ${soft_data_name}
    Wait And Input    //input[@formcontrolname='assetUsage']    soft_assetUsage
    Wait And Input    //input[@formcontrolname='operatingSystem']    soft_operatingSystem
    Wait And Input    //input[@formcontrolname='hostname']    soft_hostname
    Wait And Click    //*[text()='請選擇(部)']
    Wait And Click    //li[@aria-label='${department_name}']
    Wait And Click   //*[text()='請選擇(科)']
    Wait And Click    //li[@aria-label='${division_name}']
    Wait And Input    //input[@formcontrolname='custodian']    soft_custodian
    Wait And Click   //div[@class ='p-multiselect-label p-placeholder']
    Wait And Click    //div[@class='p-checkbox-box']
    Wait And Click   //span[@class='p-multiselect-close-icon pi pi-times']
    Wait And Click   //p-dropdown[@formcontrolname='processPersonalInformation']
    Wait And Click   //li[@aria-label='是']
    Wait And Input    //textarea[@formcontrolname='databaseName']    soft_databaseName
    Wait And Input    //textarea[@formcontrolname='databaseServer']    soft_databaseServer
    Wait And Click   //p-dropdown[@formcontrolname='backupFrequency']
    Wait And Click   //li[@aria-label='每月']
    Wait And Input    //input[@formcontrolname='outsourceMaintenance']    soft_outsourceMaintenance
    Wait And Input    //input[@formcontrolname='systemApplication']    soft_systemApplication
    Wait And Click   //p-dropdown[@formcontrolname='customerSecurityData']
    Wait And Click   //li[@aria-label='是']
    Wait And Click    //*[text()='儲存']
    Wait And Click    //*[text()='取消']
    Sleep    500ms
Create data data
    [Arguments]  ${data_data_name}
    Wait And Click  //i[@class='pi pi-copy']
    Wait And Click   //a[@href='/assetsManager/add']
    Wait And Click   //*[text()='資料']
    Wait And Click    //*[text()='請選擇(部)']
    Wait And Click    //li[@aria-label='${department_name}']
    Wait And Click   //div[@class ='input-field units-dropdown p-dropdown p-component p-dropdown-clearable']
    Wait And Click    //li[@aria-label='${division_name}']
    Wait And Click   //div[@class ='input-field p-dropdown p-component']
    Wait And Click    //li[text()=' ${data_group_name} ']
    Wait And Input    //input[@formcontrolname='nameOfAsset2']    ${data_data_name}
    Wait And Input    //input[@formcontrolname='hostname']    data_hostname
    Wait And Click    //*[text()='請選擇(部)']
    Wait And Click    //li[@aria-label='${department_name}']
    Wait And Click   //*[text()='請選擇(科)']
    Wait And Click    //li[@aria-label='${division_name}']
    Wait And Input    //input[@formcontrolname='custodian']    data_custodian
    Wait And Click   //div[@class ='p-multiselect-label p-placeholder']
    Wait And Click    //div[@class='p-checkbox-box']
    Wait And Click   //span[@class='p-multiselect-close-icon pi pi-times']
    Wait And Click   //p-dropdown[@formcontrolname='personalGroup']
    Wait And Click   //li[@aria-label='含特種個資']
    Wait And Click   //p-multiselect[@formcontrolname='personalInformation']
    Wait And Click    //div[@class='p-checkbox-box']
    Wait And Click   //span[@class='p-multiselect-close-icon pi pi-times']
    Wait And Input    //input[@formcontrolname='dataRetentionPeriodC']    data_dataRetentionPeriodC
    Wait And Click   //p-dropdown[@formcontrolname='methodOfDataBackup']
    Wait And Click   //li[@aria-label='DISK']
    Wait And Click   //p-dropdown[@formcontrolname='backupFrequency']
    Wait And Click   //li[@aria-label='每月']
    Wait And Click    //*[text()='儲存']
    Wait And Click    //*[text()='取消']
    SLEEP    500ms

Create paper data
    [Arguments]  ${paper_data_name}
    Wait And Click  //i[@class='pi pi-copy']
    Wait And Click   //a[@href='/assetsManager/add']
    Wait And Click   //*[text()='紙本']
    Wait And Click    //*[text()='請選擇(部)']
    Wait And Click    //li[@aria-label='${department_name}']
    Wait And Click   //div[@class ='input-field units-dropdown p-dropdown p-component p-dropdown-clearable']
    Wait And Click    //li[@aria-label='${division_name}']
    Wait And Click   //div[@class ='input-field p-dropdown p-component']
    Wait And Click    //li[contains(text(),' ${paper_group_name} ')]
    Wait And Input    //input[@formcontrolname='nameOfAsset']    ${paper_data_name}
    Wait And Click    //*[text()='請選擇(部)']
    Wait And Click    //li[@aria-label='${department_name}']
    Wait And Click   //*[text()='請選擇(科)']
    Wait And Click    //li[@aria-label='${division_name}']
    Wait And Input    //input[@formcontrolname='custodian']    data_custodian
    Wait And Click   //div[@class ='p-multiselect-label p-placeholder']
    Wait And Click    //div[@class='p-checkbox-box']
    Wait And Click   //span[@class='p-multiselect-close-icon pi pi-times']
    Wait And Click   //p-dropdown[@formcontrolname='personalGroup']
    Wait And Click   //li[@aria-label='含特種個資']
    Wait And Click   //p-multiselect[@formcontrolname='personalInformation']
    Wait And Click    //div[@class='p-checkbox-box']
    Wait And Click   //span[@class='p-multiselect-close-icon pi pi-times']
    Wait And Input    //input[@formcontrolname='dataRetentionPeriod']    paper_dataRetentionPeriod
    Wait And Input    //textarea[@formcontrolname='assetUsage']    paper_assetUsage
    Wait And Input    //textarea[@formcontrolname='storageLocation']    paper_assetUsage
    Wait And Click   //p-dropdown[@formcontrolname='alternateLocation']
    Wait And Click   //li[@aria-label='內湖資訊大樓']
    Wait And Click    //*[text()='儲存']
    Wait And Click    //*[text()='取消']
    SLEEP    500ms

Create people data
    [Arguments]  ${people_data_name}
    Wait And Click  //i[@class='pi pi-copy']
    Wait And Click   //a[@href='/assetsManager/add']
    Wait And Click   //*[text()='人員']
    Wait And Click    //*[text()='請選擇(部)']
    Wait And Click    //li[@aria-label='${department_name}']
    Wait And Click   //div[@class ='input-field units-dropdown p-dropdown p-component p-dropdown-clearable']
    Wait And Click    //li[@aria-label='${division_name}']
    Wait And Click   //div[@class ='input-field p-dropdown p-component']
    Wait And Click    //li[contains(text(),' ${people_group_name} ')]
    Wait And Input    //input[@formcontrolname='nameOfPersonnel']    ${people_data_name}
    Wait And Input    //input[@formcontrolname='employeeNo']    people1111
    Wait And Click    //p-calendar[@formcontrolname='joinDate']
    Select calendar month and day    ${Arrival_day}
    Wait And Input    //input[@formcontrolname='backupPersonnel_1']    people_backupPersonnel_1
    Wait And Click    //*[text()='請選擇(部)']
    Wait And Click    //li[@aria-label='${department_name}']
    Wait And Click   //*[text()='請選擇(科)']
    Wait And Click    //li[@aria-label='${division_name}']
    Wait And Input    //input[@formcontrolname='phoneExtension']    pphone
    Wait And Input    //input[@formcontrolname='jobTitle']    people_jobTitle
    Wait And Input    //textarea[@formcontrolname='briefJobDesciption']    people_briefJobDesciption
    Wait And Click    //*[text()='儲存']
    Wait And Click    //*[text()='取消']
    SLEEP    500ms

Import excel
    Wait And Click  //i[@class='pi pi-copy']
    Wait And Click  //a[@href='/assetsManager/import']
    Wait And Click    //span[contains(text(),'點擊')]   
    Upload file
    Wait And Click  //button[@class='p-element p-button functional-button p-component']  
    Sleep    5s
    
Search has review data
    [Arguments]  ${has_review_data_name}
    Wait And Click  //i[@class='pi pi-copy']
    Wait And Click  //a[@href='/assetsManager/searchApproved']
    Run Keyword If    '${has_review_data_name}' == '${has_review_soft_data_name}'    Wait And Click   //*[text()='軟體']
    ...    ELSE IF    '${has_review_data_name}' == '${has_review_data_data_name}'    Wait And Click   //*[text()='資料']
    ...    ELSE IF    '${has_review_data_name}' == '${has_review_paper_data_name}'    Wait And Click   //*[text()='紙本']
    ...    ELSE IF    '${has_review_data_name}' == '${has_review_people_data_name}'    Wait And Click   //*[text()='人員'] 
    Wait And Click    //span[@class='p-dropdown-label p-inputtext p-placeholder ng-star-inserted']
    Wait And Click    //li[@aria-label='${department_name}']
    Wait And Click   //div[@class ='p-multiselect-label p-placeholder']
    Wait And Click    //div[@class='p-checkbox p-component ng-star-inserted']
    Wait And Click    //button[@class='p-ripple p-element p-multiselect-close p-link ng-star-inserted']
    Run Keyword If    '${has_review_data_name}' == '${has_review_hard_data_name}' or '${has_review_data_name}' == '${has_review_soft_data_name}' or '${has_review_data_name}' == '${has_review_paper_data_name}'    Wait And Input    //input[@formcontrolname='nameOfAsset']    ${has_review_data_name}
    ...    ELSE IF    '${has_review_data_name}' == '${has_review_data_data_name}'    Wait And Input    //input[@formcontrolname='nameOfAsset2']    ${has_review_data_name}
    ...    ELSE IF    '${has_review_data_name}' == '${has_review_people_data_name}'    Wait And Input    //input[@formcontrolname='nameOfPersonnel']    ${has_review_data_name}
    Wait And Click    //div[@class='d-flex using-container']/div[3]/div/p-radiobutton/div/div[2]
    Select has review people data calendar
    Wait And Click    //*[text()=' 附加說明 ']
    Wait And Click    //*[text()='搜尋']
    Sleep    500ms
    Verify the testcase is pass (data is existed)    //*[contains(text(),'${has_review_data_name}')]
    
Select has review people data calendar
    Wait And Click    //div[contains(@class,'p-field ng-star-inserted')]//span[contains(@class,'p-button-icon pi pi-calendar')]
    Select calendar month and day    ${not_change_day}

*** Comments ***

