/* GHC_PACKAGES base integer-gmp ghc-prim rts ffi-1.0
*/
#include "Stg.h"
EI_(base_GHCziBase_map_closure);
EI_(base_DataziList_words_closure);
EI_(base_GHCziBase_zi_closure);
EI_(base_GHCziList_reverse_closure);
static StgWord sgd_srt[] = {
(W_)&base_GHCziBase_map_closure, (W_)&base_DataziList_words_closure, (W_)&base_GHCziBase_zi_closure, (W_)&base_GHCziList_reverse_closure
};

II_(sgd_info);
static StgWord sgd_closure[] = {
(W_)&sgd_info, 0x0, 0x0, 0x0
};

static StgWord sgc_info[] = {
((W_)&sgd_srt+0), 0x0, 0x900000010UL
};

EI_(base_GHCziBase_map_closure);
EI_(base_GHCziList_reverse_closure);
IF_(sgc_entry) {
FB_
if ((W_)(((W_)Sp - 0x10UL) < (W_)SpLim)) goto _cgn;
Sp[-2] = (W_)&stg_upd_frame_info;
Sp[-1] = R1.w;
R1.w = (W_)&base_GHCziBase_map_closure;
R2.w = (W_)&base_GHCziList_reverse_closure;
Sp=Sp-2;
JMP_((W_)&stg_ap_p_fast);
_cgn:
JMP_(stg_gc_enter_1);
FE_
}

static StgWord sgd_info[] = {
((W_)&sgd_srt+0), 0x0, 0xf00000016UL
};

EI_(base_DataziList_words_closure);
EI_(base_GHCziBase_zi_closure);
II_(sgc_info);
IF_(sgd_entry) {
FB_
if ((W_)(((W_)Sp - 0x10UL) < (W_)SpLim)) goto _cgq;
Hp=Hp+4;
if ((W_)((W_)Hp > (W_)HpLim)) goto _cgs;
Hp[-3] = (W_)&stg_CAF_BLACKHOLE_info;
Hp[-2] = (W_)CurrentTSO;
;EF_(newCAF);
{void (*ghcFunPtr)(void *, void *);
ghcFunPtr = ((void (*)(void *, void *))(W_)&newCAF);
__DISCARD__();
ghcFunPtr((void *)(W_)BaseReg, (void *)R1.w);;}
R1.p[1] = (W_)Hp-24;
*R1.p = (W_)&stg_IND_STATIC_info;
Sp[-2] = (W_)&stg_bh_upd_frame_info;
Sp[-1] = (W_)Hp-24;
Hp[-1] = (W_)&sgc_info;
R1.w = (W_)&base_GHCziBase_zi_closure;
R2.p=Hp-1;
R3.w = (W_)&base_DataziList_words_closure;
Sp=Sp-2;
JMP_((W_)&stg_ap_pp_fast);
_cgq:
JMP_(stg_gc_enter_1);
_cgs:
HpAlloc = 0x20UL;
goto _cgq;
FE_
}
EI_(base_DataziList_unwords_closure);
EI_(base_GHCziBase_zi_closure);
II_(sgd_closure);
static StgWord rbu_srt[] = {
(W_)&base_DataziList_unwords_closure, (W_)&base_GHCziBase_zi_closure, (W_)&sgd_closure
};

II_(rbu_info);
static StgWord rbu_closure[] = {
(W_)&rbu_info, 0x0, 0x0, 0x0
};

static StgWord rbu_info[] = {
((W_)&rbu_srt+0), 0x0, 0x700000016UL
};

EI_(base_DataziList_unwords_closure);
EI_(base_GHCziBase_zi_closure);
II_(sgd_closure);
IF_(rbu_entry) {
FB_
if ((W_)(((W_)Sp - 0x10UL) < (W_)SpLim)) goto _cgC;
Hp=Hp+2;
if ((W_)((W_)Hp > (W_)HpLim)) goto _cgE;
Hp[-1] = (W_)&stg_CAF_BLACKHOLE_info;
*Hp = (W_)CurrentTSO;
;EF_(newCAF);
{void (*ghcFunPtr)(void *, void *);
ghcFunPtr = ((void (*)(void *, void *))(W_)&newCAF);
__DISCARD__();
ghcFunPtr((void *)(W_)BaseReg, (void *)R1.w);;}
R1.p[1] = (W_)Hp-8;
*R1.p = (W_)&stg_IND_STATIC_info;
Sp[-2] = (W_)&stg_bh_upd_frame_info;
Sp[-1] = (W_)Hp-8;
R1.w = (W_)&base_GHCziBase_zi_closure;
R2.w = (W_)&base_DataziList_unwords_closure;
R3.w = (W_)&sgd_closure;
Sp=Sp-2;
JMP_((W_)&stg_ap_pp_fast);
_cgC:
JMP_(stg_gc_enter_1);
_cgE:
HpAlloc = 0x10UL;
goto _cgC;
FE_
}
EI_(base_GHCziBase_zd_closure);
EI_(base_GHCziList_null_closure);
EI_(base_SystemziIO_putStrLn_closure);
EI_(base_GHCziBase_zdfMonadIO_closure);
EI_(Main_main_closure);
II_(rbu_closure);
static StgWord sgI_srt[] = {
(W_)&base_GHCziBase_zd_closure, (W_)&base_GHCziList_null_closure, (W_)&base_SystemziIO_putStrLn_closure, (W_)&base_GHCziBase_zdfMonadIO_closure, (W_)&Main_main_closure, (W_)&rbu_closure
};

