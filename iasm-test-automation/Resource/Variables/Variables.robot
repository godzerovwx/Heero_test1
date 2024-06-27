*** Settings ***

*** Variables ***
#登入相關參數
${URL}    https://iasm-lab.net/change-role 
${Account}    account
${Password}    password

#按鈕相關參數
${add}    新增
${edit}    編輯
${look}    查看
${copy}    複製
${delete}    刪除
${save}    儲存
${ok}    確定
${cancel}    取消
${update}    修改
${search}    搜尋
${clear}    清除
${yes}    是

#使用者相關參數
${Attention}    經辦
${ISOAttention}    ISO經辦
${Operations_Supervisor}    科級主管
${System_Admin}    公司負責人
${Unit_Head}    單位主管
${Cloud_Unit_Head}    雲端單位主管
${Cloud_Operations_Supervisor}    雲端科級主管
${Cloud_Attention}    雲端經辦
${dep_Attention}    隸屬部-經辦
${dep_Unit_Head}    隸屬部-單位主管
${no_data}    查無資料

#首頁相關參數
${work_search_button}    工作區資產查詢
${home_table_string_edit_return}    編輯中/退回件
${home_table_string_send}    送審中
${table_hardware}    硬體
${table_software}    軟體
${table_data}    資料
${table_paper}    紙本
${table_people}    人員
${stop_status}    停用
${send_status}    送審
${delete_status}   刪除
${cancel_send_status}    取消送審
${review_status}    覆核
${return_status}    退件
${sync_now}    立即同步
${cancel_now}    立即取消
${Add_new_settings}    新增設定
${assign}    指派
${not_assign}    不指派
${not_assign_yet}    尚未指派
${send_success}    送審完成


#展開清單參數
${select_dep}    請選擇(部)
${select_div}    請選擇(科)
${select_parameter}    請選擇
${all}    全部
${Cloud_assets}    雲端資產
${Land_assets}    地端資產
${select_asset_group}    請選擇資產群組
${list_hardware}    硬體
${list_software}    軟體
${list_data}    資料
${list_paper}    紙本
${list_people}    人員
${every_month}    每月
${cloud_service_IaaS}    IaaS


#功能列表參數
${home_page_link}    首頁
${add_role_link}    新增角色
${Role_permission_scope}    角色權限範圍
${sub_company_scope}    子公司
${dep_unit_scope}    部門單位
${div_unit_scope}    科級單位
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
${cloud_asset_allocation_link}    雲端資產分派
${cloud_asset_settings_link}    雲端資產設定
${cloud_shared_menu_management_link}    雲端共用選單管理


#資產管理相關參數
#資產管理相關參數-硬體
${hard_data_name}    hard_data_name
${update_hard_data_name}    update_hard_data_name
${copy_hard_data_name}    copy_hard_data_name
${has_review_hard_data_name}    has_review_hard_data_name
${update_has_review_hard_data_name}    update_has_review_hard_data_name
${copy_has_review_hard_data_name}    copy_review_hard_data_name
#資產管理相關參數-軟體
${soft_data_name}    soft_data_name
${update_soft_data_name}    update_soft_data_name
${copy_soft_data_name}    copy_soft_data_name
${has_review_soft_data_name}    has_review_soft_data_name
${update_has_review_soft_data_name}    update_has_review_soft_data_name
${copy_has_review_soft_data_name}    copy_review_soft_data_name
#資產管理相關參數-資料
${data_data_name}    data_data_name
${update_data_data_name}    update_data_data_name
${copy_data_data_name}    copy_data_data_name
${has_review_data_data_name}    has_review_data_data_name
${update_has_review_data_data_name}    update_has_review_data_data_name
${copy_has_review_data_data_name}    copy_review_data_data_name
#資產管理相關參數-紙本
${paper_data_name}    paper_data_name
${update_paper_data_name}    update_paper_data_name
${copy_paper_data_name}    copy_paper_data_name
${has_review_paper_data_name}    has_review_paper_data_name
${update_has_review_paper_data_name}    update_has_review_paper_data_name
${copy_has_review_paper_data_name}    copy_review_paper_data_name
#資產管理相關參數-人員
${people_data_name}    people_data_name
${update_people_data_name}    update_people_data_name
${copy_people_data_name}    copy_people_data_name
${has_review_people_data_name}    has_review_people_data_name
${update_has_review_people_data_name}    update_has_review_people_data_name
${copy_has_review_people_data_name}    copy_review_people_data_name

