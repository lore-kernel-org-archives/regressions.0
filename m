Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C3E39E6F5
	for <regressions@lists.linux.dev>; Mon,  6 Apr 2026 23:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775519951; cv=none; b=aRSsrdQ0grPia3x3SsxLLzRQMhNKE3dwR2tAEoZMw+soSge0EQdbPCgEKfyjHD+nHVjom6QSQDLBLoIISoU0bJi5LfyH6q7oLTB5dWdHmMyVnoDIct33afYU9LWIAzoMxpZbIlSZNA/U1nf39H625ToREERqplbvAvqc9LTAKz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775519951; c=relaxed/simple;
	bh=MpWOMz03F9ZDGTh9ZO+Rh+oggFfdTPv35+0swSdh3Ic=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=T5fUraF0lxCfg7ILU6QYbp/vdImFSAE6IV5nk1NU/3+prUr2L9om7lVoUtsJw92B9iFBu8M3TF5tGJIBMbZlXhCLD0dFwdT0CUrdVMYCFBvPvueFed6muGQ/MgK3EnKRaegg5a05aGg8BFv85KHFqtZW+Xelfl7MCtshzo2jbuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20251104.gappssmtp.com header.i=@kernelci-org.20251104.gappssmtp.com header.b=Q9yF8mbk; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20251104.gappssmtp.com header.i=@kernelci-org.20251104.gappssmtp.com header.b="Q9yF8mbk"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12c0433a4b9so1111053c88.1
        for <regressions@lists.linux.dev>; Mon, 06 Apr 2026 16:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20251104.gappssmtp.com; s=20251104; t=1775519946; x=1776124746; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eA2dJCI1o/j3Hc6hKS2FI2qLpu0uQwvED88BvORO00s=;
        b=Q9yF8mbkTdHC2ALY4jD4c8R4u8j+my6C+pGJb5BqLR1PnpbEk2+6GMuj6vGG4VNsUk
         KfQaNa50ERUoErVhyMelZ6zpINqlxTCn1YRBF7aunfp3Ez7VRSTtwqzGnMsQrOe70lt5
         TP66Nh10vg91B3k65CZqCYrWs062EnOR/n+RuagSdzEXq7YKBcmGFb3bqDbezF4C3Ba1
         wK8vppkUqlcbT5m1VLd5ain2NAu01wuUHOy8/jfWFdB/gATiN0HLr5lXvlHxApfJJQ0C
         gSJQM8mvXH+xZSzsm2sX8yzf+2m+yLi9u9hTzZtKYB6mes3X2ORuqWs7g+jXE1q6Ev8u
         3gcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775519946; x=1776124746;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eA2dJCI1o/j3Hc6hKS2FI2qLpu0uQwvED88BvORO00s=;
        b=X8grAVhVFCjgA8+vIlt1zIxJOp+Qzab0bHL9085Yn4Lx7RgeZOyLplEe/RVm/ywQvI
         bVXxN3nNbNoaStHQeodu0lvrssDS7FEWxqJiOzIx0oGbWzMKuVYF53dWezr7hLUB9I6b
         E5DTvaIryxBJdLyPUQe9DxWLaDkLEly3LD8ghTRi88UpPudFN5RFhq+QxtTVs5HNmGYe
         DyTEW/nIOVa91s9Oqle5nToljipMYOd1SiQKDQPgyRueWi+e9ozVRrWvCQXrGPA4N3hs
         dFrNFhQsmbRoXdk6Rs5nLsjcOx4gYvnRs49RVH00PfY/BRm7YUMyJHJhOEIo1bZxscqg
         dN0w==
X-Gm-Message-State: AOJu0Yy8AC58ueGnWC3FScLG5SqdKpxusB1LmvMP1yAGActbWYLY3YMr
	KpN4rQY7Gxmy9oHvi1njfDTOihO/3rxc+xx/7I8NHMtVqmMtu1pY6GS1Iy0F/quL95M=
X-Gm-Gg: AeBDieupOPx1HKc0GLx59tl2lFRABjc29Ej4I8UcWy/8etj+uHyYr+2VUjnEs+LWEZ0
	NJ9Yz1X++e+ggQypIEH8U4tF1yv9XMXAV8uduOugNE6UXdN1oaorksfjX9OAIVAQe+oCS27AyGv
	e16Sp8YCmJiYArhhUyo7l/WR1DS2B1tiSpqmENGd8TTYHAzT0A/pHHMMs7ycZIkihV84+7Vp0c7
	lI4T10cKZIAML1E3Umj6zR5Z0rVKfHaTsRaGzkOxIOm3/EwpcfngbecwhzJzf87O6q433N5SD31
	v0X+wefCEPTgJR6/q1pYr69RqNGqXSdCZWsylAXX/J786Zb+HbHZ/bDwKA63/YGtqyRnaKmtrMN
	5qnLAA70/mtXhnIBhN/yunPD4ShGZZomxjVWW0SPRaeonC5doKbDDLVsI3zdvjyKeg4alAQIpVI
	Xpvdvy2+OC77aSBSGOAfkt7x05lCI=
X-Received: by 2002:a05:7022:112:b0:12a:7165:7408 with SMTP id a92af1059eb24-12bfb745b48mr7395946c88.18.1775519945095;
        Mon, 06 Apr 2026 16:59:05 -0700 (PDT)
Received: from 8692ffc4d55e ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c0ce7dfe8sm5197691c88.3.2026.04.06.16.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 16:59:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [REGRESSION] next/master: (build)
 ./test_signals_utils.h./test_signals_utils.h::::: 15: 15./test_sig...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Mon, 06 Apr 2026 23:59:04 -0000
Message-ID: <177551994363.2129.8386946937503506328@8692ffc4d55e>





Hello,

New build issue found on next/master:

---
 ./test_signals_utils.h./test_signals_utils.h::::: 15: 15./test_signals.h14=
:1514fatal error: :fatal error: :'asm/hwcap.h' file not found10: :  fatal e=
rror: 101515fatal error: fatal error: 'asm/hwcap.h' file not found:'asm/hwc=
ap.h' file not found :: 1010fatal error: ::'asm/hwcap.h' file not found  fa=
tal error:  fatal error: 'asm/hwcap.h' file not found'asm/hwcap.h' file not=
 found ./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found ./=
test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found ./test_sign=
als.h:15:10: fatal error: 'asm/hwcap.h' file not found ./test_signals.h:15:=
10: fatal error: 'asm/hwcap.h' file not found ./test_signals.h:15:10: fatal=
 error: 'asm/hwcap.h' file not found ./test_signals.h:15:10: fatal error: '=
asm/hwcap.h' file not found ./test_signals.h:15:10: fatal error: 'asm/hwcap=
.h' file not found ./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file =
not found ./test_signals.h:15:10: test_signals_utils.cfatal error: :'asm/hw=
cap.h' file not found ./test_signals.h:15:10: fatal error: 'asm/hwcap.h' fi=
le not found ./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not fo=
und ./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found ./tes=
t_signals.h./test_signals.h::1515::1010: fatal error: 'asm/hwcap.h' file no=
t found ./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found .=
/test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found /usr/inclu=
de/x86_64-linux-gnu/asm/sigcontext.h:40:8: error: redefinition of '_fpx_sw_=
bytes' s/usr/include/x86_64-linux-gnu/asm/sigcontext.htr:u40c:t8 :_ ferror:=
 pIn file included from In file included from xredefinition of '_fpx_sw_byt=