EI_(base_SystemziIO_getLine_closure);
EI_(base_GHCziBase_zdfMonadIO_closure);
II_(sgI_closure);
StgWord Main_main_srt[] = {
(W_)&base_SystemziIO_getLine_closure, (W_)&base_GHCziBase_zdfMonadIO_closure, (W_)&sgI_closure
};

II_(sgI_info);
static StgWord sgI_closure[] = {
(W_)&sgI_info, 0x0
};

static StgWord sgJ_info[] = {
((W_)&sgI_srt+40), 0x1UL, 0x100000011UL
};

II_(rbu_closure);
IF_(sgJ_entry) {
FB_
if ((W_)(((W_)Sp - 0x10UL) < (W_)SpLim)) goto _ch2;
Sp[-2] = (W_)&stg_upd_frame_info;
Sp[-1] = R1.w;
R2.w = R1.p[2];
R1.w = (W_)&rbu_closure;
Sp=Sp-2;
JMP_((W_)&stg_ap_p_fast);
_ch2:
JMP_(stg_gc_enter_1);
FE_
}

static StgWord sgK_info[] = {
((W_)&sgI_srt+0), 0x1UL, 0x2500000011UL
};

EI_(base_GHCziBase_zd_closure);
EI_(base_SystemziIO_putStrLn_closure);
II_(sgJ_info);
IF_(sgK_entry) {
FB_
if ((W_)(((W_)Sp - 0x10UL) < (W_)SpLim)) goto _ch5;
Hp=Hp+3;
if ((W_)((W_)Hp > (W_)HpLim)) goto _ch7;
Sp[-2] = (W_)&stg_upd_frame_info;
Sp[-1] = R1.w;
Hp[-2] = (W_)&sgJ_info;
*Hp = R1.p[2];
R1.w = (W_)&base_GHCziBase_zd_closure;
R2.w = (W_)&base_SystemziIO_putStrLn_closure;
R3.p=Hp-2;
Sp=Sp-2;
JMP_((W_)&stg_ap_pp_fast);
_ch5:
JMP_(stg_gc_enter_1);
_ch7:
HpAlloc = 0x18UL;
goto _ch5;
FE_
}

static StgWord sgH_info[] = {
((W_)&sgI_srt+0), 0x1UL, 0x3d00000020UL
};

EI_(base_GHCziBase_zgzg_info);
EI_(base_GHCziBase_return_info);
EI_(ghczmprim_GHCziUnit_Z0T_closure);
EI_(base_GHCziBase_zdfMonadIO_closure);
EI_(Main_main_closure);
II_(sgK_info);
IF_(sgH_ret) {
W_ _cha;
FB_
_cha = R1.w & 0x7UL;
if ((W_)(_cha >= 0x2UL)) goto _chc;
Hp=Hp+3;
if ((W_)((W_)Hp > (W_)HpLim)) goto _chf;
Hp[-2] = (W_)&sgK_info;
*Hp = Sp[1];
Sp[1] = (W_)&Main_main_closure;
*Sp = (W_)Hp-16;
Sp[-1] = (W_)&stg_ap_pp_info;
R2.w = (W_)&base_GHCziBase_zdfMonadIO_closure;
Sp=Sp-1;
JMP_((W_)&base_GHCziBase_zgzg_info);
_chc:
Sp[1] = (W_)&ghczmprim_GHCziUnit_Z0T_closure+1;
*Sp = (W_)&stg_ap_p_info;
R2.w = (W_)&base_GHCziBase_zdfMonadIO_closure;
JMP_((W_)&base_GHCziBase_return_info);
_chg:
JMP_(stg_gc_enter_1);
_chf:
HpAlloc = 0x18UL;
goto _chg;
FE_
}

static StgWord sgI_info[] = {
((W_)&sgI_srt+0), 0x100000005UL, 0x0, 0x3f0000000fUL
};

EI_(base_GHCziList_null_closure);
II_(sgI_closure);
II_(sgH_info);
IF_(sgI_entry) {
FB_
if ((W_)(((W_)Sp - 0x18UL) < (W_)SpLim)) goto _chj;
Sp[-1] = R2.w;
R1.w = (W_)&base_GHCziList_null_closure;
Sp[-2] = (W_)&sgH_info;
Sp=Sp-2;
JMP_((W_)&stg_ap_p_fast);
_chj:
R1.w = (W_)&sgI_closure;
JMP_(stg_gc_fun);
FE_
}

