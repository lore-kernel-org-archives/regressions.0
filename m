Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ACFA372EF5
	for <regressions@lists.linux.dev>; Tue,  7 Apr 2026 19:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775591951; cv=none; b=AsXWxrtvFXLreKvYSl17aFBLoaw1p+HuqKZoi/XXrxrDzZfgjm/IC2AaH4UOirtyBrGuKgT3/yMLcSxQTJbAXYZ+Eb1u+xo68R1Wzjkr+K2a9X7/d8EtB7OMbTFZMAvki7FZX2SnmRH2A5iu3yGYE00rcuw3+gygV44HsCCivK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775591951; c=relaxed/simple;
	bh=sbF7pV3PI7sunSCXBAhgP8B7ssMbONhGkkOLTTKBQiQ=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=oRXIO98a9q0T5t+X/0dkk8JwrK+4qnuaG2PyW1plUIB+9QTMZbF4jxrISs2smsaK3ltssm/9ezc5Ugyni55PdJYyXOTvTmEn/smWQo6BKCUSlQviAlYuqjPvLYItBH2hPLvU8WHWriJ79bLIuEMZoD7muE2tinFHpK8jjzv+TNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20251104.gappssmtp.com header.i=@kernelci-org.20251104.gappssmtp.com header.b=LrtvXF/s; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20251104.gappssmtp.com header.i=@kernelci-org.20251104.gappssmtp.com header.b="LrtvXF/s"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1271195d2a7so1589262c88.0
        for <regressions@lists.linux.dev>; Tue, 07 Apr 2026 12:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20251104.gappssmtp.com; s=20251104; t=1775591946; x=1776196746; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ac6vcwQWKP+Dj0bLi/8kn816LhOpMMm4rMezhCIszRA=;
        b=LrtvXF/s8SIsMTi8PaCcuVI4tU83PhyvgGt67mOSb7x3SGscHKjUKhGDLbX0vxE6cE
         /rtGYQDQQHomwpI3hJ9NlCYTl0vWPvlmKn9UZUbzfQ35OQ/uBy337Ga83wUE6kurWdw9
         3mfRUUFxn/XTt6Aq0Em+ZL8MpxRlqA7TOZ/30QAQe3yW+jIQxpvweNh7kXDKdj33sLzC
         Djo/rhJ6pYIL/qq33ifEb194A1mLmyQHfTNAmCPJyhHQEcZ1WE2s8jIv4Pe0A6FCvFIQ
         OEi1G92YgjhCKub8P6urfbhwgOPO6hMBOYZphcd3Urpdx9yS35QFJC+E+I/78lw6QbkY
         YO1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775591946; x=1776196746;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ac6vcwQWKP+Dj0bLi/8kn816LhOpMMm4rMezhCIszRA=;
        b=cd5mvpSHZm76lnW2kKPKEeJJ14N58NYuPGX4oYQkB9YZmsMH43LNRdSskpgcHLb2hh
         ac0iW1jiRpGgff3UtKVYa0VYxMwjN/9YiASmAmoRwsTtoNT5SJBqRe4ock1oOstpFavk
         wXNd++CSQSHLc53skZ9aWqCaU22gsQxl4aTuAey4OT9NMfycBID6YFW2hcA8G94LoTA1
         9z+dlCj4rUxfzli6JZgFgSlKAKDibMkZQcLH1Eo3C9G4QQowSgL88j6f2xe5AHKes4tC
         7VeMCoCDLS3MOTZh7Cb0EXYZihM34s7FPzgK0v5+aCFFmUjHdnNIkUEjLAK2K/iCRAnS
         taHw==
X-Gm-Message-State: AOJu0YzGvX5CPSEl7cpoQT6xMC5CKEgwBy8NaEDm+qfEqhJupFW8QdBi
	MwRUsR5FAk0pm96xC/oyScjlNE5tvOqNaSFakJhXjxWbKgjgGIG7d1Q+TEKbQw84DgAXLnujPlM
	hB5N1
X-Gm-Gg: AeBDietcw970dTadE8AbuK8Njb3eu6KF83UFECaFnBjkJnhimsBeFSW26JSTD202WQ5
	V5T2vBceZ7cpHf804Pmt8PavctwlltT5aLnT7nmSbZ03befhWf3VEC6S9a4GGRot6a/Gf0JL8x6
	Q5aU287z4Zff3bbsTAl9wlZxh+jKKGrFCUb7ohUB3Eeect7qNgUptzJzUiA4Ic12DSntpMH8156
	P3lsW7uw8F1pMNC3f6GhcCOEv8wRYCollCU69PXZ5B16MrypDjxmQ+POWodM4/hRlGYl9od1kXt
	ClrGR4k3FoDP2JSuTHyTZFTDHmfF3/9LNzU5+uuIJXjfDSBYYFrsqjUMopVIjwfw/yOdA2NkFBp
	M97chjihebwKxeuxWKnLVcfGf0H4h+BUsDcYENkKqWjfIGlHBQExr0UPk7t7HgQksGK0T3UjEGb
	iMZN5rHrFhncS1zXHlQVUdzHMqwlU=
X-Received: by 2002:a05:7022:260b:b0:11d:e40f:ee69 with SMTP id a92af1059eb24-12bfb77700amr9804212c88.36.1775591945450;
        Tue, 07 Apr 2026 12:59:05 -0700 (PDT)
Received: from 8692ffc4d55e ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bf90973b6sm17995430c88.9.2026.04.07.12.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 12:59:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [REGRESSION] next/master: (build) .c./test_signals.h::15:10: 14fatal
 error: :
 ./test_signals.h:15:10...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 07 Apr 2026 19:59:04 -0000
Message-ID: <177559194389.2512.4178477540375898956@8692ffc4d55e>





Hello,

New build issue found on next/master:

---
 .c./test_signals.h::15:10: 14fatal error: : ./test_signals.h:15:10: fatal =
error: 'asm/hwcap.h' file not found ./test_signals.h:15:10: fatal error: 'a=
sm/hwcap.h' file not found ./test_signals.h:15:10: fatal error: 'asm/hwcap.=
h' file not found ./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file n=
ot found ./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found =
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found ./test_si=
gnals.h:15:10: fatal error: 'asm/hwcap.h' file not found ./test_signals.h:1=
5:10: fatal error: 'asm/hwcap.h' file not found ./test_signals.h:15:10: fat=
al error: 'asm/hwcap.h' file not found ./test_signals.h:15:10: fatal error:=
 'asm/hwcap.h' file not foundIn file included from test_signals_utils.c:18:=
 ./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found ./test_s=
ignals.h:15:10: fatal error: 'asm/hwcap.h' file not found ./test_signals.h:=
15:10: fatal error: 'asm/hwcap.h' file not found ./test_signals.h:15:10: fa=
tal error: 'asm/hwcap.h' file not found ./test_signals.h:15:10: fatal error=
: 'asm/hwcap.h' file not found ./test_signals.h:15:10: fatal error: 'asm/hw=
cap.h' file not found ./test_signals.h:15:10: fatal error: 'asm/hwcap.h' fi=
le not found /usr/include/x86_64-linux-gnu/asm/sigcontext.h:40:8: error: re=
definition of '_fpx_sw_bytes'In file included from  /usr/include/x86_64-lin=
ux-gnu/asm/sigcontext.h:40:8: error: redefinition of '_fpx_sw_bytes' /usr/i=
nclude/x86_64-linux-gnu/asm/sigcontext.h:85:8: error: redefinition of '_fpr=
eg' /usr/include/x86_64-linux-gnu/asm/sigcontext.h:85:8:/usr/include/x86_64=
-linux-gnu/bits/sigcontext.h :error: 40redefinition of '_fpreg': 8/usr/incl=
ude/x86_64-linux-gnu/asm/sigcontext.h:: 91error: :redefinition of '_fpx_sw_=
bytes'8 : error: redefinition of '_fpxreg' /usr/include/x86_64-linux-gnu/as=
m/sigcontext.h:/usr/include/x86_64-linux-gnu/bits/sigcontext.h   91:40:46 |=
 8:s:8t :rerror:  uredefinition of '_fpxreg'note: cprevious definition is h=
ere /usr/include/x86_64-linux-gnu/asm/sigcontext.h:98:8: error: redefinitio=
n of '_xmmreg' t/usr/include/x86_64-linux-gnu/asm/sigcontext.hr:u98c:t8 :_ =
xerror: mredefinition of '_xmmreg'm /usr/include/x86_64-linux-gnu/asm/sigco=
ntext.h:85:8: error: redefinition of '_fpreg' s/usr/include/x86_64-linux-gn=
u/asm/sigcontext.ht:r180u:c8t:  _error: fredefinition of '_ymmh_state'p t/u=
sr/include/x86_64-linux-gnu/asm/sigcontext.hr:u180c:t8 :_ yerror: mredefini=
tion of '_ymmh_state'm m/usr/include/x86_64-linux-gnu/asm/sigcontext.hm:h91=
_:s8t:a terror: eredefinition of '_fpxreg'  /usr/include/x86_64-linux-gnu/a=
sm/sigcontext.h:192:8: error: redefinition of '_xstate' /usr/include/x86_64=
-linux-gnu/asm/sigcontext.h:317:8: error: redefinition of 'sigcontext' /usr=
/include/x86_64-linux-gnu/asm/sigcontext.h:317:8: error: redefinition of 's=
igcontext' testcases/testcases.h:101:25: error: invalid application of 'siz=
eof' to an incomplete type 'struct _aarch64_ctx' testcases/testcases.htestc=
ases/testcases.h:101::9525::22 :error:  invalid application of 'sizeof' to =
an incomplete type 'struct _aarch64_ctx'note:  i:      c |  error:         =
             ^iredefinition of '_ymmh_state' line str  uc180t |  s_taarrucc=
