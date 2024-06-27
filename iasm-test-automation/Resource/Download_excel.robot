*** Settings ***
Resource    Action.robot
Resource  IASMImportLib.robot

*** Variables ***

*** Keywords ***
Download excel
#資產清冊下載
    Wait And Click  //i[@class='pi pi-print']
    Wait And Click  //a[@href='/reportPrinting/assetInventory']
    Wait And Click    //span[@class='p-dropdown-label p-inputtext p-placeholder ng-star-inserted']
    Wait And Click    //li[@aria-label='${department_name}']
    Wait And Click   //div[@class ='p-multiselect-label p-placeholder']
    Wait And Click    //div[@class='p-checkbox p-component ng-star-inserted']
    Wait And Click    //button[contains(@class,'p-multiselect-close')]
    Wait And Click    //span[text()='${table_hardware}']
    Wait And Click    //li[@aria-label='${all}'] 
    Wait And Click  //button[@class='p-element p-button functional-button mx-2 p-component']  
    Sleep    5s

Download role excel
#角色權限表下載
    Wait And Click  //i[@class='pi pi-print']
    Wait And Click  //a[@href='/reportPrinting/rolePermissionTable']
    Wait And Click    //span[@class='p-button-label']
    Sleep    5s

*** Comments ***