#資產管理相關參數-人員 到職日
${Arrival_day}    15
#資產管理相關參數-已審核查詢中 在xxx日期前未異動參數
${not_change_day}    15

${department_name}    法令遵循部
#${department_name}    中台發展部
${division_name}    法令遵循一科
${division_name_update}    法令遵循二科
#${division_name}    中台發展部
${group_name}    H3-後勤支援應用硬體

${hard_group_name}    H3-後勤支援應用硬體
${soft_group_name}    S3-後勤支援應用軟體
${data_group_name}    F2-極機密資料/一般直接識別個人 
${paper_group_name}    D2-極機密紙本/一般直接識別個人 
${people_group_name}    P2-長期駐點資訊作業維運委外人員 

#資產管理-查看資產頁面相關參數
${read_data_title}    查看資產
${change_records_title}    異動紀錄
${status_history_title}    狀態歷程
${read_data_edit_project}    顯示本次編輯項目
${change_time_name}    異動人員
${history_time_name}    流程狀態時間


#盤點計畫相關參數
${stocktaking_plan_name}    測試盤點計畫
#${stocktaking_plan_name}    aaa
${stocktaking_download_excel}    下載 Excel
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
#${path_to_update_excel_file}    C:\\資產清冊-20231030095231.xlsx     #改成相對位置
${OUTPUT_DIR}    C:\\Users\\TPI
${path_to_update_excel_file}    test_UAT.xlsx     #改成相對位置
${path_to_update_excel_right_file}    test_right_data.xlsx     #改成相對位置
${path_to_update_excel_wrong_file}    test_wrong_data.xlsx     #改成相對位置
${import_name}    盤點單位-部門 
${path_to_update_download_link}    匯出錯誤結果
${upload_successfully}     上傳成功
${upload_result}     上傳結果
${total_numbers}     總共筆數
${add_numbers}     新增筆數
${upload_numbers}     更新筆數 

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

#${Role_function_management_no_role}    劉○澤
${Role_function_management_no_role}    李○


#管理-常用部門組織管理相關參數
${Most_used_department_list}    常用清單列表

#管理-代理人管理相關參數
${agent_remind}    近3個月代理人設定
${agent_error_code_2084}    儲存失敗，因代理期間重疊，請確認																		  
${agent_add}    新增代理人
${agent_add_reason}    測試新增代理人
${agent_update_reason}    測試修改
${agent_name_for_Attention}    李○
${agent_name_for_number_Attention}    00583311
${agent_name_for_ISOAttention}    陳○茜
${agent_name_for_Operations_Supervisor}    李○
${agent_name_for_number_Operations_Supervisor}    00583311
${agent_name_for_Unit_Head}    周○宏
${agent_name_for_Cloud_Attention}    蘇○昕
${agent_name_for_number_Cloud_Attention}    00590870
${agent_name_for_Cloud_Operations_Supervisor}    劉○余
${agent_name_for_number_Cloud_Operations_Supervisor}    00586810
${agent_name_for_Cloud_Unit_Head}    
${agent_start_year}    2023
${agent_start_month}    十二月
${agent_start_day}    15
${agent_end_year}    2023
${agent_end_month}    十二月
${agent_end_day}    15			
${agent_error_code_add_manager_to_attention}    儲存失敗，該員工在未來代理經辦角色因此不能兼任主管，請重新選擇角色	  
${agent_error_code_add_attention_to_manager}    儲存失敗，該員工在未來代理主管角色因此不能兼任經辦，請重新選擇角色	  
${agent_error_code_add_attention_and_mamanger_conflict}   儲存失敗，因代理人不可同時兼任經辦、主管角色，請重新選擇指派人員

