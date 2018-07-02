SELECT bi.barcoderun_id,
bi.barcode_no||isabarcode.checkdigit(bi.barcode_no) barcode_no,
  bt.last_name,  bt.first_name,  bt.middle_name,  to_char(bt.birth_date,'mm/dd/yyyy') birth_date_mmddyyyy,
  bsg.grade,  bt.gender,  bsg.building_name, bsg.building_code,  bsg.class_name,  bsg.class_code,
  bt.identification as "Student ID",  bt.identification2 as "Additional ID Number",  bt.iowa_form,  bt.iowa_level,  bt.cogat_form,  bt.cogat_level,
  case bt.nativeind when 1 then 1 end as "American Ind or Alaskan",case bt.asian when 1 then 1 end as "Asian", case  bt.africanamerican when 1 then 1 end as "African American",  case bt.hispanic_latino when 1 then 1 end as "Hispanic or Latino", 
  case bt.haw_pac_islander when 1 then 1 end as "Hawaaiian or Pacific Islander",  case bt.white when 1 then 1 end as "White", case bt.others when 1 then 1 end as "Others",
  case bt.adm_code_A when 1 then 1 end as "Test Admin Use Only: Code A", case bt.ADM_CODE_B when 1 then 1 end as "Test Admin Use Only: Code B",  
  case bt.ADM_CODE_C when 1 then 1 end as "Test Admin Use Only: Code C", case bt.ADM_CODE_D when 1 then 1 end as "Test Admin Use Only: Code D",  
  case bt.ADM_CODE_E when 1 then 1 end as "Test Admin Use Only: Code E", case bt.ADM_CODE_F when 1 then 1 end as "Test Admin Use Only: Code F", case bt.ADM_CODE_G when 1 then 1 end as "Test Admin Use Only: Code G",
  case bt.ADM_CODE_H when 1 then 1 end as "Test Admin Use Only: Code H", case bt.ADM_CODE_I when 1 then 1 end as "Test Admin Use Only: Code I",  
  case bt.ADM_CODE_J when 1 then 1 end as "Test Admin Use Only: Code J", case bt.ADM_CODE_K when 1 then 1 end as "Test Admin Use Only: Code K",  
  case bt.ADM_CODE_L when 1 then 1 end as "Test Admin Use Only: Code L", case bt.ADM_CODE_M when 1 then 1 end as "Test Admin Use Only: Code M", case bt.ADM_CODE_N when 1 then 1 end as "Test Admin Use Only: Code N",
  case bt.ADM_CODE_O when 1 then 1 end as "Test Admin Use Only: Code O", case bt.ADM_CODE_P when 1 then 1 end as "Test Admin Use Only: Code P",  
  case bt.ADM_CODE_Q when 1 then 1 end as "Test Admin Use Only: Code Q", case bt.ADM_CODE_R when 1 then 1 end as "Test Admin Use Only: Code R",  
  case bt.ADM_CODE_S when 1 then 1 end as "Test Admin Use Only: Code S", case bt.ADM_CODE_T when 1 then 1 end as "Test Admin Use Only: Code T",  
  case bt.adm_a0 when 1 then 1 end as "Test Admin Use Only: Column A", case bt.adm_b0 when 1 then 1 end as "Test Admin Use Only: Column B", case bt.adm_c0 when 1 then 1 end as "Test Admin Use Only: Column C",  
  case bt.adm_d0 when 1 then 1 end as "Test Admin Use Only: Column D", case bt.adm_e0 when 1 then 1 end as "Test Admin Use Only: Column E", case sd.adm_f when 1 then 1 end as "Test Admin Use Only: Column F",  
  case bt.adm_g when 1 then 1 end as "Test Admin Use Only: Column G", case bt.adm_h when 1 then 1 end as "Test Admin Use Only: Column H", case sd.adm_i when 1 then 1 end as "Test Admin Use Only: Column I",  
  case bt.adm_j when 1 then 1 end as "Test Admin Use Only: Column J", case sd.adm_o when 1 then 1 end as "Home Reporting",
  sd.ou_z as "Office Use Only Z",  case sd.prog_se when 1 then 1 end as "Special Education",  case sd.prog_504 when 1 then 1 end as "Section 504", case sd.prog_frl when 1 then 1 end as "Free or Reduced Lunch", 
  case sd.prog_gt when 1 then 1 end as "Gifted and/or Talented", case sd.prog_ell when 1 then 1 end as "English Language Learner", case sd.prog_mg when 1 then 1 end as "Migrant", case sd.prog_t1lang when 1 then 1 end as "Title 1 Language", 
  case sd.prog_t1math when 1 then 1 end as "title 1 Math", case sd.prog_other1 when 1 then 1 end as "Other 1", case sd.prog_other2 when 1 then 1 end as "Other 2"
    
  
FROM barcodestudent bt
join barcodeinstance bi on bi.barcodestudent_id = bt.barcodestudent_id
join barcodestudentgroup bsg on bsg.barcodestudentgroup_id = bt.barcodestudentgroup_id
join barcoderun bcr on bcr.barcoderun_id = bi.barcoderun_id
join studentdemography sd on sd.student_id = bi.barcodestudent_id
WHERE bi.barcoderun_id  in ('') --Enter Run number(s) here
order by grade, last_name, first_name;