*** Settings ***

*** Variables ***
#登入相關參數
${URL}    https://iasm-lab.net/change-role 
${Account}    account
${Password}    password

#按鈕相關參數
${add}    新增
${edit}    編輯
${delete}    刪除
${save}    儲存
${ok}    確定
${cancel}    取消
${update}    修改

#使用者相關參數
${Attention}    經辦
${ISOAttention}    ISO經辦
${Operations_Supervisor}    科級主管
${System_Admin}    公司負責人
${Unit_Head}    單位主管
${dep_Attention}    隸屬部-經辦
${dep_Unit_Head}    隸屬部-單位主管

#首頁相關參數
${work_search_button}    工作區資產查詢
${home_table_string_edit_return}    編輯中/退回件
${home_table_string_send}    送審中

#功能列表參數
${home_page_link}    首頁
${stocktaking_plan_link}    盤點計畫

${asset_management_link}    資產管理
${work_search_link}    工作區資產查詢
${single_new_addition_link}    單筆新增
${import_in_bulk_link}     整批匯入
${has_work_search_link}    已審核資產查詢

${report_printing_link}    報表列印
${asset_inventory_link}    資產清冊

${management_link}    管理
${asset_group_maintenance_link}    資產群組維護
${role_function_management_link}    角色功能管理
${user_rights_management_link}    使用者權限管理
${ISO_user_rights_management_link}    ISO使用者權限管理
${shared_menu_management_link}    共用選單管理
${field_description_management_link}    欄位說明管理
${agent_management_link}    代理人管理
${common_department_organization_management_link}    常用部門組織管理

#資產管理相關參數
#資產管理相關參數-硬體
${hard_data_name}    hard_data_name
${update_hard_data_name}    update_hard_data_name
${copy_hard_data_name}    copy_hard_data_name
${has_review_hard_data_name}    has_review_hard_data_name
${update_has_review_hard_data_name}    update_has_review_hard_data_name
${copy_has_review_hard_data_name}    copy_has_review_hard_data_name
#資產管理相關參數-軟體
${soft_data_name}    soft_data_name
${update_soft_data_name}    update_soft_data_name
${copy_soft_data_name}    copy_soft_data_name
${has_review_soft_data_name}    has_review_soft_data_name
${update_has_review_soft_data_name}    update_has_review_soft_data_name
${copy_has_review_soft_data_name}    copy_has_review_soft_data_name
#資產管理相關參數-資料
${data_data_name}    data_data_name
${update_data_data_name}    update_data_data_name
${copy_data_data_name}    copy_data_data_name
${has_review_data_data_name}    has_review_data_data_name
${update_has_review_data_data_name}    update_has_review_data_data_name
${copy_has_review_data_data_name}    copy_has_review_data_data_name
#資產管理相關參數-紙本
${paper_data_name}    paper_data_name
${update_paper_data_name}    update_paper_data_name
${copy_paper_data_name}    copy_paper_data_name
${has_review_paper_data_name}    has_review_paper_data_name
${update_has_review_paper_data_name}    update_has_review_paper_data_name
${copy_has_review_paper_data_name}    copy_has_review_paper_data_name
#資產管理相關參數-人員
${people_data_name}    people_data_name
${update_people_data_name}    update_people_data_name
${copy_people_data_name}    copy_people_data_name
${has_review_people_data_name}    has_review_people_data_name
${update_has_review_people_data_name}    update_has_review_people_data_name
${copy_has_review_people_data_name}    copy_has_review_people_data_name

#資產管理相關參數-人員 到職日
${Arrival_day}    15
#資產管理相關參數-已審核查詢中 在xxx日期前未異動參數
${not_change_day}    15

${department_name}    資訊架構部
${division_name}    資訊架構發展科

${hard_group_name}    H3-後勤支援應用硬體
${soft_group_name}    S3-後勤支援應用軟體
${data_group_name}    F2-極機密資料/一般直接識別個人 
${paper_group_name}    D2-極機密紙本/一般直接識別個人 
${people_group_name}    P2-長期駐點資訊作業維運委外人員 

#資產管理-查看資產頁面相關參數
${read_data_title}    查看資產
${read_data_edit_project}    顯示本次編輯項目
${change_time_name}    異動人員
${history_time_name}    流程狀態時間


#盤點計畫相關參數
${stocktaking_plan_name}    測試盤點計畫

