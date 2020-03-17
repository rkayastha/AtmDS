function GenControl()
PrjDir='/data6/MEI/DemoPrj';
DomDir=fullfile(PrjDir,'Domain');
FrcDir=fullfile(PrjDir,'Forcing');
PrmDir=fullfile(PrjDir,'Parameter');
OutDir=fullfile(PrjDir,'Output');
ini=IniConfig();
ini.AddSections({'Domain','Forcing','Parameter','Output'});

%% Domain section
ini.AddKeys('Domain',{'StTm_Vb','EdTm_Vb','NTmS_Vb','TmFm_Vb','Ycor_DFn','Xcor_DFn','Lati_DFn',...
    'Elev_DFn','Slop_DFn','Aspt_DFn','SVFa_DFn','Ycor_bFn','Xcor_bFn','Elev_bFn'},{'s2008010100',...
    's2008013123',744,'yyyymmddHH',fullfile(DomDir,'Ycor.1km.mat'),fullfile(DomDir,'Xcor.1km.mat'),...
    fullfile(DomDir,'Lati.1km.mat'),fullfile(DomDir,'Elev.1km.mat'),fullfile(DomDir,'Slop.1km.mat'),...
    fullfile(DomDir,'Aspt.1km.mat'),fullfile(DomDir,'SVFa.1km.mat'),fullfile(DomDir,'Ycor_b.50km.mat'),...
    fullfile(DomDir,'Xcor_b.50km.mat'),fullfile(DomDir,'Elev_b.50km.mat')});

%% Forcing section
ini.AddKeys('Forcing',{'MHti_Vb','MHto_Vb','Tair_bFn','Psfc_bFn','IVTp_Vb','IVar_bFn','LRad_Fn',...
    'SRad_Fn','Albd_Fn','WsTp_Vb','Uspd_Fn','Vspd_Fn','Roug_Fn','DisH_Fn'},...
    {fullfile(FrcDir,'MHgt','MHgt_b.50km.MERRA2.yyyymmddHH.mat'),10,...
    fullfile(FrcDir,'Tair','Tair_b.50km.MERRA2.yyyymmddHH.mat'),...
    fullfile(FrcDir,'Psfc','Psfc_b.50km.MERRA2.yyyymmddHH.mat'),'DewPoint; Specific/Relative/DewPoint',...
    fullfile(FrcDir,'Tdew','Tdew_b.50km.MERRA2.yyyymmddHH.mat'),...
    fullfile(FrcDir,'LRad','LRad.50km.MERRA2.yyyymmddHH.mat'),...
    fullfile(FrcDir,'SRad','SRad.50km.MERRA2.yyyymmddHH.mat'),...
    fullfile(FrcDir,'Albd','Albd.50km.MERRA2.yyyymmddHH.mat'),'Component; Total/Component',...
    [fullfile(FrcDir,'Uspd','Uspd.50km.MERRA2.yyyymmddHH.mat') '; '],...
    [fullfile(FrcDir,'Vspd','Vspd.50km.MERRA2.yyyymmddHH.mat'), '; Off (if WsTp_Vb is Total)']...
    [fullfile(FrcDir,'Roug','Roug.50km.MERRA2.yyyymmddHH.mat') '; Off'],...
    [fullfile(FrcDir,'DisH','DisH.50km.MERRA2.yyyymmddHH.mat') '; Off (must be Off if Roug_Fn is Off)']});