ht6 4__ycmtmtestcases/testcases.hhx:_ 105s*:tg13ae:t eerror:  incomplete de=
finition of type 'struct _aarch64_ctx'{ :testcases/testcases.h :error: 15in=
complete definition of type 'struct _aarch64_ctx': /usr/include/x86_64-linu=
x-gnu/asm/sigcontext.h   :95192 | :8s:t   a105error: t | redefinition of '_=
xstate'i         :       error: | incomplete definition of type 'struct _aa=
rch64_ctx'                                       ~~~~^ h64_ctx *get_header(=
struct _aarch64_ctxtestcases/testcases.h :*106h:e15a:d ,error:  incomplete =
definition of type 'struct _aarch64_ctx'u :8: error: redefinition of 'sigco=
ntext' archtestcases/testcases.h64:_106c:t15x:  *error: hincomplete definit=
ion of type 'struct _aarch64_ctx'e testcases/testcases.h:107:testcases/test=
cases.h10::95 :error: 22incomplete definition of type 'struct _aarch64_ctx'=
: testcases/testcases.h:109:10: error: incomplete definition of type 'struc=
t _aarch64_ctx' (itestcases/testcases.hhn:et101a3:d225-_:>t m error: aminva=
lid application of 'sizeof' to an incomplete type 'struct _aarch64_ctx'gai =
testcases/testcases.h:129:7: error: incomplete definition of type 'struct _=
aarch64_ctx' 104:27: error: invalid application of 'sizeof' to an incomplet=
e type 'struct _aarch64_ctx' testcases/testcases.h:129:7: error: incomplete=
 definition of type 'struct _aarch64_ctx' testcases/testcases.h:130  :1297 =
| :                 error: tincomplete definition of type 'struct _aarch64_=
ctx'a testcases/testcases.h:130:7: error: incomplete definition of type 'st=
ruct _aarch64_ctx' testcases/testcases.h:105:13: error: incomplete definiti=
on of type 'struct _aarch64_ctx' testcases/testcases.h:105:37: error: incom=
plete definition of type 'struct _aarch64_ctx' testcases/testcases.h:106:15=
: error: incomplete definition of type 'struct _aarch64_ctx' testcases/test=
cases.h:107:10: error: incomplete definition of type 'struct _aarch64_ctx' =
testcases/testcases.h:109:10: error: incomplete definition of type 'struct =
_aarch64_ctx' testcases/testcases.h:129:7: error: incomplete definition of =
type 'struct _aarch64_ctx' testcases/testcases.h:130:7: error: incomplete d=
efinition of type 'struct _aarch64_ctx' /usr/include/x86_64-linux-gnu/asm/s=
igcontext.h:40:8: error: redefinition of '_fpx_sw_bytes' /usr/include/x86_6=
4-linux-gnu/asm/sigcontext.h:85:8: error: redefinition of '_fpreg' /usr/inc=
lude/x86_64-linux-gnu/asm/sigcontext.h:91:8: error: redefinition of '_fpxre=
g' /usr/include/x86_64-linux-gnu/asm/sigcontext.h:98:8: error: redefinition=
 of '_xmmreg' /usr/include/x86_64-linux-gnu/asm/sigcontext.h:180:8: error: =
redefinition of '_ymmh_state' /usr/include/x86_64-linux-gnu/asm/sigcontext.=
h:192:8: error: redefinition of '_xstate' /usr/include/x86_64-linux-gnu/asm=
/sigcontext.h:317:8: error: redefinition of 'sigcontext' testcases/testcase=
s.h:101:25: error: invalid application of 'sizeof' to an incomplete type 's=
truct _aarch64_ctx' testcases/testcases.h:104:27: error: invalid applicatio=
n of 'sizeof' to an incomplete type 'struct _aarch64_ctx' testcases/testcas=
es.h:105:13: error: incomplete definition of type 'struct _aarch64_ctx' tes=
tcases/testcases.h:105:37: error: incomplete definition of type 'struct _aa=
rch64_ctx' testcases/testcases.h:106:15: error: incomplete definition of ty=
pe 'struct _aarch64_ctx' /usr/include/x86_64-linux-gnu/asm/sigcontext.h:40:=
8: error: redefinition of '_fpx_sw_bytes' testcases/testcases.h:107:10: err=
or: incomplete definition of type 'struct _aarch64_ctx' u/usr/include/x86_6=
4-linux-gnu/asm/sigcontext.hc:t85 :_8a:a rerror: credefinition of '_fpreg'h=
 testcases/testcases.h:109:10: error: incomplete definition of type 'struct=
 _aarch64_ctx' e/usr/include/x86_64-linux-gnu/asm/sigcontext.h:91:8: error:=
 redefinition of '_fpxreg' *h/usr/include/x86_64-linux-gnu/asm/sigcontext.h=
e:a98d:,8 :u ierror: nredefinition of '_xmmreg't testcases/testcases.h:129:=
7: error: incomplete definition of type 'struct _aarch64_ctx' /usr/include/=
x86_64-linux-gnu/asm/sigcontext.h:180:8: error: redefinition of '_ymmh_stat=
e' :7:   error: 184incomplete definition of type 'struct _aarch64_ctx' |  e=
/usr/include/x86_64-linux-gnu/asm/sigcontext.h :s192t:r8u:c terror:  redefi=
nition of '_xstate'_ /usr/include/x86_64-linux-gnu/asm/sigcontext.h:317:8: =
error: redefinition of 'sigcontext' testcases/testcases.c:18:34: error: inc=
omplete definition of type 'struct extra_context' testcases/testcases.c:18t=
estcases/testcases.c::349:: 36error: : incomplete definition of type 'struc=
t extra_context'note:  34x    t:9r  | error: ab,testcases/testcases.co inco=
mplete definition of type 'struct extra_context'o:c ta:r      34_:a|       =
                              ~~~~~^c_error:  ird(aa&,te exct_hreaxart-test=
cases/testcases.c>:rh18ae:_34ac:do) n;error: t error: oVeoinvalid applicati=
on of 'sizeof' to an incomplete type 'struct _aarch64_ctx'l_x x34 | t:br oa=
error: o,incomplete definition of type 'struct extra_context'testcases/test=
cases.hl  m   a 28_ | c=3D        o snGitEeTzx_etRo(EfsS(tVsr_tuNrcEutXcT t=
_e xH_tEarAaarD_cc(testcases/testcases.cho&:6n19e4:tx_19et:c xrterror: tain=
complete definition of type 'struct _aarch64_ctx' x- te_exttestcases/testca=
ses.htestcases/testcases.cr::a9519:_:22c19:o: n note: terror: forward decla=
ration of 'struct _aarch64_ctx'eincomplete definition of type 'struct _aarc=
h64_ctx' crtcxh 6*4g_e   ctt_xh e*ahdeear95d(, |  ssuttestcases/testcases.c=
tirna:utt19ci3:t19c2 : __ itanerror: alincomplete definition of type 'struc=
t _aarch64_ctx'  tx    95* | hesatda,t iuci nitn3l2_itfatal error:  ntoo ma=
ny errors emitted, stopping now [-ferror-limit=3D]me fatal error: too many =
errors emitted, stopping now [-ferror-limit=3D] testcases/testcases.h:104:2=
7: error: invalid application of 'sizeof' to an incomplete type 'struct _aa=
rch64_ctx' :105:13: error: incomplete definition of type 'struct _aarch64_c=
tx' 105:37: error: incomplete definition of type 'struct _aarch64_ctx' :   =
    error: incomplete definition of type 'struct _aarch64_ctx' fatal error:=
 too many errors emitted, stopping now [-ferror-limit=3D] testcases/testcas=
es.h:106:15: error: incomplete definition of type 'struct _aarch64_ctx' tes=
tcases/testcases.h:107:10: error: incomplete definition of type 'struct _aa=
rch64_ctx' testcases/testcases.h:109:10: error: incomplete definition of ty=
pe 'struct _aarch64_ctx' testcases/testcases.h:129:7: error: incomplete def=
inition of type 'struct _aarch64_ctx' testcases/testcases.h:130:7: error: i=
ncomplete definition of type 'struct _aarch64_ctx' testcases/testcases.c:18=
:34: error: incomplete definition of type 'struct extra_context' testcases/=
testcases.c:18:34: error: incomplete definition of type 'struct extra_conte=
xt' testcases/testcases.c:19:19: error: incomplete definition of type 'stru=
ct _aarch64_ctx' fatal error: too many errors emitted, stopping now [-ferro=
r-limit=3D] /usr/include/x86_64-linux-gnu/asm/sigcontext.h:40:8: error: red=
efinition of '_fpx_sw_bytes' /usr/include/x86_64-linux-gnu/asm/sigcontext.h=
:85:8: error: redefinition of '_fpreg' /usr/include/x86_64-linux-gnu/asm/si=
gcontext.h:91:8: error: redefinition of '_fpxreg' /usr/include/x86_64-linux=
-gnu/asm/sigcontext.h:98:8: error: redefinition of '_xmmreg' /usr/include/x=
86_64-linux-gnu/asm/sigcontext.h:180:8: error: redefinition of '_ymmh_state=
' /usr/include/x86_64-linux-gnu/asm/sigcontext.h:192:8: error: redefinition=
 of '_xstate' /usr/include/x86_64-linux-gnu/asm/sigcontext.h:317:8: error: =
redefinition of 'sigcontext' testcases/testcases.h:101:25: error: invalid a=
pplication of 'sizeof' to an incomplete type 'struct _aarch64_ctx' testcase=
s/testcases.h:104:27: error: invalid application of 'sizeof' to an incomple=
te type 'struct _aarch64_ctx' testcases/testcases.h:105:13: error: incomple=
te definition of type 'struct _aarch64_ctx' testcases/testcases.h:105:37: e=
rror: incomplete definition of type 'struct _aarch64_ctx' testcases/testcas=
es.h:106:15: error: incomplete definition of type 'struct _aarch64_ctx' tes=
tcases/testcases.h:107:10: error: incomplete definition of type 'struct _aa=
rch64_ctx' testcases/testcases.h:109:10: error: incomplete definition of ty=
pe 'struct _aarch64_ctx' testcases/testcases.h:129:7: error: incomplete def=
inition of type 'struct _aarch64_ctx' testcases/testcases.h:130:7: error: i=
ncomplete definition of type 'struct _aarch64_ctx' testcases/testcases.c:18=
:34: error: incomplete definition of type 'struct extra_context' testcases/=
testcases.c:18:34: error: incomplete definition of type 'struct extra_conte=
xt' testcases/testcases.c:19:19: error: incomplete definition of type 'stru=
ct _aarch64_ctx' fatal error: too many errors emitted, stopping now [-ferro=
r-limit=3D] /usr/include/x86_64-linux-gnu/asm/sigcontext.h:40:8: error: red=
efinition of '_fpx_sw_bytes' /usr/include/x86_64-linux-gnu/asm/sigcontext.h=
:85:8: error: redefinition of '_fpreg' /usr/include/x86_64-linux-gnu/asm/si=
gcontext.h:91:8: error: redefinition of '_fpxreg' /usr/include/x86_64-linux=
-gnu/asm/sigcontext.h:98:8: error: redefinition of '_xmmreg' /usr/include/x=
86_64-linux-gnu/asm/sigcontext.h:180:8: error: redefinition of '_ymmh_state=
' /usr/include/x86_64-linux-gnu/asm/sigcontext.h:192:8: error: redefinition=
 of '_xstate' /usr/include/x86_64-linux-gnu/asm/sigcontext.h:317:8: error: =
redefinition of 'sigcontext' testcases/testcases.h:101:25: error: invalid a=
pplication of 'sizeof' to an incomplete type 'struct _aarch64_ctx' testcase=
s/testcases.h:104:27: error: invalid application of 'sizeof' to an incomple=
te type 'struct _aarch64_ctx' testcases/testcases.h:105:13: error: incomple=
te definition of type 'struct _aarch64_ctx' testcases/testcases.h:105:37: e=
rror: incomplete definition of type 'struct _aarch64_ctx' testcases/testcas=
es.h:106:15: error: incomplete definition of type 'struct _aarch64_ctx' tes=
tcases/testcases.h:107:10: error: incomplete definition of type 'struct _aa=
rch64_ctx' testcases/testcases.h:109:10: error: incomplete definition of ty=
pe 'struct _aarch64_ctx' testcases/testcases.h:129:7: error: incomplete def=
inition of type 'struct _aarch64_ctx' testcases/testcases.h:130:7: error: i=
ncomplete definition of type 'struct _aarch64_ctx' testcases/testcases.c:18=
:34: error: incomplete definition of type 'struct extra_context' testcases/=
testcases.c:18:34: error: incomplete definition of type 'struct extra_conte=
xt' testcases/testcases.c:19:19: error: incomplete definition of type 'stru=
ct _aarch64_ctx' fatal error: too many errors emitted, stopping now [-ferro=
r-limit=3D] /usr/include/x86_64-linux-gnu/asm/sigcontext.h:40:8: error: red=
efinition of '_fpx_sw_bytes' /usr/include/x86_64-linux-gnu/asm/sigcontext.h=
:85:8: error: redefinition of '_fpreg' /usr/include/x86_64-linux-gnu/asm/si=
gcontext.h:91:8: error: redefinition of '_fpxreg' /usr/include/x86_64-linux=
-gnu/asm/sigcontext.h:98:8: error: redefinition of '_xmmreg' /usr/include/x=
86_64-linux-gnu/asm/sigcontext.h:180:8: error: redefinition of '_ymmh_state=
' /usr/include/x86_64-linux-gnu/asm/sigcontext.h:192:8: error: redefinition=
 of '_xstate' /usr/include/x86_64-linux-gnu/asm/sigcontext.h:317:8: error: =
redefinition of 'sigcontext' testcases/testcases.h:101:25: error: invalid a=
pplication of 'sizeof' to an incomplete type 'struct _aarch64_ctx' testcase=
s/testcases.h:104:27: error: invalid application of 'sizeof' to an incomple=
te type 'struct _aarch64_ctx' testcases/testcases.h:105:13: error: incomple=
te definition of type 'struct _aarch64_ctx' testcases/testcases.h:105:37: e=
rror: incomplete definition of type 'struct _aarch64_ctx' testcases/testcas=
es.h:106:15: error: incomplete definition of type 'struct _aarch64_ctx' tes=
tcases/testcases.h:107:10: error: incomplete definition of type 'struct _aa=
rch64_ctx' testcases/testcases.h:109:10: error: incomplete definition of ty=
pe 'struct _aarch64_ctx' testcases/testcases.h:129:7: error: incomplete def=
inition of type 'struct _aarch64_ctx' testcases/testcases.h:130:7: error: i=
ncomplete definition of type 'struct _aarch64_ctx' testcases/testcases.c:18=
:34: error: incomplete definition of type 'struct extra_context' testcases/=
testcases.c:18:34: error: incomplete definition of type 'struct extra_conte=
xt' testcases/testcases.c:19:19: error: incomplete definition of type 'stru=
ct _aarch64_ctx' fatal error: too many errors emitted, stopping now [-ferro=
r-limit=3D] signals.Ssignals.S:16:19: error: expected ']' in brackets expre=
ssion :16:19: error: expected ']' in brackets expression signals.S:16:19: e=
rror: expected ']' in brackets expression signals.Ssignals.S:16:19: error: =
expected ']' in brackets expression 19 :   error:  expected ']' in brackets=
 expression  signals.S:16:19: error: expected ']' in brackets expression si=