${investigate_start_year}    2023
${investigate_start_month}    十二月
${investigate_start_day}    15
${investigate_end_year}    2023
${investigate_end_month}    十二月
${investigate_end_day}    15
${review_start_year}    2023
${review_start_month}    十二月
${review_start_day}    16
${review_end_year}    2023
${review_end_month}    十二月
${review_end_day}    16
${stocktaking_plan_note}    新建測試盤點計畫
${update_stocktaking_plan_note}    更新測試計畫
${stocktaking_plan_not_access_message}    尚未到審核期間，無法覆核
${stocktaking_plan_review_all_data}    覆核部門所有資產
${stocktaking_plan_review_all_data_not_access_message}    覆核失敗，尚有資產未覆核，請確認
${history_stocktaking_plan}    盤點部門
${history_stocktaking_table_name}    歷史紀錄
${check_history_stocktaking_plan_for_IOS}    盤點計畫已結束
${check_history_stocktaking_plan_for_UH}    已核准
${uncheck_history_stocktaking_plan_for_UH}    未核准

${agent_error_code_2024}    儲存失敗，盤點計畫時間不能重疊，請確認

#報表列印-資產清冊相關參數
#${path_to_update_excel_file}    C:\\Users\\TPI\\Downloads\\資產清冊-20231030095231.xlsx    
${path_to_update_excel_file}    C:\\資產清冊-20231030095231.xlsx  
${import_name}    盤點單位-部門 

#管理-資產群組維護相關參數
${Asset_group_hard_code}    A1
${Asset_group_hard_name_zh}    測試硬體群組名稱_中文
${Asset_group_hard_name_en}    測試硬體群組名稱_英文
${Asset_group_hard_Description_zh}    測試硬體說明名稱_中文
${Asset_group_hard_Description_en}    測試硬體說明名稱_英文
${Asset_group_hard_Example_zh}    測試硬體範例名稱_中文    
${Asset_group_hard_Example_en}    測試硬體範例名稱_英文
${Asset_group_hard_code_update}    A2

#管理-角色功能管理相關參數
${Role_function_management_name_UH_zh}    測試腳色功能_部門單位_中文    
${Role_function_management_name_UH_en}    測試腳色功能_部門單位_英文
${Role_function_management_scope_UH}    部門單位
${Role_function_management_name_OS_zh}    測試腳色功能_科級單位_中文    
${Role_function_management_name_OS_en}    測試腳色功能_科級單位_英文
${Role_function_management_scope_OS}    科級單位
${Role_function_management_update}    報表列印

${Role_function_management_no_role}    彭○瑜

#管理-常用部門組織管理相關參數
${Most_used_department_list}    常用清單列表

#管理-代理人管理相關參數
${agent_remind}    近3個月代理人設定
${agent_error_code_2084}    儲存失敗，因代理期間重疊，請確認
${agent_add}    新增代理人
${agent_add_reason}    測試新增代理人
${agent_update_reason}    測試修改
${agent_name_for_Attention}    彭○瑜
${agent_name_for_ISOAttention}    曾○樺
${agent_name_for_Operations_Supervisor}    王○全
${agent_name_for_Unit_Head}    黃○富
${agent_start_year}    2023
${agent_start_month}    十二月
${agent_start_day}    15
${agent_end_year}    2023
${agent_end_month}    十二月
${agent_end_day}    15

#管理-使用者權限管理相關參數
${permission_management_Attention}    梁○全
${permission_management_Operations_Supervisor}    王○全
${permission_management_Unit_Head}    RP○○3
${permission_management_number_Attention}    00595173
${permission_management_number_Operations_Supervisor}    00515494
${permission_management_number_Unit_Head}    00549100
${permission_management_number_ISOAttention}    00590983
${permission_management_department_name}    資訊架構部
${permission_management_division_name}    資訊架構發展科
${permission_management_error_code_same_role}    角色請勿重複新增

#管理-共用選單管理相關參數
${Shared_menu_management_list}    備份頻率
${Shared_menu_management_list_code}    測試代碼
${Shared_menu_management_list_name_zh}    測試資訊中文
${Shared_menu_management_list_name_en}    測試資訊英文
${Shared_menu_management_list_name_zh_update}    測試資訊中文-修改

#管理-欄位說明管理相關參數
${Field_description_management_list}    資料保留年限
${Field_description_management_list_software_name}    測試軟體欄位

#通知相關參數
${notify_string}    通知類別
${empty_string}    查無資料
${start_string}    已啟動

*** Keywords ***

*** Comments ***
