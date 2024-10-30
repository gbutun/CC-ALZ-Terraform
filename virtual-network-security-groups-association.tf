module "rg_pri_hub_vn_jmb_sub_nsg_asc" {
  source                    = "./module/nsgassc"
  subnet_id                 = module.rg_pri_hub_vn_jmb_sub.id
  network_security_group_id = module.rg_pri_hub_vn_jmb_sub_nsg.id
}

module "rg_pri_hub_vn_wef_agw_sub_nsg_asc" {
  source                    = "./module/nsgassc"
  subnet_id                 = module.rg_pri_hub_vn_wef_agw_sub.id
  network_security_group_id = module.rg_pri_hub_vn_wef_agw_sub_nsg.id
}

module "rg_pri_spk_vn_wl_sub_nsg_asc" {
  source                    = "./module/nsgassc"
  subnet_id                 = module.rg_pri_spk_vn_wl_sub.id
  network_security_group_id = module.rg_pri_spk_vn_wl_sub_nsg.id
}

module "rg_pri_spk_vn_sql_pe_int_sub_nsg_asc" {
  source                    = "./module/nsgassc"
  subnet_id                 = module.rg_pri_spk_vn_sql_pe_int_sub.id
  network_security_group_id = module.rg_pri_spk_vn_sql_pe_int_sub_nsg.id
}

module "rg_pri_spk_vn_rls_sub_nsg_asc" {
  source                    = "./module/nsgassc"
  subnet_id                 = module.rg_pri_spk_vn_rls_sub.id
  network_security_group_id = module.rg_pri_spk_vn_rls_sub_nsg.id
}

#RG-02

module "rg_sec_hub_vn_jmb_sub_nsg_asc" {
  source                    = "./module/nsgassc"
  subnet_id                 = module.rg_sec_hub_vn_jmb_sub.id
  network_security_group_id = module.rg_sec_hub_vn_jmb_sub_nsg.id
}

module "rg_sec_hub_vn_wef_agw_sub_nsg_asc" {
  source                    = "./module/nsgassc"
  subnet_id                 = module.rg_sec_hub_vn_wef_agw_sub.id
  network_security_group_id = module.rg_sec_hub_vn_wef_agw_sub_nsg.id
}

module "rg_sec_spk_vn_wl_sub_nsg_asc" {
  source                    = "./module/nsgassc"
  subnet_id                 = module.rg_sec_spk_vn_wl_sub.id
  network_security_group_id = module.rg_sec_spk_vn_wl_sub_nsg.id
}

module "rg_sec_spk_vn_sql_pe_int_sub_nsg_asc" {
  source                    = "./module/nsgassc"
  subnet_id                 = module.rg_sec_spk_vn_sql_pe_int_sub.id
  network_security_group_id = module.rg_sec_spk_vn_sql_pe_int_sub_nsg.id
}

module "rg_sec_spk_vn_rls_sub_nsg_asc" {
  source                    = "./module/nsgassc"
  subnet_id                 = module.rg_sec_spk_vn_rls_sub.id
  network_security_group_id = module.rg_sec_spk_vn_rls_sub_nsg.id
}