gnals.S:16:19: error: expected ']' in brackets expression signals.S:16:19: =
error: expected ']' in brackets expression signals.S:17:2: error: unknown u=
se of instruction mnemonic without a size suffix signals.Ssignals.S::1717::=
22: : error: error: unknown use of instruction mnemonic without a size suff=
ixunknown use of instruction mnemonic without a size suffix signals.S:19:2:=
 error: unknown use of instruction mnemonic without a size suffix signals.S=
:20:2: error: unknown use of instruction mnemonic without a size suffixsign=
als.S : error: unknown use of instruction mnemonic without a size suffix si=
gnals.S:21:2: error: unknown use of instruction mnemonic without a size suf=
fix :: 2error: : unknown use of instruction mnemonic without a size suffixe=
rror:  signals.S:signals.S19::242signals.Ssignals.S:: ::error: 20202::: unk=
nown use of instruction mnemonic without a size suffix22error:  error:  err=
or: ^ 2:: : 25error: error: :unknown use of instruction mnemonic without a =
size suffixsignals.Sunknown use of instruction mnemonic without a size suff=
ix14 error: :signals.S mov x21, x1unknown token in expression:21 mov x29, s=
p 22  : :  error: ^error:  : 2  :: 17^: ^error:  17:: 22 :  mov x22, x2:  e=
rror:  unknown use of instruction mnemonic without a size suffixerror:  22s=
ignals.S:: :error: : 2414unknown use of instruction mnemonic without a size=
 suffixerror: :: 2error: signals.S :   error: ^ unknown use of instruction =
mnemonic without a size suffix 19 : :^1914:unknown token in expressionerror=
: 2unknown token in expression : : error: error:  signals.Serror: unknown u=
se of instruction mnemonic without a size suffix: : :error: 20: ^unknown us=
e of instruction mnemonic without a size suffix: error:  mov x21, x126error=
: 26signals.Sunknown use of instruction mnemonic without a size suffix: err=
or: error: signals.Sunknown token in expression:  signals.S:     :  : 21sig=
nals.S :   error:  28unknown use of instruction mnemonic without a size suf=
fix: 2:: 221   error:  unknown use of instruction mnemonic without a size s=
uffix   30signals.S::1024: :error: signals.S2unknown token in expression:: =
 27error: signals.S ldr x0, =3Dcall_fmt:signals.Sunknown use of instruction=
 mnemonic without a size suffix 24::error: :unknown use of instruction mnem=
onic without a size suffix   ^27:2: error: unknown use of instruction mnemo=
nic without a size suffix signals.S:28:2: error: unknown use of instruction=
 mnemonic without a size suffix signals.S:30:10: error: unknown token in ex=
pression :  error:   27: :^231^:signals.Serror: : signals.Serror:  2:: unkn=
own token in expressionerror: unknown use of instruction mnemonic without a=
 size suffixsignals.S2528 error:  ::   unknown use of instruction mnemonic =
without a size suffix^ error:   unknown token in expression : ^error:  erro=
r:  error: unknown use of instruction mnemonic without a size suffixerror: =
 unknown token in expression unknown use of instruction mnemonic without a =
size suffix signals.S :   ::error: 33  signals.S 14  ^ : error:  signals.S:=
signals.Serror: : unknown token in expressionunknown token in expression :1=
431::error: 26 error: 14  :   bl printferror:   bic x0, x0, #15signals.S :e=
rror: 33 :unknown token in expression2 signals.S:32:2: error: unknown use o=
f instruction mnemonic without a size suffix signals.S:33:2: error: invalid=
 instruction mnemonic 'bl' ^  2:: ~error:   2  error: :unknown use of instr=
uction mnemonic without a size suffix mov x0, x23 22: ^^error: 2: unknown u=
se of instruction mnemonic without a size suffix : error: signals.S : mov x=
1, x21error:  : bic x0, x0, #152error: 32: unknown use of instruction mnemo=
nic without a size suffix :error:  signals.S:error: :  mov x1, x20 :2unknow=
n use of instruction mnemonic without a size suffix27 ^ : error: 2unknown u=
se of instruction mnemonic without a size suffix38error: : unknown use of i=
nstruction mnemonic without a size suffix : mov x2, x212error: : signals.Si=
nvalid instruction mnemonic 'bl' mov x2, x21 error: :signals.S 2: error: er=
ror:  unknown token in expression: unknown use of instruction mnemonic with=
out a size suffix error: ^signals.S signals.S :2error: :signals.S 39:  :inv=
alid instruction mnemonic 'bl'2:^30error:  unknown use of instruction mnemo=
nic without a size suffix2 :   mov x0, x23 bl memcpyerror:  10 error: :   i=
nvalid instruction mnemonic 'bl'error:  unknown token in expressionsignals.=
S signals.S^:2signals.S  :~5137:  error: ^ ::22: : error: error: signals.Su=
nknown use of instruction mnemonic without a size suffix 2~error: ^invalid =
instruction mnemonic 'ldr' error:  error: 31::2:error: 2 : unknown use of i=
nstruction mnemonic without a size suffix2 : unknown token in expression^er=
ror: : unknown use of instruction mnemonic without a size suffix str x23, [=
x0]error: signals.Sunknown use of instruction mnemonic without a size suffi=
x:32:2 ~ ldr x0, =3Dcall_fmterror:  signals.S 54 :: :^ signals.S2:error: : =
39error:  : error:  2 error: ^invalid instruction mnemonic 'bl'unknown use =
of instruction mnemonic without a size suffixsignals.S ^33error: signals.S:=
 :: 54^error:  signals.Ssignals.S::: 562 bl printf:  error: :56:error: 10 :=
102~: error:  mov sp, x23 mov x1, x21:  error: unknown token in expression =
error:  ^  mov x0, x23error:  error: 3322 error: invalid instruction mnemon=
ic 'svc':: 2signals.S: invalid instruction mnemonic 'svc'signals.S :: 57err=
or: error: :error: unknown use of instruction mnemonic without a size suffi=
x ^: ^error:  ~error:  mov x0, x23~~ :error: signals.S38::642::37invalid in=
struction mnemonic 'b'2:56: ::error:  210: 2 b .: error: error:  mov x0, x2=
3invalid instruction mnemonic 'b': error: error:  error:  invalid instructi=
on mnemonic 'b'  ^ signals.S :: ^ error: 38unknown use of instruction mnemo=
nic without a size suffix error: ^signals.S :2error: 2: invalid instruction=
 mnemonic 'bl':  error:  bl memcpyunknown use of instruction mnemonic witho=
ut a size suffix 2: error: invalid instruction mnemonic 'bl' signals.S:51:2=
: error: error: invalid instruction mnemonic 'svc'invalid instruction mnemo=
nic 'ldr' 2 ldr x0, current: 39error:   ~error: ~invalid instruction mnemon=
ic 'bl' :64signals.Ssignals.S:::252signals.S52:: :51error: 2:: :invalid ins=
truction mnemonic 'b'22error:  : : error: unknown use of instruction mnemon=
ic without a size suffix b . error:  signals.S:54:2: error: signals.Sunknow=
n use of instruction mnemonic without a size suffix:signals.S52 :  error: ^=
unknown use of instruction mnemonic without a size suffix 56:5410:: 2error:=
 : unknown token in expressionerror:  2 :  error:  ^ unknown use of instruc=
tion mnemonic without a size suffix :56:signals.S10:: 56signals.Serror: ::u=
nknown token in expression5710 ::  mov x8, #152error:  : unknown token in e=
xpression error:  signals.S:64signals.S:signals.S:2:5757: :error: :2invalid=
 instruction mnemonic 'b'2:  : error:  b .error: invalid instruction mnemon=
ic 'svc'invalid instruction mnemonic 'svc' signals.S:64:2: error: invalid i=
nstruction mnemonic 'b'signals.S 2 : ^error:  signals.S:17:2: error: unknow=
n use of instruction mnemonic without a size suffix signals.S:19:2: error: =
unknown use of instruction mnemonic without a size suffix signals.S:20:2: e=
rror: unknown use of instruction mnemonic without a size suffix signals.S:2=
1:2: error: unknown use of instruction mnemonic without a size suffix signa=
ls.S:24:2: error: unknown use of instruction mnemonic without a size suffix=
 signals.S:25:14: error: unknown token in expression signals.S:26:14: error=
