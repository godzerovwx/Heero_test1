*** Settings ***
Resource    Action.robot

*** Variables ***


*** Keywords ***
Open Browser Chrome and use user
    Open Browser  ${URL}  browser=headlesschrome
    Set Window Size    1920    1080
    Maximize Browser Window
Login Attention
    Wait And Click  //button[contains(@label,'${Attention}')]
    Sleep    500ms

Login Dep Attention
    Wait And Click  //button[contains(@label,'${dep_Attention}')]
    Sleep    500ms

Login ISOAttention
    Wait And Click  //button[contains(@label,'${ISOAttention}')]
    Sleep    500ms

Login Operations Supervisor
    Wait And Click  //button[contains(@label,'${Operations_Supervisor}')]
    Sleep    500ms

Login System Admin
    Wait And Click  //button[contains(@label,'${System_Admin}')]
    Sleep    500ms

Login Unit Head
    Wait And Click  //button[contains(@label,'${Unit_Head}')]
    Sleep    500ms

Login Dep Unit Head
    Wait And Click  //button[contains(@label,'${dep_Unit_Head}')]
    Sleep    500ms

*** Comments ***
