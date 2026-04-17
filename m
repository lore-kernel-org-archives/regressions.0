Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D67314A77
	for <regressions@lists.linux.dev>; Fri, 17 Apr 2026 18:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776452347; cv=none; b=mTH3mg9k/s//ll8Un+0qEu3vLK7bEzhqcTe7IajIVRh/oBcvfpOMgUuf7uNjrmdK2+jbEmDKiOx2P3aDL81jxZCyaKY1jsCUMgpEznshXA6NyPpWp+nWfFgNUfcWdWAA0yYVVtNbD14QAHIlG1DsP6G4BnsBhHA7SaaWQ1bN19s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776452347; c=relaxed/simple;
	bh=D1SfTDISnsGwBOun5e9MMADymKhUWrp5jOD2PAaiaEE=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=OjklyqZw7bUtbCgbMCMBDKeXpmieUKBcikAyuUQQfFB81NhQomv2mrZf1xVINHrDAlGma9IE1m+zvn4s0GkBnXh+CDNjO2Rg/VLzqFTB/eHDApe9Fl33Q8kp08DOP5bHb8FBkFhsz/p40R2eW+TqqGtcbqK8gRbpAJxJHboaEaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=i4ILX2Ke; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="i4ILX2Ke"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-12c42a23c8eso1163849c88.1
        for <regressions@lists.linux.dev>; Fri, 17 Apr 2026 11:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1776452345; x=1777057145; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n8miLtXzVFBTzLW1EdiHdkXb0B3uB4TPKzmPwVTIm68=;
        b=i4ILX2Ke5uLw5FNEbELVpnIa7uGiSgunnMIJASGGvr5qVpH8+Y/UN5njqmGmm2LKrH
         Yp9vxodYYVi0GVSu7HUQR5C/M5VMNQqxjJEbLx+GgcHdyyBEx/ax+iKPrwbmr21AmeBj
         Vlos2SU586pyUf93efD42A/ubqjUEcmycDtaY+dcwTebLJ6ZHKujOave4hRIDwoapZ+t
         hslGIMtCV/L3dta/gNsfy9eP2D95jMIXuC4oq333HVd+aDPEsXr1crM/bWXHKsv6hfzZ
         2nM1DDr/LlkgABe7DzNVCkKCVZKbBs5aSnKKYr89gLhgqzZ3y40Tp2qQWLKI6Vn07LNE
         FRwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776452345; x=1777057145;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n8miLtXzVFBTzLW1EdiHdkXb0B3uB4TPKzmPwVTIm68=;
        b=oSK5G9RNTmO3hTVpAuzcescM+g4EY3daC9lOIMj/1lHf7HEeYIdj+bzxozhG5IsNx0
         oRmgKGqEEvlb5Bp52R1zNkVqZedenCUCNAZ2DZWg79k4X6m++/106GaoVHGbf5lxE5hV
         9MdWWf76ZrLysHpyoARn1WlugmfgG/kmr/dlsIjh04FSzINmyR98pew549RKK3aDAwq8
         R80oFQZPhIkkwdatszsJJA7Aoi+YPWua9q3ifgbtAAECWPck/7Febalpa6up63lN8f0j
         Xcf+AQDmgIkj4bkNs4qDSdw0rTsFZrILT3Oe1n2vCMqqWgQGP4LXlOxY/Ck1/febHKJt
         Lwwg==
X-Gm-Message-State: AOJu0YyGDpxqegHIOte6SiL4/aCt6Q85UsbXIaBG3YHBR7KQyJLZKQ2Y
	Sem7U5mgkhgmAX+gjDDSpVAJ/dTUYT37tfUUOF1bN+BDmZz686+ZeFYL7USlLAwagxY=
X-Gm-Gg: AeBDievVf7vDQuoiF5Lx6OZ3ya0djiEgTcPXYswy8c+6RDAOYi2Y7oIjq8WXmqczKnr
	0jLRBqh58aEzxD3mo4BXCZDSUPGh2tCIK8NcN5ARd2+NlyLO0RawKJLzqnvq3LrV/+HMWd2m0IN
	IYP65+aP1VitBfR20FQNYmMklJwOh6UK2lWULpx8vnx1yx53V2u5RrRp8KI6PQblG05Ud7b57pi
	YALwmeewCK2Z4/2wLJPHdOijerO2qtq0s1Tncha/8vXmN+NFPIwiRYwWtoerC/QlzsGc1aH+CN3
	qlXGueFf5uBLkr33eD3LtZYRqosXDu5chGMaujfwE3GEZJdnzQPhPx8ZGbBFlWtPxQ4OsFBBGRQ
	uEPs7x6KCb8srVJtkBMJFzvZbQvB6C0h7UXcpTP1RLqUigzktRsj0/abUHCJNRC5Fzmnj6+Pziw
	R0iystmXEnaR603C3iaFMhN7/a8So=
