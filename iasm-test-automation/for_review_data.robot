*** Settings ***
Resource  Resource/IASMImportLib.robot

Suite Setup    Open Browser Chrome and use user
Suite Teardown    Close Browser 

*** Variables ***

*** Test Cases ***
覆核迴圈
    Login Operations Supervisor
    Wait And Click    //p-paginator[@styleclass='p-paginator-bottom']//span[@class='p-dropdown-trigger-icon pi pi-chevron-down']
    Wait And Click    //li[@aria-label='100']
    FOR    ${i}    IN RANGE    1    50
        Wait And Click    //p-tabpanel[1]//tr[@class='ng-star-inserted']//div[@role='checkbox']
        Wait And Click    //*[text()='覆核']
        Sleep    500ms
        Wait And Click    //*[text()='確定']
        Sleep    500ms
        Wait And Click    //*[text()='確定']
    END