: unknown token in expression signals.S:27:2: error: unknown use of instruc=
tion mnemonic without a size suffix signals.S:28:2: error: unknown use of i=
nstruction mnemonic without a size suffix signals.S:30:10: error: unknown t=
oken in expression signals.S:31:2: error: unknown use of instruction mnemon=
ic without a size suffix signals.S:32:2: error: unknown use of instruction =
mnemonic without a size suffix signals.S:33:2: error: invalid instruction m=
nemonic 'bl' signals.S:36:2: error: unknown use of instruction mnemonic wit=
hout a size suffix signals.S:37:2: error: unknown use of instruction mnemon=
ic without a size suffix signals.S:38:2: error: unknown use of instruction =
mnemonic without a size suffix signals.S:39:2: error: invalid instruction m=
nemonic 'bl' signals.S:51:2: error: invalid instruction mnemonic 'ldr' sign=
als.S:52:2: error: unknown use of instruction mnemonic without a size suffi=
x signals.S:54:2: error: unknown use of instruction mnemonic without a size=
 suffix signals.S:56:10: error: unknown token in expression signals.S:57:2:=
 error: invalid instruction mnemonic 'svc' signals.S:64:2: error: invalid i=
nstruction mnemonic 'b' sve_helpers.csve_helpers.c:13:18: error: use of und=
eclared identifier 'SVE_VQ_MAX' sve_helpers.csve_helpers.c:::131313:::1818:=
18: : error:  use of undeclared identifier 'SVE_VQ_MAX'error:  error: use o=
f undeclared identifier 'SVE_VQ_MAX'use of undeclared identifier 'SVE_VQ_MA=
X' sve_helpers.csve_helpers.c::1313::1818::  error: error: use of undeclare=
d identifier 'SVE_VQ_MAX'use of undeclared identifier 'SVE_VQ_MAX' sve_help=
ers.c:25:12: error: use of undeclared identifier 'SVE_VQ_MAX' sve_helpers.c=
:25:12: error: use of undeclared identifier 'SVE_VQ_MAX' sve_helpers.c:25:1=
2: error: use of undeclared identifier 'SVE_VQ_MAX' sve_helpers.c:25:12:   =
 25error:  | use of undeclared identifier 'SVE_VQ_MAX'         sve_helpers.=
c:25:12: error: use of undeclared identifier 'SVE_VQ_MAX' sve_helpers.c:41:=
12: error: call to undeclared function 'sve_vq_from_vl'; ISO C99 and later =
do not support implicit function declarations [-Wimplicit-function-declarat=
ion] sve_helpers.c:41:12: error: call to undeclared function 'sve_vq_from_v=
l'; ISO C99 and later do not support implicit function declarations [-Wimpl=
icit-function-declaration] sve_helpers.c:41:12: error: call to undeclared f=
unction 'sve_vq_from_vl'; ISO C99 and later do not support implicit functio=
n declarations [-Wimplicit-function-declaration] sve_helpers.c:41:12: error=
: call to undeclared function 'sve_vq_from_vl'; ISO C99 and later do not su=
pport implicit function declarations [-Wimplicit-function-declaration] :12:=
 error: call to undeclared function 'sve_vq_from_vl'; ISO C99 and later do =
not support implicit function declarations [-Wimplicit-function-declaration=
] sve_helpers.c:13:18: error: use of undeclared identifier 'SVE_VQ_MAX' sve=
_helpers.c:25:12: error: use of undeclared identifier 'SVE_VQ_MAX' sve_help=
ers.c:41:12: error: call to undeclared function 'sve_vq_from_vl'; ISO C99 a=
nd later do not support implicit function declarations [-Wimplicit-function=
-declaration] sve_helpers.c:13:18: error: use of undeclared identifier 'SVE=
_VQ_MAX' sve_helpers.c:25:12: error: use of undeclared identifier 'SVE_VQ_M=
AX' in testcases/fake_sigreturn_sme_change_vl (Makefile:31) [logspec:kbuild=
,kbuild.other]
---

- dashboard: https://d.kernelci.org/i/maestro:b038160296fc0b9fcd6813fa2bca5=
848db87b59f
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it
- commit HEAD:  f3e6330d7fe42b204af05a2dbc68b379e0ad179e
- tags: next-20260407

Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
.c./test_signals.h::15:10: 14fatal error: :
'asm/hwcap.h' file not foundIn file included from=20
./test_signals_utils.h:14:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
n      c| l         ^~~~~~~~~~~~~u
de <asm/hwcap.h>
11 error error generated generated.
.
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
In file included from test_signals.c:16:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
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
In file included from test_signals.c:16:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
11 error generated.
1 error generated.
1 error generated.
In file included from test_signals_utils.c:18:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not foundIn file in=
cluded from test_signals_utils.c:18:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
In file included from test_signals_utils.c:18:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
1 error generated.
1 error generated.
1 error generated.
In file included from test_signals_utils.c:18:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
In file included from test_signals_utils.c:18:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
In file included from test_signals_utils.c:18:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
In file included from test_signals_utils.c:18:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
1 error generated.
1 error generated.
1 error generated.
1 error generated.
In file included from test_signals_utils.c:18:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
1 error generated.
In file included from In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:40:8: error: redefinition of=
 '_fpx_sw_bytes'In file included from=20
testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:40:8: error: redefinition of=
 '_fpx_sw_bytes'