es'testcases/testcases.c_testcases/testcases.c /usr/include/x86_64-linux-gn=
u/asm/sigcontext.h/usr/include/x86_64-linux-gnu/asm/sigcontext.hIn file inc=
luded from ::testcases/testcases.c4040:::88::  7error: error: : /usr/includ=
e/x86_64-linux-gnu/asm/sigcontext.hIn file included from :40testcases/testc=
ases.cIn file included from :testcases/testcases.c:8:: error: redefinition =
of '_fpx_sw_bytes'77 40 | st   40    | str::    _r31uu 840:f  | error: scce=
rror:  | redefinition of '_fpx_sw_bytes'ttrtu credefinition of '_fpx_sw_byt=
es'ts error: redefinition of '_fpreg'    c/usr/include/x86_64-linux-gnu/asm=
/sigcontext.ht: 85:_8f: pIn file included from error: rtestcases/testcases.=
credefinition of '_fpreg'e: s:In file included from 8ttestcases/testcases.h=
:r :uerror: 15c: g sIn file included from  error: ttestcases/testcases.h{rr=
edefinition of '_fpreg':u15 :f |  pserror: trredefinition of '_fpreg'/usr/i=
nclude/x86_64-linux-gnu/bits/sigcontext.he:r /usr/include/x86_64-linux-gnu/=
bits/sigcontext.htestcases/testcases.c_ :    :error: :40f{7p40redefinition =
of '_fpxreg'7 redefinition of '_fpreg'      previous definition is here p_e=
rror: xredefinition of '_fpreg' error: In file included from   : error: 407=
 | 40      s   redefinition of '_fpxreg'| : 8      :| pcx      | |         =
^       ^tr        ^error:  error: :         | x       ^t 46:r8 :: /usr/inc=
lude/x86_64-linux-gnu/bits/sigcontext.h91 | e   _gerror:  8 | :    redefini=
tion of '_xmmreg'error:  /usr/include/x86_64-linux-gnu/asm/sigcontext.h:98:=
8: error: redefinition of '_xmmreg' merror:        ^e       {r /usr/include=
/x86_64-linux-gnu/asm/sigcontext.h:180:8: error: redefinition of '_ymmh_sta=
te' ::180/usr/include/x86_64-linux-gnu/asm/sigcontext.h :error: 8:redefinit=
ion of '_xstate':180 : 8error: :redefinition of '_ymmh_state'  error:   red=
efinition of '_ymmh_state'192 8   :error: 189   redefinition of '_ymmh_stat=
e'184note:  |  ::/usr/include/x86_64-linux-gnu/asm/sigcontext.h180184:::818=
0In file included from 8::testcases/testcases.c: 8In file included from : e=
rror: :note: testcases/testcases.c7:redefinition of '_ymmh_state' previous =
definition is here: error: In file included from  cct  terror:  /usr/includ=
e/x86_64-linux-gnu/asm/sigcontext.herror: t:_ yredefinition of '_ymmh_state=
'mredefinition of '_xstate' 8  :yhh  180  | ms_m_192error:  | tshsredefinit=
ion of '_xstate't herror: previous definition is hereredefinition of '_xsta=
te'_ :In file included from ttestcases/testcases.h:error: 7189: :s:x  8189t=
8s:t:a  | error: rredefinition of '_xstate' tseu error: tredefinition of '_=
xstate'  /usr/include/x86_64-linux-gnu/asm/sigcontext.h:317:8: error: redef=
inition of 'sigcontext' ru/usr/include/x86_64-linux-gnu/asm/sigcontext.hc:t=
317 :s8i:g cerror: oredefinition of 'sigcontext'n /usr/include/x86_64-linux=
-gnu/asm/sigcontext.h:317:8: error: redefinition of 'sigcontext' /usr/inclu=
de/x86_64-linux-gnu/asm/sigcontext.h:317  :1398 | :s terror: rredefinition =
of 'sigcontext'u t:e/usr/include/x86_64-linux-gnu/asm/sigcontext.h :xerror:=
 317t:redefinition of 'sigcontext'8  testcases/testcases.h:101:25: error: i=
nvalid application of 'sizeof' to an incomplete type 'struct _aarch64_ctx' =
atestcases/testcases.htestcases/testcases.hd:: 101101|::|2525 ::r  eerror: =
error: sinvalid application of 'sizeof' to an incomplete type 'struct _aarc=
h64_ctx'invalid application of 'sizeof' to an incomplete type 'struct _aarc=
h64_ctx'v eecttestcases/testcases.httestcases/testcases.ht_:hx:_101e 101h::=
a*25de25h::  eerror: raederror: einvalid application of 'sizeof' to an inco=
mplete type 'struct _aarch64_ctx'invalid application of 'sizeof' to an inco=
mplete type 'struct _aarch64_ctx' add   :testcases/testcases.h101,:r101|:|u=
:i net25 :25 uerror: s3vr:eisinvalid application of 'sizeof' to an incomple=
te type 'struct _aarch64_ctx'2 _ snzv __serror: ztinvalid application of 's=
izeof' to an incomplete type 'struct _aarch64_ctx'3<2t_ t   101 :error:   d=
testcases/testcases.hinvalid application of 'sizeof' to an incomplete type =
'struct _aarch64_ctx':note:  xw h4i104   | __al**        caweg eg(teorhcth_=
xtfif6hs  _le4a*<hed_ h=3D(eecoe ara(tdfedrsxr f*,et(ssh eusitestcases/test=
cases.hvr ta<n=3D: _udrt104r3esc,ut: 2szv  -c27t___tsu iH:  aerror:  invali=
d application of 'sizeof' to an incomplete type 'struct _aarch64_ctx'm &ter=
ror: &incomplete definition of type 'struct _aarch64_ctx'i : h | r         =
105/usr/include/x86_64-linux-gnu/asm/sigcontext.h1056e4s_ ::: 4013sic13 :::=
8vtz_   h:exeserror: error:  a)ozfincomplete definition of type 'struct _aa=
rch64_ctx'incomplete definition of type 'struct _aarch64_ctx' error: d :m:_=
95eu a8a | rcerror: g:iincomplete definition of type 'struct _aarch64_ctx'c=
as(t s rt error: u      redefinition of '_fpreg'c|  _ | a        4i85_ | cs=
truca105r:ca ctt13hr   ixn l:6testcases/testcases.h4c:_h 6   head _ifn 105c=
4-_*cpte: 37error: :t >error: mgaxr s*incomplete definition of type 'struct=
 _aarch64_ctx'hx herror: :105mincomplete definition of type 'struct _aarch6=
4_ctx' | a 9195      i| c   i!13::8               ~~~~^:  uerror: ni=3Dn:22=
 im3error: 2:incomplete definition of type 'struct _aarch64_ctx'95 dne a   =
g-s_ a13te95ncltg:/usr/include/x86_64-linux-gnu/bits/sigcontext.h_a:i c: h_=
d22error:  46e:a-:>incomplete definition of type 'struct _aarch64_ctx'!a8a =
mnote: a t/usr/include/x86_64-linux-gnu/asm/sigcontext.h 3m2a__tt smt: adga=
i ta_a98t:i-cac_ag8i:> m error: r,redefinition of '_xmmreg'a _testcases/tes=
tcases.hh105extestcases/testcases.he:a:e:arm(am95a:r10637:d:,s dr22ecg15  t=
u,:h :{error: riu c6u4note:   incomplete definition of type 'struct _aarch6=
4_ctx'nti _forward declaration of 'struct _aarch64_ctx'error:        itnrit=
ngdriutestcases/testcases.h3l2-ucctestcases/testcases.h::_106it>cst  t_105:=
 niez! =3Dx :15m:a gerror: iincomplete definition of type 'struct _aarch64_=
ctx'c raarg:ie106      g | u        c herror: c|  t37crh>g | :iu6   s95si c=
c4t |  t_zaerror: )_scataerincomplete definition of type 'struct _aarch64_c=
tx'c t{t a hientl_iheader(sttc180 t_g e_nratestcases/testcases.h::8aiaedua1=
05r::cahc esc t37rru6c 4r&(error: t:c ht_&cstredefinition of '_ymmh_state'x=
  error: 6incomplete definition of type 'struct _aarch64_ctx'  :4      95:s=
i10:_15| :                     ^: tcerror: :incomplete definition of type '=
struct _aarch64_ctx'c  error:       note: xforward declaration of 'struct _=
aarch64_ctx'incomplete definition of type 'struct _aarch64_ctx'eincomplete =
definition of type 'struct _aarch64_ctx'|   arSe/usr/include/x86_64-linux-g=
nu/asm/sigcontext.hdu-aV>:cstestcases/testcases.hdi_:192t-107:zN:>810eREsX =
T::_ ;aerror: Eiredefinition of '_xstate'_  error: aSzV scxtestcases/testca=
ses.httestcases/testcases.hat:x    :t85i c*85106 | :* )i:        4315g(ent:=
( :s( _lnote: tcerror: hiincomplete definition of type 'struct _aarch64_ctx=
'expanded from macro 'GET_RESV_NEXT_HEAD'hrenu 107a:tntil:ir10_cnh  icn:eee=
rror: hredefinition of 'sigcontext'l T      sc,10t:_| Rtt x_u i       ^erro=
r: Eincomplete definition of type 'struct _aarch64_ctx'Sr hn * )((h(ec   ha=
a85dr | -         >*(m)sa(tghri)ucc  t+=3D  =3D(_ ham)aartestcases/testcase=
s.hc-g:h>109i6stestcases/testcases.h:4c10_i:): c tzx109{e:error: 10 : *    =
   )incomplete definition of type 'struct _aarch64_ctx')error:  a(derror: -=
aincomplete definition of type 'struct _aarch64_ctx'h>   d _xara aaur*crtc)=
c h(h_66a4(a4r__ccccthhxt6ax 4r*  _**hc)htex(etestcases/testcases.haa h:dd*=
),109,:h10 e  :u+ aui nIn file included from terror: di(testcases/testcases=
.c3incomplete definition of type 'struct _aarch64_ctx',n -merror:  acg     =
 >invalid application of 'sizeof' to an incomplete type 'struct _aarch64_ct=
x'm,aig| imc 95r | testcases/testcases.hestestcases/testcases.h:s109t:v:95a=
10:t_:s 22zerror: i:  incomplete definition of type 'struct _aarch64_ctx'no=
te: c htoe fa_(dastestcases/testcases.h   e95atr:r | (rsct129suhr:tca6tu7t4=
 c:ti c__c error:  aitn_xaincomplete definition of type 'struct _aarch64_ct=
x'aarlr c :error: rincomplete definition of type 'struct _aarch64_ctx': (no=
te:  c_error: ah ceha6d4,_ cutixn   t 95*3 | htestcases/testcases.h2es_:at1=
30dt:a7, : tm uiierror: anincomplete definition of type 'struct _aarch64_ct=
x'gcit :e:t 129  testcases/testcases.h=3Derror: ::130_7 invalid application=
 of 'sizeof' to an incomplete type 'struct _aarch64_ctx':0 7 r      error: =
c:testcases/testcases.h :|   incomplete definition of type 'struct _aarch64=
_ctx'herror: 1306:                ~~~~^104 7 | _testcases/testcases.h:     =
   c :werror:   incomplete definition of type 'struct _aarch64_ctx't95hx  1=
30 ct testcases/testcases.h_:130:7: error: incomplete definition of type 's=
truct _aarch64_ctx' c inline st   r95u | cstt a_taiacr cihn6lci4h_n6ec 4stt=
_rxtestcases/testcases.hu:cc t*x129gt e*: 7t:g __eerror: ahtincomplete defi=
nition of type 'struct _aarch64_ctx'a r4c_hc6t4x_ c*tgxtestcases/testcases.=
he :t*_106hge:e15at:d_ eherror: reincomplete definition of type 'struct _aa=
rch64_ctx'(a testcases/testcases.h   :95130 | :s7t:a terror: iincomplete de=
finition of type 'struct _aarch64_ctx'c gtestcases/testcases.he:testcases/t=
estcases.ht105:_:95h13e::a22 d:error: e incomplete definition of type 'stru=
ct _aarch64_ctx'rnote:  truct _atestcases/testcases.ha:r107c:h106:4 _error:=
 ctincomplete definition of type 'struct _aarch64_ctx'x 4_ctx *get_header(s=
truct _aarch64_ctx *head, uinttestcases/testcases.h3:1092:_10:t  error: inc=
omplete definition of type 'struct _aarch64_ctx'm testcases/testcases.h:106=
   :9515 | s:t aterror: iincomplete definition of type 'struct _aarch64_ctx=
'c  testcases/testcases.h:107:10: error: incomplete definition of type 'str=
uct _aarch64_ctx' testcases/testcases.h:130:7: error: incomplete definition=
 of type 'struct _aarch64_ctx' eoerror: rnincomplete definition of type 'st=
ruct _aarch64_ctx'rt testcases/testcases.h:130:7: error: incomplete definit=
ion of type 'struct _aarch64_ctx' testcases/testcases.c:18:testcases/testca=
ses.c34::9 :error: 36incomplete definition of type 'struct extra_context': =
HtEeA   xD18t( | (&            set9te | testcases/testcases.cx:rtrb18ouorlm=
a:c  v-34t:=3D aerror: testcases/testcases.ctestcases/testcases.c:> h elinc=
omplete definition of type 'struct extra_context': 18e:xGaEi1834dta   d18T =
| _:R:ErSat_)e        _34e Verror: cincomplete definition of type 'struct e=
xtra_context'; Xeerror: rn      T|    rincomplete definition of type 'struc=
t extra_context'mat_                                   ~~~~~^18 *ntt:rceoe1=
8xat,testcases/testcases.cxn:(t :c9t:3436:s:ehxra t rtuar, error: *note: * =
ec tincomplete definition of type 'struct extra_context' forward declaratio=
n of 'struct extra_context' c34hVx:a_trNr a E_testcases/testcases.cerror: *=
Xc:incomplete definition of type 'struct extra_context'*To18n Derror: (inco=
mplete definition of type 'struct extra_context' |  E=3DTa_18R:A34      :  =
_EcDS(| &Gerror: oV                                   ~~~~~^eExincomplete d=
efinition of type 'struct extra_context'Tn_t _eErRXxtestcases/testcases.caE=
:Tt   -18S9V_testcases/testcases.cH E>A | :        _t:e*18r:m34 :=3D  hD36N=
eerror: GeE(T:_E xincomplete definition of type 'struct extra_context'a&dR)=
XEnote: tforward declaration of 'struct extra_context'r v19            :_19=
c:a| l                                   ~~~~~^i| dH                       =
            ~~~~~^o     error:  rcutestcases/testcases.c:hca    :919rt19 | =
:  *:_b19o19:*ao: ealr error: r ctestcases/testcases.crverror: incomplete d=
efinition of type 'struct _aarch64_ctx':h,a ic:c fatal error: |   |9595  te=
stcases/testcases.citoo many errors emitted, stopping now [-ferror-limit=3D=
] | : t:ns22tea19l:irt: 19n:m inote: error: e-cforward declaration of 'stru=
ct _aarch64_ctx'incomplete definition of type 'struct _aarch64_ctx'  ac rt*=
cxfatal error: hh too many errors emitted, stopping now [-ferror-limit=3D]6=
 e*4agfatal error: _detoo many errors emitted, stopping now [-ferror-limit=
=3D],t _ctx *hcead, uitntx3 2*_tfatal error: g too many errors emitted, sto=
pping now [-ferror-limit=3D]em (struct _aarch64_ctx *head,fatal error:  too=
 many errors emitted, stopping now [-ferror-limit=3D]u fatal error: too man=
y errors emitted, stopping now [-ferror-limit=3D] testcases/testcases.c:18:=
34: error: incomplete definition of type 'struct extra_context' testcases/t=
estcases.c:18:34: error: incomplete definition of type 'struct extra_contex=
t' testcases/testcases.c:19:19: error: incomplete definition of type 'struc=
t _aarch64_ctx' fatal error: too many errors emitted, stopping now [-ferror=
-limit=3D] testcases/testcases.c:18:34: error: incomplete definition of typ=
e 'struct extra_context' testcases/testcases.c:19:19: error: incomplete def=
inition of type 'struct _aarch64_ctx' fatal error: too many errors emitted,=
 stopping now [-ferror-limit=3D] signals.Ssignals.S:16:19: error: expected =
']' in brackets expression 19 :  error:  expected ']' in brackets expressio=
n  signals.Ssignals.S:16:19: error: expected ']' in brackets expression :  =
error:  expected ']' in brackets expression  signals.Ssignals.S:16:19: erro=
r: expected ']' in brackets expression 16 : 19 :   error:  expected ']' in =
brackets expression  signals.S:16:19: error: expected ']' in brackets expre=
ssion signals.S:16:19: error: expected ']' in brackets expression signals.S=
:17:2: error: unknown use of instruction mnemonic without a size suffix sig=
nals.S:17:2: error: unknown use of instruction mnemonic without a size suff=
ix signals.S:19:2: error: unknown use of instruction mnemonic without a siz=
e suffix signals.S:20signals.S::2: 19error: :unknown use of instruction mne=
monic without a size suffix2 :  mov x21, x1error:  signals.S:21:2: signals.=
Serror: :unknown use of instruction mnemonic without a size suffix20 :  err=
or: ^unknown use of instruction mnemonic without a size suffix signals.S:21=
:2: error: unknown use of instruction mnemonic without a size suffix signal=
s.Ssignals.S::1724::22: : error: error: unknown use of instruction mnemonic=
 without a size suffixunknown use of instruction mnemonic without a size su=
ffix error: signals.Sunknown use of instruction mnemonic without a size suf=
fixsignals.S 14: 217: :error: : signals.Ssignals.Serror: :unknown token in =
expression2unknown use of instruction mnemonic without a size suffixerror: =
 2error: : mov x29, sp14 error: ^ 17:2: error: unknown use of instruction m=
nemonic without a size suffix ::signals.S262::: signals.S19:error: 14:26unk=
nown use of instruction mnemonic without a size suffix: 2: error: signals.S=
:  mov x21, x1error:  14unknown token in expression: :signals.S19unknown us=
e of instruction mnemonic without a size suffix: 19^error:  :  error: ^unkn=
own use of instruction mnemonic without a size suffix signals.S:20:2: signa=
ls.S:20:2: error: unknown use of instruction mnemonic without a size suffix=
 : error:   signals.S 2 unknown use of instruction mnemonic without a size =
suffix:  error:  mov x21, x1unknown use of instruction mnemonic without a s=
ize suffixsignals.S error:   unknown use of instruction mnemonic without a =
size suffix 2:  20  error:  unknown use of instruction mnemonic without a s=
ize suffix20signals.S:22 ^^ : mov x22, x2: : error: ^error:  error:  signal=
s.Sunknown use of instruction mnemonic without a size suffix^: signals.S2 :=
: ^21error:  :  add x0, x21, x22error: signals.Ssignals.S: : error:  : ^err=
or: unknown use of instruction mnemonic without a size suffixunknown use of=
 instruction mnemonic without a size suffixsignals.S error: signals.Ssignal=
s.Sunknown use of instruction mnemonic without a size suffix :: error: erro=
r:  error: 24unknown use of instruction mnemonic without a size suffixsigna=
ls.Sunknown token in expressionunknown use of instruction mnemonic without =
a size suffix::signals.S : :error: 2error: :  unknown use of instruction mn=
emonic without a size suffix error: unknown token in expressionsignals.S  e=
rror:   error: 26 ::  unknown token in expression   1426: : 14 :   ldr x0, =
=3Dcall_fmtsignals.Serror: ^unknown token in expression  error:  bic x0, x0=
, #15  :  error: 26     : signals.Serror:  unknown token in expression ^  :=
 ^::  bic x0, x0, #15error: 32 error:  :  error:  unknown use of instructio=
n mnemonic without a size suffix^  signals.S:28:2: error: unknown use of in=
struction mnemonic without a size suffix     :2732signals.S:2::22: signals.=
S: : 30error: error: unknown use of instruction mnemonic without a size suf=
fix: error:  mov x2, x23:unknown use of instruction mnemonic without a size=
 suffixunknown use of instruction mnemonic without a size suffix33 :  signa=
ls.Serror: ^ signals.S: : 27: ldr x0, =3Dcall_fmterror: :^22 error:  unknow=
n use of instruction mnemonic without a size suffixsignals.Ssignals.S:error=
:  bl printf  : :error: ^^:   ^2 error: ^:  invalid instruction mnemonic 'b=
l'error:  error: :unknown use of instruction mnemonic without a size suffix=
2836: signals.S^ :: 10error:  : ^2error: : unknown use of instruction mnemo=
nic without a size suffixsignals.S : unknown use of instruction mnemonic wi=
thout a size suffixerror: error:  : : error: 2unknown use of instruction mn=
emonic without a size suffix: signals.S : error: 10unknown token in express=
ion signals.Serror:  mov x0, x23::37 :   : mov x2, x232error: :  ldr x0, =
=3Dcall_fmt  ^error:  ldr x0, =3Dcall_fmt  unknown use of instruction mnemo=
nic without a size suffix signals.S :   error:   :33:2: error: invalid inst=
ruction mnemonic 'bl' 2 :  ldr x0, =3Dcall_fmt: ^  signals.Serror: : 36erro=
r: : :2 2::  : 31error: error: unknown use of instruction mnemonic without =
a size suffix signals.Ssignals.S::signals.S2:unknown use of instruction mne=
monic without a size suffix :error: 2: : 2 error:  mov x1, x21 39: error: s=
ignals.S::392^:unknown use of instruction mnemonic without a size suffixsig=
nals.S32: signals.S2 error: :error: 3332invalid instruction mnemonic 'bl'si=
gnals.S 2:invalid instruction mnemonic 'bl':  : ^38error:  bl memcpy2 inval=
id instruction mnemonic 'bl': error: ^^ signals.S^ error: unknown use of in=
struction mnemonic without a size suffix~~: :: :error: : error:  signals.S:=
 :error: error: invalid instruction mnemonic 'ldr'invalid instruction mnemo=
nic 'ldr' ^error: 33unknown use of instruction mnemonic without a size suff=
ixsignals.S::invalid instruction mnemonic 'bl' error:  invalid instruction =
mnemonic 'bl'^ ~error:  : 33^^ bl printf~ error:  signals.Sinvalid instruct=
ion mnemonic 'bl'^ :signals.S:372signals.S: 52:error:  unknown use of instr=
uction mnemonic without a size suffix: 2: : error: :error:  unknown use of =
instruction mnemonic without a size suffixerror: : unknown use of instructi=
on mnemonic without a size suffix2signals.S^ error:  :  str x23, [x0]error:=
  :signals.S2error: signals.S : :error:  error: signals.Sunknown use of ins=
truction mnemonic without a size suffixsignals.S:37:2: error: unknown use o=
f instruction mnemonic without a size suffix 2error: : error: unknown use o=
f instruction mnemonic without a size suffixerror: unknown token in express=
ionunknown use of instruction mnemonic without a size suffix 238 54 :102: :=
error: ^2 : :  unknown use of instruction mnemonic without a size suffix : =
signals.S error: error:  mov x2, x21error: : unknown use of instruction mne=
monic without a size suffixunknown token in expression ^ signals.Sinvalid i=
nstruction mnemonic 'bl'error: signals.S ^10:: :error: error:  invalid inst=
ruction mnemonic 'bl'~39unknown token in expression2  2 :error: signals.S e=
rror:  invalid instruction mnemonic 'bl'~ : signals.Serror: 51: svc #0  :si=
gnals.S:: 51  64::error: :^^signals.S~~572invalid instruction mnemonic 'ldr=
'2:~~: error:  error: ^:invalid instruction mnemonic 'b'2 52error: : 2error=
: :  error: unknown use of instruction mnemonic without a size suffix 52545=
4:signals.S2:254::2:: : signals.Serror: invalid instruction mnemonic 'b' 2:=
 2: : error: error: :unknown use of instruction mnemonic without a size suf=
fixerror:  error:  mov sp, x23unknown use of instruction mnemonic without a=
 size suffix : ^ signals.S^error:  ::561054signals.S: b .2:: : :error:  unk=
nown use of instruction mnemonic without a size suffix10error: 56unknown to=
ken in expression  :  error: ^ mov x8, #15 unknown token in expression : er=
ror: :invalid instruction mnemonic 'svc'error: 2invalid instruction mnemoni=
c 'svc' error:  svc #0invalid instruction mnemonic 'svc': ^: ~~error:  64::=
6464:22:: : 2error: error: signals.S: invalid instruction mnemonic 'b'inval=
id instruction mnemonic 'b': error:  signals.S:17:2: error: unknown use of =
instruction mnemonic without a size suffix signals.S:19:2: error: unknown u=
se of instruction mnemonic without a size suffix signals.S:20:2: error: unk=
nown use of instruction mnemonic without a size suffix signals.S:21:2: erro=
r: unknown use of instruction mnemonic without a size suffix signals.S:24:2=
: error: unknown use of instruction mnemonic without a size suffix signals.=
S:25:14: error: unknown token in expression signals.S:26:14: error: unknown=
 token in expression signals.S:27:2: error: unknown use of instruction mnem=
onic without a size suffix signals.S:28:2: error: unknown use of instructio=
n mnemonic without a size suffix signals.S:30:10: error: unknown token in e=
xpression signals.S:31:2: error: unknown use of instruction mnemonic withou=
t a size suffix signals.S:32:2: error: unknown use of instruction mnemonic =
without a size suffix signals.S:33:2: error: invalid instruction mnemonic '=
bl' signals.S:36:2: error: unknown use of instruction mnemonic without a si=
ze suffix signals.S:37:2: error: unknown use of instruction mnemonic withou=
t a size suffix signals.S:38:2: error: unknown use of instruction mnemonic =
without a size suffix signals.S:39:2: error: invalid instruction mnemonic '=
bl' signals.S:51:2: error: invalid instruction mnemonic 'ldr' signals.S:52:=
2: error: unknown use of instruction mnemonic without a size suffix signals=
.S:54:2: error: unknown use of instruction mnemonic without a size suffix s=
ignals.S:56:10: error: unknown token in expression signals.S:57:2: error: i=
nvalid instruction mnemonic 'svc' signals.S:64:2: error: invalid instructio=
n mnemonic 'b' sve_helpers.c:13:18: error: use of undeclared identifier 'SV=
E_VQ_MAX' sve_helpers.c:25:12: error: use of undeclared identifier 'SVE_VQ_=
MAX' sve_helpers.c:41:12: error: call to undeclared function 'sve_vq_from_v=
l'; ISO C99 and later do not support implicit function declarations [-Wimpl=
icit-function-declaration] sve_helpers.c:sve_helpers.c13:18: error: use of =
undeclared identifier 'SVE_VQ_MAX' :13:18: error: use of undeclared identif=
ier 'SVE_VQ_MAX' :18: error: use of undeclared identifier 'SVE_VQ_MAX' sve_=
helpers.c:13:18: error: use of undeclared identifier 'SVE_VQ_MAX' sve_helpe=
rs.c:25:12: error: use of undeclared identifier 'SVE_VQ_MAX' sve_helpers.c:=
41:12: error: call to undeclared function 'sve_vq_from_vl'; ISO C99 and lat=
er do not support implicit function declarations [-Wimplicit-function-decla=
ration] sve_helpers.c:25:12: error: use of undeclared identifier 'SVE_VQ_MA=
X' :12: error: use of undeclared identifier 'SVE_VQ_MAX' sve_helpers.c:41:1=
2: error: call to undeclared function 'sve_vq_from_vl'; ISO C99 and later d=
o not support implicit function declarations [-Wimplicit-function-declarati=
on] sve_helpers.c:41:12: error: call to undeclared function 'sve_vq_from_vl=
'; ISO C99 and later do not support implicit function declarations [-Wimpli=
cit-function-declaration] sve_helpers.c:41:12: error: call to undeclared fu=
nction 'sve_vq_from_vl'; ISO C99 and later do not support implicit function=
 declarations [-Wimplicit-function-declaration] sve_helpers.c:13:18: error:=
 use of undeclared identifier 'SVE_VQ_MAX' in testcases/fake_sigreturn_bad_=
magic (Makefile:31) [logspec:kbuild,kbuild.other]
---

- dashboard: https://d.kernelci.org/i/maestro:e24f671632032692e8b0e5683b5da=
5aec1a14bb0
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it
- commit HEAD:  816f193dd0d95246f208590924dd962b192def78
- tags: next-20260406

Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
.ctestcases/fake_sigreturn_sve_change_vl.c:testcases/fake_sigreturn_duplica=
ted_fpsimd.c14:::
13In file included from In file included from :
./test_signals_utils.hIn file included from In file included from 141413tes=
tcases/fake_sigreturn_bad_size.c::13./test_signals_utils.h:
testcases/fake_sigreturn_misaligned_sp.cIn file included from :
:
:
14::
:14./test_signals.h./test_signals_utils.hIn file included from :In file inc=
luded from ./test_signals_utils.h./test_signals_utils.hIn file included fro=
m :13./test_signals_utils.h:
:./test_signals.h151413:14:
::1415:::
10:
14In file included from :
In file included from :
./test_signals.h10./test_signals.h./test_signals.h::
./test_signals_utils.h./test_signals_utils.h::::: 15: 15./test_signals.h14:=
1514fatal error: :fatal error: :'asm/hwcap.h' file not found10:
:15./test_signals.h::
10'asm/hwcap.h' file not found:10
: ::./test_signals.h
:  fatal error: 101515fatal error: fatal error: 'asm/hwcap.h' file not foun=
d:'asm/hwcap.h' file not found
'asm/hwcap.h' file not found
:: 1010fatal error: ::'asm/hwcap.h' file not found  fatal error:=20
fatal error: 'asm/hwcap.h' file not found'asm/hwcap.h' file not found
hahpwehm <<>a
h>wa.pc.         ^~~~~~~~~~~~~hh>
wcchaa
p
.      ha>>p      .| p         ^~~~~~~~~~~~~.
|       h
>h
|=20
1 error generated.
1 error generated.
1 error generated.
1 error generated.
1 error generated.
1 error generated.
1 error generated.
1 error generated.
In file included from test_signals.c:16:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
In file included from test_signals.c:16:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
1 error generated.
In file included from test_signals.c:16:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
In file included from test_signals.c:16:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
1 error generated.
In file included from test_signals.c:16:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
1 error generated.
1 error generated.
In file included from test_signals.c:16:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
1 error generated.
1 error generated.
In file included from test_signals.c:16:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
In file included from test_signals.c:16:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
1 error generated.
1 error generated.
In file included from In file included from test_signals_utils.c:18:
./test_signals.h:15:10: test_signals_utils.cfatal error: :'asm/hwcap.h' fil=
e not found
18:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
s      m| /         ^~~~~~~~~~~~~h
wcap.h>
In file included from test_signals_utils.c:18:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
In file included from In file included from test_signals_utils.c:18:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
In file included from In file included from test_signals_utils.ctest_signal=
s_utils.c::1818:
:
./test_signals.h./test_signals.h::1515::1010: fatal error: 'asm/hwcap.h' fi=
le not found
ap.h>
test_signals_utils.c:18:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
In file included from test_signals_utils.c:18:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
1 error generated.
1 error generated.
1 error generated.
11 error generated.
11 error generated.
1 error generated.
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:40:8: error: redefinition of=
 '_fpx_sw_bytes'
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h   :4015 | :
s/usr/include/x86_64-linux-gnu/asm/sigcontext.htr:u40c:t8 :_ ferror: pIn fi=
le included from In file included from xredefinition of '_fpx_sw_bytes'test=
cases/testcases.c_testcases/testcases.c
::sw_bytes {
77      :
:
| In file included from In file included from        ^testcases/testcases.h=
testcases/testcases.h
::1515:
:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h/usr/include/x86_64-linux-gnu=
/asm/sigcontext.hIn file included from ::testcases/testcases.c4040:::88::  =
7error: error: :
redefinition of '_fpx_sw_bytes'redefinition of '_fpx_sw_bytes'In file inclu=
ded from=20
testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.hIn file included from :40test=
cases/testcases.cIn file included from :testcases/testcases.c:8:: error: re=
definition of '_fpx_sw_bytes'77
:
:
In file included from In file included from    testcases/testcases.htestcas=
es/testcases.h40:: | 15/usr/include/x86_64-linux-gnu/bits/sigcontext.hs15:
:t:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h31::r/usr/include/x86_64-linu=
x-gnu/asm/sigcontext.h408u:::8 cnote: 40tprevious definition is here  =20
40 | st   40    | str::    _r31uu 840:f  | error: sccerror:  | redefinition=
 of '_fpx_sw_bytes'ttrtu credefinition of '_fpx_sw_bytes'ts
_      sstt{r| uwc tr{
_ ub_     =20
cytf | t_efps       ^pxx _
{_s
sw      w_| _b       ^by
ytteess  {{
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:31:8: note: previous defini=
tion is here
31:previous definition is here8:
:b      :| 88    31y       ^:: note: note:  | previous definition is here
bw       ^            | y       ^t
es
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h
_| :/usr/include/x86_64-linux-gnu/bits/sigcontext.hb       ^15
::
y31/usr/include/x86_64-linux-gnu/asm/sigcontext.h:t8e::s85=20
:note:       8previous definition is here| :
error: redefinition of '_fpreg'  =20
31 | struct _   f85p | x_sswt_rbyutcest
reg {
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:40:8: note: previous defini=
tion is here
7   40:
c/usr/include/x86_64-linux-gnu/asm/sigcontext.ht: 85:_8f: pIn file included=
 from error: rtestcases/testcases.credefinition of '_fpreg'e:
g7
:
In file included from       testcases/testcases.h| :       ^In file include=
d from 15
testcases/testcases.c:
s:In file included from 8ttestcases/testcases.h:r :uerror: 15c:
redefinition of '_fpreg't
/usr/include/x86_64-linux-gnu/asm/sigcontext.h :In file included from _85ft=
estcases/testcases.c:   p:885r7: | e:
g sIn file included from  error: ttestcases/testcases.h{rredefinition of '_=
fpreg':u15
:
c      /usr/include/x86_64-linux-gnu/asm/sigcontext.ht| :        ^85_   :858
:f |  pserror: trredefinition of '_fpreg'/usr/include/x86_64-linux-gnu/bits=
/sigcontext.he:r
g40u :c{8tIn file included from    testcases/testcases.c
:       85: | note: _previous definition is here |=20
7       ^fsp:
:
u_8      :/usr/include/x86_64-linux-gnu/asm/sigcontext.hcf| p       ^ :tr91
:note: In file included from previous definition is hereIn file included fr=
om  e8gtestcases/testcases.c:
/usr/include/x86_64-linux-gnu/bits/sigcontext.htestcases/testcases.c_ :    =
:error: :40f{7p40redefinition of '_fpxreg'7
:
:In file included from=20
testcases/testcases.h:
:
s91t:rprevious definition is hereu      /usr/include/x86_64-linux-gnu/asm/s=
igcontext.h | :/usr/include/x86_64-linux-gnu/bits/sigcontext.h15c
| s       ^85   :40:
redefinition of '_fpreg'      previous definition is here p_error: xredefin=
ition of '_fpreg'
r|=20
f
p       ^er   e
g85      g=20
In file included from 40      s |       testcases/testcases.c | :| stt| s7 =
      ^rru       ^ctt:
u
r_utestcases/testcases.hcfcpt: t_/usr/include/x86_64-linux-gnu/bits/sigcont=
ext.hr15 :
f:pe_/usr/include/x86_64-linux-gnu/asm/sigcontext.h46:r91gf::e8 p8g:{r:e=20
error: In file included from =20
g             redefinition of '_fpxreg'{
note: testcases/testcases.cprevious definition is here|   =20
In file included from | testcases/testcases.c       ^:   746 | s
:             ^|=20
91
:
t7       ^ |=20
In file included from :
testcases/testcases.hr/usr/include/x86_64-linux-gnu/bits/sigcontext.hu:scIn=
 file included from :t/usr/include/x86_64-linux-gnu/bits/sigcontext.h :40_4=
0ttestcases/testcases.h15::
f/usr/include/x86_64-linux-gnu/asm/sigcontext.h:r:8p:89115:u:x :note: 8 ::
redefinition of '_fpxreg'
: error: 407 | 40      s   redefinition of '_fpxreg'| :
In file included from rstestcases/testcases.hu |=20
ft:c   sptr15t91 x_rrfepur:
8      :| pcx      | |         ^       ^tr        ^error:=20
_e
redefinition of '_fpxreg'fg
/usr/include/x86_64-linux-gnu/bits/sigcontext.hp :x{46r:In file included fr=
om=20
s{ 7t
note: /usr/include/x86_64-linux-gnu/bits/sigcontext.h:
:rIn file included from       previous definition is here46u:c8testcases/te=
stcases.h|=20
:t        ^:note:  previous definition is here
46:
:s 8e:
gt In file included from tnote: r:previous definition is hereIn file includ=
ed from  {testcases/testcases.h_:testcases/testcases.h15u:
f:pc15/usr/include/x86_64-linux-gnu/asm/sigcontext.h:
error: :         | x       ^t
/usr/include/x86_64-linux-gnu/asm/sigcontext.hredefinition of '_xmmreg'91
46:r8 :: /usr/include/x86_64-linux-gnu/bits/sigcontext.h91 | e   _gerror:=20
:redefinition of '_fpxreg':s8f98p      46
t:rxu | c| t:  r   esg       ^
e g
tt note: _
xr   m91previous definition is here |       um| s
cr       ^ttre
u g   _cf 46tp { | x_
sIn file included from rfep      ttestcases/testcases.cgx r| r:       ^In f=
ile included from=20
{etestcases/testcases.cu7
g:c/usr/include/x86_64-linux-gnu/bits/sigcontext.h:
In file included from        ^
15In file included from :
testcases/testcases.h46
:x:
r/usr/include/x86_64-linux-gnu/asm/sigcontext.h::: /usr/include/x86_64-linu=
x-gnu/bits/sigcontext.h/usr/include/x86_64-linux-gnu/asm/sigcontext.he:1598=
98:
8:note: 8:g46
:/usr/include/x86_64-linux-gnu/asm/sigcontext.h:previous definition is here=
=20
::      88   :: note:  | previous definition is here:
8 | :    redefinition of '_xmmreg'error:=20
previous definition is heres
46   redefinition of '_xmmreg't
mpxrreggr In file included from mtestcases/testcases.hxe
ge{:rr      e
g
15e| g             :
g       ^
| {|=20
{             ^     =20
|=20
98| :/usr/include/x86_64-linux-gnu/bits/sigcontext.h      /usr/include/x86_=
64-linux-gnu/bits/sigcontext.h8       ^:| 53:::8
previous definition is herenote: 53previous definition is here
:
8      :98   53  |  | s53note:  | stIn file included from previous definiti=
on is herestestcases/testcases.ctt:r
7rr:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:98:8: error: redefinition of=
 '_xmmreg'
tm _uxem/usr/include/x86_64-linux-gnu/asm/sigcontext.hm:_98cxgm
rre:t8m       _exg:m | rgm
merror:        ^e       {r
redefinition of '_xmmreg'e
g|               ^
g{
|=20
98       | | | s       ^       ^
/usr/include/x86_64-linux-gnu/bits/sigcontext.ht
ru:c/usr/include/x86_64-linux-gnu/bits/sigcontext.h53:t: 538_::x8 :mnote:  =
mprevious definition is herenote: r
previous definition is heree
g {  =20
ruct/usr/include/x86_64-linux-gnu/bits/sigcontext.hc :t_53 x:_m8xm:mr menot=
e: rgprevious definition is heree
g     =20
|                 ^53|=20
truct _xmmreg
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:180:8: error: redefinition o=
f '_ymmh_state'
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:184:8: note: previous defin=
ition is here
In file included from testcases/testcases.c:In file included from 7:
testcases/testcases.cIn file included from In file included from :testcases=
/testcases.ctestcases/testcases.h7:::
715In file included from :
:
testcases/testcases.h/usr/include/x86_64-linux-gnu/asm/sigcontext.hIn file =
included from ::15testcases/testcases.h192:
::15/usr/include/x86_64-linux-gnu/asm/sigcontext.h8:
::180/usr/include/x86_64-linux-gnu/asm/sigcontext.h :error: 8:redefinition =
of '_xstate':180
: 8error: :redefinition of '_ymmh_state'=20
error:   redefinition of '_ymmh_state'192
h_      s_tIn file included from | satestcases/testcases.ctt       ^ae:=20
t{7
e       :
| {In file included from        ^/usr/include/x86_64-linux-gnu/bits/sigcont=
ext.htestcases/testcases.h
:      :189| 15:       ^:
/usr/include/x86_64-linux-gnu/bits/sigcontext.h8/usr/include/x86_64-linux-g=
nu/asm/sigcontext.h::184:: /usr/include/x86_64-linux-gnu/bits/sigcontext.h8=
180:note: : :previous definition is herenote: 1848
previous definition is here::
8   :error: 189   redefinition of '_ymmh_state'184note:  |=20
ttrruuc  c  t184t180  |   | _s_sxtytsmrrtumuchatct_ tes_ y
t_am      ytm| meh       ^m
_
h      s_| tsa       ^tte
a
t      e| In file included from  In file included from testcases/testcases.=
ctestcases/testcases.c       ^:{:
77
:
In file included from | In file included from        ^testcases/testcases.h
testcases/testcases.h:15::
15/usr/include/x86_64-linux-gnu/bits/sigcontext.h/usr/include/x86_64-linux-=
gnu/asm/sigcontext.h:
::/usr/include/x86_64-linux-gnu/asm/sigcontext.h180184:::8180In file includ=
ed from 8::testcases/testcases.c: 8In file included from : error: :note: te=
stcases/testcases.c7:redefinition of '_ymmh_state' previous definition is h=
ere:
7
:
error: In file included from=20
testcases/testcases.hIn file included from :In file included from 15redefin=
ition of '_ymmh_state':
184::15180: |  | 7:
tIn file included from ::sttrrtestcases/testcases.h192:8ru:u:c815:u:
cct  terror:  /usr/include/x86_64-linux-gnu/asm/sigcontext.herror: t:_ yred=
efinition of '_ymmh_state'mredefinition of '_xstate'
8  :yhh  180  | ms_m_192error:  | tshsredefinition of '_xstate't
srt_attua  tser e{c
t192t | usc
ttr       y_t| umcxte       ^m  _s{
h
xts_      sttaaatt/usr/include/x86_64-linux-gnu/bits/sigcontext.he| te: 184=
       ^:In file included from etestcases/testcases.c  :{{
8      {7
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:|         ^:
8testcases/testcases.h       ^
184::184:8: note: previous definition is here
189/usr/include/x86_64-linux-gnu/asm/sigcontext.hnote: :um8/usr/include/x86=
_64-linux-gnu/bits/sigcontext.h:previous definition is here:ch189:192=20
t_ s:t  a184:note: _previous definition is here8t | 8sy:
:e=20
t      r| mumc tnote:           ^189
herror: previous definition is hereredefinition of '_xstate'_
s  m192s | ttm  hsrau189c_ttt |  s_reIn file included from=20
sttarxuuctestcases/testcases.ct:      7t:
es
c t| In file included from ttestcases/testcases.h      :_15 :
testcases/testcases.cxts       ^ts
::e192at
t      7e:a| 8:
In file included from=20
:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:In file included from 317tes=
tcases/testcases.c  :1928 | ::7/usr/include/x86_64-linux-gnu/bits/sigcontex=
t.hIn file included from stestcases/testcases.c :
:In file included from ttestcases/testcases.h:error: 7189:
redefinition of 'sigcontext':r:In file included from=20
testcases/testcases.h8:u15c:15:
t :
:s:x  8189t8s:t:a  | error: rredefinition of '_xstate' tseu
error: tredefinition of '_xstate'=20
c{r  t192
xcscotutc/usr/include/x86_64-linux-gnu/bits/sigcontext.hn: tate_189xt: xset=
8_:
previous definition is heree
{       ^        189
|=20
:c/usr/include/x86_64-linux-gnu/bits/sigcontext.h139/usr/include/x86_64-lin=
ux-gnu/bits/sigcontext.h::t189:189:8 :_: 8x8snote: :tprevious definition is=
 herea:=20
t note: note: eprevious definition is hereprevious definition is here
189s |  | tssrtturrcuutcc tts  i__gxxcssottnaattteeex
t           =20
| |              ^       ^|=20
In file included from testcases/testcases.c:In file included from 7testcase=
s/testcases.c:
:In file included from 7testcases/testcases.h:
:In file included from 15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:317:8: error: redefinition o=
f 'sigcontext'
ru/usr/include/x86_64-linux-gnu/asm/sigcontext.hc:t317 :s8i:g cerror: orede=
finition of 'sigcontext'n
text   {317
uct /usr/include/x86_64-linux-gnu/bits/sigcontext.hs:i139g:c8o:n tnote: epr=
evious definition is herex
t {
truct/usr/include/x86_64-linux-gnu/bits/sigcontext.h :s139i:g8c:o nnote: tp=
revious definition is heree
xt
truct sigcontext
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:317:8: error: redefinition o=
f 'sigcontext'
In file included from /usr/include/x86_64-linux-gnu/bits/sigcontext.htestca=
ses/testcases.c::1397::
8In file included from :testcases/testcases.h :note: 15previous definition =
is here:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:317  :1398 | :s terror: rred=
efinition of 'sigcontext'u
ct sigc  o317n | tIn file included from stestcases/testcases.cet:xr7tIn fil=
e included from utestcases/testcases.c:
c      :In file included from ttestcases/testcases.h|  7::
15       ^:
s/usr/include/x86_64-linux-gnu/asm/sigcontext.hIn file included from=20
i:testcases/testcases.hg317:c:15o8n:
t:e/usr/include/x86_64-linux-gnu/asm/sigcontext.h :xerror: 317t:redefinitio=
n of 'sigcontext'8=20
{:
i s  gi139cg | ocsntotrnetuexxcttt   {s{
i
tex/usr/include/x86_64-linux-gnu/bits/sigcontext.ht:
/usr/include/x86_64-linux-gnu/bits/sigcontext.h      139| ::       ^1398
::8 :note:  previous definition is herenote:=20
previous definition is here
In file included from testcases/testcases.c:7:
testcases/testcases.h:101:25: error: invalid application of 'sizeof' to an =
incomplete type 'struct _aarch64_ctx'
:
atestcases/testcases.htestcases/testcases.hd:: 101101|::|2525 ::r  eerror: =
error: sinvalid application of 'sizeof' to an incomplete type 'struct _aarc=
h64_ctx'invalid application of 'sizeof' to an incomplete type 'struct _aarc=
h64_ctx'v
_sz < HDR_SZ    )101101
__sszz  <<  HH   DD28RR | __        SSsZZi))z
e            o| | f                               ^~~~~~                   =
            ^~~~~~(
structestcases/testcases.htestcases/testcases.ht:: 28_28:a:2a:2r :cnote:  h=
expanded from macro 'HDR_SZ'note: 6
expanded from macro 'HDR_SZ'4
_ctx)
6h46_4c_tcxt)x
)     =20
|               ^     ~~~~~~~~~~~~~~~~~~~~~|=20
forward declaration of 'struct _aarch64_ctx'n
e struct _aar   c   95h95 | 6 | s4st_tacatttixic c * iginenltli_inhene eas =
dtsertrur(custct tr_ ua_caatra cr_hca6ha46r_4cc_htcIn file included from 6x=
tIn file included from xtestcases/testcases.ctestcases/testcases.c:4:  *7g_=
7*:
g:
eecttestcases/testcases.httestcases/testcases.ht_:hx:_101e 101h::a*25de25h:=
:  eerror: raederror: einvalid application of 'sizeof' to an incomplete typ=
e 'struct _aarch64_ctx'invalid application of 'sizeof' to an incomplete typ=
e 'struct _aarch64_ctx'
(
arsd(t,sr tuurciutnc tt_3 a2a__r    tac101101 ahmr6 |  | a        c4i      =
  fgh_i i6c4f(c t_x!,( cIn file included from In file included from h
e!      *t| hxtestcases/testcases.ctestcases/testcases.c:a7dh e|           =
          ^ :*:
heeaa|d
,7testcases/testcases.h:
add   :testcases/testcases.h101,:r101|:|u:i net25 :25 uerror: s3vr:eisinval=
id application of 'sizeof' to an incomplete type 'struct _aarch64_ctx'2
_ snzv __serror: ztinvalid application of 'sizeof' to an incomplete type 's=
truct _aarch64_ctx'3<2t_ t   101
_101i | c,,f
i                                      ^~~~~~Z
104(h::      27!eh28| ::ea                               ^~~~~~2 ad
:error:   dtestcases/testcases.hinvalid application of 'sizeof' to an incom=
plete type 'struct _aarch64_ctx':note:=20
| expanded from macro 'HDR_SZ'28||
|:  2rr  e:   e104s v28_ss | note:  |         vzexpanded from macro 'HDR_SZ=
'        w_ s<
:z:eZorfs        )u(
<                               ^~~~~~                               ^~~~~~=
=3Dinvalid application of 'sizeof' to an incomplete type 'struct _aarch64_c=
tx't=20
_
ratestcases/testcases.hu104rtestcases/testcases.ha:  28::c28 | e:rs104v2_:t=
          w2hci | snote: _:ahalr        zwexpanded from macro 'HDR_SZ' h6ie=
lce h
note: 4 _( -(6 expanded from macro 'HDR_SZ'c
o   fo4fH   t28x)
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_=
ctx'
fir_e&ssl      (iszze&v| nt ro
_        ^     ~~~~~~~~~~~~~~~~~~~~~e-uf       s
z  (c-s tHH| DsRttrtestcases/testcases.hurcD                               =
  ^~~~~~R_
r      c:ha6&4_&note:=20
| 2r_cahforward declaration of 'struct _aarch64_ctx'6                      =
                 ^~~~~~:c a
4|=20
tnote: xr)_
c   testcases/testcases.h95c | t     =20
htestcases/testcases.h:sxt| a        ^     ~~~~~~~~~~~~~~~~~~~~~6
:28 28   :t24:testcases/testcases.h_:c*28gi | c         :note: 2expanded fr=
om macro 'HDR_SZ't
e tisn95i::22x:_)h   lz  enote:=20
forward declaration of 'struct _aarch64_ctx'e
28i | note: o      an| d        expanded from macro 'HDR_SZ'f   e        ^ =
    ~~~~~~~~~~~~~~~~~~~~~ es
(95
rcctahr_acc 6c4ta_racahr6c4h_6h4   _95c | statih_xc6tc46c ttxx)=20
*       | _        ^     ~~~~~~~~~~~~~~~~~~~~~4
c*xhgei_t ex*antestcases/testcases.hct)_hdl:t
xhe,ei95n      )|=20
a        ^     ~~~~~~~~~~~~~~~~~~~~~ a:e22      :d=20
note: uforward declaration of 'struct _aarch64_ctx'd e| r,testcases/testcas=
es.hi
nst        ^     ~~~~~~~~~~~~~~~~~~~~~( s:ut95i3  =20
95t | rrs:ntestcases/testcases.h2:u95u:t22att_ctc22::3 itc  mta 2note: _ ti=
g note: forward declaration of 'struct _aarch64_ctx'_ amnaali_forward decla=
ration of 'struct _aarch64_ctx'a
rgcic
,a
irhn      ec cs6      95|  | ,h
t      4| 95_                     ^s
6tr4a                     ^_
a6r4      invalid application of 'sizeof' to an incomplete type 'struct _aa=
rch64_ctx' =20
r4u__| 104cccct                     ^ | h        t6  xt
xw h4i104   | __al**        caweg eg(teorhcth_xtfif6hs  _le4a*<hed_ h=3D(ee=
coe ara(tdfedrsxr f*,et(ssh eusitestcases/testcases.hvr ta<n=3D: _udrt104r3=
esc,ut: 2szv  -c27t___tsu iH:  aerror:  invalid application of 'sizeof' to =
an incomplete type 'struct _aarch64_ctx'm
zangD_a ti3R2_  ra-c _StZ104  mca,H | D&Rahr
h      iZch_                     ^i| l                                  ^~~=
~~~e,c6
&=20
t4|       testcases/testcases.h| (:x_                     ^c
o28f testcases/testcases.hx::28f:2* s2: h *e:<note: ahd enote: =3Daexpanded=
 from macro 'HDR_SZ',expanded from macro 'HDR_SZ'  rd
,
:s ,g
&terror: &incomplete definition of type 'struct _aarch64_ctx'i
cIn file included from         | r                     ^
104u| :       | |                                          ^~~~~~c
28105h:
offs <r 15testcases/testcases.htestcases/testcases.h=3D   c28 ::
: h | r         105/usr/include/x86_64-linux-gnu/asm/sigcontext.h1056e4s_ :=
:: 4013sic13 :::8vtz_   h:exeserror: error:  a)ozfincomplete definition of =
type 'struct _aarch64_ctx'incomplete definition of type 'struct _aarch64_ct=
x'
error: d
redefinition of '_fpx_sw_bytes'-  -s        ^     ~~~~~~~~~~~~~~~~~~~~~
105> | t
forward declaration of 'struct _aarch64_ctx'-mh  6z     =20
| >a_h4ee                                 ^~~~~~agmdfa   _o
i-gpc95cf | ix> mttestcases/testcases.h(:sstc_a&gx28)t s&i!w:
a thc_=3D2      i| e        ^     ~~~~~~~~~~~~~~~~~~~~~ b :ca=20
i!ymt dn-=3Deasnote: testcases/testcases.hlexpanded from macro 'HDR_SZ'>=20
m ga:imn{igc95a   e
i       c:) {
: note: gforward declaration of 'struct _aarch64_ctx'28
-eeorac>amfht   da95( | s/usr/include/x86_64-linux-gnu/bits/sigcontext.h6i-=
4>gstt:c_mircaut31i cai)n c:ct tigl{8
g      a
e previous definition is heree| tr_ hs
t               ~~~~^testcases/testcases.h
csert   r:ua95testcases/testcases.hu:h31cd:ecrt95 6 | t22s(t:r_22a4 :s u:a_=
r_ctnote: rc cnote: aforward declaration of 'struct _aarch64_ctx'haforward =
declaration of 'struct _aarch64_ctx'u
tt
6rcxt4c)        9595__hc_t
a | as | ft6ax       r*spt4| gc        ^     ~~~~~~~~~~~~~~~~~~~~~txi_ccett=
hx
a_ _i6 ts*hn4lwigie__cetestcases/testcases.hnacb t:edtyxi_  r95e*rt(nhs:thu=
ecetsle22arasd ,ti:du
e_r runu c      a| (       ^i
ec note: tasrtnts forward declaration of 'struct _aarch64_ctx'=20
crtut_r_aha3rcctuhca6t46_24    a c__t95_r_atc t | csaahxm6xt)ara 4*
arcgh_6h      etacdih,64 _cucti| icc4txxn         ^     ~~~~~~~~~~~~~~~~~~~=
~~,
2ichgt      _| e                     ^n
exta testcases/testcases.hl tdm:ia95*,In file included from _testcases/test=
cases.cnge: 22gs h:eia:cetu7di:
:forward declaration of 'struct _aarch64_ctx'15::
_ur3     =20
105/usr/include/x86_64-linux-gnu/asm/sigcontext.hhc(2s| ::et_t             =
        ^1385a    dtr=20
:m:_95eu a8a | rcerror: g:iincomplete definition of type 'struct _aarch64_c=
tx'cas(t s
t,r
rt error: u      redefinition of '_fpreg'c|=20
ca_testcases/testcases.ht                     ^  h1056t   a:=20
_ | a        4i85_ | cstruca105r:ca ctt13hr   ixn l:6testcases/testcases.h4=
c:_h 6   head _ifn 105c4-_*cpte: 37error: :t >error: mgaxr s*incomplete def=
inition of type 'struct _aarch64_ctx'hx
ahdiec_ghr u{  ,a de,  acd
t105  ! 105e |       r|  | _        au=3Du        (        ^s truct  ai n i
a6c4dt a&e&g _   c-txxg aidhc40> mi*cg*e-hte_, | a
,s      >eaahdg,i
tc      r| umde  | c!                     ^=3Da-au                     ^t
n mimrt_afcag (3pgii!cs2rc=3De  )mttestcases/testcases.hr_g& testcases/test=
cases.h{a
:ut
&: g      i105c       105h| | c               ~~~~^:
tm:e       ^a
&_gai::-&a ch, 95  >rec
herror: :105mincomplete definition of type 'struct _aarch64_ctx' | a
6      422a        :d| _g  -note:                      ^cIn file included f=
rom i testcases/testcases.c>    forward declaration of 'struct _aarch64_ctx=
'=20
tc:x7m 105
-s>=20
atestcases/testcases.h)/usr/include/x86_64-linux-gnu/asm/sigcontext.hmta d:=
 105:testcases/testcases.ha:gti c, {:
9195      i| c   i!13::8               ~~~~^:  uerror: ni=3Dn:22
hredefinition of '_fpxreg'el t testcases/testcases.h:a
im3error: 2:incomplete definition of type 'struct _aarch64_ctx'95 dne a   g=
-s_
t:tnote: 91i>cr u22&:  | forward declaration of 'struct _aarch64_ctx'm
era        ccasudt , ac-a>   m=20
!      rtt95iac  =3D | c h | 6gi                       ^_ f4 psinmc
a_ghxtrl)eic itceang{=20
x       | a&tde{-                                        ~~~~^&i=20
s>      *
a13te95ncltg:/usr/include/x86_64-linux-gnu/bits/sigcontext.h_a:i c: h_d22er=
ror:  46e:a-:>incomplete definition of type 'struct _aarch64_ctx'!a8a mnote=
: a
g=3Didc:rforward declaration of 'struct _aarch64_ctx'e )c  h
6rm  (note: {4
ia105ngsprevious definition is here_     =20
c|  |                                        ~~~~^  =20
e95i | tstt        testcases/testcases.h    csrtaxt :4695  | &u&crt i *:sg =
eu cct  22t : h te_ahde-a>d_ eir u marn_lnote: icnahgai(aforward declaratio=
n of 'struct _aarch64_ctx'te e rsctsrau
_catc)trrfudc th  c   p-95_ | 6s_ta{ahx6>4a_4cat
rrmeag_
tcixc      c| ar      cth  h               ~~~~^6g4i_| x6 **ig
cc       ^4
h_ncetestcases/testcases.ht _textl:h95!:a22x i*eh=3Dd : naedae,d m a*egr,ug=
note: e (t _In file included from iiforward declaration of 'struct _aarch64=
_ctx'ncs shtestcases/testcases.ceua
dtetr&(t&r:i   3r2s tu7nc:
tIn file included from 95testcases/testcases.hu:_hrteu c | 15c:
t/usr/include/x86_64-linux-gnu/asm/sigcontext.h 3m2a__tt smt: adgai ta_a98t=
:i-cac_ag8i:> m error: r,redefinition of '_xmmreg'a
acrai   gc
a,crnc98hi | h     =20
hl664c_s6|       i4| n                     ^)ct 4                     ^_
e
tr{_
c xts u*cg      extt_cht|  xrtestcases/testcases.hutec t               ~~~~=
^ * :a*d_h
_testcases/testcases.hh105extestcases/testcases.he:a:e:arm(am95a:r10637:d:,=
s dr22ecg15  tu,:h :{error: riu c6u4note: =20
incomplete definition of type 'struct _aarch64_ctx'nti _forward declaration=
 of 'struct _aarch64_ctx'error:      =20
incomplete definition of type 'struct _aarch64_ctx't
n3_ca
a| rtc2t_  t         ^1053 | h        x106   |           =20
sd e+h=3Dce
ae      t|                         ^r
e      d|  -                     ^u>cm sasat
itnritngdriutestcases/testcases.h3l2-ucctestcases/testcases.h::_106it>cst  =
t_105: niez! =3Dx :15m:a gerror: iincomplete definition of type 'struct _aa=
rch64_ctx'c
,
raarg:ie106      g | u        c herror: c|=20
c              6| incomplete definition of type 'struct _aarch64_ctx'=20
ftax
ed106-cgnittc> | )3        2__   h es it        95!a=3D{z eo | d=20
emrm;fs
sisitac                                       ~~~~^c testcases/testcases.hr=
t,i
c       |                      ^
:ae  d>105amnote: s-:ra   forward declaration of 'struct _aarch64_ctx'95
t37crh>g | :iu6   s95si cc4t |  t_zaerror: )_scataerincomplete definition o=
f type 'struct _aarch64_ctx'c t{t
xi;
ha6       | c*=20
i4tn                                       ~~~~^h
e  a      _il105dcc|  testcases/testcases.hi: | n95,ti                     =
   ~~~~^        e : xn
4racIn file included from ltestcases/testcases.ca:>7_g   h95idm:
acgi | 6n4eIn file included from rticxse_ (testcases/testcases.hc,=20
tcss: 15*      gattxt !:
=3D| ettr*r/usr/include/x86_64-linux-gnu/asm/sigcontext.h                  =
    ^imc_ugcu:
a hientl_iheader(sttc180 t_g e_nratestcases/testcases.h::8aiaedua105r::cahc=
 esc t37rru6c 4r&(error: t:c ht_&cstredefinition of '_ymmh_state'x=20
error: 6incomplete definition of type 'struct _aarch64_ctx'=20
(      -nth2__sst| r                                       ~~~~^>utxetta
mc3t  testcases/testcases.hdaeatge2  *m_:r95i_{h
aega(a:r22cct      a| is:  !h=3D  m       ^a
dctnote: 6forward declaration of 'struct _aarch64_ctx'm
g,,/usr/include/x86_64-linux-gnu/bits/sigcontext.h
r      u| 4                     ^a  =20
i :c_tg95 c_ua184acri | c,i:tcx s&h
n8      t 3t&2a6:4| _*                     ^=20
_t chthteianote: cexa ddprevious definition is here-=20
,2 re)       s| _                     ^uu tt
atestcases/testcases.h3  2      _| g_:_ta                                  =
     ~~~~^aiy107 testcases/testcases.hr
testcases/testcases.hccmhm:mh:a:,testcases/testcases.h610_107g:106
:4      95:si10:_15| :                     ^: tcerror: :incomplete definiti=
on of type 'struct _aarch64_ctx'c=20
a22,:=20
error:       note: xforward declaration of 'struct _aarch64_ctx'incomplete =
definition of type 'struct _aarch64_ctx'eincomplete definition of type 'str=
uct _aarch64_ctx'| =20
*      107
| g       ^ | testcases/testcases.he  =20
dftestcases/testcases.c =3D:   106G | E                offes7Ts  r_:
(++sRIn file included from =3Dtestcases/testcases.h =3D:htE 15he:
arSe/usr/include/x86_64-linux-gnu/asm/sigcontext.hdu-aV>:cstestcases/testca=
ses.hdi_:192t-107:zN:>810eREsX T::_ ;aerror: Eiredefinition of '_xstate'_=20
error: aSzV
H      Eincomplete definition of type 'struct _aarch64_ctx'|=20
re_A                        ~~~~^N =20
cDE192h  (X | 107Th6s | ttestcases/testcases.h_e4        ru:aH_        cc95=
dEhtet :)A22Da(dx _;x:h =3D
s       t aenote: *G| taforward declaration of 'struct _aarch64_ctx'd
hE                       ^~~~~~~~~~~~~~~~~~~~~~~~ee
T a_{dR
,E       | testcases/testcases.h       ^   Su
:V95i85_ | :nN/usr/include/x86_64-linux-gnu/bits/sigcontext.hs43:tEt189:a3X=
:t 2T8inote: __:c expanded from macro 'GET_RESV_NEXT_HEAD' tHnote:=20
;iE previous definition is herenmA
a
esacd ,st)rsutestcases/testcases.h
t;t
c      :t       r_ru| c95t| x                     ^su
_:ta tnote:  eaforward declaration of 'struct _aarch64_ctx'
testcases/testcases.h_ra
)      :c85a;| h:       ^r
643c4         | :                       ^~~~~~~~~~~~~~~~~~~~~~~~ h_695
note: c4 | expanded from macro 'GET_RESV_NEXT_HEAD't_
scxtestcases/testcases.httestcases/testcases.hat:x    :t85i c*85106 | :* )i=
:        4315g(ent:( :s( _lnote: tcerror: hiincomplete definition of type '=
struct _aarch64_ctx'expanded from macro 'GET_RESV_NEXT_HEAD'hrenu
aaercd t e*s   r_106a)   a(t(r | 85rhsu        t | c        )h c+        r(=
6t 4 o_ufs(fh_)accts-atrrt > su_cax+ic=3Dth  ah z6_4r_ec*teacaar)x) hc6d4(_
(cct*hgh-      x>ae6rt4| _ cst xi_                                         =
     ~~~^h*
h **zeea)d)(e(testcases/testcases.ha(ehr:); dc,(95s
+h       :utiarnr  | *22)tu(                        ~~~~^:(h3c2
ri95+mcza:g ihce22   ,6):95=20
4note:      =20
h                     ^)| -                                               ~=
~~^t
a>*s
tihz   iecea95 testcases/testcases.h)di |=20
:s,n      95| t                                              ~~~^=20
l:aui22itn:nei t testcases/testcases.hc:note:  3s95forward declaration of '=
struct _aarch64_ctx'2it:n
_r22ltuic:t  n    In file included from _testcases/testcases.camnote: ea95:=
aforward declaration of 'struct _aarch64_ctx'r
cIn file included from 6   testcases/testcases.hrt,a4:9515u:
tc
_ | /usr/include/x86_64-linux-gnu/asm/sigcontext.hi:t      csct317x | testc=
ases/testcases.ht  :*_                     ^:aig8ea
107a:tntil:ir10_cnh  icn:eeerror: hredefinition of 'sigcontext'l
tcr | eeur c(ststst tr  uxt_ rc*107rautc g | uatcr __e        tt caaa      =
  s_ihrahhg6eccrao4ehca6ddn_thctestcases/testcases.ht4x  =3De e6x:t_*cGtrx4=
 107* ghEe(a_d:{e
T      sc,10t:_| Rtt x_u i       ^error: Eincomplete definition of type 'st=
ruct _aarch64_ctx'Sr hn
tV
_u*e3/usr/include/x86_64-linux-gnu/bits/sigcontext.hNcga2:E139t:ed_e  tX8T =
tr_107 :__(HaE | a        m rhsA        anote: cethDhgprevious definition i=
s hereard6(e4hi
ucecra  _e,t(ds139tcrat
e      Ea_u| Tda,c                       ^~~~~~~~~~~~~~~~~~~~~~~~_aR _t
crtEcuStestcases/testcases.hi xhV6_:N485_:ctx *heans tE43Xdi*3:T2_,gh  u_Hc=
enote: aiexpanded from macro 'GET_RESV_NEXT_HEAD'Etodn
A n,t D3(mtua   285h_eittestcases/testcases.h g | e        axn:mt1093i(dta:
2      cs)gti10_r| u       ^,;:ctc=20
m
a      g| i                     ^c
,
|                              ^~~~~~~~~~~~~~~~~~~~~~~~_| aincomplete defin=
ition of type 'struct _aarch64_ctx'a
testcases/testcases.hc:h856:4  43_109:c |  t        note: xi expanded from =
macro 'GET_RESV_NEXT_HEAD'f
* )((h(ec   haa85dr | -         >*(m)sa(tghri)ucc  t+=3D  =3D(_ ham)aartest=
cases/testcases.hc-g:h>109i6stestcases/testcases.h:4c10_i:): c tzx109{e:err=
or: 10 :
*       )incomplete definition of type 'struct _aarch64_ctx')error:=20
|=20
(incomplete definition of type 'struct _aarch64_ctx'            ~~~~^      (
| c                                                ~~~^h109
a | testcases/testcases.h          :109rtestcases/testcases.hi95 | :testcas=
es/testcases.h ::        f107*9522)i (:::fh()1022  h :+:note: (eh   note: f=
orward declaration of 'struct _aarch64_ctx'forward declaration of 'struct _=
aarch64_ctx'
e
a(derror: -aincomplete definition of type 'struct _aarch64_ctx'h>   d
ne mmn      laaal| idgg i                                              ~~~^=
niic=3Dn
ec))  e{   Gtestcases/testcases.h
:      sst{rEu95c| :t22
Tt            ~~~~^_r:      =20
_Ru | testcases/testcases.ha:Ecnote:             ~~~~^a95
Stforward declaration of 'struct _aarch64_ctx'Vr:_=20
Nc22Eh_6:testcases/testcases.hXa 4:_T   anote: 95c95t_:r22forward declarati=
on of 'struct _aarch64_ctx' | xsHc:h
chaht i* geecaaedti)    idn_;n95e | lhs
lrietn      ai(taed | ensitsr                       ^~~~~~~~~~~~~~~~~~~~~~~=
~urcec ts
t(rt  r_sautestcases/testcases.hiutacrc:nr85ut:ctl cit  43_h_na_a:rac6aera =
a h4note: 6cr4cs_expanded from macro 'GET_RESV_NEXT_HEAD'h_6h4tc_
c6trtctx *hea4d_xu c*t _xa   ,c85h at  | e*rxu         agci*(ndt,ehg6s3 teu=
4t2_rti___htuenhtce tmca3axa td2 dg_*e_ageiert(arct sr(,_mtacs
hhrgetar      d| 6                     ^uiuce,4r
cc
_(tt      c| s                       ^tt_
_xara aaur*crtc)c h(h_66a4(a4r__ccccthhxt6ax 4r*  _**hc)htex(etestcases/tes=
tcases.haa h:dd*),109,:h10 e  :u+ aui nIn file included from terror: di(tes=
tcases/testcases.c3incomplete definition of type 'struct _aarch64_ctx',n
-merror:  acg      >invalid application of 'sizeof' to an incomplete type '=
struct _aarch64_ctx'm,aig| imc
a
c                                              ~~~^,g      ,
i|=20
testcases/testcases.h| |  101=3D | :=3D                     ^              =
       ^
i95 f:m22 a:(g !inote: hcforward declaration of 'struct _aarch64_ctx'e)
a d{=20
|      | |            ~~~~^   =20
95r | testcases/testcases.hestestcases/testcases.h:s109t:v:95a10:t_:s 22zer=
ror: i:  incomplete definition of type 'struct _aarch64_ctx'note: c
<forward declaration of 'struct _aarch64_ctx' =20
iHn  Dl109Ri | _n           S95eZi ) | f
sstt r      a(u| tchi                               ^~~~~~ect
a  d_-ia>natestcases/testcases.hlmra:cign28ehi 6:cs 4=3D2=3Dt _rmca:guict c=
txnote: ) expanded from macro 'HDR_SZ'  *{_g
e      at| a_            ~~~~^rh
ceha   d6testcases/testcases.he4:28r_95 | (c:        st22sxt :ri* gueztnote=
: _cforward declaration of 'struct _aarch64_ctx'e
htoe fa_(dastestcases/testcases.h   e95atr:r | (rsct129suhr:tca6tu7t4 c:ti =
c__c error:  aitn_xaincomplete definition of type 'struct _aarch64_ctx'aarl=
r c
hci6h*6nhe4 4se_tacrdu  t,129 cx | u         *t        ihte anda,_ ta_aicru=
ci3ntlh26tx-4__3t2)>cm _
tamtg      xa i|  g*mig        ^     ~~~~~~~~~~~~~~~~~~~~~cac e
g,=3Dtestcases/testcases.ht :i0
;_
129h      testcases/testcases.hc      :e7| :testcases/testcases.h:,|=20
a                     ^                ~~~~^ :129
95:d7      :|=20
:incomplete definition of type 'struct _aarch64_ctx'22e testcases/testcases=
.h
:error: rincomplete definition of type 'struct _aarch64_ctx': (note:=20
95s:forward declaration of 'struct _aarch64_ctx't  22
129 r: |            iunote:         129forward declaration of 'struct _aarc=
h64_ctx'    | n95ct
nue  *s;      tc| rt                ~~~~^u=20
c_error: ah
te incomplete definition of type 'struct _aarch64_ctx'aatestcases/testcases=
.hr      _
d:c| a,a95h                   ~~~~^r:6c22hu109
4:6i4 | testcases/testcases.h_ cn_:        tnote: xtc95t:iforward declarati=
on of 'struct _aarch64_ctx' f*3x22
amdshtea-   earat(gs>95ditim | earcr( csg,isuti
ntcatc       lrti n_=3D| uieac =3Ds                     ^tctrau=20
t c      hr6*| h            ~~~~^e64aud
c4_,t_c  cut_tixaxn a t*r*3gch2ehe_ta6t_d4 h,_me caautgdixien crt*,(3g
s2e      t_t| rt_                     ^u h
cmetaa gd_iecra,(a
sr      testcases/testcases.h| tc                     ^rh:6
u495c_:ct22t :x_  anote: *aforward declaration of 'struct _aarch64_ctx'rh
ceha6d4,_ cutixn   t 95*3 | htestcases/testcases.h2es_:at130dt:a7, : tm uii=
error: anincomplete definition of type 'struct _aarch64_ctx'gcit
t130      l  | | m                             ^a       =20
igtnaieic l,testcases/testcases.hs-
:>      t104s| r:i                     ^u27zctestcases/testcases.h
:e:t 129  testcases/testcases.h=3Derror: ::130_7 invalid application of 'si=
zeof' to an incomplete type 'struct _aarch64_ctx':0
a;:a
7 r      error: c:testcases/testcases.h :|   incomplete definition of type =
'struct _aarch64_ctx'herror: 1306:                ~~~~^104
incomplete definition of type 'struct _aarch64_ctx'4
7 | _testcases/testcases.h:        c :werror:   incomplete definition of ty=
pe 'struct _aarch64_ctx't95hx  130
: | i l12922        *  eg | :        130 t aei        note:  | (tl        f=
orward declaration of 'struct _aarch64_ctx'        o        _t-
>tsfafhsieai za   li<ed95-el=3D  | >r- =3Dsst(i>r aszetemr0ts vau;i=3D_ g
ccs0      ;| it z
n-|                  ~~~~^ H_=3Dltestcases/testcases.h
:D95a i:Rntestcases/testcases.htestcases/testcases.ha:0r12922_c:e:;95:S: hn=
ote: 7forward declaration of 'struct _aarch64_ctx'=20
Z       22&6&:4
s| t:
tnote: 95c | tincomplete definition of type 'struct _aarch64_ctx'          =
                        ^~~~~~_xaforward declaration of 'struct _aarch64_ct=
x' testcases/testcases.hs:
a
*t95testcases/testcases.hrhcah::22e:  at6   2895  | 129id4:,note: sforward =
declaration of 'struct _aarch64_ctx' | c        _2 :t=20
a         icnulnote: texpanded from macro 'HDR_SZ't
tiii   c95a | xnn    is et 28ilt*s3t | n        -agr2elsii>tu_tnzmiact_ee g=
ct  hosit riumefacd_nacat(gs ielra t=3Dc i,(r_rau0ac;n
scr      te        _| ahtcr| s                ~~~~^ta
rr6hu                     ^ucch46ctestcases/testcases.h
:t956_4t_: 4c_ c_22_t:ctaaaxr  txacnote: *x rhforward declaration of 'struc=
t _aarch64_ctx'g)*
gc6h
e      e46_t| c_th4        ^     ~~~~~~~~~~~~~~~~~~~~~t_
e_axc h*   dtetestcases/testcases.hhee95xa | r:a95 dd,se(tr:*(g sattertuiiu=
n_chceta3t2 _d eitn _rl(msaiaartcrsnguhceti6  s_tc4rta,_urau
rcctcx      ctt  *| hhe _                     ^a
a6ra_cah46da_4,_rcc cthxt6u x*4ig e_tn_*tchh3tee2xaa_d d*the, re mu(aaisdgn=
t,r iutuic3c,tn2t
hm6t4a g_micactg,xi
| d                     ^,
ct testcases/testcases.h_:130:7: error: incomplete definition of type 'stru=
ct _aarch64_ctx'
e =3D 0; =20
130       | |                         ~~~~^       =20
taialtestcases/testcases.ha-:>95sri:z22e:  =3Dnote:  forward declaration of=
 'struct _aarch64_ctx'0
;
testcases/testcases.h:   9595: | 22s:t anote: tforward declaration of 'stru=
ct _aarch64_ctx'i
c inline st   r95u | cstt a_taiacr cihn6lci4h_n6ec 4stt_rxtestcases/testcas=
es.hu:cc t*x129gt e*: 7t:g __eerror: ahtincomplete definition of type 'stru=
ct _aarch64_ctx'a
e_rahcdehea6rd  4(e129_sr | t        rcu(c        tttxs ta _*riaulag-ectr>c=
mth _a6g_hae4a_ricahc6cd et4x_=3Dcr  t(x*0s h*;h22te
e      r| :aadu,                ~~~~^  dc,
unote: t forward declaration of 'struct _aarch64_ctx'i ntestcases/testcases=
.hu
t_:a95i3n2a_:tt3 rm222a:_cg th inote: 6forward declaration of 'struct _aarc=
h64_ctx'm
gt   s95       | ixt | *shtce,a                     ^a
at
dti      ,ic|  c                      ^iun ilin
intnl3ei2 n_sett r sumtcartgu ic_cat,a=20
r_      c| ah                     ^a6
r4c_hc6t4x_ c*tgxtestcases/testcases.he :t*_106hge:e15at:d_ eherror: reinco=
mplete definition of type 'struct _aarch64_ctx'(a
sdterru(cstt r_uacatr c_ha6a4  r_106cc | ht        6x        4 o_*fchftesxa=
  d+*,=3Dh  euhaiedna,td -3u>2is_nittz 3em2;a_
gt      i | cm                        ~~~~^,a
g      i| c                     ^testcases/testcases.h,
:
95      :| 22                     ^:
testcases/testcases.h   :95130 | :s7t:a terror: iincomplete definition of t=
ype 'struct _aarch64_ctx'c
t      x|                  ~~~~^*
gtestcases/testcases.he:testcases/testcases.ht105:_:95h13e::a22 d:error: e =
incomplete definition of type 'struct _aarch64_ctx'rnote:=20
(forward declaration of 'struct _aarch64_ctx's
truct _a  a105   r | 95c         | h s6 t4 a_ tc it cx   hi*enhaledia-nd>e,=
m  ausgitinrctu 3c!2t=3D_  _tma aamgraicgchi 6c&4,&_
(      s| t               ~~~~^r
uct _atestcases/testcases.ha:r95c:h226:4 _note: cforward declaration of 'st=
ruct _aarch64_ctx't
x *head, ui   n95t | 3s2t_att imca giincl,i
n      e|                       ^s
truct _atestcases/testcases.ha:r107c:h106:4 _error: ctincomplete definition=
 of type 'struct _aarch64_ctx'x
a      d| ,                       ^~~~~~~~~~~~~~~~~~~~~~~~=20
uint3testcases/testcases.h2:_85t: 43m:a gnote: iexpanded from macro 'GET_RE=
SV_NEXT_HEAD'c
,
*)((char *)  (105h | )         +   ( h) - > s ihzeea)d
-      | >                                              ~~~^m
agic !=3D mtestcases/testcases.ha:g95ic: 22&: &note:  forward declaration o=
f 'struct _aarch64_ctx'h
ead->magi   c95) |  s{t
a      ti| c                                       ~~~~^ i
nline sttestcases/testcases.hru:c95t :_22aa:r chnote: 64forward declaration=
 of 'struct _aarch64_ctx'_
ctx *get_header   (s95t | rusctt a_ataricch6 4i_cntlx i*hneaed , sutirntu32=
c_tt  m_agaiacr,
c      h| 6                     ^
4_ctx *get_header(struct _aarch64_ctx *head, uinttestcases/testcases.h3:109=
2:_10:t  error: incomplete definition of type 'struct _aarch64_ctx'm
agic  ,109 |=20
head->magic =3D=3D magic) {
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_=
ctx'
testcases/testcases.h:106   :9515 | s:t aterror: iincomplete definition of =
type 'struct _aarch64_ctx'c=20
inline st  r106uc | t         _        aaorfchf6s4 _c+t=3Dx  *hgeeta_hde-ad=
>esr(istzreuc;t
ch64_ctestcases/testcases.htx: 95*h:e22ad:,  unote: iforward declaration of=
 'struct _aarch64_ctx'nt
32_t magic,
testcases/testcases.h:107:10: error: incomplete definition of type 'struct =
_aarch64_ctx'
testcases/testcases.h:85:43: note: expanded from macro 'GET_RESV_NEXT_HEAD'
*)(h) +   (129h | )        -        >tsaiizle)-
>      m| a                                              ~~~^g
ic =3D testcases/testcases.h0:;95
:      22| :                ~~~~^=20
note: forward declaration of 'struct _aarch64_ctx'
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_=
ctx'  =20
95 | static i   n95l | isntea tsitcr uicntl i_naea rscthr6u4c_tc t_xa a*rgc=
eht6_4h_ecatdxe r*(gsettr_uhceta d_eara(rscthr6u4c_tc t_xa a*rhceha6d4,_ cu=
tixn t*3h2e_atd ,m augiinct,3
2      _| t                     ^=20
magic,
testcases/testcases.h:130:7: error: incomplete definition of type 'struct _=
aarch64_ctx'
ze =3D 0;
if (testcases/testcases.hh:e95a:d22-:> mnote: aforward declaration of 'stru=
ct _aarch64_ctx'g
ic =3D=3D mag   i95c | )s t{a
t      i| c            ~~~~^=20
inlinetestcases/testcases.h :s95t:r22u:c tnote:  forward declaration of 'st=
ruct _aarch64_ctx'_
aarch64_ctx    95* | gsetta_tic inline struct _haeaardcehr6(4s_tcrtuxc t* g=
_eata_rhceha6d4e_rc(tsxt r*uhceta d_,a auricnht6342__ctt xm a*ghieca,d
,       | u                     ^i
nt32_t magic,
testcases/testcases.c:testcases/testcases.c:9:36: warning: declaration of '=
struct extra_context' will not be visible outside of this function [-Wvisib=
ility]
9:36:     warning: 9declaration of 'struct extra_context' will not be visib=
le outside of this function [-Wvisibility] |=20
bool vtestcases/testcases.cal:idate_ext    r9a | _bcooonl9 t:ve36ax:lt i(wa=
rning: dsdeclaration of 'struct extra_context' will not be visible outside =
of this function [-Wvisibility]at
treu_ctestcases/testcases.cet:x 9te:rx    36at9r:_ | a c_bwarning: odeclara=
tion of 'struct extra_context' will not be visible outside of this function=
 [-Wvisibility]coonn
toetlxe txv ta*(els    ixt9dtr | arubctao,t eo c_lehe xaxvrt tra*ral*ae__ic=
rdcro,ona
n      t| t                                   ^tee
exx_tte (x*stetrxratu_rcctao ,en txcethxratar(_ cstestcases/testcases.c*ot:=
*9nret:ur36e:crxt,  twarning:=20
edeclaration of 'struct extra_context' will not be visible outside of this =
function [-Wvisibility]       x
| *t                                   ^er
xat_rc    ao9,n |  tbceohxoaltr   v**a*elexirdtrra,testcases/testcases.cat
:,e       testcases/testcases.h9_c| h::e                                   =
^xat12936
:rr:  a7warning: *_:declaration of 'struct extra_context' will not be visib=
le outside of this function [-Wvisibility]*c=20
eoerror: rnincomplete definition of type 'struct _aarch64_ctx'rt
,e
x      t| (                                   ^s
t    r  9u129 | c | bt        o         oetlxa tviralal-_i>cdmoaantgteie_ce=
x xt=3Dt  r*0ae;_x
ct      or| na                ~~~~^t,
xforward declaration of 'struct _aarch64_ctx'      t
| r                                   ^a
_context    95* | exsttraa,t ichca ri *n*leirnre,
uct _aarch64_ctx *get_header(struct _aarch64_ctx *head, uint32_t magic,
testcases/testcases.h:130:7: error: incomplete definition of type 'struct _=
aarch64_ctx'
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_=
ctx'
testcases/testcases.c:18:testcases/testcases.c34::9 :error: 36incomplete de=
finition of type 'struct extra_context':
36N:_E cXwarning: oTdeclaration of 'struct extra_context' will not be visib=
le outside of this function [-Wvisibility]_n
HtEeA   xD18t( | (&            set9te | testcases/testcases.cx:rtrb18ouorlm=
a:c  v-34t:=3D aerror: testcases/testcases.ctestcases/testcases.c:> h elinc=
omplete definition of type 'struct extra_context':
18e:xGaEi1834dta   d18T | _:R:ErSat_)e        _34e Verror: cincomplete defi=
nition of type 'struct extra_context';
t:x _tNoE
Xeerror: rn      T|    rincomplete definition of type 'struct extra_context=
'mat_                                   ~~~~~^18
h_aamEtNrr-u TE _    R>Ec=3DX* T9h | Sbt*G_EeTV__oe HaRNorerE,xdt)r;a
_      |                                    ~~~~~^
EElA
c      SoX TD| V                                   ^n_testcases/testcases.c=
v_(
tN:aH&leE9EeixdXaT:_AHxtEtA36DDt e:((&r*_a &eeee-xnote: txrtaxr_testcases/t=
estcases.cacx>thforward declaration of 'struct extra_context'eta:d-18>or
r):ah-e>naa;34,:    t9eh | d
|=20
ml36e:e :note:  forward declaration of 'struct extra_context'i
rdxa9ttestcases/testcases.c=3Drt    ,:r:36 :e9
a9      G Enote: _forward declaration of 'struct extra_context' | _:b| oT  =
                                 ^_e
cx36o
Rlo tv:a    lEinSr a9d | abtoeol validtVenote: x_tc_oaenx_forward declarati=
on of 'struct extra_context' tt*etN
eex_tr(aExes_t    rXtTx_cH9ourtarE,A  | cncatDhbt_ c(aoreoeolx& x*t*(esrtrr=
,un tvrea
xcttal_      rte xicdo| aetant                                   ^-x(te
_>tesexthreraxtudcat_rc)a;t o_n
t *ece      x| x                                   ~~~~~^teroxatestcases/te=
stcases.ct_=20
*ntt:rceoe18xat,testcases/testcases.cxn:(t :c9t:3436:s:ehxra t rtuar, error=
: *note: * ec tincomplete definition of type 'struct extra_context' forward=
 declaration of 'struct extra_context'
*rerc,e
xx   h      a    rtt18rr|  9 | aa,                                   ^* |  =
       _=20
c*btcheoareororlrmn t ,ev a*l
*x=3Di      et d | *                                   ^eGxratestcases/test=
cases.c
tErrt:T,ae18_
R      E,| _                                   ^:e S
c34hVx:a_trNr a E_testcases/testcases.cerror: *Xc:incomplete definition of =
type 'struct extra_context'*To18n
e_t:testcases/testcases.cerH34::x18rE   A t:,3418
Derror: (incomplete definition of type 'struct extra_context' |=20
e_
R        xtrtE   eSuVr_18arc | N-Emt         >tXh =3DeeearTd xm_)HGt rtestc=
ases/testcases.c;:E
E=3DTa_18R:A34      :  _EcDS(| &Gerror: oV                                 =
  ~~~~~^eExincomplete definition of type 'struct extra_context'Tn_t
Nt
_eErRXxtestcases/testcases.caE:Tt   -18S9V_testcases/testcases.cH E>A | :  =
      _t:e*18r:m34 :=3D  hD36Neerror: GeE(T:_E xincomplete definition of ty=
pe 'struct extra_context'a&dR)XEnote: tforward declaration of 'struct extra=
_context'r
e;TS
ax
_V,t_      H rc    hNa   r|                                     ~~~~~^E
a9E18*A- | Xb | *Dtestcases/testcases.c(>Toh        eea:&_otdre9eHl)rr,:xE =
;m
D=3D(l i
aforward declaration of 'struct extra_context'&GedE-
xtestcases/testcases.caT>_    tRr:at-h9E9>e:e | 36ShVe__abN:aedoxodtE )l);r=
Xanote: testcases/testcases.c ;
T_forward declaration of 'struct extra_context':
v19            :_19c:a| l                                   ~~~~~^i| dH    =
                               ~~~~~^o     error:=20
9a | E
Anincomplete definition of type 'struct _aarch64_ctx't
betestcases/testcases.cD:t(etestcases/testcases.co:_99e   &xxtor:a36:e19tl_=
:36c | xo        (i f v:atlnits t(note: ! rderxforward declaration of 'stru=
ct extra_context'tt(note: aaforward declaration of 'struct extra_context'u
cesrt-t>tme         hr _9e9xeu|c|e  | t | tatxdbebrr t)eoxotmoar;o
r-al>__aclo       mvca_n t| aolcnev                                   ~~~~~=
^g
iotxaidcnettlai testcases/testcases.c|x|e  xtd:tt*etrem_a9t ee_(-es:t*rxeu>=
csxi36t:re txnote: tzforward declaration of 'struct extra_context'ea
)_x rt ct{raraeox
r( ot*l*osnt*rtestcases/testcases.he xetvrtru*,c
:      (aseetr95 | ltxr:e                                   ^,22x
t
r:a       _| note:                                    ^cforward declaration=
 of 'struct _aarch64_ctx'
o
ntext *extr   a95, |  scthaatritestcases/testcases.c c:* 9*it:en 36rl*:rei =
,warning: xn
tedeclaration of 'struct extra_context' will not be visible outside of this=
 function [-Wvisibility]r      =20
a| s,                                   ^t testcases/testcases.c
rcutestcases/testcases.c:hca    :919rt19 | :  *:_b19o19:*ao: ealr error: r =
ctestcases/testcases.crverror: incomplete definition of type 'struct _aarch=
64_ctx':h,a
19incomplete definition of type 'struct _aarch64_ctx'
6l:
ga6_ c zi   4c_tcetoce19 rxn )h  | {|mt*a        r
|-e>hi        | xsefa*dt,                     ~~~~^ tui  *(*ee
rirzee!rn,tx3)t testcases/testcases.ht:m95
2r{_et-r:      22a
|forward declaration of 'struct _aarch64_ctx'izcr|=20
testcases/testcases.he, *t:)e
*95e: 22r:         r{rm -| >                     ^95
, | note:=20
m
ag| t                                   ^itestcases/testcases.h
ic:c fatal error: |   |9595  testcases/testcases.citoo many errors emitted,=
 stopping now [-ferror-limit=3D] | :
t:ns22tea19l:irt: 19n:m inote: error: e-cforward declaration of 'struct _aa=
rch64_ctx'incomplete definition of type 'struct _aarch64_ctx'=20
s>=20
tsriiunc   tzl19i    |  en95_)a         ie | a{f srt
c _rticm t_na lxi a*rg|etestcases/testcases.hnc|t term->magic || t:he_eh6 9=
5rem:4s_tcrtuxc *get_header(stra-22>t:sud  iczee_)note:  t{r
a      forward declaration of 'struct _aarch64_ctx' (
a| r_cs                     ~~~~^atah
rr6uc4c   h_testcases/testcases.ht:956c95 : | 4t__a22xscatr:x  note: *tc fo=
rward declaration of 'struct _aarch64_ctx'aht6*i
4hc_e cagit   denx95 ,*thle |  _iasnuhdteie,a tnat dsi3cu etr2riiun(_ncltis=
tt3n2t_r u cet_ mt  m_aaaagsiaca,rtcrghur
ci6c4      h| ct_ 6                     ^,
c_4
t      a| _                     ^x
ac rt*cxfatal error: hh too many errors emitted, stopping now [-ferror-limi=
t=3D]6
e*4agfatal error: _detoo many errors emitted, stopping now [-ferror-limit=
=3D],t
rc      h| 6                     ^4
_ctx *hcead, uitntx3 2*_tfatal error: g too many errors emitted, stopping n=
ow [-ferror-limit=3D]em
ta_gihce,a
d      | e                     ^r
(struct _aarch64_ctx *head,fatal error:  too many errors emitted, stopping =
now [-ferror-limit=3D]u
int32_t magic,
fatal error: too many errors emitted, stopping now [-ferror-limit=3D]
testcases/testcases.c:18:34: error: incomplete definition of type 'struct e=
xtra_context'
testcases/testcases.c:9:36: note: forward declaration of 'struct extra_cont=
ext'
testcases/testcases.c:18:34: error: incomplete definition of type 'struct e=
xtra_context'
testcases/testcases.c:9:36: note: forward declaration of 'struct extra_cont=
ext'
testcases/testcases.c:19:19: error: incomplete definition of type 'struct _=
aarch64_ctx'
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_=
ctx'
fatal error: too many errors emitted, stopping now [-ferror-limit=3D]
idate_extra_context(struct extra_context *extra, char **err,
testcases/testcases.c:18:34: error: incomplete definition of type 'struct e=
xtra_context'
testcases/testcases.c:9:36: note: forward declaration of 'struct extra_cont=
ext'
testcases/testcases.c:19:19: error: incomplete definition of type 'struct _=
aarch64_ctx'
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_=
ctx'
fatal error: too many errors emitted, stopping now [-ferror-limit=3D]
1 warning and 20 errors generated.
1 warning and 20 errors generated.
1 warning and 20 errors generated.
1 warning and 20 errors generated.
1 warning and 20 errors generated.
1 warning and 20 errors generated.
1 warning and 20 errors generated.
1 warning and 20 errors generated.
signals.Ssignals.S:16:19: error: expected ']' in brackets expression
:16 stp x29, x30, [sp, #-16]!:
19 :  error:  expected ']' in brackets expression=20
signals.Ssignals.S:16:19: error: expected ']' in brackets expression
:16: stp x29, x30, [sp, #-16]!19
:  error:  expected ']' in brackets expression=20
signals.Ssignals.S:16:19: error: expected ']' in brackets expression
16 : 19 :   error:  expected ']' in brackets expression=20
signals.S:16:19: error: expected ']' in brackets expression
signals.S:16:19: error: expected ']' in brackets expression
signals.S:17:2: error: unknown use of instruction mnemonic without a size s=
uffix
signals.S:17:2: error: unknown use of instruction mnemonic without a size s=
uffix
signals.S:19:2: error: unknown use of instruction mnemonic without a size s=
uffix
signals.S:20signals.S::2: 19error: :unknown use of instruction mnemonic wit=
hout a size suffix2
:  mov x21, x1error:=20
unknown use of instruction mnemonic without a size suffix=20
^ mov x20, x0
signals.S:21:2: signals.Serror: :unknown use of instruction mnemonic withou=
t a size suffix20
: mov x22, x22
:  error: ^unknown use of instruction mnemonic without a size suffix
signals.S:21:2: error: unknown use of instruction mnemonic without a size s=
uffix
signals.Ssignals.S::1724::22: : error: error: unknown use of instruction mn=
emonic without a size suffixunknown use of instruction mnemonic without a s=
ize suffix
signals.S
: mov x29, sp add x0, x21, x2224
:  2^^:=20
error: signals.Sunknown use of instruction mnemonic without a size suffixsi=
gnals.S
signals.S:: add x0, x21, x22:signals.S1717
25 :^2:::
14: 217: :error: : signals.Ssignals.Serror: :unknown token in expression2un=
known use of instruction mnemonic without a size suffixerror:=20
:19
:: unknown use of instruction mnemonic without a size suffix25
2error: : mov x29, sp14
error: ^
unknown token in expression mov x20, x0
17:2: error: unknown use of instruction mnemonic without a size suffix
^ =20
::signals.S262::: signals.S19:error: 14:26unknown use of instruction mnemon=
ic without a size suffix: 2:
error: signals.S:  mov x21, x1error:=20
14unknown token in expression: :signals.S19unknown use of instruction mnemo=
nic without a size suffix: 19^error:=20
unknown token in expressionsignals.S::2
: mov x20, x02
:  error: ^unknown use of instruction mnemonic without a size suffix
signals.S:20:2: signals.S:20:2: error: unknown use of instruction mnemonic =
without a size suffix
unknown use of instruction mnemonic without a size suffix bic x0, x0, #15
: error: =20
signals.S 2 unknown use of instruction mnemonic without a size suffix:  err=
or:  mov x21, x1unknown use of instruction mnemonic without a size suffixsi=
gnals.S
:=20
:  ^
2 :   :signals.S
error:   unknown use of instruction mnemonic without a size suffix 2:  20=20
error:  unknown use of instruction mnemonic without a size suffix20signals.=
S:22 ^^
: mov x22, x2: : error: ^error:=20
unknown use of instruction mnemonic without a size suffix21
^=20
^2
:=20
error:  signals.Sunknown use of instruction mnemonic without a size suffix^:
24 mov x22, x2:
signals.S2 :: ^21error:=20
:unknown use of instruction mnemonic without a size suffix2
:  add x0, x21, x22error: signals.Ssignals.S:
21unknown use of instruction mnemonic without a size suffixsignals.S:: 27:
224^:: mov x22, x2:=20
22
: error:  : ^error: unknown use of instruction mnemonic without a size suff=
ixunknown use of instruction mnemonic without a size suffixsignals.S
error: signals.Ssignals.Sunknown use of instruction mnemonic without a size=
 suffix
: add x0, x21, x22:
:
25 27
::2 :^ 2^: 14
^signals.S:=20
:: error: error:=20
error: 24unknown use of instruction mnemonic without a size suffixsignals.S=
unknown token in expressionunknown use of instruction mnemonic without a si=
ze suffix::signals.S
: :28=20
:: 24 add x0, x21, x22 ^
: :error: 2error: :=20
unknown use of instruction mnemonic without a size suffix error: unknown to=
ken in expressionsignals.S=20
:^ add x23, sp, x22  add x0, x21, x22 add x0, x0, #1525
signals.S:
: =20
:
2:unknown token in expression=20
: 25
:14
error: =20
^
error: 26 ::  unknown token in expression =20
1426: : 14 :   ldr x0, =3Dcall_fmtsignals.Serror: ^unknown token in express=
ion=20
error:  bic x0, x0, #15=20
:
:  error: 26   =20
unknown use of instruction mnemonic without a size suffix:
: signals.Serror:  unknown token in expression ^  :
: signals.S=20
: =20
^::  bic x0, x0, #15error: 32
2unknown use of instruction mnemonic without a size suffix:
error:  :  error:  unknown use of instruction mnemonic without a size suffi=
x^=20
signals.S:28:2: error: unknown use of instruction mnemonic without a size s=
uffix   =20
27^signals.Ssignals.S^:
:
:2732signals.S:2::22: signals.S: : 30error: error: unknown use of instructi=
on mnemonic without a size suffix:
error:  mov x2, x23:unknown use of instruction mnemonic without a size suff=
ixunknown use of instruction mnemonic without a size suffix33
10=20
^: sub sp, sp, x0 sub sp, sp, x0
:  signals.Serror: ^
2
:unknown token in expression27
signals.S: : 27: ldr x0, =3Dcall_fmterror: :^22
invalid instruction mnemonic 'bl'=20
: :=20
error:  unknown use of instruction mnemonic without a size suffixsignals.Ss=
ignals.S:error:  bl printf=20
33=20
:2 : 2  sub sp, sp, x028
: :error: ^^:   ^2
unknown use of instruction mnemonic without a size suffix~
error: ^:=20
invalid instruction mnemonic 'bl'error:=20
unknown use of instruction mnemonic without a size suffix
^signals.S31::signals.S
2 :=20
error: :unknown use of instruction mnemonic without a size suffix2836: sign=
als.S^
: mov x1, x21:28^:~302
2:
:: 10error:  : ^2error: : unknown use of instruction mnemonic without a siz=
e suffixsignals.S
: unknown use of instruction mnemonic without a size suffixerror: error:=20
signals.S: add x23, sp, x22unknown use of instruction mnemonic without a si=
ze suffix
unknown token in expression  mov x0, x23:
3630
signals.S
^ :: add x23, sp, x22:
32signals.S::
30
: : error: 2unknown use of instruction mnemonic without a size suffix: sign=
als.S : error: 10unknown token in expression
signals.Serror:  mov x0, x23::37 : =20
unknown use of instruction mnemonic without a size suffix30
: mov x2, x232error: :  ldr x0, =3Dcall_fmt=20
unknown token in expression=20
^error:  ldr x0, =3Dcall_fmt=20
unknown use of instruction mnemonic without a size suffix signals.S :   err=
or: =20
^signals.S
:33:2: error: invalid instruction mnemonic 'bl'
2=20
2 :  ldr x0, =3Dcall_fmt: ^  signals.Serror: :
36error: :
2^=20
unknown use of instruction mnemonic without a size suffix unknown use of in=
struction mnemonic without a size suffix:  =20
^
unknown use of instruction mnemonic without a size suffixsignals.S :
: mov x0, x2331=20
:2 2::  : 31error: error: unknown use of instruction mnemonic without a siz=
e suffix signals.Ssignals.S::signals.S2:unknown use of instruction mnemonic=
 without a size suffix
^:32: :372:
:error: 2: : 2
^ mov x2, x23 mov x2, x21
signals.S :
error:  mov x1, x21
unknown use of instruction mnemonic without a size suffix=20
:^
signals.S2: mov x1, x20: signals.S
39: error: signals.S::392^:unknown use of instruction mnemonic without a si=
ze suffixsignals.S32: signals.S2
:=20
: mov x1, x21:
error: :error: 3332invalid instruction mnemonic 'bl'signals.S 2:invalid ins=
truction mnemonic 'bl':=20
::2
: ^38error:  bl memcpy2
:unknown use of instruction mnemonic without a size suffix2
:=20
invalid instruction mnemonic 'bl': error: ^^ signals.S^
error: unknown use of instruction mnemonic without a size suffix~~:
^32~
: mov x2, x23
signals.S2signals.Ssignals.S mov x2, x21
:: :error: :
signals.S  3351unknown use of instruction mnemonic without a size suffix:
51:^36^::
2 mov x2, x23:
22: 2: :=20
error:  signals.S: :error: error: invalid instruction mnemonic 'ldr'invalid=
 instruction mnemonic 'ldr'
^error: 33unknown use of instruction mnemonic without a size suffixsignals.=
S::invalid instruction mnemonic 'bl'
239
: ldr x0, current2 bl printf mov x0, x23:=20
signals.S
error:  invalid instruction mnemonic 'bl'^
~error:  : 33^^ bl printf~
invalid instruction mnemonic 'bl'^:~
~^2
~ bl memcpy~:=20
error:  signals.Sinvalid instruction mnemonic 'bl'^
:signals.S~ bl printf36signals.S:
:signals.S:372signals.S: 52:error:  unknown use of instruction mnemonic wit=
hout a size suffix:
36:52:signals.S:2:^ mov x0, x23~:
22: 51
2: : error: :error:  unknown use of instruction mnemonic without a size suf=
fixerror: : unknown use of instruction mnemonic without a size suffix2signa=
ls.S^
:unknown use of instruction mnemonic without a size suffix str x23, [x0]
error:=20
:  str x23, [x0]error:=20
invalid instruction mnemonic 'ldr'36 mov x1, x20:unknown use of instruction=
 mnemonic without a size suffix=20
^2
^ mov x0, x23 ldr x0, current :=20
^
37
:signals.S :unknown use of instruction mnemonic without a size suffix2^: ~5=
4~
:signals.S2error: signals.S
3754signals.Sunknown use of instruction mnemonic without a size suffix mov =
x1, x20 :::252
^2
: :error:=20
error: signals.Sunknown use of instruction mnemonic without a size suffixsi=
gnals.S:37:2: error: unknown use of instruction mnemonic without a size suf=
fix
unknown use of instruction mnemonic without a size suffix mov x1, x20signal=
s.S
:
: str x23, [x0]signals.S38 mov sp, x23 56
::
^: 10 ^382
: :=20
^:
2error: : error: unknown use of instruction mnemonic without a size suffixe=
rror: unknown token in expressionunknown use of instruction mnemonic withou=
t a size suffix
signals.S mov x2, x21
signals.S signals.S mov x8, #15signals.S
: mov x2, x2138::^56
:::=20
238 54 :102: :error: ^2 : :  unknown use of instruction mnemonic without a =
size suffix
: signals.S error: error:  mov x2, x21error: : unknown use of instruction m=
nemonic without a size suffixunknown token in expression
unknown use of instruction mnemonic without a size suffix 39=20
^::39=20
2: =20
: 2^^=20
^ signals.Sinvalid instruction mnemonic 'bl'error: signals.S
invalid instruction mnemonic 'bl' :
:
39 :^
^10:: :error: error:  invalid instruction mnemonic 'bl'~39unknown token in =
expression2=20
^signals.S
::51
:  bl memcpy mov x8, #15
2 :error: signals.S
:   ^2invalid instruction mnemonic 'svc':
error:  invalid instruction mnemonic 'bl'~
: signals.Serror: 51: svc #0=20
57  :
22 ldr x0, current: ^=20
~invalid instruction mnemonic 'ldr'
:=20
~
51^ svc #0
~ ldr x0, currentsignals.S:signals.S2
:signals.S:: 51  64::error: :^^signals.S~~572invalid instruction mnemonic '=
ldr'2:~~:
2:=20
: 52 ldr x0, current
error:  error: ^:invalid instruction mnemonic 'b'2
signals.Sinvalid instruction mnemonic 'ldr'~: ~:  b .:
52error: :
2error: :=20
^
signals.S
unknown use of instruction mnemonic without a size suffix str x23, [x0]=20
^
~52~
signals.S
^2: ~^:=20
error: unknown use of instruction mnemonic without a size suffix
signals.Ssignals.S64signals.S~::::
525454:signals.S2:254::2:: : signals.Serror: invalid instruction mnemonic '=
b'
2: 2: : error: error: :unknown use of instruction mnemonic without a size s=
uffixerror:=20
error:  mov sp, x23unknown use of instruction mnemonic without a size suffix
64 unknown use of instruction mnemonic without a size suffixunknown use of =
instruction mnemonic without a size suffix
:^ str x23, [x0] mov sp, x23
^=20
: ^ signals.S^error:=20
:
56invalid instruction mnemonic 'b'signals.S:signals.S
::561054signals.S: b .2:: : :error:=20
unknown use of instruction mnemonic without a size suffix10error: 56unknown=
 token in expression=20
:  mov sp, x23:
^10
unknown token in expression=20
:  error: ^ mov x8, #15 unknown token in expression
: error: :invalid instruction mnemonic 'svc'error: 2invalid instruction mne=
monic 'svc'
:=20
error:  svc #0invalid instruction mnemonic 'svc':
57 :^ ~^~2~
^: ~~error:=20
~invalid instruction mnemonic 'svc'
64::6464:22:: : 2error: error: signals.S: invalid instruction mnemonic 'b'i=
nvalid instruction mnemonic 'b':
error:=20
invalid instruction mnemonic 'b'64
2
invalid instruction mnemonic 'b'
signals.S:17:2: error: unknown use of instruction mnemonic without a size s=
uffix
signals.S:19:2: error: unknown use of instruction mnemonic without a size s=
uffix
signals.S:20:2: error: unknown use of instruction mnemonic without a size s=
uffix
signals.S:21:2: error: unknown use of instruction mnemonic without a size s=
uffix
signals.S:24:2: error: unknown use of instruction mnemonic without a size s=
uffix
signals.S:25:14: error: unknown token in expression
signals.S:26:14: error: unknown token in expression
signals.S:27:2: error: unknown use of instruction mnemonic without a size s=
uffix
signals.S:28:2: error: unknown use of instruction mnemonic without a size s=
uffix
signals.S:30:10: error: unknown token in expression
signals.S:31:2: error: unknown use of instruction mnemonic without a size s=
uffix
signals.S:32:2: error: unknown use of instruction mnemonic without a size s=
uffix
signals.S:33:2: error: invalid instruction mnemonic 'bl'
signals.S:36:2: error: unknown use of instruction mnemonic without a size s=
uffix
signals.S:37:2: error: unknown use of instruction mnemonic without a size s=
uffix
signals.S:38:2: error: unknown use of instruction mnemonic without a size s=
uffix
signals.S:39:2: error: invalid instruction mnemonic 'bl'
signals.S:51:2: error: invalid instruction mnemonic 'ldr'
signals.S:52:2: error: unknown use of instruction mnemonic without a size s=
uffix
signals.S:54:2: error: unknown use of instruction mnemonic without a size s=
uffix
signals.S:56:10: error: unknown token in expression
signals.S:57:2: error: invalid instruction mnemonic 'svc'
signals.S:64:2: error: invalid instruction mnemonic 'b'
sve_helpers.c:13:18: error: use of undeclared identifier 'SVE_VQ_MAX'
sve_helpers.c:25:12: error: use of undeclared identifier 'SVE_VQ_MAX'
sve_helpers.c:41:12: error: call to undeclared function 'sve_vq_from_vl'; I=
SO C99 and later do not support implicit function declarations [-Wimplicit-=
function-declaration]
3 errors generated.
sve_helpers.c:sve_helpers.c13:18: error: use of undeclared identifier 'SVE_=
VQ_MAX'
:13:18: error: use of undeclared identifier 'SVE_VQ_MAX'
ed sve_helpers.c:13int vls[SVE_VQ_MAX];
:18: error: use of undeclared identifier 'SVE_VQ_MAX'
sve_helpers.c:13:18: error: use of undeclared identifier 'SVE_VQ_MAX'
sve_helpers.c:25:12: error: use of undeclared identifier 'SVE_VQ_MAX'
sve_helpers.c:41:12: error: call to undeclared function 'sve_vq_from_vl'; I=
SO C99 and later do not support implicit function declarations [-Wimplicit-=
function-declaration]
sve_helpers.c:25:12: error: use of undeclared identifier 'SVE_VQ_MAX'
sve_helpers.c      | :                  ^~~~~~~~~~25
:12: error: use of undeclared identifier 'SVE_VQ_MAX'
3 errors generated.
sve_helpers.c:41:12: error: call to undeclared function 'sve_vq_from_vl'; I=
SO C99 and later do not support implicit function declarations [-Wimplicit-=
function-declaration]
3 errors generated.
sve_helpers.c:41:12: error: call to undeclared function 'sve_vq_from_vl'; I=
SO C99 and later do not support implicit function declarations [-Wimplicit-=
function-declaration]
sve_helpers.c:41:12: error: call to undeclared function 'sve_vq_from_vl'; I=
SO C99 and later do not support implicit function declarations [-Wimplicit-=
function-declaration]
sve_helpers.c:13:18: error: use of undeclared identifier 'SVE_VQ_MAX'

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D


# Builds where the incident occurred:

## defconfig on (arm64):
- compiler: clang-21
- config: None
- dashboard: https://d.kernelci.org/build/maestro:69d3d704dcae953c056c1aa2


#kernelci issue maestro:e24f671632032692e8b0e5683b5da5aec1a14bb0

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