%% Parameter section
ini.AddKeys('Parameter',{'LRTp_Vb','LRTa_Fn','LRTd_Fn','LRFm_Vb','EmTp_Vb','Emis_DFn','Azim_bFn',...
    'SoEl_bFn','SRTA_Fn','SMTp_Vb','SdMk_DFn','BSAl_DFn','WSAl_DFn','AlFm_Vb','LCWt_DFn','LCFm_Vb',...
    'LCRg_Fn','VgIx_DFn','VITL_Fn','VIFm_Vb'},{'Slp_min; User/Slp_min/Slp_avg/Slp_reg',...
    'Off; /some_path/Lapse_rate_file (if LRTp_Vb is User)',...
    'Off; /some_path/Lapse_rate_file (if LRTp_Vb is User)',...
    'Off; date string format of LRTa_Fn and LRTd_Fn (if LRTa_Fn and LRTd_Fn are not Off)',...
    'Konz; User/Brut/Konz/Satt/Idso/Izio/Prat','Off; /some_path/Emissivity_file',...
    fullfile(PrmDir,'Azim','Azim_b.50km.yyyymmddHH.mat'),...
    fullfile(PrmDir,'SoEl','SoEl_b.50km.yyyymmddHH.mat'),...
    [fullfile(PrmDir,'SRTA','SRTA.50km.MERRA2.yyyymmddHH.mat') '; Built-in'],'Built-in; User/Built-in',...
    fullfile(PrmDir,'SdMk','SdMk.1km.Built-in.yyyymmddHH.mat'),...
    [fullfile(PrmDir,'MAlb','BSAl.1km.MODIS_shortwave.yyyymmdd.mat') '; Off'],...
    [fullfile(PrmDir,'MAlb','WSAl.1km.MODIS_shortwave.yyyymmdd.mat') '; Off'],'yyyymmdd',...
    fullfile(PrmDir,'LCWt','LCWt_*.1km.MODIS_IGBP.yyyy.mat'),'yyyy',fullfile(PrmDir,'LC_Roug_LuT.txt'),...
    [fullfile(PrmDir,'VgIx','VgIx.1km.MODIS_NDVI.yyyymmdd.mat') '; Off (must be Off if Roug_Fn is Off)'],...
    [fullfile(PrmDir,'VI_TimeLine.txt') '; Off (if VgIx_DFn is Off)'],...
    'yyyymmdd; Off (if VgIx_DFn is Off)'});

%% Output section
ini.AddKeys('Output',{'Tair_DFn','Psfc_DFn','SHum_DFn','RHum_DFn','LRad_DFn','SRad_DFn','Uspd_DFn',...
    'Vspd_DFn','Tdew_DFn','Tair_OFn','Psfc_OFn','SHum_OFn','RHum_OFn','Tdew_OFn','Uspd_OFn','Vspd_OFn'},...
    {fullfile(OutDir,'Tair','Tair.1km.MERRA2.yyyymmddHH.mat'),...
    fullfile(OutDir,'Psfc','Psfc.1km.MERRA2.yyyymmddHH.mat'),...
    fullfile(OutDir,'SHum','SHum.1km.MERRA2.yyyymmddHH.mat'),...
    fullfile(OutDir,'RHum','RHum.1km.MERRA2.yyyymmddHH.mat'),...
    fullfile(OutDir,'LRad','LRad.1km.MERRA2.yyyymmddHH.mat'),...
    fullfile(OutDir,'SRad','SRad.1km.MERRA2.yyyymmddHH.mat'),...
    fullfile(OutDir,'Uspd','Uspd.1km.MERRA2.yyyymmddHH.mat'),...
    fullfile(OutDir,'Vspd','Vspd.1km.MERRA2.yyyymmddHH.mat'),...
    fullfile(OutDir,'Tdew','Tdew.1km.MERRA2.yyyymmddHH.mat'),...
    [fullfile(OutDir,'Ta10','Ta10.50km.MERRA2.yyyymmddHH.mat') '; Off'],...
    [fullfile(OutDir,'Ps10','Ps10.50km.MERRA2.yyyymmddHH.mat') '; Off'],...
    [fullfile(OutDir,'SH10','SH10.50km.MERRA2.yyyymmddHH.mat') '; Off'],...
    [fullfile(OutDir,'RH10','RH10.50km.MERRA2.yyyymmddHH.mat') '; Off'],...
    [fullfile(OutDir,'Td10','Td10.50km.MERRA2.yyyymmddHH.mat') '; Off'],...
    [fullfile(OutDir,'Us10','Us10.50km.MERRA2.yyyymmddHH.mat') '; Off'],...
    [fullfile(OutDir,'Vs10','Vs10.50km.MERRA2.yyyymmddHH.mat') '; Off']});

%% Write the control file
ini.WriteFile(fullfile(PrjDir,'Control.DemoPrj.ini'));
end