s      t| r       ^u
ct _fpx_sw_bytes {
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:31:8: note: previous defini=
tion is here
/usr/include/x86_64-linux-gnu/bits/sigcontext.h   :3131 | :s8t:r unote: cpr=
evious definition is heret
x_sw_bytes
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:85:8: error: redefinition of=
 '_fpreg'
{In file included from=20
testcases/testcases.h      :| 15       ^:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:85:8:/usr/include/x86_64-lin=
ux-gnu/bits/sigcontext.h :error: 40redefinition of '_fpreg':
8: note: previous definition is here
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:40:8: note: previous defini=
tion is here
:7:
In file included from testcases/testcases.hIn file included from :testcases=
/testcases.c15::
7:
/usr/include/x86_64-linux-gnu/asm/sigcontext.hIn file included from testcas=
es/testcases.h::4015::
8/usr/include/x86_64-linux-gnu/asm/sigcontext.h:: 91error: :redefinition of=
 '_fpx_sw_bytes'8
: error: redefinition of '_fpxreg'
7      :
| In file included from        ^testcases/testcases.h
:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:/usr/include/x86_64-linux-gn=
u/bits/sigcontext.h   91:40:46 | 8:s:8t :rerror:  uredefinition of '_fpxreg=
'note: cprevious definition is here
t
ff      p| px       ^xr
reegg=20
{     =20
|              ^|=20
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:46:8: note: previous defini=
tion is here
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:98:8: error: redefinition of=
 '_xmmreg'
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:53:8: note: In file include=
d from previous definition is here
testcases/testcases.c:7:
t/usr/include/x86_64-linux-gnu/asm/sigcontext.hr:u98c:t8 :_ xerror: mredefi=
nition of '_xmmreg'm
reg
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:53:8: note: previous defini=
tion is here
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:85:8: error: redefinition of=
 '_fpreg'
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:40:8:In file included from =
 note: testcases/testcases.cprevious definition is here:
7:
In file included from testcases/testcases.h   :4015 | :
s/usr/include/x86_64-linux-gnu/asm/sigcontext.ht:r180u:c8t:  _error: fredef=
inition of '_ymmh_state'p
reg
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:184:8: note: previous defin=
ition is hereIn file included from=20
testcases/testcases.c:7:
t/usr/include/x86_64-linux-gnu/asm/sigcontext.hr:u180c:t8 :_ yerror: mredef=
inition of '_ymmh_state'm
h_state =20
180       | | s       ^In file included from=20
ttestcases/testcases.c:r7u:
cIn file included from ttestcases/testcases.h :_15y:
m/usr/include/x86_64-linux-gnu/asm/sigcontext.hm:h91_:s8t:a terror: eredefi=
nition of '_fpxreg'=20
{
note: pIn file included from previous definition is herextestcases/testcase=
s.h
r:e15g:
192s      :t| 8r       ^:u
_:y46m:m  8h192:_  | snote: stprevious definition is hereta
rtuec
tsrtuactte  _{f
p      x| r       ^e
g
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:189:8: note: previous defin=
ition is here
7      :
| In file included from        ^testcases/testcases.h
:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:192:8: error: redefinition o=
f '_xstate'
tIn file included from  testcases/testcases.h_:x15s:
t/usr/include/x86_64-linux-gnu/asm/sigcontext.ha:t98e: 8{:
reg {
truct /usr/include/x86_64-linux-gnu/bits/sigcontext.h_:x53s:t8a:t enote:=20
previous definition is here     =20
|        ^
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:317:8: error: redefinition o=
f 'sigcontext'
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:139:8: note: previous defin=
ition is here
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:317:8: error: redefinition o=
f 'sigcontext'
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:139:8: note: previous defin=
ition is here
In file included from testcases/testcases.c:7:
testcases/testcases.h:101:25: error: invalid application of 'sizeof' to an =
incomplete type 'struct _aarch64_ctx'
testcases/testcases.h:28:2: note: expanded from macro 'HDR_SZ'
In file included from testcases/testcases.c:7:
testcases/testcases.htestcases/testcases.h:101::9525::22 :error:  invalid a=
pplication of 'sizeof' to an incomplete type 'struct _aarch64_ctx'note:=20
forward declaration of 'struct _aarch64_ctx'
6      4| _                               ^~~~~~c
tx *getestcases/testcases.ht:_28h:e2a:d enote: rexpanded from macro 'HDR_SZ=
'(
struct    _28a | a        rscihz6e4o_fc(tsxt r*uhceta d_,a auricnht6342__ct=
t xm)a
g      i| c        ^     ~~~~~~~~~~~~~~~~~~~~~,
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_=
ctx'
*head, uin  t31042 | _        tw hmialgei c(,o
f      f| s                     ^=20
<=3D resv_sz - HDR_SZ &&
testcases/testcases.h:28:2: note: expanded from macro 'HDR_SZ'
offs <=3D res   v_95s | zs t-a tHiDcR_ SiZn l&&i
n      e|                                   ^~~~~~s
trutestcases/testcases.hc:t28 :_2a:a rnote: cexpanded from macro 'HDR_SZ'h
64_ct   x28  | *        gseitz_ehoefa(dsterru(cstt r_uacatrc h_64a_acrtcxh)6
4      _| c        ^     ~~~~~~~~~~~~~~~~~~~~~t
x *htestcases/testcases.he:a95d:,22 :uIn file included from  inote: testcas=
es/testcases.cnforward declaration of 'struct _aarch64_ctx':t
73:
2In file included from _testcases/testcases.ht:    15m95:
a | /usr/include/x86_64-linux-gnu/asm/sigcontext.hgs:it180ca:,t8
i:      c |  error:                      ^iredefinition of '_ymmh_state'
n
line str  uc180t |  s_taarruccht6 4__ycmtmtestcases/testcases.hhx:_ 105s*:t=
g13ae:t eerror:  incomplete definition of type 'struct _aarch64_ctx'{
struct   184_ | asatrrc uh c6ht4e a__dcy-tmx>m mh*a_hgseitacad t,!e =3D
u       im| na       ^tg
3i2c_ t& &ma ghieca,
d      -| >                     ^m
agic) {
testcases/testcases.h:95:22In file included from testcases/testcases.h:test=
cases/testcases.c: :105note: 7:forward declaration of 'struct _aarch64_ctx':
13In file included from=20
:testcases/testcases.h :error: 15incomplete definition of type 'struct _aar=
ch64_ctx':
/usr/include/x86_64-linux-gnu/asm/sigcontext.h   :95192 | :8s:t   a105error=
: t | redefinition of '_xstate'i       =20
c   i   n 192l |  is nt erh uescattdr -u_>cxmtsat ga_tiaeca  r{!c
=3Dh       6| m4       ^a_
gcitcx /usr/include/x86_64-linux-gnu/bits/sigcontext.h &:*&189g :eh8te:_a h=
dnote: e-previous definition is herea>
dmaegri  (c189s) | t sr{tu
rc      ut| c                ~~~~^t_
c:       t| note: x       ^forward declaration of 'struct _aarch64_ctx'=20
*head, uint   3952 | _stt amtaigci ci,n
l      i| n                     ^e
4_ctx *head, u  i105n | t        3 2 _ t   m a ghieca,d
-      >| m                     ^a
gic !=3D magic && head->magtestcases/testcases.hi:c)105 :{37
:       error: | incomplete definition of type 'struct _aarch64_ctx'       =
                                ~~~~^
testcases/testcases.h  :10595 | :22        :   note:  forward declaration o=
f 'struct _aarch64_ctx'=20
6      4| _                                       ~~~~^c
tx *get_testcases/testcases.hh:ea95d:e22r:( snote: tforward declaration of =
'struct _aarch64_ctx'r
uct _aarch64_   ct95x |  s*thaetaidc,  iunilnitn3e2 _ts tmraugcitc ,_
a      a| r                     ^c
h64_ctx *get_header(struct _aarch64_ctxtestcases/testcases.h :*106h:e15a:d =
,error:  incomplete definition of type 'struct _aarch64_ctx'u
int32_t   106m | a        g        iocf,f
s       | +                     ^=3D
zIn file included from etestcases/testcases.h;:
15      :
| /usr/include/x86_64-linux-gnu/asm/sigcontext.h                        ~~~=
~^:317
:8: error: redefinition of 'sigcontext'
testcases/testcases.h:95:22:   317note:  | forward declaration of 'struct _=
aarch64_ctx's
truct sigc   o95n | tsetxatt i{c
ine stru/usr/include/x86_64-linux-gnu/bits/sigcontext.hc:t139 :_8a:a rnote:=
 cprevious definition is hereh
64_c  t139x |  s*tgreutc_th esaidgecro(nstterxutc
t       | _       ^a
archtestcases/testcases.h64:_106c:t15x:  *error: hincomplete definition of =
type 'struct _aarch64_ctx'e
ad, uint3  2106_ | t                 moafgfisc ,+
=3D       |                      ^h
ead->size;
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_=
ctx'
tx *head, u  i107n | t        3        2h_eta dm a=3Dg iGcE,T
_      R| E                     ^S
V_NEXT_HEAD(head);
testcases/testcases.h:85:43: note: expanded from macro 'GET_RESV_NEXT_HEAD'
testcases/testcases.h:107:testcases/testcases.h10::95 :error: 22incomplete =
definition of type 'struct _aarch64_ctx':
t      x|                         ^~~~~~~~~~~~~~~~~~~~~~~~*
get_htestcases/testcases.he:a85d:e43r:( snote: texpanded from macro 'GET_RE=
SV_NEXT_HEAD'r
uct _aarc   h856 | 4        _(csttxr u*chte a_da,a rucihn6t43_2c_ttx  m*a)g=
(ic(,c
h      a| r                     ^=20
*)(h) + (h)->size)
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_=
ctx'
testcases/testcases.h:109:10: error: incomplete definition of type 'struct =
_aarch64_ctx'
ead, uint3testcases/testcases.h2:_95t: 22m:a gnote: iforward declaration of=
 'struct _aarch64_ctx'c,
64_ctx *  h109e | aIn file included from         dtestcases/testcases.ci,:f=
 7 u:
(itestcases/testcases.hhn:et101a3:d225-_:>t m error: aminvalid application =
of 'sizeof' to an incomplete type 'struct _aarch64_ctx'gai
cg i=3Dc=3D, m
a      g  | i101                     ^c |=20
)         {i
f       | (            ~~~~^!
head || testcases/testcases.hr:e95s:v22_:s znote:  forward declaration of '=
struct _aarch64_ctx'<
95 | statitestcases/testcases.hc: 28i:n2l:i nnote: eexpanded from macro 'HD=
R_SZ'=20
struct _   a28a | r        cshi6z4e_ocft(xs t*rguectt_ h_eaaadrecrh(6s4t_rc=
utcxt)=20
_      a| a        ^     ~~~~~~~~~~~~~~~~~~~~~r
ch64_ctx *hetestcases/testcases.ha:d95,: 22u:i nnote: tforward declaration =
of 'struct _aarch64_ctx'3
2_t magic,
testcases/testcases.h:129:7: error: incomplete definition of type 'struct _=
aarch64_ctx'
testcases/testcases.h:95:22: note: testcases/testcases.hforward declaration=
 of 'struct _aarch64_ctx':
104:27: error: invalid application of 'sizeof' to an incomplete type 'struc=
t _aarch64_ctx'
a      d| e                                 ^~~~~~r
(struct _aarch64_ctx *head, uint32_t magic,
testcases/testcases.h:129:7: error: incomplete definition of type 'struct _=
aarch64_ctx'
testcases/testcases.h:130  :1297 | :                 error: tincomplete def=
inition of type 'struct _aarch64_ctx'a
il->magi  c130  | =3D                 0t;a
i      l| -                ~~~~^>
size =3D 0testcases/testcases.h;:
95      :| 22                ~~~~^:
testcases/testcases.h:95:22:    95note:  | forward declaration of 'struct _=
aarch64_ctx's
tatic inlin   e 95s | tsrtuactti c_ aairnclhi6n4e_ csttxr u*cgte t__ahaerac=
dhe6r4(_scttrxu c*tg e_ta_ahreacdhe6r4(_scttrxuc t* h_eaaardc,h 6u4_icnttx3=
 2*_heta dm,a ugiinct3,2
_      t|                       ^m
agic,
testcases/testcases.h:130:7: error: incomplete definition of type 'struct _=
aarch64_ctx'
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_=
ctx'
testcases/testcases.h:28:2: note: expanded from macro 'HDR_SZ'
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_=
ctx'
testcases/testcases.h:105:13: error: incomplete definition of type 'struct =
_aarch64_ctx'
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_=
ctx'
testcases/testcases.h:105:37: error: incomplete definition of type 'struct =
_aarch64_ctx'
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_=
ctx'
testcases/testcases.h:106:15: error: incomplete definition of type 'struct =
_aarch64_ctx'
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_=
ctx'
testcases/testcases.h:107:10: error: incomplete definition of type 'struct =
_aarch64_ctx'
testcases/testcases.h:85:43: note: expanded from macro 'GET_RESV_NEXT_HEAD'
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_=
ctx'
testcases/testcases.h:109:10: error: incomplete definition of type 'struct =
_aarch64_ctx'
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_=
ctx'
testcases/testcases.h:129:7: error: incomplete definition of type 'struct _=
aarch64_ctx'
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_=
ctx'
testcases/testcases.h:130:7: error: incomplete definition of type 'struct _=
aarch64_ctx'
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_=
ctx'
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:40:8: error: redefinition of=
 '_fpx_sw_bytes'
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:31:8: note: previous defini=
tion is here
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:85:8: error: redefinition of=
 '_fpreg'
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:40:8: note: previous defini=
tion is here
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:91:8: error: redefinition of=
 '_fpxreg'
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:46:8: note: previous defini=
tion is here
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:98:8: error: redefinition of=
 '_xmmreg'
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:53:8: note: previous defini=
tion is here
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:180:8: error: redefinition o=
f '_ymmh_state'
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:184:8: note: previous defin=
ition is here
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:192:8: error: redefinition o=
f '_xstate'
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:189:8: note: previous defin=
ition is here
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:317:8: error: redefinition o=
f 'sigcontext'
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:139:8: note: previous defin=
ition is here
In file included from testcases/testcases.c:7:
testcases/testcases.h:101:25: error: invalid application of 'sizeof' to an =
incomplete type 'struct _aarch64_ctx'
testcases/testcases.h:28:2: note: expanded from macro 'HDR_SZ'
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_=
ctx'
testcases/testcases.h:104:27: error: invalid application of 'sizeof' to an =
incomplete type 'struct _aarch64_ctx'
testcases/testcases.h:28:2: note: expanded from macro 'HDR_SZ'
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_=
ctx'
testcases/testcases.h:105:13: error: incomplete definition of type 'struct =
_aarch64_ctx'
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_=
ctx'
testcases/testcases.h:105:37: error: incomplete definition of type 'struct =
_aarch64_ctx'
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_=
ctx'
testcases/testcases.h:106:15: error: incomplete definition of type 'struct =
_aarch64_ctx'
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_=
ctx'
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:40:8: error: redefinition of=
 '_fpx_sw_bytes'
testcases/testcases.h:107:10: error: incomplete definition of type 'struct =
_aarch64_ctx'
;     =20
|              ^|=20
testcases/testcases.h:85:43: note: expanded from macro 'GET_RESV_NEXT_HEAD'
/usr/include/x86_64-linux-gnu/bits/sigcontext.h   85 |         (struct _a:a=
31r:c8h:6 4note: _previous definition is herec
tx *)   (31( | cshtarru c*t) (_hf)p x+_ s(wh_)b-y>tseisz
e      )|=20
|                                               ~~~^
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_=
ctx'
rIn file included from (testcases/testcases.hs:t15r:
u/usr/include/x86_64-linux-gnu/asm/sigcontext.hc:t85 :_8a:a rerror: credefi=
nition of '_fpreg'h
64_ct   x85  | *shteraudc,t  u_ifnptr3e2g_ t{=20
m      a| g       ^i
c,
:8: note: previous definition is here
testcases/testcases.h:109:10: error: incomplete definition of type 'struct =
_aarch64_ctx'
In file included from testcases/testcases.c  :1097 | :
e/usr/include/x86_64-linux-gnu/asm/sigcontext.h:91:8: error: redefinition o=
f '_fpxreg'
c      )|         ^{
:46:8: testcases/testcases.hnote: :previous definition is here95
:22:    46note:  | forward declaration of 'struct _aarch64_ctx's
truct _fp   x95r | esgt
a      t| i       ^c
_In file included from ctestcases/testcases.ht:x15 :
*h/usr/include/x86_64-linux-gnu/asm/sigcontext.he:a98d:,8 :u ierror: nredef=
inition of '_xmmreg't
32_t    m98a | gsitcr,u
c      t|                       ^_
xmmreg {
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:53:8: note: previous defini=
tion is here
testcases/testcases.h:129:7: error: incomplete definition of type 'struct _=
aarch64_ctx'
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_=
ctx'
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:180:8: error: redefinition o=
f '_ymmh_state'
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:184:8: testcases/testcases.=
hnote: :previous definition is here130
:7:   error: 184incomplete definition of type 'struct _aarch64_ctx' |=20
struct   130_ | y        m        mtha_islt-a>tsei
z      e|         ^=3D
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_=
ctx'
iIn file included from ntestcases/testcases.hl:i15n:
e/usr/include/x86_64-linux-gnu/asm/sigcontext.h :s192t:r8u:c terror:  redef=
inition of '_xstate'_
aarch6  4192_ | csttxr u*cgte t__xhsetaadteer ({s
t      r| u       ^c
t _a/usr/include/x86_64-linux-gnu/bits/sigcontext.ha:r189c:h86:4 _note: cpr=
evious definition is heret
x *h  e189a | ds,t ruuicntt 3_2x_stt amtaeg
i      c| ,       ^
testcases/testcases.c:9:36: warning: declaration of 'struct extra_context' =
will not be visible outside of this function [-Wvisibility]
testcases/testcases.c      | :                                   ^9
:36: warning: declaration of 'struct extra_context' will not be visible out=
side of this function [-Wvisibility]
text(struct extra    _c9o | ntbeoxotl  *evxatrlai, dcahtaer_ e**xetrrra,
_      co|                                    ^n
text(struct extra_context *extra, char **err,
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:317:8: error: redefinition o=
f 'sigcontext'
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:139:8: note: previous defin=
ition is here
testcases/testcases.c:18:34: error: incomplete definition of type 'struct e=
xtra_context'
testcases/testcases.c:18testcases/testcases.c::349:: 36error: : incomplete =
definition of type 'struct extra_context'note:=20
forward declaration of 'struct extra_context'
-r>ah_ecaodn)ttestcases/testcases.c;e
x:t       | 18*                                   ~~~~~^:e
34x    t:9r  | error: ab,testcases/testcases.co incomplete definition of ty=
pe 'struct extra_context'o:c
l9h :av36ra: l* i*note: dforward declaration of 'struct extra_context'ea
rt   er18_, |=20
rbmo o=3Dl  GvEaTl_iRdEatSeV_e_eNxEtXrTa__HcEoAnDt(e&xetx(tsrta-r>uhceta dx=
e)testcases/testcases.ct:;xr18
ta:r      34_:a|                                     ~~~~~^c_error:=20
ocincomplete definition of type 'struct extra_context'no
tnetxettestcases/testcases.cx(:   s18t9t |          :tr*36eure:c mxtnote:  =
t r=3Dforward declaration of 'struct extra_context'e
a x,Gt ErcTah__aRcrE    o S9n*V | *te_berNoxroEtXl, T=20
_*v      Hea| Exl                                   ^AtD
ird(aa&,te exct_hreaxart-testcases/testcases.c>:rh18ae:_34ac:do) n;error: t
incomplete definition of type 'struct extra_context'e     =20
x| t                                   ~~~~~^(
struc   t18testcases/testcases.c  | :e        9 t:xe36In file included from=
 :*rttestcases/testcases.c :*mrnote: a7e forward declaration of 'struct ext=
ra_context'_=3D:
crtestcases/testcases.hoG:,En101t   =20
eT:925      :x_ | tR|   bE                                   ^S*
error: oVeoinvalid application of 'sizeof' to an incomplete type 'struct _a=
arch64_ctx'l_x
N tEvrXaaTl,i_ dHcaEhAtaDer(_   &e101x*e | xt*        terirrfaar_ ,-(c
>!ho      hen| eat                                   ^ade
d)x ;t|
(|      s | tr                                   ~~~~~^re
uscvt_ setestcases/testcases.czx: t9<r: a36H_:D cRnote: o_forward declarati=
on of 'struct extra_context'nSt
Ze)x
ttestcases/testcases.c       :| *    18                               ^~~~~=
~e9:
x34 | t:br oaerror: o,incomplete definition of type 'struct extra_context't=
estcases/testcases.hl=20
: c28vh:aa2rl: i *d   *note: ea18expanded from macro 'HDR_SZ'tr |=20
re        ,_
te      ex| rt                                   ^r
m   a 28_ | c=3D        o snGitEeTzx_etRo(EfsS(tVsr_tuNrcEutXcT t_e xH_tEar=
AaarD_cc(testcases/testcases.cho&:6n19e4:tx_19et:c xrterror: taincomplete d=
efinition of type 'struct _aarch64_ctx' x-
*)>e
hx      et| a        ^     ~~~~~~~~~~~~~~~~~~~~~r   d
19a) | ,;        =20
ic      fh|  a                                   ~~~~~^(r
! t*e*testcases/testcases.hre:rm95r :,|22
|:      testcases/testcases.c  :| note:                                    =
^t9
eforward declaration of 'struct _aarch64_ctx'r:
m36-:> mnote: agforward declaration of 'struct extra_context'i
c ||    t95e | rs    mt9-a> | tsbiioczoel)  v{a
l      i| d                     ~~~~^a
te_exttestcases/testcases.htestcases/testcases.cr::a9519:_:22c19:o: n note:=
 terror: forward declaration of 'struct _aarch64_ctx'eincomplete definition=
 of type 'struct _aarch64_ctx'
x
t(s truct    19e    | x95        t | irsfa t_(act!oitncet reimxn tl| i|*n e=
etx esrttmrr-au>,cm tac gh_iaacra  |r*|c* he6tre4rr_,mc-
t>      xs|  ii                                   ^*zngele
)i tn_{eh
eurc(ttestcases/testcases.hs :t_95ra:ua22cr:tc  hnote: 6_forward declaratio=
n of 'struct _aarch64_ctx'4a_a
crtcxh 6*4g_e   ctt_xh e*ahdeear95d(, |  ssuttestcases/testcases.ctirna:utt=
19ci3:t19c2 : __ itanerror: alincomplete definition of type 'struct _aarch6=
4_ctx'=20
rimcnaheg6 isct,r  =20
u      19c|  | t                     ^       =20
egremt-_>hmeaagdiecr (|s|t rtuecrtm -_>asai4zrec)h 6{4
_      c| t                     ~~~~^x
gic,
tx    95* | hesatda,t iuci nitn3l2_itfatal error:  ntoo many errors emitted=
, stopping now [-ferror-limit=3D]me
a gsitcr,
u      | c                     ^t
fatal error: too many errors emitted, stopping now [-ferror-limit=3D]
testcases/testcases.h:104:27: error: invalid application of 'sizeof' to an =
incomplete type 'struct _aarch64_ctx'
testcases/testcases.h:28:2: note: expanded from macro 'HDR_SZ'
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_=
ctx'
4_ctx *head, ui   n18t | 3        2t_etr mm a=3Dg iGcE,T
_      R| E                     ^S
V_NEXT_HEAD(&extra->head);
testcases/testcases.c:9:36: note: forward declaration of 'struct extra_cont=
ext'testcases/testcases.h
:105:13: error: incomplete definition of type 'struct _aarch64_ctx'
testcases/testcases.h:95c:t22 :e xnote: tforward declaration of 'struct _aa=
rch64_ctx'r
a_context *extra, char **err,
(struct _a   a18r | c        ht6e4r_mc t=3Dx  G*EhTe_aRdE,S Vu_iNnEtX3T2__H=
tE AmDa(g&iecx,t
r      a| -                     ^>
head);
testcases/testcases.c:9:36: note: forward declaration of 'struct extra_cont=
ext'
105:37: error: incomplete definition of type 'struct _aarch64_ctx'
:       error: incomplete definition of type 'struct _aarch64_ctx'
:       | note:                      ~~~~^forward declaration of 'struct _a=
arch64_ctx'
testcases/testcases.h:95:22   :95  | note: sforward declaration of 'struct =
_aarch64_ctx't
atic inline    95s | tsrtuactti c_ aianrlcihn6e4 _scttrxu c*tg e_ta_ahrecah=
d6e4r_(csttxr u*cgte t__ahaeracdhe6r4(_scttrxu c*th e_aarch64_ctx *head, ui=
nt32_t amda,g iuci,n
t      3| 2                     ^_
t magic,
fatal error: too many errors emitted, stopping now [-ferror-limit=3D]
testcases/testcases.h:106:15: error: incomplete definition of type 'struct =
_aarch64_ctx'
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_=
ctx'
testcases/testcases.h:107:10: error: incomplete definition of type 'struct =
_aarch64_ctx'
testcases/testcases.h:85:43: note: expanded from macro 'GET_RESV_NEXT_HEAD'
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_=
ctx'
testcases/testcases.h:109:10: error: incomplete definition of type 'struct =
_aarch64_ctx'
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_=
ctx'
testcases/testcases.h:129:7: error: incomplete definition of type 'struct _=
aarch64_ctx'
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_=
ctx'
testcases/testcases.h:130:7: error: incomplete definition of type 'struct _=
aarch64_ctx'
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_=
ctx'
testcases/testcases.c:9:36: warning: declaration of 'struct extra_context' =
will not be visible outside of this function [-Wvisibility]
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
1 warning and 20 errors generated.
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:40:8: error: redefinition of=
 '_fpx_sw_bytes'
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:31:8: note: previous defini=
tion is here
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:85:8: error: redefinition of=
 '_fpreg'
1 warning and 20 errors generated.
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:40:8: note: previous defini=
tion is here
ct _fpreg
1 warning and 20 errors generated.
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:91:8: error: redefinition of=
 '_fpxreg'
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:46:8: note: previous defini=
tion is here
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:98:8: error: redefinition of=
 '_xmmreg'
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:53:8: note: previous defini=
tion is here
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:180:8: error: redefinition o=
f '_ymmh_state'
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:184:8: note: previous defin=
ition is here
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:192:8: error: redefinition o=
f '_xstate'
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:189:8: note: previous defin=
ition is here
1 warning and 20 errors generated.
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:317:8: error: redefinition o=
f 'sigcontext'
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:139:8: note: previous defin=
ition is here
In file included from testcases/testcases.c:7:
testcases/testcases.h:101:25: error: invalid application of 'sizeof' to an =
incomplete type 'struct _aarch64_ctx'
testcases/testcases.h:28:2: note: expanded from macro 'HDR_SZ'
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_=
ctx'
testcases/testcases.h:104:27: error: invalid application of 'sizeof' to an =
incomplete type 'struct _aarch64_ctx'
testcases/testcases.h:28:2: note: expanded from macro 'HDR_SZ'
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_=
ctx'
testcases/testcases.h:105:13: error: incomplete definition of type 'struct =
_aarch64_ctx'
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_=
ctx'
testcases/testcases.h:105:37: error: incomplete definition of type 'struct =
_aarch64_ctx'
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_=
ctx'
testcases/testcases.h:106:15: error: incomplete definition of type 'struct =
_aarch64_ctx'
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_=
ctx'
testcases/testcases.h:107:10: error: incomplete definition of type 'struct =
_aarch64_ctx'
testcases/testcases.h:85:43: note: expanded from macro 'GET_RESV_NEXT_HEAD'
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_=
ctx'
testcases/testcases.h:109:10: error: incomplete definition of type 'struct =
_aarch64_ctx'
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_=
ctx'
testcases/testcases.h:129:7: error: incomplete definition of type 'struct _=
aarch64_ctx'
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_=
ctx'
testcases/testcases.h:130:7: error: incomplete definition of type 'struct _=
aarch64_ctx'
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_=
ctx'
testcases/testcases.c:9:36: warning: declaration of 'struct extra_context' =
will not be visible outside of this function [-Wvisibility]
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
1 warning and 20 errors generated.
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:40:8: error: redefinition of=
 '_fpx_sw_bytes'
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:31:8: note: previous defini=
tion is here
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:85:8: error: redefinition of=
 '_fpreg'
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:40:8: note: previous defini=
tion is here
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:91:8: error: redefinition of=
 '_fpxreg'
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:46:8: note: previous defini=
tion is here
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:98:8: error: redefinition of=
 '_xmmreg'
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:53:8: note: previous defini=
tion is here
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:180:8: error: redefinition o=
f '_ymmh_state'
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:184:8: note: previous defin=
ition is here
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:192:8: error: redefinition o=
f '_xstate'
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:189:8: note: previous defin=
ition is here
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:317:8: error: redefinition o=
f 'sigcontext'
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:139:8: note: previous defin=
ition is here
In file included from testcases/testcases.c:7:
testcases/testcases.h:101:25: error: invalid application of 'sizeof' to an =
incomplete type 'struct _aarch64_ctx'
testcases/testcases.h:28:2: note: expanded from macro 'HDR_SZ'
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_=
ctx'
testcases/testcases.h:104:27: error: invalid application of 'sizeof' to an =
incomplete type 'struct _aarch64_ctx'
testcases/testcases.h:28:2: note: expanded from macro 'HDR_SZ'
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_=
ctx'
testcases/testcases.h:105:13: error: incomplete definition of type 'struct =
_aarch64_ctx'
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_=
ctx'
testcases/testcases.h:105:37: error: incomplete definition of type 'struct =
_aarch64_ctx'
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_=
ctx'
testcases/testcases.h:106:15: error: incomplete definition of type 'struct =
_aarch64_ctx'
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_=
ctx'
testcases/testcases.h:107:10: error: incomplete definition of type 'struct =
_aarch64_ctx'
testcases/testcases.h:85:43: note: expanded from macro 'GET_RESV_NEXT_HEAD'
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_=
ctx'
testcases/testcases.h:109:10: error: incomplete definition of type 'struct =
_aarch64_ctx'
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_=
ctx'
testcases/testcases.h:129:7: error: incomplete definition of type 'struct _=
aarch64_ctx'
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_=
ctx'
testcases/testcases.h:130:7: error: incomplete definition of type 'struct _=
aarch64_ctx'
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_=
ctx'
testcases/testcases.c:9:36: warning: declaration of 'struct extra_context' =
will not be visible outside of this function [-Wvisibility]
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
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:40:8: error: redefinition of=
 '_fpx_sw_bytes'
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:31:8: note: previous defini=
tion is here
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:85:8: error: redefinition of=
 '_fpreg'
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:40:8: note: previous defini=
tion is here
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:91:8: error: redefinition of=
 '_fpxreg'
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:46:8: note: previous defini=
tion is here
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:98:8: error: redefinition of=
 '_xmmreg'
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:53:8: note: previous defini=
tion is here
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:180:8: error: redefinition o=
f '_ymmh_state'
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:184:8: note: previous defin=
ition is here
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:192:8: error: redefinition o=
f '_xstate'
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:189:8: note: previous defin=
ition is here
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:317:8: error: redefinition o=
f 'sigcontext'
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:139:8: note: previous defin=
ition is here
In file included from testcases/testcases.c:7:
testcases/testcases.h:101:25: error: invalid application of 'sizeof' to an =
incomplete type 'struct _aarch64_ctx'
testcases/testcases.h:28:2: note: expanded from macro 'HDR_SZ'
testcases/testcases.h:95:22:1 warning and 20 errors generated.
testcases/testcases.h:104:27: error: invalid application of 'sizeof' to an =
incomplete type 'struct _aarch64_ctx'
testcases/testcases.h:28:2: note: expanded from macro 'HDR_SZ'
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_=
ctx'
testcases/testcases.h:105:13: error: incomplete definition of type 'struct =
_aarch64_ctx'
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_=
ctx'
testcases/testcases.h:105:37: error: incomplete definition of type 'struct =
_aarch64_ctx'
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_=
ctx'
testcases/testcases.h:106:15: error: incomplete definition of type 'struct =
_aarch64_ctx'
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_=
ctx'
testcases/testcases.h:107:10: error: incomplete definition of type 'struct =
_aarch64_ctx'
testcases/testcases.h:85:43: note: expanded from macro 'GET_RESV_NEXT_HEAD'
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_=
ctx'
testcases/testcases.h:109:10: error: incomplete definition of type 'struct =
_aarch64_ctx'
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_=
ctx'
testcases/testcases.h:129:7: error: incomplete definition of type 'struct _=
aarch64_ctx'
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_=
ctx'
testcases/testcases.h:130:7: error: incomplete definition of type 'struct _=
aarch64_ctx'
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_=
ctx'
testcases/testcases.c:9:36: warning: declaration of 'struct extra_context' =
will not be visible outside of this function [-Wvisibility]
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
1 warning and 20 errors generated.
signals.Ssignals.S:16:19: error: expected ']' in brackets expression
:16:19: error: expected ']' in brackets expression
signals.S:16:19: error: expected ']' in brackets expression
signals.Ssignals.S:16:19: error: expected ']' in brackets expression
:16 stp x29, x30, [sp, #-16]!:
19 :   error:  expected ']' in brackets expression=20
signals.S:16:19: error: expected ']' in brackets expression
signals.S:16:19: error: expected ']' in brackets expression
signals.S:16:19: error: expected ']' in brackets expression
signals.S:17:2: error: unknown use of instruction mnemonic without a size s=
uffix
signals.Ssignals.S::1717::22: : error: error: unknown use of instruction mn=
emonic without a size suffixunknown use of instruction mnemonic without a s=
ize suffix
signals.S:19:2: error: unknown use of instruction mnemonic without a size s=
uffix
signals.S:20:2: error: unknown use of instruction mnemonic without a size s=
uffixsignals.S
17 :^2
: error: unknown use of instruction mnemonic without a size suffix
signals.S:21:2: error: unknown use of instruction mnemonic without a size s=
uffix
signals.S mov x22, x2:
signals.S19 ::^192
:: 2error: : unknown use of instruction mnemonic without a size suffixerror=
:=20
unknown use of instruction mnemonic without a size suffix mov x20, x0
^=20
^
signals.S:signals.S19::242signals.Ssignals.S:: ::error: 20202::: unknown us=
e of instruction mnemonic without a size suffix22error:=20
: :  mov x20, x0unknown use of instruction mnemonic without a size suffix
error:  error: ^
unknown use of instruction mnemonic without a size suffixunknown use of ins=
truction mnemonic without a size suffix
signals.S mov x21, x1 mov x21, x1=20
^ :signals.S :
^17
^20::signals.S2
2:: : 25error: error: :unknown use of instruction mnemonic without a size s=
uffixsignals.Sunknown use of instruction mnemonic without a size suffix14
:=20
error: :signals.S mov x21, x1unknown token in expression:21 mov x29, sp
22  : :  error: ^error:=20
signals.S unknown use of instruction mnemonic without a size suffix:
unknown use of instruction mnemonic without a size suffix mov x22, x2
signals.Ssignals.S21
: 2  :: 17^: ^error:  17::
unknown use of instruction mnemonic without a size suffix=20
22 :  mov x22, x2:  error:=20
unknown use of instruction mnemonic without a size suffixerror:=20
signals.Ssignals.S
22signals.S:: :error: : 2414unknown use of instruction mnemonic without a s=
ize suffixerror: :: 2error: signals.S
unknown use of instruction mnemonic without a size suffix:=20
unknown use of instruction mnemonic without a size suffix:
:   error: ^ unknown use of instruction mnemonic without a size suffix
signals.S mov x20, x0:signals.S
19 : :^1914:unknown token in expressionerror: 2unknown token in expression
:=20
2 add x0, x0, #15
: : error: error:=20
signals.Serror: unknown use of instruction mnemonic without a size suffix:
unknown token in expression =20
unknown use of instruction mnemonic without a size suffix20 mov x20, x0   a=
dd x0, x0, #15
:
2
: :error: 20: ^unknown use of instruction mnemonic without a size suffix:
27signals.S: 2signals.S:=20
2:: ^:
error:  mov x21, x126error: 26signals.Sunknown use of instruction mnemonic =
without a size suffix:
:unknown use of instruction mnemonic without a size suffix14:: 2614: 14 sub=
 sp, sp, x0:=20
error: error: signals.Sunknown token in expression:=20
:^
21 =20
^
signals.S:     :  : 21signals.S :   error:  28unknown use of instruction mn=
emonic without a size suffix: 2:: 221 =20
unknown use of instruction mnemonic without a size suffix add x23, sp, x22 =

error:  unknown use of instruction mnemonic without a size suffix =20
^=20
^ mov x22, x2
^=20
30signals.S::1024: :error: signals.S2unknown token in expression::=20
27error: signals.S ldr x0, =3Dcall_fmt:signals.Sunknown use of instruction =
mnemonic without a size suffix
2 signals.S:
: :  24  add x0, x21, x22signals.S
24::error: :unknown use of instruction mnemonic without a size suffix   ^27=
:2: error: unknown use of instruction mnemonic without a size suffix
signals.S:28:2: error: unknown use of instruction mnemonic without a size s=
uffix
signals.S:30:10: error: unknown token in expression
2
:  error: =20
unknown use of instruction mnemonic without a size suffixsignals.S=20
:=20
: 14 ^:=20
27: :^231^:signals.Serror: : signals.Serror:=20
:
2:: unknown token in expressionerror: unknown use of instruction mnemonic w=
ithout a size suffixsignals.S2528
unknown use of instruction mnemonic without a size suffix
signals.S:::2 add x0, x0, #15
error:  ::   unknown use of instruction mnemonic without a size suffix^
^
error:   unknown token in expression
: ^error:=20
signals.S=20
:signals.S :1028 : 2 2 : :  ^:=20
error:  error: unknown use of instruction mnemonic without a size suffixerr=
or:  unknown token in expression unknown use of instruction mnemonic withou=
t a size suffix
signals.S mov x2, x23=20
^=20
signals.S :   ::error: 33  signals.S 14  ^
unknown use of instruction mnemonic without a size suffix30
:: mov x2, x23^::=20
26102
: error:  signals.S:signals.Serror: : unknown token in expressionunknown to=
ken in expression
^
:1431::error: 26
invalid instruction mnemonic 'bl'2:
error: 14=20
:  unknown token in expression
:   bl printferror:   bic x0, x0, #15signals.S
:error: 33 :unknown token in expression2
unknown use of instruction mnemonic without a size suffix  =20
~ mov x1, x21
signals.S:32:2: error: unknown use of instruction mnemonic without a size s=
uffix
signals.S:33:2: error: invalid instruction mnemonic 'bl'
^  2:: ~error:   2=20
^unknown use of instruction mnemonic without a size suffixsignals.S
signals.S : =20
error: :unknown use of instruction mnemonic without a size suffix mov x0, x=
23
: 27signals.S mov x0, x23:
3631^:  ::
22: ^^error: 2: unknown use of instruction mnemonic without a size suffix
: error: signals.S
: mov x1, x21error:=20
unknown use of instruction mnemonic without a size suffix26unknown use of i=
nstruction mnemonic without a size suffix:=20
^signals.S14:signals.S37 sub sp, sp, x0 mov x0, x23
: ::
signals.S::=20
: bic x0, x0, #152error: 32: unknown use of instruction mnemonic without a =
size suffix
:error:=20
signals.S:error: :  mov x1, x20 :2unknown use of instruction mnemonic witho=
ut a size suffix27 ^
28:=20
:: 2
signals.S mov x1, x20unknown use of instruction mnemonic without a size suf=
fix
38:
:2:^
^::
: error: 2unknown use of instruction mnemonic without a size suffix38error:=
 : unknown use of instruction mnemonic without a size suffix
: mov x2, x212error: : signals.Sinvalid instruction mnemonic 'bl' mov x2, x=
21
error: :signals.S
signals.S30:::27 bl printf10^^
2 : ^
~
2: error: error:  unknown token in expression: unknown use of instruction m=
nemonic without a size suffix
error: ^signals.S
signals.S=20
signals.S::39
:
2: sub sp, sp, x0^36 :: 39
signals.S :2error: :signals.S 39:  :invalid instruction mnemonic 'bl'2:^30e=
rror:  unknown use of instruction mnemonic without a size suffix2
:=20
:=20
:   mov x0, x23 bl memcpyerror:=20
10 error: : =20
invalid instruction mnemonic 'bl'^=20
invalid instruction mnemonic 'bl'error:  unknown token in expressionsignals=
.S
~:^ bl memcpy
28
signals.S^:2signals.S  :~5137:  error: ^
~
::22: : error: error: signals.Sunknown use of instruction mnemonic without =
a size suffix
signals.S:signals.S: unknown use of instruction mnemonic without a size suf=
fixinvalid instruction mnemonic 'ldr'=20
: mov x1, x205131
: 2: add x23, sp, x22 2 :^:=20
2~error: ^invalid instruction mnemonic 'ldr'
unknown use of instruction mnemonic without a size suffix: ~
signals.S
error:=20
signals.S30:
52signals.Ssignals.S: ::102 ldr x0, currentsignals.S::3852^:=20
:=20
error: 31::2:error: 2 : unknown use of instruction mnemonic without a size =
suffix2
: unknown token in expression^error: : unknown use of instruction mnemonic =
without a size suffix str x23, [x0]error: signals.Sunknown use of instructi=
on mnemonic without a size suffix:32:2
~ ldr x0, =3Dcall_fmterror:=20
unknown use of instruction mnemonic without a size suffix
unknown use of instruction mnemonic without a size suffix=20
^ =20
signals.S :^52 :^
:=20
2
signals.S 54 :: :^ signals.S2:error: : 39error:=20
:2
: error:=20
2 error: ^invalid instruction mnemonic 'bl'unknown use of instruction mnemo=
nic without a size suffixsignals.S
^33error: signals.S:
signals.S2  ^
~unknown use of instruction mnemonic without a size suffix:
:: 54^error:=20
31signals.S:invalid instruction mnemonic 'bl'2 mov x2, x23:
signals.Ssignals.S::: 562 bl printf:  error: :56:error: 10
^unknown use of instruction mnemonic without a size suffix 51:^unknown use =
of instruction mnemonic without a size suffix:=20
:102~: error:  mov sp, x23 mov x1, x21:=20
error: unknown token in expression
error:=20
invalid instruction mnemonic 'ldr'unknown token in expression
:=20
33^: mov x8, #15signals.Ssignals.S : 2
unknown use of instruction mnemonic without a size suffix mov x2, x23 mov x=
8, #15 2 ^^=20
: =20
^  mov x0, x23error:=20
unknown use of instruction mnemonic without a size suffix signals.S ^
:
57::signals.Ssignals.S::3736  22: :::^^:=20
error: 3322
error: invalid instruction mnemonic 'svc':: 2signals.S: invalid instruction=
 mnemonic 'svc'signals.S
:: 57error: error: :error: unknown use of instruction mnemonic without a si=
ze suffix
invalid instruction mnemonic 'bl'54
unknown use of instruction mnemonic without a size suffix bl printf
2   mov x1, x20^:~2
: =20
^: ^error:=20
~error:  mov x0, x23~~
invalid instruction mnemonic 'svc'=20
^unknown use of instruction mnemonic without a size suffix~
signals.S
:: 36:~signals.S
:error: signals.S38::642::37invalid instruction mnemonic 'b'2:56: ::error: =

unknown use of instruction mnemonic without a size suffix:=20
210: 2 b .: error: error:  mov x0, x23invalid instruction mnemonic 'b': err=
or: error:=20
unknown token in expressionunknown use of instruction mnemonic without a si=
ze suffix
signals.S=20
^unknown use of instruction mnemonic without a size suffix=20
^
: b .
64
: mov x8, #152 mov x1, x20
: =20
error:  invalid instruction mnemonic 'b'  ^
37=20
2=20
signals.S :: ^ error: 38unknown use of instruction mnemonic without a size =
suffix
^: =20
error: ^signals.S
unknown use of instruction mnemonic without a size suffix:
39 mov x2, x21:signals.S
:2signals.S :57: 38^:
:2error: 2: invalid instruction mnemonic 'bl':=20
error:  bl memcpyunknown use of instruction mnemonic without a size suffix
signals.S~:=20
39^:
2: error: invalid instruction mnemonic 'bl'
signals.S:51:2: error: error: invalid instruction mnemonic 'svc'invalid ins=
truction mnemonic 'ldr'
signals.Ssignals.S svc #0:
51::
2 ldr x0, current: 39error: =20
:invalid instruction mnemonic 'ldr'=20
^^2 ldr x0, current~
~~~: =20
^
~error: ~invalid instruction mnemonic 'bl'
:64signals.Ssignals.S:::252signals.S52:: :51error: 2:: :invalid instruction=
 mnemonic 'b'22error:=20
: : error: unknown use of instruction mnemonic without a size suffix b .
error:=20
unknown use of instruction mnemonic without a size suffix invalid instructi=
on mnemonic 'ldr' str x23, [x0]
^
~
signals.S:54:2: error: signals.Sunknown use of instruction mnemonic without=
 a size suffix:signals.S52
:: mov sp, x232
:  error: ^unknown use of instruction mnemonic without a size suffix
56:5410:: 2error: : unknown token in expressionerror:=20
signals.Sunknown use of instruction mnemonic without a size suffix: mov x8,=
 #15
54
2 :  error:  ^ unknown use of instruction mnemonic without a size suffix
signals.S
:56:signals.S10:: 56signals.Serror: ::unknown token in expression5710
::  mov x8, #152error:=20
: unknown token in expression error:=20
^=20
signals.S:64signals.S:signals.S:2:5757: :error: :2invalid instruction mnemo=
nic 'b'2:=20
: error:  b .error: invalid instruction mnemonic 'svc'invalid instruction m=
nemonic 'svc'
signals.S:64:2: error: invalid instruction mnemonic 'b'signals.S
: b .64:
2 : ^error:=20
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
sve_helpers.csve_helpers.c:13:18: error: use of undeclared identifier 'SVE_=
VQ_MAX'
sve_helpers.csve_helpers.c:::131313:::1818:18: : error:  use of undeclared =
identifier 'SVE_VQ_MAX'error:=20
error: use of undeclared identifier 'SVE_VQ_MAX'use of undeclared identifie=
r 'SVE_VQ_MAX'
13      _ |    V| 13uQ                 ^~~~~~~~~~ |=20
n_usMniAsgXin]ge;nd
e       di|  n                 ^~~~~~~~~~it
n tv lvsl[sS[VSEV_EV_QV_QM_AMXA]X;]
;     =20
|                        ^~~~~~~~~~|=20
sve_helpers.csve_helpers.c::1313::1818::  error: error: use of undeclared i=
dentifier 'SVE_VQ_MAX'use of undeclared identifier 'SVE_VQ_MAX'
sve_helpers.c:25:12: error: use of undeclared identifier 'SVE_VQ_MAX'
_MAX; vq > 0;    25- | -        vfqo)r  {(
v      q|                    ^~~~~~~~~~=3D
sve_helpers.c:25:12: error: use of undeclared identifier 'SVE_VQ_MAX'
sve_helpers.c:25:12: error: use of undeclared identifier 'SVE_VQ_MAX'
sve_helpers.c:25:12:    25error:  | use of undeclared identifier 'SVE_VQ_MA=
X'       =20
for (vq =3D S   V25E | _        VfQo_rM A(Xv;q  v=3Dq  S>V E0_;V Q-_-MvAqX)=
;  {v
q       | >                  ^~~~~~~~~~=20
0; --vq) {
sve_helpers.c:25:12: error: use of undeclared identifier 'SVE_VQ_MAX'
sve_helpers.c:41:12: error: call to undeclared function 'sve_vq_from_vl'; I=
SO C99 and later do not support implicit function declarations [-Wimplicit-=
function-declaration]
sve_helpers.c:41:12: error: call to undeclared function 'sve_vq_from_vl'; I=
SO C99 and later do not support implicit function declarations [-Wimplicit-=
function-declaration]
sve_helpers.c:41:12: error: call to undeclared function 'sve_vq_from_vl'; I=
SO C99 and later do not support implicit function declarations [-Wimplicit-=
function-declaration]
3 errors generated.
sve_helpers.c:41:12: error: call to undeclared function 'sve_vq_from_vl'; I=
SO C99 and later do not support implicit function declarations [-Wimplicit-=
function-declaration]
3 errorssve_helpers.c generated:41.
:12: error: call to undeclared function 'sve_vq_from_vl'; ISO C99 and later=
 do not support implicit function declarations [-Wimplicit-function-declara=
tion]
q_from_v   l41( | v        l        )if)=20
(      v| q                          ^<
33 errors generated.
3 errors generated.
3 errors generated.
sve_helpers.c:13:18: error: use of undeclared identifier 'SVE_VQ_MAX'
sve_helpers.c:25:12: error: use of undeclared identifier 'SVE_VQ_MAX'
sve_helpers.c:41:12: error: call to undeclared function 'sve_vq_from_vl'; I=
SO C99 and later do not support implicit function declarations [-Wimplicit-=
function-declaration]
3 errors generated.
sve_helpers.c:13:18: error: use of undeclared identifier 'SVE_VQ_MAX'
sve_helpers.c:25:12: error: use of undeclared identifier 'SVE_VQ_MAX'

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D


# Builds where the incident occurred:

## defconfig on (arm64):
- compiler: clang-21
- config: None
- dashboard: https://d.kernelci.org/build/maestro:69d51ceddcae953c056f95bc


#kernelci issue maestro:b038160296fc0b9fcd6813fa2bca5848db87b59f

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
