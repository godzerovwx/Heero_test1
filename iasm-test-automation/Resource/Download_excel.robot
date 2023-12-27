*** Settings ***
Resource    Action.robot


*** Variables ***

*** Keywords ***
Download excel
    Wait And Click  //i[@class='pi pi-print']
    Wait And Click  //a[@href='/reportPrinting/assetInventory']
    Wait And Click    //span[@class='p-dropdown-label p-inputtext p-placeholder ng-star-inserted']
    Wait And Click    //li[@aria-label='${department_name}']
    Wait And Click   //div[@class ='p-multiselect-label p-placeholder']
    Wait And Click    //div[@class='p-checkbox p-component ng-star-inserted']
    Wait And Click    //button[@class='p-ripple p-element p-multiselect-close p-link ng-star-inserted']
    Wait And Click    //span[text()='硬體']
    Wait And Click    //li[@aria-label='全部'] 
    Wait And Click  //button[@class='p-element p-button functional-button mx-2 p-component']  
    Sleep    5s

*** Comments ***
Wait And Click    //i[@class='pi pi-file-import']