#管理-使用者權限管理相關參數
${permission_management_now_role}    現有角色
${permission_management_Attention}    陳○茜
${permission_management_Operations_Supervisor}    李○
${permission_management_Unit_Head}    陳○喧
${permission_management_Cloud_Attention}    蘇○昕
${permission_management_Cloud_Operations_Supervisor}    李○展
${permission_management_Cloud_Unit_Head}    劉○余
${permission_management_number_Attention}    00589597	
${permission_management_number_Operations_Supervisor}    00544621
${permission_management_number_Unit_Head}    00512885
${permission_management_number_ISOAttention}    00589597	
${permission_management_number_Cloud_Attention}    00590164	
${permission_management_number_Cloud_Operations_Supervisor}    00588467
${permission_management_number_Cloud_Unit_Head}    00582605											 
${permission_management_department_name}    法令遵循部
${permission_management_division_name}    法令遵循一科
${permission_management_cloud_department_name}    	雲端架構發展部
${permission_management_cloud_division_name}    雲端應用發展科
${permission_management_error_code_same_role}    角色請勿重複新增
${permission_management_error_code_add_manager_to_attention}     現有角色為經辦，無法新增主管角色 
${permission_management_error_code_add_attention_to_manager}     現有角色為主管，無法新增經辦角色

#管理-共用選單管理相關參數
${Shared_menu_management_list}    備份頻率
${Shared_menu_management_list_code}    測試代碼
${Shared_menu_management_list_name_zh}    測試資訊中文
${Shared_menu_management_list_name_en}    測試資訊英文
${Shared_menu_management_list_name_zh_update}    測試資訊中文-修改

#管理-欄位說明管理相關參數
${Field_description_management_list}    資料保留年限
${Field_description_management_list_software_name}    測試軟體欄位

#管理-驗證單位管理相關參數
${Verification_unit_management_dep}    財富管理部
${Verification_unit_management_div}    營運管理科
${Verification_unit_hard_data_name}    Verification_unit_hard_data_name
${Verification_unit_soft_data_name}    Verification_unit_soft_data_name
${Verification_unit_data_data_name}    Verification_unit_data_data_name
${Verification_unit_paper_data_name}    Verification_unit_paper_data_name
${Verification_unit_people_data_name}    Verification_unit_people_data_name

#管理-雲端資產設定相關參數
${Cloud_asset_settings_des_title}    新增雲端設定
${Cloud_asset_settings_des_1}    設定說明如下：
${Cloud_asset_settings_des_2}    1.Org ID 和 Folder ID 擇一填寫即可
${Cloud_asset_settings_des_3}    2.填入 Org ID 將取得該層級下的所有專案
${Cloud_asset_settings_des_4}    3.填入 Folder ID 將取得該層級下的所有專案
${Cloud_asset_settings_field_1}    雲服務
${Cloud_asset_settings_field_2}    Org ID
${Cloud_asset_settings_field_3}    Folder ID
${Cloud_asset_settings_field_4}    Resource Type

${Cloud_asset_settings_status_1}    未開始
${Cloud_asset_settings_status_2}    同步中
${Cloud_asset_settings_status_3}    已取消
${Cloud_asset_settings_status_4}    已完成
${Cloud_asset_settings_status_5}    同步失敗
${Cloud_asset_settings_status_6}    設定有誤

${Cloud_asset_look_des_title}    查看雲端設定
${Cloud_asset_look_des_1}    雲服務
${Cloud_asset_look_des_2}    Resource Type
${Cloud_asset_look_des_3}    上次同步時間
${Cloud_asset_look_des_4}    最後異動者

${error_message_2110_des}    儲存失敗，您輸入的 Org ID 或 Folder ID 不存在，請確認
${error_message_2110_code}    訊息編碼: 2110

${error_message_2118_des}    刪除失敗，已被雲端資產設定使用，因此無法刪除
${error_message_2118_code}    訊息編碼: 2118

${Org_ID_error}    aaa
${Org_ID_right_1}    692857849857
${Folder_ID_right_1}    980794902379
${test_resource_type}    test_resource_type
${test_resource_type_update}    test_resource_type_update

#管理-雲端共用選單管理相關參數

#通知相關參數
${notify_string}    通知類別
${empty_string}    查無資料
${start_string}    已啟動
${have_assets_review}    您有待審核資產

*** Keywords ***

*** Comments ***