EI_(Main_main_info);
StgWord Main_main_closure[] = {
(W_)&Main_main_info, 0x0, 0x0, 0x0
};

StgWord Main_main_info[] = {
((W_)&Main_main_srt+0), 0x0, 0x700000016UL
};

EI_(base_GHCziBase_zgzgze_info);
EI_(base_SystemziIO_getLine_closure);
EI_(base_GHCziBase_zdfMonadIO_closure);
II_(sgI_closure);
FN_(Main_main_entry) {
FB_
if ((W_)(((W_)Sp - 0x28UL) < (W_)SpLim)) goto _chq;
Hp=Hp+2;
if ((W_)((W_)Hp > (W_)HpLim)) goto _chs;
Hp[-1] = (W_)&stg_CAF_BLACKHOLE_info;
*Hp = (W_)CurrentTSO;
;EF_(newCAF);
{void (*ghcFunPtr)(void *, void *);
ghcFunPtr = ((void (*)(void *, void *))(W_)&newCAF);
__DISCARD__();
ghcFunPtr((void *)(W_)BaseReg, (void *)R1.w);;}
R1.p[1] = (W_)Hp-8;
*R1.p = (W_)&stg_IND_STATIC_info;
Sp[-2] = (W_)&stg_bh_upd_frame_info;
Sp[-1] = (W_)Hp-8;
Sp[-3] = (W_)&sgI_closure+1;
Sp[-4] = (W_)&base_SystemziIO_getLine_closure;
Sp[-5] = (W_)&stg_ap_pp_info;
R2.w = (W_)&base_GHCziBase_zdfMonadIO_closure;
Sp=Sp-5;
JMP_((W_)&base_GHCziBase_zgzgze_info);
_chq:
JMP_(stg_gc_enter_1);
_chs:
HpAlloc = 0x10UL;
goto _chq;
FE_
}
EI_(base_GHCziTopHandler_runMainIO_closure);
EI_(Main_main_closure);
StgWord ZCMain_main_srt[] = {
(W_)&base_GHCziTopHandler_runMainIO_closure, (W_)&Main_main_closure
};

EI_(ZCMain_main_info);
StgWord ZCMain_main_closure[] = {
(W_)&ZCMain_main_info, 0x0, 0x0, 0x0
};

StgWord ZCMain_main_info[] = {
((W_)&ZCMain_main_srt+0), 0x0, 0x300000016UL
};

EI_(base_GHCziTopHandler_runMainIO_closure);
EI_(Main_main_closure);
FN_(ZCMain_main_entry) {
FB_
if ((W_)(((W_)Sp - 0x10UL) < (W_)SpLim)) goto _chC;
Hp=Hp+2;
if ((W_)((W_)Hp > (W_)HpLim)) goto _chE;
Hp[-1] = (W_)&stg_CAF_BLACKHOLE_info;
*Hp = (W_)CurrentTSO;
;EF_(newCAF);
{void (*ghcFunPtr)(void *, void *);
ghcFunPtr = ((void (*)(void *, void *))(W_)&newCAF);
__DISCARD__();
ghcFunPtr((void *)(W_)BaseReg, (void *)R1.w);;}
R1.p[1] = (W_)Hp-8;
*R1.p = (W_)&stg_IND_STATIC_info;
Sp[-2] = (W_)&stg_bh_upd_frame_info;
Sp[-1] = (W_)Hp-8;
R1.w = (W_)&base_GHCziTopHandler_runMainIO_closure;
R2.w = (W_)&Main_main_closure;
Sp=Sp-2;
JMP_((W_)&stg_ap_p_fast);
_chC:
JMP_(stg_gc_enter_1);
_chE:
HpAlloc = 0x10UL;
goto _chC;
FE_
}
static StgWord _module_registered[] = {
0x0
};


EF_(__stginit_base_Prelude_);
EF_(__stginit_base_GHCziTopHandler_);
FN_(__stginit_Main_) {
FB_
if ((W_)(0x0 != (*((P_)(W_)&_module_registered)))) goto _chK;
goto _chM;
_chK:
Sp=Sp+1;
JMP_(Sp[-1]);
_chM:
*((P_)(W_)&_module_registered) = 0x1UL;
Sp=Sp-1;
*Sp = (W_)&__stginit_base_Prelude_;
Sp=Sp-1;
*Sp = (W_)&__stginit_base_GHCziTopHandler_;
goto _chK;
FE_
}


EF_(__stginit_Main_);
FN_(__stginit_Main) {
FB_
JMP_((W_)&__stginit_Main_);
FE_
}


FN_(__stginit_ZCMain) {
FB_
Sp=Sp+1;
JMP_(Sp[-1]);
FE_
}