X-Received: by 2002:a05:7022:2511:b0:123:330b:398 with SMTP id a92af1059eb24-12c73f94e7cmr1799406c88.19.1776452344595;
        Fri, 17 Apr 2026 11:59:04 -0700 (PDT)
Received: from 062ea10430ee ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53ab8b89csm3383495eec.12.2026.04.17.11.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 11:59:03 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] mainline/master: (build) use of undeclared identifier
 'PR_GET_SHADOW_STACK_STATUS' in testc...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, laura.nao@collabora.com,
 shreeya.patel@collabora.com, broonie@kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 17 Apr 2026 18:59:03 -0000
Message-ID: <177645234310.80.5327936895487953105@062ea10430ee>





Hello,

New build issue found on mainline/master:

---
 use of undeclared identifier 'PR_GET_SHADOW_STACK_STATUS' in testcases/gcs_frame (testcases/gcs_frame.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:6902516570be03133db78539f945f27d802fae38
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
- commit HEAD:  d730905bc3c0075275b2d109cd971735274b98c0


Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================
testcases/gcs_frame.c:27:14: error: use of undeclared identifier 'PR_GET_SHADOW_STACK_STATUS'
   27 |         ret = prctl(PR_GET_SHADOW_STACK_STATUS, &expected, 0, 0, 0);
      |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~
testcases/gcs_frame.c:53:26: error: use of undeclared identifier 'GCS_MAGIC'
   53 |         head = get_header(head, GCS_MAGIC, GET_BUF_RESV_SIZE(context),
      |                                 ^~~~~~~~~
testcases/gcs_frame.c:64:9: error: incomplete definition of type 'struct gcs_context'
   64 |         if (gcs->features_enabled != expected) {
      |             ~~~^
testcases/gcs_frame.c:22:9: note: forward declaration of 'struct gcs_context'
   22 |         struct gcs_context *gcs;
      |                ^
testcases/gcs_frame.c:66:7: error: incomplete definition of type 'struct gcs_context'
   66 |                         gcs->features_enabled, expected);
      |                         ~~~^
testcases/gcs_frame.c:22:9: note: forward declaration of 'struct gcs_context'
   22 |         struct gcs_context *gcs;
      |                ^
testcases/gcs_frame.c:70:9: error: incomplete definition of type 'struct gcs_context'
   70 |         if (gcs->gcspr != gcspr) {
      |             ~~~^
testcases/gcs_frame.c:22:9: note: forward declaration of 'struct gcs_context'
   22 |         struct gcs_context *gcs;
      |                ^
testcases/gcs_frame.c:72:7: error: incomplete definition of type 'struct gcs_context'
   72 |                         gcs->gcspr, gcspr);
      |                         ~~~^
testcases/gcs_frame.c:22:9: note: forward declaration of 'struct gcs_context'
   22 |         struct gcs_context *gcs;
      |                ^
6 errors generated.
test_signals.c:31:3: error: use of undeclared identifier 'PR_SET_SHADOW_STACK_STATUS'
test_signals.ctest_signals.c::3131::33::  error: error: use of undeclared identifier 'PR_SET_SHADOW_STACK_STATUS'use of undeclared identifier 'PR_SET_SHADOW_STACK_STATUS'

   31 |                 gcs_set_state(PR_SHADOW_STACK_ENABLE);
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   
31    | 31         |                 g        cgsc_ss./test_signals_utils.he_:ts34e_:ts_41st:at tanote: etexpanded from macro 'gcs_set_state'(e
P(RP_RS_HSAHDAODWO_W   S_34TS | AT        AC        KCr_KeE_gtest_signals.cNiEAsNBtALeEB:)L;rE31 :
)l3      ;o
:n|                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
gerror: |  use of undeclared identifier 'PR_SET_SHADOW_STACK_STATUS'                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~_

arg1./test_signals_utils.h ./test_signals_utils.h_::_3434a::s4141m::_  _note:  note: expanded from macro 'gcs_set_state'(expanded from macro 'gcs_set_state'"

x0   "31) |          =         g       cP3434sR |  | _        s_e        St                Err_Tsee_ggtSaiiHststteAeer(r PD lRO_loWnoS_gnHS gAT_ DA_aOaWCrr_KSgg_T1A1CS  K____TaAtest_signals.cs_mE_T:Ua_N S(;31" :sAx\3mB0_L"_E) ) (
":;=
      x 0       | error: "| )                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~use of undeclared identifier 'PR_SET_SHADOW_STACK_STATUS'                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

P=
 R _PSRE_TS_./test_signals_utils.hES:TH34_A:SD41HO:AW D_note: OSexpanded from macro 'gcs_set_state'WT
_ASCTK   _A31SCtest_signals.cTK | :A_           3431         | TSgU:        STcA3        s;T:_ r \UsSeerror: 
use of undeclared identifier 'PR_SET_SHADOW_STACK_STATUS'      e
;g | it\                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~_
s
s      tt| ear                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~t 
el(oPnRg_ S   _H31aA | rD        Og        W1g_ cS_sT__AsaCeKst_m_E_sN_tA aBt(L"eEx()0P;"R
)_       S| =H                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ A
 DPORW__SSETTA./test_signals_utils.h_C:SK34H_:AE41DN:OA WBnote: _Lexpanded from macro 'gcs_set_state'SE
T)A;C
K      _| S                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~T
ATU   S34;./test_signals_utils.h |  :        \34        
r      e| g                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~i
ster lon:g41 :_ anote: rexpanded from macro 'gcs_set_state'g
1test_signals.c __a:sm31_   _: 343( | :"         x        error: r0e"use of undeclared identifier 'PR_SET_SHADOW_STACK_STATUS'g)
i s=t e rP Rl_oSnEgT __SaHrAgD1O W___SaTsAmC_K__ S(T"AxT0U"S)    ;31=  |  \         
        P      gR| c_                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~sS
_EsTe_tS_HsAtDaOtWe_(SPTRA_CSKH_ASDTOAWT_USST;A C\K
_      E| N                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~A
BLE);
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./test_signals_utils.h:34:41: note: expanded from macro 'gcs_set_state'
   34 |                 register long _arg1 __asm__ ("x0") =  PR_SET_SHADOW_STACK_STATUS; \
      |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
test_signals.c:31:3: error: use of undeclared identifier 'PR_SET_SHADOW_STACK_STATUS'
   31 |                 gcs_set_state(PR_SHADOW_STACK_ENABLE);
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./test_signals_utils.h:34:41: note: expanded from macro 'gcs_set_state'
   34 |                 register long _arg1 __asm__ ("x0") =  PR_SET_SHADOW_STACK_STATUS; \
      |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
test_signals.c:31:3: error: use of undeclared identifier 'PR_SET_SHADOW_STACK_STATUS'
   31 |                 gcs_set_state(PR_SHADOW_STACK_ENABLE);
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./test_signals_utils.h:34:41: note: expanded from macro 'gcs_set_state'
   34 |                 register long _arg1 __asm__ ("x0") =  PR_SET_SHADOW_STACK_STATUS; \
      |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
test_signals.c:31:3: error: use of undeclared identifier 'PR_SET_SHADOW_STACK_STATUS'
   31 |                 gcs_set_state(PR_SHADOW_STACK_ENABLE);
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./test_signals_utils.h:34:41: note: expanded from macro 'gcs_set_state'
   34 |                 register long _arg1 __asm__ ("xtest_signals.c0:"31): 3=:   error: PRuse of undeclared identifier 'PR_SET_SHADOW_STACK_STATUS'_
SET_SHADOW_STACK_STATUS; \
         31|  |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~        
        gcs_set_state(PR_SHADOW_STACK_ENABLE);
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./test_signals_utils.h:34:41: note: expanded from macro 'gcs_set_state'
   34 |                 register long _arg1 __asm__ ("x0") =  PR_SET_SHADOW_STACK_STATUS; \
      |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
test_signals.c:31:3: error: use of undeclared identifier 'PR_SET_SHADOW_STACK_STATUS'
   31 |                 gcs_set_state(PR_SHADOW_STACK_ENABLE);
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./test_signals_utils.h:34:41: note: expanded from macro 'gcs_set_state'
   34test_signals.c |                 :re31g:i3s:t eerror: r use of undeclared identifier 'PR_SET_SHADOW_STACK_STATUS'l
ong _arg1 __asm__ ("x0") =     31P | R        _        SgEcTs__SsHeAtD_OsWt_aStTeA(CPKR__SSTHAATDUOSW;_ S\T
A      C| K                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~_
ENABLE);
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./test_signals_utils.h:34:41: note: expanded from macro 'gcs_set_state'
   34 |                 register long _arg1 __asm__ ("x0") =  PR_SET_SHADOW_STACK_STATUS; \
      |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
test_signals.c:31:3: error: use of undeclared identifier 'PR_SET_SHADOW_STACK_STATUS'
   31 |                 gcs_set_state(PR_SHADOW_STACK_ENABLE);
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./test_signals_utils.h:34:41: note: expanded from macro 'gcs_set_state'
   34 |                 register long _arg1 __asm__ ("x0") =  PR_SET_SHADOW_STACK_STATUS; \
      |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
test_signals.c:31:3: error: use of undeclared identifier 'PR_SET_SHADOW_STACK_STATUS'
   31 |                 gcs_set_state(PR_SHADOW_STACK_ENABLE);
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./test_signals_utils.h:34:41: note: expanded from macro 'gcs_set_state'
   34 |                 register long _arg1 __asm__ ("x0") =  PR_SET_SHADOW_STACK_STATUS; \
      |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
test_signals.c:31:3: error: use of undeclared identifier 'PR_SET_SHADOW_STACK_STATUS'
   31 |                 gcs_set_state(PR_SHADOW_STACK_ENABLE);
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./test_signals_utils.h:34:41: note: expanded from macro 'gcs_set_state'
   34 |                 register long _arg1 __asm__ ("x0") =  PR_SET_SHADOW_STACK_STATUS; \
      |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
test_signals.ctest_signals.c:31:17: error: use of undeclared identifier 'PR_SHADOW_STACK_ENABLE'
:31:17: error: use of undeclared identifier 'PR_SHADOW_STACK_ENABLE'
   31 |                 g   c31s | _        s        egtc_ss_tsaette_(sPtRatest_signals.ct_eS:(HPA31DR:O_17WS:_H SAerror: DTuse of undeclared identifier 'PR_SHADOW_STACK_ENABLE'OA
WC_KS_TEANCAKB_LEEN)A;B
L      E| )                              ^~~~~~~~~~~~~~~~~~~~~~;

         | 31                              ^~~~~~~~~~~~~~~~~~~~~~ | 
                gcs_set_state(PR_SHADOW_STACK_ENABLE);
      |                               ^~~~~~~~~~~~~~~~~~~~~~
test_signals.c:31:17: error: use of undeclared identifier 'PR_SHADOW_STACK_ENABLE'
   31 |                 gcs_set_state(PR_SHADOW_STACK_ENABLE);
      |                               ^~~~~~~~~~~~~~~~~~~~~~
test_signals.c:31:17: error: use of undeclared identifier 'PR_SHADOW_STACK_ENABLE'
   31 |                 gcs_set_state(PR_SHADOW_STACK_ENABLE);
      |                               ^~~~~~~~~~~~~~~~~~~~~~
test_signals.c:2 error31s: generated17.
: error: use of undeclared identifier 'PR_SHADOW_STACK_ENABLE'
   31 |                 gcs_set_state(PR_SHADOW_STACK_ENABLE);
      |                               ^~~~~~~~~~~~~~~~~~~~~~
2 errors generated.
test_signals.c:31:17: error: use of undeclared identifier 'PR_SHADOW_STACK_ENABLE'
   31 |                 gcs_set_state(PR_SHADOW_STACK_ENABLE);
      |                               ^~~~~~~~~~~~~~~~~~~~~~
test_signals.c:31:17: error: use of undeclared identifier 'PR_SHADOW_STACK_ENABLE'
   31 |                 gcs_set_state(PR_SHADOW_STACK_ENABLE);
      |                               ^~~~~~~~~~~~~~~~~~~~~~
2 errors generated.
2 errors generated.
test_signals.c:31:17: error: use of undeclared identifier 'PR_SHADOW_STACK_ENABLE'
test_signals.c:31:17   :31  | error:                 use of undeclared identifier 'PR_SHADOW_STACK_ENABLE'g
cs_set_state(PR_SHADOW_STACK_EN   A31B | L        E        )g;
c      s| _                              ^~~~~~~~~~~~~~~~~~~~~~s
et_state(PR_SHADOW_STACK_ENABLE);
      |                               ^~~~~~~~~~~~~~~~~~~~~~
2 errors generated.
2 errors generated.
test_signals.c:31:17: error: use of undeclared identifier 'PR_SHADOW_STACK_ENABLE'
2 errors generated.
   31 |                 gcs_set_state(PR_SHADOW_STACK_ENABLE);
      |                               ^~~~~~~~~~~~~~~~~~~~~~
2 errors generated.
2 errors generated.
2 errors generated.
2 errors generated.
test_signals.c:31:17: error: use of undeclared identifier 'PR_SHADOW_STACK_ENABLE'
   31 |                 gcs_set_state(PR_SHADOW_STACK_ENABLE);
      |                               ^~~~~~~~~~~~~~~~~~~~~~
test_signals.c:31:17: error: use of undeclared identifier 'PR_SHADOW_STACK_ENABLE'
   31 |                 gcs_set_state(PR_SHADOW_STACK_ENABLE);
      |                               ^~~~~~~~~~~~~~~~~~~~~~
test_signals.c:31:17: error: test_signals.cuse of undeclared identifier 'PR_SHADOW_STACK_ENABLE'2
: errors31 generated:.
17: error: use of undeclared identifier 'PR_SHADOW_STACK_ENABLE'
   31 |            31         | g        c        sg_csse_ts_estt_asttea(tPeR(_PSRH_ASDHOAWD_OSWT_ASCTKA_CEKN_AEBNLAEB)L;E
)      ;| 
                              ^~~~~~~~~~~~~~~~~~~~~~      
|                               ^~~~~~~~~~~~~~~~~~~~~~
2 errors generated.
2 errors generated.
2 errors generated.
test_signals.c:31:17: error: use of undeclared identifier 'PR_SHADOW_STACK_ENABLE'
   31 |                 gcs_set_state(PR_SHADOW_STACK_ENABLE);
      |                               ^~~~~~~~~~~~~~~~~~~~~~
2 errors generated.
testcases/testcases.c:201:8: error: use of undeclared identifier 'GCS_MAGIC'
  201 |                 case GCS_MAGIC:
      |                      ^~~~~~~~~
testcases/testcases.ctestcases/testcases.c:204:22: error: invalid application of 'sizeof' to an incomplete type 'struct gcs_context'
  204 |                         if (head->size != sizeof(struct gcs_context))
      |                                           ^     ~~~~~~~~~~~~~~~~~~~~
testcases/testcases.c:204:36: note: forward declaration of 'struct gcs_context'
  204 |                         if (head->size != sizeof(struct gcs_context))
      |                                                         ^
:201:8: error: use of undeclared identifier 'GCS_MAGIC'
  201 |                 case GCS_MAGIC:
      |                      ^~~~~~~~~
testcases/testcases.c:204:22: error: invalid application of 'sizeof' to an incomplete type 'struct gcs_context'
  204 |                         if (head->size != sizeof(struct gcs_context))
      |                                           ^     ~~~~~~~~~~~~~~~~~~~~
testcases/testcases.c:204:36: note: forward declaration of 'struct gcs_context'
  204 |                         if (head->size != sizeof(struct gcs_context))
      |                                                         ^
testcases/testcases.c:201:8: error: use of undeclared identifier 'GCS_MAGIC'
  201 |                 case GCS_MAGIC:
      |                      ^~~~~~~~~
testcases/testcases.c:204:22: error: invalid application of 'sizeof' to an incomplete type 'struct gcs_context'
  204 |                         if (head->size != sizeof(struct gcs_context)testcases/testcases.c:201:8: error: use of undeclared identifier 'GCS_MAGIC'
  201 |                 case GCS_MAGIC:
      |                      ^~~~~~~~~
)
testcases/testcases.c:204:22: error: invalid application of 'sizeof' to an incomplete type 'struct gcs_context'
  204 |                         if (head->size != sizeof(struct gcs_testcases/testcases.cco:nt201ext))
      |                                           ^     ~~~~~~~~~~~~~~~~~~~~
testcases/testcases.c:204:36: note: forward declaration of 'struct gcs_context'
  204 |                         if (head->size != sizeof(struct gcs_context))
      |                                                         ^
      |                                           ^     ~~~~~~~~~~~~~~~~~~~~
testcases/testcases.c:204:testcases/testcases.c36: :note: 201forward declaration of 'struct gcs_context':
8: error: use of undeclared identifier 'GCS_MAGIC'
  204 |                         if (head->size != sizeof(st  r201u | c        t         cgacsse_ cGCoSn_MtAeGIxCt:
)      )| 
:                           ^~~~~~~~~| 
8                                                        ^:
 error: use of undeclared identifier 'GCS_MAGIC'
testcases/testcases.c:201:8: error: use of undeclared identifier 'GCS_MAGIC'
  201 |                 case   G201C | S        _        McAaGsIeC :G
C      S|                      ^~~~~~~~~_
MAGIC:
      |                      ^~~~~~~~~
testcases/testcases.c:204:22: error: invalid application of 'sizeof' to an incomplete type 'struct gcs_context'
  204 |                         if (head->size != sizeof(structtestcases/testcases.c :g204c:s22_:c oerror: ninvalid application of 'sizeof' to an incomplete type 'struct gcs_context't
ext))
      |                                           ^     ~~~~~~~~~~~~~~~~~~~~
  204 |                         iftestcases/testcases.c :(204h:e36a:d -note: >forward declaration of 'struct gcs_context's
ize !=   s204i | z        e                if (head->size !o=f (ssitzreuocft( testcases/testcases.csgtc:rs201u_:ctestcases/testcases.ctc: 8og:204 ncerror: ts:use of undeclared identifier 'GCS_MAGIC'e_
c22ox:nt )terror: )e
invalid application of 'sizeof' to an incomplete type 'struct gcs_context'      x
| t                                          ^     ~~~~~~~~~~~~~~~~~~~~)
)
      |                                                         ^
testcases/testcases.c:204:36  :  204 201 | note:  |         forward declaration of 'struct gcs_context'                
                ciafse    G(C204hS | e_        aM        dA        -Gi>IfC s:(
i      h| ze                     ^~~~~~~~~e
a d!-= >ssiizzeeo f!(=s tsriuzceto fg(csst_rcuocntt egxcts)_)c
o      n| t                                          ^     ~~~~~~~~~~~~~~~~~~~~e
xt))
      |                                                         ^
testcases/testcases.c:204:36: note: forward declaration of 'struct gcs_context'
  204 |                         if (head->size != sizeof(sttestcases/testcases.cr:u204c:t22:  gerror: testcases/testcases.cc:invalid application of 'sizeof' to an incomplete type 'struct gcs_context's
201_:c8o:n terror:   euse of undeclared identifier 'GCS_MAGIC'204x | 
t        )        )        
i      f|                                                          ^(
head->  s201i | z        e         c!a=s es iGzCeSo_fM(AsGtIrCu:c
t       | g                     ^~~~~~~~~c
s_context))
      |                                           ^     ~~~~~~~~~~~~~~~~~~~~
testcases/testcases.c:204:36: note: forward declaration of 'struct gcs_context'
  204 |                         if (head->size != sizeof(struct gcs_context))
      |                                                         ^
testcases/testcases.c:204:22: error: invalid application of 'sizeof' to an incomplete type 'struct gcs_context'
  204 |                         if (head->size != sizeof(sttestcases/testcases.cru:c201t: 8g:c error: suse of undeclared identifier 'GCS_MAGIC'_
context))
      |                                           ^     ~~~~~~~~~~~~~~~~~~~~
testcases/testcases.c:204:36: note: forward declaration of 'struct gcs_context'
  201 |                 cas  e204  | G        C        S        _iMfA G(IhCe:a
      d| -                     ^~~~~~~~~>
size != sizeof(struct gcs_context))
      |                                                         ^
testcases/testcases.c:204:22: error: invalid application of 'sizeof' to an incomplete type 'struct gcs_context'
  204 |                         if (head->size != sizeof(struct gcs_context))
      |                                           ^     ~~~~~~~~~~~~~~~~~~~~
testcases/testcases.c:204:36: note: forward declaration of 'struct gcs_context'
  204 |                         if (head->size != sizeof(struct gcs_context))
      |                                                         ^
testcases/testcases.c:201:8: error: use of undeclared identifier 'GCS_MAGIC'
  201 |                 case GCS_MAGIC:
      |                      ^~~~~~~~~
testcases/testcases.c:201:8: error: use of undeclared identifier 'GCS_MAGIC'
  201 |                 case GCS_MAGIC:
      |                      ^~~~~~~~~
testcases/testcases.c:204:22: error: invalid application of 'sizeof' to an incomplete type 'struct gcs_context'
  204 |                         if (head->size !=testcases/testcases.c si:z201e:o8f:( serror: tuse of undeclared identifier 'GCS_MAGIC'r
uct gcs_context))
      |                                           ^     ~~~~~~~~~~~~~~~~~~~~
  201 |                 castestcases/testcases.ce :G204CS:_36M:A Gnote: Iforward declaration of 'struct gcs_context'C
:
      |                      ^~~~~~~~~
  204 |                         if (testcases/testcases.ch:e204a:d22-:> serror: iinvalid application of 'sizeof' to an incomplete type 'struct gcs_context'z
e != sizeof  (204s | t        r        u        citf  gc(sh_ecaodn-t>esxitz)e) 
!      =|                                                          ^s
izeof(struct gcs_cotestcases/testcases.cn:t201e:x8t:) )error: 
use of undeclared identifier 'GCS_MAGIC'      
|                                           ^     ~~~~~~~~~~~~~~~~~~~~
testcases/testcases.c:204:36: note: forward declaration of 'struct gcs_context'
  201 |                 ca  s204e |  G        C        S_        Mitestcases/testcases.cAfG :(204I:Ch22:e:
a      d| - >                     ^~~~~~~~~error: 
sinvalid application of 'sizeof' to an incomplete type 'struct gcs_context'i
ze != size  o204f | (        s        t        riufc t( hgecasd_-c>osnitzeex t!))
      |                                                         ^
= sizeof(struct gcs_context))
      |                                           ^     ~~~~~~~~~~~~~~~~~~~~
testcases/testcases.c:204:36: note: forward declaration of 'struct gcs_context'
  204 |                         if (head->size != stestcases/testcases.ci:z204e:o22f:( serror: tinvalid application of 'sizeof' to an incomplete type 'struct gcs_context'r
uct gcs_  c204o | n                t        iefx (the)a)d-
>s      iz| e                                                         ^!=
 sizeof(struct gcs_context))
      |                                           ^     ~~~~~~~~~~~~~~~~~~~~
testcases/testcases.c:204:36: note: forward declaration of 'struct gcs_context'
  204 |                         if (head->size != sizeof(struct gcs_context))
      |                                                         ^
testcases/testcases.c:201:8: error: use of undeclared identifier 'GCS_MAGIC'
  201 |                 case GCS_MAGIC:
      |                      ^~~~~~~~~
testcases/testcases.c:204:22: error: invalid application of 'sizeof' to an incomplete type 'struct gcs_context'
  204 |                         if (head->size != sizeof(struct gcs_context))
      |                                           ^     ~~~~~~~~~~~~~~~~~~~~
testcases/testcases.c:204:36: note: forward declaration of 'struct gcs_context'
  204 |                         if (head->size != sizeof(struct gcs_context))
      |                                                         ^
testcases/testcases.c:201:8: error: use of undeclared identifier 'GCS_MAGIC'
  201 |                 case GCS_MAGIC:
      |                      ^~~~~~~~~
testcases/testcases.c:204:22: error: invalid application of 'sizeof' to an incomplete type 'struct gcs_context'
  204 |                         if (head->size != sizeof(struct gcs_context))
      |                                           ^     ~~~~~~~~~~~~~~~~~~~~
testcases/testcases.c:204:36: note: forward declaration of 'struct gcs_context'
  204 |                         if (head->size != sizeof(struct gcs_context))
      |                                                         ^
2 errors generated.
2 errors generated.
2 errors generated.
2 errors generated.
2 errors generated.
2 errors generated.
2 errors generated.
2 errors generated.
2 errors generated.
2 errors generated.
2 errors generated.
2 errors generated.
2 errors generated.
2 errors generated.
2 errors generated.
2 errors generated.

=====================================================


# Builds where the incident occurred:

## defconfig on (arm64):
- compiler: clang-21
- config: None
- dashboard: https://d.kernelci.org/build/maestro:69e267c19b5a968309e5e936


#kernelci issue maestro:6902516570be03133db78539f945f27d802fae38

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
