*** Settings ***
Library  Selenium2Library    run_on_failure=Nothing
Library    OperatingSystem
#Library    Resource/my_custom_library.py

Resource    Action.robot
Resource    Variables/Variables.robot
Resource    Login.robot
Resource    Home_page_button.robot
Resource    Stocktaking_plan.robot
Resource    Asset_management.robot
Resource    Download_excel.robot
Resource    Management.robot
Resource    Notify.robot
Resource    Data_dropdown_list.robot
