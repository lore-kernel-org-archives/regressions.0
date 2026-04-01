Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2254747AF60
	for <regressions@lists.linux.dev>; Wed,  1 Apr 2026 16:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775062752; cv=none; b=sF56cdxyF7WGd0dc0N6tJOmXYjLyknRXiaLS0Zk6Y2Y4fPp2h1Y5/Lnj2egLT0xhoYOar21s4DV+krXgygtTF9AqSBqhBJvi52Ve+nsgp0Z4vl8FFuWMjYVsvVeoAaJdj+49ytYFsWVrFt+xpwENtyPIk1GHKDw8zFOhizHsFfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775062752; c=relaxed/simple;
	bh=6KL7MfGMbs9ci98S5Z5f8tNloGYj9NZmlhTZPBdyLu0=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=FrYmAyptLDnBHmUuotBh4sadIVNyM/g3xPTK38VdBV/jnxkrI9YzPxkYMsJVo3c3YH8EMAXo9evTCRCWcNAA9jCtSVDDf2QVT6d3vlMr7SitUZYpfq8YgDcOB7VXXO2RfUSCBd0xI0n488Ccb8p8SHLPk3+EVHXouRpR6kOPySI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=jF3PHwoz; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="jF3PHwoz"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2bd9a485bd6so14024512eec.1
        for <regressions@lists.linux.dev>; Wed, 01 Apr 2026 09:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1775062747; x=1775667547; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mxdTmmMuHeDG9lsPL9fTxjerF6cN0+yGPKkClvwEfmA=;
        b=jF3PHwoz4f8TuhIqDdhDV9NDnAvqMsLZ5VrrXKxI7wYzfPgOF96TyHY6uoybnpPJFs
         eCoshjH5lecuFO/RefnbkxGMJo0WLmy5UmfT5RypLnPOfe66uPDL27Sm4P7C9OY8lkSj
         PgcMuhfjtFTHEPWTS5q64xhYmyTlSSW5G7UjMKwLCa+zkOew047FDwyGpjiC69it3Nx9
         6IqlQMdy1JAAxRDHbwFBGnaVzlj3ornazQXFdQkQL0zjglgExftGw0ym9jUUyAG+2cQi
         vost7ZhQxTNK1HBm7DorFQJBE11PUKqSDrWf3++subBkSJEimw18BJj9mShgKsTvzRlq
         qf0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775062747; x=1775667547;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mxdTmmMuHeDG9lsPL9fTxjerF6cN0+yGPKkClvwEfmA=;
        b=XLHp2JEnv6+XowQ53EWbG8H26rMTKh0vi5i424lTK93o7n4I4ZFdsfmt9YwV1RXS/c
         A7mm3HrKgWKos19cefb4e9689Gu2MM3iTtf6RR6GDW1Lcn/ntRSfpUEuosxrSqg0EPWz
         FoWqF52RJOENE7Vg4m1p1GcY3nrqwWvzLP5qGlVkRbOUCjpf5MAoiVp6zaWNu5mwEBj/
         EAiWJ2ICaheR0lq6ZjblhBxDKpdWMdr39zq2JeywJnbF/eVx/Ii2UbMZS72ymf72RdHK
         0w3szeJmdmhdVYqAPUfFPJ2jxtTzXee1/z6udMW/upIeLd89Opxu72jWtSpp2NZu1azj
         Wf4w==
X-Gm-Message-State: AOJu0YxVCplu12bFKMJB0guzsthfqT0Xf8xWATGdvcbUrbhgmmGFOU6I
	MHFWjPTt5hq019t+AuQ9hJx8REGSH+pVd9VRorVV9Ptop8NiApQzYRuwL0TP5fjcbwE=
X-Gm-Gg: ATEYQzyAVnYMKMzkMSv6OOAl0ackyYbO2lssNV4syu0E1ZWn1yLzQ5cE4fKbuulmjow
	naf9RZq1GRofjSXz0qRCzj6rrGpNSG9/kgx5m0T3eBpwsR1Eg4P6mVguf7J/j3CyTCzNeaPWjrg
	vNxDVAThVCshb/KDLxsMLjcizg7c0a0+Ki0OeXD8Rv3uQb+rcXdo05fnvi5hQAVyOseLio7Pm0n
	wVAn5FFn5TQCinIEDDHg2drGMWy/bArkUTkNMXkcfej61TdbEH+s7ignu6O3AUxjBDHeEkAW9le
	GJyC6OpCADeSHvcR9r0X+35chyAPRJ3+6cxLEZWO7r8DUyz9i4wQ73lCtjLziU0LgpvQLHNDcf7
	esPbnq/JUaJbSaQcVuOcaYxjxL6uQpQyCBH0avw0jVAgwbexA4ZnNutbs96VNlhoRSRKO9zyftI
	2ecmJz7jzjdbvHEiSQ
X-Received: by 2002:a05:7300:bc06:b0:2c7:3a7:c7a7 with SMTP id 5a478bee46e88-2c932bb25a3mr2187372eec.25.1775062746703;
        Wed, 01 Apr 2026 09:59:06 -0700 (PDT)
Received: from 984b78e0ad75 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7c20c30asm288784eec.15.2026.04.01.09.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 09:59:05 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [REGRESSION] next/master: (build)
 ./test_signals.h./test_signals.h./test_signals.h./test_signals.h:....
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 01 Apr 2026 16:59:05 -0000
Message-ID: <177506274539.1080.14277520788534285920@984b78e0ad75>





Hello,

New build issue found on next/master:

---
 ./test_signals.h./test_signals.h./test_signals.h./test_signals.h:./test_si=
gnals.h:::::151515151515:::::1010101010:::::     fatal error: fatal error: =
fatal error: 'asm/hwcap.h' file not foundfatal error: 'asm/hwcap.h' file no=
t foundfatal error: 'asm/hwcap.h' file not found'asm/hwcap.h' file not foun=
d :         1515 | 15 | # | #   i#in15inc | nlcc#ulldiu   uen1510dd  | :cee=
<# l  aifatal error: u<s<ndma'asm/hwcap.h' file not foundca/es ./test_signa=
ls.h:15:10: fatal error: 'asm/hwcap.h' file not found ./test_signals.h:15:1=
0: fatal error: 'asm/hwcap.h' file not found ./test_signals.h:15:10: fatal =
error: 'asm/hwcap.h' file not found ./test_signals.h:15:10: fatal error: 'a=
sm/hwcap.h' file not found ./test_signals.h:15:10: fatal error: 'asm/hwcap.=
h' file not found ./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file n=
ot found ./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found =
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found ./test_si=
gnals.h:15:10: fatal error: 'asm/hwcap.h' file not found ./test_signals.h:1=
5:10: fatal error: 'asm/hwcap.h' file not found : ./test_signals.hfatal err=
or: :'asm/hwcap.h' file not found15 :10: fatal error: 'asm/hwcap.h' file no=
t found ./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found .=
/test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found ./test_sig=
nals.h:15:10: fatal error: 'asm/hwcap.h' file not found ./test_signals.h:15=
:10: fatal error: 'asm/hwcap.h' file not found ./test_signals.h:15:10: fata=
l error: 'asm/hwcap.h' file not found /usr/include/x86_64-linux-gnu/asm/sig=
context.h:40:8: error: In file included from redefinition of '_fpx_sw_bytes=
' /usr/include/x86_64-linux-gnu/asm/sigcontext.h:40:8: error: In file inclu=
ded from redefinition of '_fpx_sw_bytes' u/usr/include/x86_64-linux-gnu/asm=
/sigcontext.hc:t40: 8   _:40  | error: In file included from sredefinition =
of '_fpx_sw_bytes' tru8c:t  error: _redefinition of '_fpx_sw_bytes'f /usr/i=
nclude/x86_64-linux-gnu/asm/sigcontext.h   :3140: | 8s:  t_error: rfredefin=
ition of '_fpx_sw_bytes'up r error: _redefinition of '_fpreg'f :        | /=
usr/include/x86_64-linux-gnu/bits/sigcontext.h_error:        ^:fredefinitio=
n of '_fpreg' error: redefinition of '_fpreg' r8testcases/testcases.ce::g  =
7error: {: 40r8In file included from :u:testcases/testcases.h8c ::terror: 1=
5  : p91x:r   8   e40:91g |   |  serror: s{tredefinition of '_fpxreg't :   =
p      468x | :rs eterror: rgredefinition of '_fpxreg'u  846In file include=
d from u: | testcases/testcases.cc s:terror: t7/usr/include/x86_64-linux-gn=
u/bits/sigcontext.h redefinition of '_fpxreg'r: error: _46 :p53In file incl=
uded from   | testcases/testcases.hxerror: s:rredefinition of '_xmmreg't15e=
In file included from  :x | testcases/testcases.h ms:error: m15redefinition=
 of '_xmmreg'tr: x:smt rmerror: urredefinition of '_xmmreg'ce /usr/include/=
x86_64-linux-gnu/asm/sigcontext.h:180:8: error: redefinition of '_ymmh_stat=
e' rerror: /usr/include/x86_64-linux-gnu/asm/sigcontext.huredefinition of '=
_ymmh_state':c 180t: 8_:y merror:   mredefinition of '_ymmh_state'180h erro=
r:   | /usr/include/x86_64-linux-gnu/asm/sigcontext.hredefinition of '_ymmh=
_state'{s: error:  _redefinition of '_ymmh_state'y r:hu /usr/include/x86_64=
-linux-gnu/asm/sigcontext.h_cerror: s:tredefinition of '_xstate'40t  s8   t=
:40a  | terror: seredefinition of '_xstate't In file included from  r/usr/i=
nclude/x86_64-linux-gnu/bits/sigcontext.h_/usr/include/x86_64-linux-gnu/asm=
/sigcontext.hu:s:c189w192tIn file included from ::_ 88testcases/testcases.c=
b:_:: yx7error: t : tr  uerror: _c/usr/include/x86_64-linux-gnu/bits/sigcon=
text.hredefinition of '_xstate'x: /usr/include/x86_64-linux-gnu/asm/sigcont=
ext.h:85:8: error: redefinition of '_fpreg' /usr/include/x86_64-linux-gnu/a=
sm/sigcontext.h:91:8: error: redefinition of '_fpxreg' :/usr/include/x86_64=
-linux-gnu/asm/sigcontext.h317::8317:In file included from : testcases/test=
cases.cIn file included from 8error: :testcases/testcases.c:7redefinition o=
f 'sigcontext':: 7In file included from error: : error: c rIn file included=
 from redefinition of '_xmmreg'terror: utestcases/testcases.h  /usr/include=
/x86_64-linux-gnu/asm/sigcontext.h:180:8: error: redefinition of '_ymmh_sta=
te' /usr/include/x86_64-linux-gnu/asm/sigcontext.h:192:8: error: redefiniti=
on of '_xstate' :101:_25testcases/testcases.hx:101:s:25 :t101error: :25a:in=
valid application of 'sizeof' to an incomplete type 'struct _aarch64_ctx': =
t25  error: :eerror: invalid application of 'sizeof' to an incomplete type =
'struct _aarch64_ctx' error:  dr,r/usr/include/x86_64-linux-gnu/asm/sigcont=
ext.he uu:urcc317i(tnt:st 8 t3_:r_2a ua_aerror: catrredefinition of 'sigcon=
text' tc /usr/include/x86_64-linux-gnu/asm/sigcontext.h:192:8: error: redef=
inition of '_xstate' :testcases/testcases.he  :error: {invalid application =
of 'sizeof' to an incomplete type 'struct _aarch64_ctx'104   :104      27 |=
 | :               ^ werror:  h 6i4nline    s95ttestcases/testcases.h | r:u=
s104ct:at27t :i_ ca_error:  ainvalid application of 'sizeof' to an incomple=
te type 'struct _aarch64_ctx'cir 6:ti rnerror: utredefinition of 'sigcontex=
t'c3 ::t  13rnote: error: uforward declaration of 'struct _aarch64_ctx':/us=
r/include/x86_64-linux-gnu/bits/sigcontext.hincomplete definition of type '=
struct _aarch64_ctx'c  terror: 139 incomplete definition of type 'struct _a=
arch64_ctx':_ error: i      iincomplete definition of type 'struct _aarch64=
_ctx'| nn iinnee  ssttruct _raucatrtestcases/testcases.h c:_h105a6:a413r:_ =
ccerror: ht  incomplete definition of type 'struct _aarch64_ctx'6x105 :t95:=
105a:105t:22i:37:c37:  : note:  error: forward declaration of 'struct _aarc=
h64_ctx'error: incomplete definition of type 'struct _aarch64_ctx' e95a | d=
setra(tisct    r95iu | ntestcases/testcases.hsl:ti105an:t37ei: c cserror:  =
tincomplete definition of type 'struct _aarch64_ctx'ir error: nt      incom=
plete definition of type 'struct _aarch64_ctx'l3|  h64_testcases/testcases.=
hc:tx106 :  *15105g:e  | terror:         _incomplete definition of type 'st=
ruct _aarch64_ctx' h :i22 nerror: :eincomplete definition of type 'struct _=
aarch64_ctx'  2i:_n tterror:  testcases/testcases.h3incomplete definition o=
f type 'struct _aarch64_ctx'm:2a28_g:ti2c:,  95:S      :10V22:| _:         =
               ^~~~~~~~~~~~~~~~~~~~~~~~error:  N da aerror: )d;t  du rtestc=
ases/testcases.hec*cr:thh(1016e :s4a25_t_:darc ,auterror:  cxrinvalid appli=
cation of 'sizeof' to an incomplete type 'struct _aarch64_ctx'ut  :10g109:i=
: c10error: ,   :incomplete definition of type 'struct _aarch64_ctx'testcas=
es/testcases.h 10i:z e  error: o109incomplete definition of type 'struct _a=
arch64_ctx'f   |  error: invalid application of 'sizeof' to an incomplete t=
ype 'struct _aarch64_ctx' testcases/testcases.h *:)129(:testcases/testcases=
.h(7:c:95 h:error: 22aincomplete definition of type 'struct _aarch64_ctx': =
l+;error: i 276h:46 _error: 4cinvalid application of 'sizeof' to an incompl=
ete type 'struct _aarch64_ctx'_t cxt x* h*e  ha104ed | a,        d wtestcas=
es/testcases.h,uh:ii 130lnu:eti 7h3(:ne2 otaerror: _fd3incomplete definitio=
n of type 'struct _aarch64_ctx'fte2 :7testcases/testcases.h:testcases/testc=
ases.htestcases/testcases.h :error: :28incomplete definition of type 'struc=
t _aarch64_ctx'130: :27::  note: error: expanded from macro 'HDR_SZ'incompl=
ete definition of type 'struct _aarch64_ctx'   testcases/testcases.h:105:13=
   :95  | error: sincomplete definition of type 'struct _aarch64_ctx' tx *h=
ead, utestcases/testcases.h:105i:n37:t error: 3incomplete definition of typ=
e 'struct _aarch64_ctx'2 uct _aar   c95h | 6s4_ttestcases/testcases.hcat:tx=
129i :c*7 h:ie anerror: dlincomplete definition of type 'struct _aarch64_ct=
x',i  95r | csht6a4ti_cc tixn li*nge struct _aeatrtestcases/testcases.hc_:h=
h1056e:4a37_dc:te xrerror:  (incomplete definition of type 'struct _aarch64=
_ctx'*s testcases/testcases.h:   13095: | 7s:t aerror: tincomplete definiti=
on of type 'struct _aarch64_ctx'i c inl  i130n | e                 sttarite=
stcases/testcases.hlu:-c107>:s10i: zerror: eincomplete definition of type '=
struct _aarch64_ctx'  hr6c4h_64c_tcxtx  **g)e(t(_chheatestcases/testcases.h=
ra: d106*e:)15(r:h )error:  incomplete definition of type 'struct _aarch64_=
ctx'+ uct _aarch64_ctx *head, uint32testcases/testcases.h_t: 109:m10a:g ice=
rror: ,incomplete definition of type 'struct _aarch64_ctx' :109:10:testcase=
s/testcases.h :error: 95incomplete definition of type 'struct _aarch64_ctx'=
: nline struct _aarchtestcases/testcases.h6:4130_:c7t:x  *error: gincomplet=
e definition of type 'struct _aarch64_ctx'e testcases/testcases.h:129:7: er=
ror: incomplete definition of type 'struct _aarch64_ctx' testcases/testcase=
s.h:130:7: error: incomplete definition of type 'struct _aarch64_ctx' /usr/=
include/x86_64-linux-gnu/asm/sigcontext.h:40:8: error: redefinition of '_fp=
x_sw_bytes' /usr/include/x86_64-linux-gnu/asm/sigcontext.h:85:8: error: red=
efinition of '_fpreg' /usr/include/x86_64-linux-gnu/asm/sigcontext.h:91:8: =
error: redefinition of '_fpxreg' /usr/include/x86_64-linux-gnu/asm/sigconte=
xt.h:98:8: error: redefinition of '_xmmreg' /usr/include/x86_64-linux-gnu/a=
sm/sigcontext.h:180:8: error: redefinition of '_ymmh_state' /usr/include/x8=
6_64-linux-gnu/asm/sigcontext.h:192:8: error: redefinition of '_xstate' /us=
r/include/x86_64-linux-gnu/asm/sigcontext.h:317:8: error: redefinition of '=
sigcontext' testcases/testcases.h:101:25: error: invalid application of 'si=
zeof' to an incomplete type 'struct _aarch64_ctx' testcases/testcases.h:104=
:27: error: invalid application of 'sizeof' to an incomplete type 'struct _=
aarch64_ctx' testcases/testcases.h:105:13: error: incomplete definition of =
type 'struct _aarch64_ctx' testcases/testcases.h:105:37: error: incomplete =
definition of type 'struct _aarch64_ctx' testcases/testcases.h:106:15: erro=
r: incomplete definition of type 'struct _aarch64_ctx' testcases/testcases.=
h:107:10: error: incomplete definition of type 'struct _aarch64_ctx' testca=
ses/testcases.h:109:10: error: incomplete definition of type 'struct _aarch=
64_ctx' testcases/testcases.h:129:7: error: incomplete definition of type '=
struct _aarch64_ctx' testcases/testcases.h:130:7: error: incomplete definit=
ion of type 'struct _aarch64_ctx' testcases/testcases.ctestcases/testcases.=
ctestcases/testcases.ctestcases/testcases.ctestcases/testcases.c:::::181818=
18::::3434testcases/testcases.c34::34::  : 18error:  error: :error: incompl=
ete definition of type 'struct extra_context'error: 34incomplete definition=
 of type 'struct extra_context'incomplete definition of type 'struct extra_=
context':incomplete definition of type 'struct extra_context' error: incomp=
lete definition of type 'struct extra_context' 18      :      1818341818 | =
: |  |                      |         error: tt18        teincomplete defin=
ition of type 'struct extra_context'e | trr        ee testcases/testcases.c=
::341818::testcases/testcases.c:: 18:3434error: :18::incomplete definition =
of type 'struct extra_context'34:  error: incomplete definition of type 'st=
ruct extra_context'incomplete definition of type 'struct extra_context' : e=
rror: incomplete definition of type 'struct _aarch64_ctx' testcases/testcas=
es.c:19:19: error: incomplete definition of type 'struct _aarch64_ctx'    1=
9 | testcases/testcases.c        :i19f   : 1919( | :!         tierror: efte=
stcases/testcases.cincomplete definition of type 'struct _aarch64_ctx'r :m =
( 19testcases/testcases.c!|::|t1919 e::t   testcases/testcases.cr e1919:err=
or: :rm | 19m incomplete definition of type 'struct _aarch64_ctx'         e=
rror: -|:i | 22error:                            ~~~~^:zsredefinition of '_=
fpx_sw_bytes'|  c| u                     ^,tfatal error:  | fatal error:   =
                   ^c too many errors emitted, stopping now [-ferror-limit=
=3D] mta gfatal error: _itoo many errors emitted, stopping now [-ferror-lim=
it=3D]fc fatal error: ,ptoo many errors emitted, stopping now [-ferror-limi=
t=3D] fatal error: too many errors emitted, stopping now [-ferror-limit=3D]=
 /usr/include/x86_64-linux-gnu/asm/sigcontext.h:85:8: error: redefinition o=
f '_fpreg' /usr/include/x86_64-linux-gnu/asm/sigcontext.h:91:8: error: rede=
finition of '_fpxreg' /usr/include/x86_64-linux-gnu/asm/sigcontext.h:98:8: =
error: redefinition of '_xmmreg' /usr/include/x86_64-linux-gnu/asm/sigconte=
xt.h:180:8: error: redefinition of '_ymmh_state' /usr/include/x86_64-linux-=
gnu/asm/sigcontext.h:192:8: error: redefinition of '_xstate' /usr/include/x=
86_64-linux-gnu/asm/sigcontext.h:317:8: error: redefinition of 'sigcontext'=
 testcases/testcases.c:18:34: error: incomplete definition of type 'struct =
extra_context' &etestcases/testcases.hx:t101r:a25-:> herror: eainvalid appl=
ication of 'sizeof' to an incomplete type 'struct _aarch64_ctx'd testcases/=
testcases.c:18:34: error:    incomplete definition of type 'struct extra_co=
ntext'95 lidate_extra_context(struct extra_contexttestcases/testcases.h :*1=
04e:x27t:r aerror: ,invalid application of 'sizeof' to an incomplete type '=
struct _aarch64_ctx'  : error:    incomplete definition of type 'struct _aa=
rch64_ctx'28 64_ctx *head, uinttestcases/testcases.h3:2105_:t13 : merror: a=
incomplete definition of type 'struct _aarch64_ctx'g testcases/testcases.h:=
105:37: error: incomplete definition of type 'struct _aarch64_ctx' testcase=
s/testcases.h:106:15: error: incomplete definition of type 'struct _aarch64=
_ctx' testcases/testcases.h:107:10: error: incomplete definition of type 's=
truct _aarch64_ctx' testcases/testcases.h:109:10: error: incomplete definit=
ion of type 'struct _aarch64_ctx' 1testcases/testcases.h warning: and 12920=
 error:s7 generated:. testcases/testcases.h:130:7: error: incomplete defini=
tion of type 'struct _aarch64_ctx' testcases/testcases.c:18:34: error: inco=
mplete definition of type 'struct extra_context' testcases/testcases.c:18:3=
4: error: incomplete definition of type 'struct extra_context' testcases/te=
stcases.c:19:19: error: incomplete definition of type 'struct _aarch64_ctx'=
 fatal error: too many errors emitted, stopping now [-ferror-limit=3D] sign=
als.S:16:19: error: expected ']' in brackets expression signals.S:16:19: er=
ror: expected ']' in brackets expression signals.S:16:19: error: expected '=
]' in brackets expression signals.S:16:19: error: expected ']' in brackets =
expression signals.S:16:19: error: expected ']' in brackets expression sign=
als.S:16:19: error: expected ']' in brackets expression signals.S:16:19: er=
ror: expected ']' in brackets expression signals.S:16:19: error: expected '=
]' in brackets expression signals.Ssignals.Ssignals.Ssignals.S:::1717:17:22=
:: 2: signals.S: error: :signals.Sunknown use of instruction mnemonic witho=
ut a size suffixerror: :error: 17 :  :2^ mov x29, sperror: :  mov x29, sp2 =
: error:  signals.S:signals.S19signals.Ssignals.Ssignals.S::::2:19: 191919e=
rror: ::signals.Sunknown use of instruction mnemonic without a size suffix:=
:2 : :error: error: error:  error: 2unknown use of instruction mnemonic wit=
hout a size suffix^unknown use of instruction mnemonic without a size suffi=
x:  unknown use of instruction mnemonic without a size suffixunknown use of=
 instruction mnemonic without a size suffixerror:  error: unknown use of in=
struction mnemonic without a size suffix signals.Ssignals.Ssignals.Ssignals=
.S::::20202020signals.S:::::signals.S222221:: : : : :error: 20error: error:=
 2error: unknown use of instruction mnemonic without a size suffix:: unknow=
n use of instruction mnemonic without a size suffixunknown use of instructi=
on mnemonic without a size suffixunknown use of instruction mnemonic withou=
t a size suffix2 error: :  signals.Ssignals.Ssignals.S:signals.S:::21212121=
::::2222: signals.S: : : error: :error: error: error: 21unknown use of inst=
ruction mnemonic without a size suffixunknown use of instruction mnemonic w=
ithout a size suffixunknown use of instruction mnemonic without a size suff=
ix:unknown use of instruction mnemonic without a size suffix error:  signal=
s.S:signals.S24::242signals.Ssignals.S: signals.S:error: ::2unknown use of =
instruction mnemonic without a size suffix:2424 : 24:: add x0, x21, x22sign=
als.Serror: : error: : error: error: unknown use of instruction mnemonic wi=
thout a size suffix2unknown use of instruction mnemonic without a size suff=
ix add x0, x21, x22signals.Sunknown use of instruction mnemonic without a s=
ize suffix error:  add x0, x21, x2225  add x0, x21, x22unknown use of instr=
uction mnemonic without a size suffix ^ add x0, x21, x22error: ^ 25 signals=
.S: : signals.S14signals.S25 :: :: 25error: 2514signals.S: unknown token in=
 expression:: 14:  1425error: :  : add x0, x0, #15: unknown token in expres=
sion error:  14error:  26  : 14signals.S : signals.S: signals.Serror: signa=
ls.S :26:unknown token in expression:26 :26 :error:  14:  14unknown token i=
n expression: error: :   error: unknown token in expression error: unknown =
token in expression bic x0, x0, #15 signals.S:28:2: error: unknown use of i=
nstruction mnemonic without a size suffixsignals.S : signals.Serror: :signa=
ls.Ssignals.S:unknown use of instruction mnemonic without a size suffix27:3=
0 2: :  : error: error: ^error: unknown token in expressionunknown use of i=
nstruction mnemonic without a size suffix : 2^: signals.Serror: :unknown us=
e of instruction mnemonic without a size suffix28 signals.S: signals.S :err=
or: :^27unknown use of instruction mnemonic without a size suffix28 ::22: :=
 error: error: unknown use of instruction mnemonic without a size suffixunk=
nown use of instruction mnemonic without a size suffix :: 102signals.S: : ^=
:error: signals.Serror: 31unknown use of instruction mnemonic without a siz=
e suffix: :unknown use of instruction mnemonic without a size suffixsignals=
.Serror: 28 : :   add x23, sp, x22 ^10error:  : unknown use of instruction =
mnemonic without a size suffix  error: signals.S^ unknown token in expressi=
on: :error: 2  30: unknown token in expression error: : error:   :  ^unknow=
n token in expression30 ^ :  31  error: :signals.S  unknown token in expres=
sion2:   : 33  : ldr x0, =3Dcall_fmterror: ^2  signals.S  error:  mov x1, x=
21:  invalid instruction mnemonic 'bl' :  ^error:  ~unknown use of instruct=
ion mnemonic without a size suffix  signals.Serror: 36signals.S:unknown use=
 of instruction mnemonic without a size suffix::31 232::  mov x1, x21:2erro=
r:  error: ^:  mov x0, x23:unknown use of instruction mnemonic without a si=
ze suffix error: signals.S31  2error: ^ signals.S: unknown use of instructi=
on mnemonic without a size suffix:^ error: 37 error:  mov x2, x23unknown us=
e of instruction mnemonic without a size suffix error:  :: :3233: error: 2:=
:unknown use of instruction mnemonic without a size suffixerror: : 2 2error=
: invalid instruction mnemonic 'bl' mov x2, x21: :  error:  error:  signals=
.S 2 :^: ^39~error:  error:  bl printfinvalid instruction mnemonic 'bl' ::e=
rror: 22: unknown use of instruction mnemonic without a size suffix: error:=
  error: invalid instruction mnemonic 'bl'signals.S mov x0, x23unknown use =
of instruction mnemonic without a size suffix:  error: 51signals.S mov x0, =
x23 bl printf::invalid instruction mnemonic 'bl' :  : error: ^2 bl printf^i=
nvalid instruction mnemonic 'ldr' ~error:  ldr x0, current  :2signals.S36: =
:signals.S:error: 52unknown use of instruction mnemonic without a size suff=
ix::22 36:  mov x1, x20: :error: error:  error:  mov x0, x23 37^unknown use=
 of instruction mnemonic without a size suffix: 2error: :  unknown use of i=
nstruction mnemonic without a size suffixerror: ^unknown use of instruction=
 mnemonic without a size suffix :2: signals.S37: error: ::error: 56unknown =
use of instruction mnemonic without a size suffix2signals.Sunknown use of i=
nstruction mnemonic without a size suffix: :   mov x8, #15 mov x1, x20^:^er=
ror:  :signals.S:: 2:: error: 257error: signals.Sunknown use of instruction=
 mnemonic without a size suffix: :invalid instruction mnemonic 'bl':2 error=
:  : 39unknown use of instruction mnemonic without a size suffix mov x2, x2=
1error:  bl memcpy: error: ~^ error:  : : 2error: 2error: invalid instructi=
on mnemonic 'b': :  signals.Sinvalid instruction mnemonic 'bl'error:  b .er=
ror: : error:  : : 52error: :error: 2invalid instruction mnemonic 'ldr'inva=
lid instruction mnemonic 'ldr'signals.S:  :error:  ldr x0, current ldr x0, =
current52unknown use of instruction mnemonic without a size suffix ~52~erro=
r:  ~:~unknown use of instruction mnemonic without a size suffix^ :  str x2=
3, [x0]error:  :2254: :: 2error: error: signals.S: unknown use of instructi=
on mnemonic without a size suffixunknown use of instruction mnemonic withou=
t a size suffix:error:  : :^^error:   error:  unknown use of instruction mn=
emonic without a size suffix^signals.Ssignals.S : : error: 56error: error: =
unknown token in expression:unknown use of instruction mnemonic without a s=
ize suffixunknown use of instruction mnemonic without a size suffix signals=
.S mov x8, #15:  mov sp, x23: mov sp, x23error:  error:  :  :  error:  erro=
r:   unknown token in expressionunknown token in expression   :  2  :   err=
or: signals.S  invalid instruction mnemonic 'svc':   ^: error:  ~error: inv=
alid instruction mnemonic 'svc'~invalid instruction mnemonic 'svc' signals.=
Serror: 2 :error: 2 svc #0invalid instruction mnemonic 'svc':  error:  inva=
lid instruction mnemonic 'b' svc #0signals.S^ error: : invalid instruction =
mnemonic 'b'error:  : 2error: : invalid instruction mnemonic 'b'error:  sig=
nals.S:17:2: error: unknown use of instruction mnemonic without a size suff=
ix signals.S:19:2: error: unknown use of instruction mnemonic without a siz=
e suffix signals.S:20:2: error: unknown use of instruction mnemonic without=
 a size suffix signals.S:21:2: error: unknown use of instruction mnemonic w=
ithout a size suffix signals.S:24:2: error: unknown use of instruction mnem=
onic without a size suffix signals.S:25:14: error: unknown token in express=
ion signals.S:26:14: error: unknown token in expression signals.S:27:2: err=
or: unknown use of instruction mnemonic without a size suffix signals.S:28:=
2: error: unknown use of instruction mnemonic without a size suffix signals=
.S:30:10: error: unknown token in expression signals.S:31:2: error: unknown=
 use of instruction mnemonic without a size suffix signals.S:32:2: error: u=
nknown use of instruction mnemonic without a size suffix signals.S:33:2: er=
ror: invalid instruction mnemonic 'bl' signals.S:36:2: error: unknown use o=
f instruction mnemonic without a size suffix signals.S:37:2: error: unknown=
 use of instruction mnemonic without a size suffix signals.S:38:2: error: u=
nknown use of instruction mnemonic without a size suffix signals.S:39:2: er=
ror: invalid instruction mnemonic 'bl' signals.S:51:2: error: invalid instr=
uction mnemonic 'ldr' signals.S:52:2: error: unknown use of instruction mne=
monic without a size suffix signals.S:54:2: error: unknown use of instructi=
on mnemonic without a size suffix signals.S:56:10: error: unknown token in =
expression signals.S:57:2: error: invalid instruction mnemonic 'svc' signal=
s.S:64:2: error: invalid instruction mnemonic 'b' signals.S:17:2: error: un=
known use of instruction mnemonic without a size suffix signals.S:19:2: err=
or: unknown use of instruction mnemonic without a size suffix signals.S:20:=
2: error: unknown use of instruction mnemonic without a size suffix signals=
.S:21:2: error: unknown use of instruction mnemonic without a size suffix s=
ignals.S:24:2: error: unknown use of instruction mnemonic without a size su=
ffix signals.S:25:14: error: unknown token in expression signals.S:26:14: e=
rror: unknown token in expression signals.S:27:2: error: unknown use of ins=
truction mnemonic without a size suffix signals.S:28:2: error: unknown use =
of instruction mnemonic without a size suffix signals.S:30:10: error: unkno=
wn token in expression signals.S:31:2: error: unknown use of instruction mn=
emonic without a size suffix signals.S:32:2: error: unknown use of instruct=
ion mnemonic without a size suffix signals.S:33:2: error: invalid instructi=
on mnemonic 'bl' signals.S:36:2: error: unknown use of instruction mnemonic=
 without a size suffix signals.S:37:2: error: unknown use of instruction mn=
emonic without a size suffix signals.S:38:2: error: unknown use of instruct=
ion mnemonic without a size suffix signals.S:39:2: error: invalid instructi=
on mnemonic 'bl' signals.S:51:2: error: invalid instruction mnemonic 'ldr' =
signals.S:52:2: error: unknown use of instruction mnemonic without a size s=
uffix signals.S:54:2: error: unknown use of instruction mnemonic without a =
size suffix signals.S:56:10: error: unknown token in expression signals.S:5=
7:2: error: invalid instruction mnemonic 'svc' signals.S:64:2: error: inval=
id instruction mnemonic 'b' sve_helpers.c:13:18: error: use of undeclared i=
dentifier 'SVE_VQ_MAX' sve_helpers.csve_helpers.c:13:18: error: use of unde=
clared identifier 'SVE_VQ_MAX' sve_helpers.c:13:18: error: use of undeclare=
d identifier 'SVE_VQ_MAX' :sve_helpers.c13:18: error: use of undeclared ide=
ntifier 'SVE_VQ_MAX' :25:12: error: use of undeclared identifier 'SVE_VQ_MA=
X' sve_helpers.c:25:12: error: use of undeclared identifier 'SVE_VQ_MAX' sv=
e_helpers.c:25:12: error: use of undeclared identifier 'SVE_VQ_MAX' sve_hel=
pers.c:41:12: error: sve_helpers.c:41:12: error: call to undeclared functio=
n 'sve_vq_from_vl'; ISO C99 and later do not support implicit function decl=
arations [-Wimplicit-function-declaration] sve_helpers.c:41:12: error: call=
 to undeclared function 'sve_vq_from_vl'; ISO C99 and later do not support =
implicit function declarations [-Wimplicit-function-declaration] sve_helper=
s.c:41:12: error: call to undeclared function 'sve_vq_from_vl'; ISO C99 and=
 later do not support implicit function declarations [-Wimplicit-function-d=
eclaration] sve_helpers.c:13:18: error: use of undeclared identifier 'SVE_V=
Q_MAX' sve_helpers.c:25:12: error: use of undeclared identifier 'SVE_VQ_MAX=
' sve_helpers.c:41:12: error: call to undeclared function 'sve_vq_from_vl';=
 ISO C99 and later do not support implicit function declarations [-Wimplici=
t-function-declaration] in testcases/fake_sigreturn_missing_fpsimd (Makefil=
e:31) [logspec:kbuild,kbuild.other]
---

- dashboard: https://d.kernelci.org/i/maestro:b5ea0020699d6ea2fad0d46696c2f=
2ac1ef88d9c
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it
- commit HEAD:  bd0f139e5fc11182777b81cefc3893ea508544ec
- tags: next-20260401

Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
.ctestcases/fake_sigreturn_sme_change_vl.ctestcases/fake_sigreturn_bad_size=
_for_magic0.cIn file included from :testcases/fake_sigreturn_sve_change_vl.=
c::testcases/fake_sigreturn_duplicated_fpsimd.c:In file included from :test=
cases/fake_sigreturn_bad_magic.c141414:1313:
:
:
:
:
In file included from 13In file included from In file included from ./test_=
signals_utils.hIn file included from In file included from :
./test_signals_utils.h./test_signals_utils.h./test_signals_utils.hIn file i=
ncluded from :./test_signals_utils.h::./test_signals_utils.h:1414::14:
141414:
:
:
:
./test_signals.h:
./test_signals.h./test_signals.h./test_signals.h./test_signals.h:./test_sig=
nals.h:::::151515151515:::::1010101010:::::     fatal error: fatal error: f=
atal error: 'asm/hwcap.h' file not foundfatal error: 'asm/hwcap.h' file not=
 foundfatal error: 'asm/hwcap.h' file not found'asm/hwcap.h' file not found
'asm/hwcap.h' file not found
:         1515 | 15 | # | #   i#in15inc | nlcc#ulldiu   uen1510dd  | :cee<#=
 l  aifatal error: u<s<ndma'asm/hwcap.h' file not foundca/es
lsh mumw</d/chaehwas cpmwa<./cpahha.s>wph
m>.c      /
ha|          p         ^~~~~~~~~~~~~h>| .
15
c| >#a         ^~~~~~~~~~~~~
ip
u      d| e         ^~~~~~~~~~~~~=20
<asm/hwcap.h>
In file included from testcases/fake_sigreturn_bad_size.c:13:
In file included from ./test_signals_utils.h:14:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
In file included from testcases/fake_sigreturn_misaligned_sp.c:13:
In file included from ./test_signals_utils.h:14:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
1 error generated.
1 error generated.
1 error generated.
1 error generated.
1 error generated.
11 error error generated generated.
1 error.
In file included from test_signals.c:16:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
1 error generated.
In file included from test_signals.c:16:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
1 error generated.
In file included from test_signals.c:16:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
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
In file included from test_signals.c:16:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
1 error generated.
In file included from test_signals.c:16:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
1 error generated.
In file included from In file included from test_signals_utils.c:18:
./test_signals.htest_signals_utils.c::15:1810:
: ./test_signals.hfatal error: :'asm/hwcap.h' file not found15
:10: fatal error: 'asm/hwcap.h' file not found
>     =20
|                ^~~~~~~~~~~~~|=20
In file included from test_signals_utils.c:18:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
In file included from test_signals_utils.c:18:
./test_signals.h:15:10:In file included from test_signals_utils.c:18:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
In file included from test_signals_utils.c:18:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
1 error generated.
1 error generated.
11 error generated.
In file included from test_signals_utils.c:18:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
1 error generated.
1 error generated.
1 error generated.
In file included from test_signals_utils.c:18:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
1 error generated.
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:40:8: error: In file include=
d from redefinition of '_fpx_sw_bytes'
testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:40:8: error: In file include=
d from redefinition of '_fpx_sw_bytes'
testcases/testcases.c:   740:
u/usr/include/x86_64-linux-gnu/asm/sigcontext.hc:t40: 8   _:40  | error: In=
 file included from sredefinition of '_fpx_sw_bytes'
ttestcases/testcases.cr:uctf7 p:
_xIn file included from f_testcases/testcases.hps:xw15__:
bsy/usr/include/x86_64-linux-gnu/asm/sigcontext.hwte_sb y{t
:e      40s| :        ^{
tru8c:t  error: _redefinition of '_fpx_sw_bytes'f
px_sw_bytes {
tr/usr/include/x86_64-linux-gnu/bits/sigcontext.hu:c31/usr/include/x86_64-l=
inux-gnu/bits/sigcontext.ht:: 831_::8f :pnote:  xnote: previous definition =
is here_previous definition is here
s
w_b/usr/include/x86_64-linux-gnu/bits/sigcontext.hy   :   t313131e | : | ss=
8s tt:{rr=20
uunote:       ccprevious definition is here| tt
_fIn file included from    p31testcases/testcases.cx | :s_tsrwu7_c:
btIn file included from y testcases/testcases.ht_efsp
x      _| s       ^w
_/usr/include/x86_64-linux-gnu/bits/sigcontext.hb:y31t:e8s:
15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h   :3140: | 8s:  t_error: rfr=
edefinition of '_fpx_sw_bytes'up
xc_ts w__fbpyxt_essw_
b      y|        ^t
es
struct _fpx_sw_bytes {
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.hIn file included from :testcases=
/testcases.c15::
/usr/include/x86_64-linux-gnu/bits/sigcontext.h7/usr/include/x86_64-linux-g=
nu/asm/sigcontext.h:
::In file included from 31testcases/testcases.h:85:8:15:8:
In file included from  redefinition of '_fpreg'In file included from _
testcases/testcases.c
testcases/testcases.hf::px157_   :
:
s85In file included from w | /usr/include/x86_64-linux-gnu/asm/sigcontext.h=
testcases/testcases.h_s:   bt1585yr:
r error: _redefinition of '_fpreg'f
preg    85{ |=20
s      te| :r       ^g85u
:        | /usr/include/x86_64-linux-gnu/bits/sigcontext.h_error:        ^:=
fredefinition of '_fpreg'
40p
:r8e:/usr/include/x86_64-linux-gnu/bits/sigcontext.hg : note:    40{previou=
s definition is here:85
8 |       :s | note:           ^tprevious definition is here40
r
note: p
e|        ^g
/usr/include/x86_64-linux-gnu/bits/sigcontext.hs:tIn file included from 40r=
:testcases/testcases.cu:8c
7:t:
p15r:
e/usr/include/x86_64-linux-gnu/asm/sigcontext.h   g:40
85 |       :s8| t:       ^ r
error: redefinition of '_fpreg'
In file included from utestcases/testcases.cc:   t785 :
etg/usr/include/x86_64-linux-gnu/asm/sigcontext.h=20
:_      91| f       ^p:In file included from=20
r8testcases/testcases.ce::g  7error: {:
redefinition of '_fpxreg'
In file included from=20
In file included from 91/usr/include/x86_64-linux-gnu/asm/sigcontext.htestc=
ases/testcases.c | ::/usr/include/x86_64-linux-gnu/bits/sigcontext.hs917:t::
40r8In file included from :u:testcases/testcases.h8c ::terror: 15  :
note: redefinition of '_fpxreg'_/usr/include/x86_64-linux-gnu/asm/sigcontex=
t.hprevious definition is here
f:
p91x:r   8   e40:91g |   |  serror: s{tredefinition of '_fpxreg't
r
r      uu| cIn file included from c       ^ttestcases/testcases.c   t
:fspIn file included from 46prttestcases/testcases.h:exr:8gur15:
c:
_
91{f
:   p      468x | :rs eterror: rgredefinition of '_fpxreg'u=20
c{t
91
x | rset/usr/include/x86_64-linux-gnu/bits/sigcontext.hg/usr/include/x86_64=
-linux-gnu/bits/sigcontext.hr:
:u46      46c:| :t       ^88=20
In file included from :_testcases/testcases.c f:note: p7previous definition=
 is herex:
In file included from r:testcases/testcases.he :gnote:  15   previous defin=
ition is here{:
46
/usr/include/x86_64-linux-gnu/asm/sigcontext.h |       :s| 91t       ^:   r
846In file included from u: | testcases/testcases.cc s:terror: t7/usr/inclu=
de/x86_64-linux-gnu/bits/sigcontext.h redefinition of '_fpxreg'r:
:_
uIn file included from 46ctestcases/testcases.hf:t:p8    15x:_91:
r  | f/usr/include/x86_64-linux-gnu/asm/sigcontext.hesnote: :ptgprevious de=
finition is here98xr
:ru      8c| :et       ^     g
error: _46
redefinition of '_xmmreg'f |      =20
ps| xt       ^rr
rf      up| cx       ^tr
/usr/include/x86_64-linux-gnu/bits/sigcontext.hm      :m| 46r       ^:e
8g:  {note:=20
previous definition is here     =20
|        ^In file included from=20
testcases/testcases.c   :/usr/include/x86_64-linux-gnu/bits/sigcontext.h746=
::
cnote: /usr/include/x86_64-linux-gnu/asm/sigcontext.hIn file included from =
tprevious definition is here:testcases/testcases.c
:p53In file included from   | testcases/testcases.hxerror: s:rredefinition =
of '_xmmreg't15eIn file included from=20
r:
gtestcases/testcases.cu/usr/include/x86_64-linux-gnu/asm/sigcontext.h
:c:      7t98|     ::
:x | testcases/testcases.h ms:error: m15redefinition of '_xmmreg'tr:
re/usr/include/x86_64-linux-gnu/asm/sigcontext.hug:c
x:smt rmerror: urredefinition of '_xmmreg'ce
tg  _{x
tgr u{/usr/include/x86_64-linux-gnu/bits/sigcontext.hc
:t      53|  :       ^In file included from _8
testcases/testcases.cx::m 7/usr/include/x86_64-linux-gnu/bits/sigcontext.hm=
note: :
:rIn file included from previous definition is here53testcases/testcases.he
::g815 ::
:| t8       ^:r  =20
s :t_53rx:u   8mc98:mt |  r snote: t_eprevious definition is hererxg
um
mc      rt|    e       ^ g53
_
uecgt  {_
x      | m       ^m
re/usr/include/x86_64-linux-gnu/bits/sigcontext.hg:
53      :| 8       ^:
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:180:8: error: redefinition o=
f '_ymmh_state'
In file included from /usr/include/x86_64-linux-gnu/bits/sigcontext.htestca=
ses/testcases.c::1847::
8In file included from :testcases/testcases.h :note: In file included from =
15previous definition is heretestcases/testcases.c
:
:/usr/include/x86_64-linux-gnu/asm/sigcontext.h7::
rerror: /usr/include/x86_64-linux-gnu/asm/sigcontext.huredefinition of '_ym=
mh_state':c
180t: 8_:y merror:   mredefinition of '_ymmh_state'180h
struIn file included from c/usr/include/x86_64-linux-gnu/bits/sigcontext.ht=
estcases/testcases.cIn file included from t:: 1847:
_:In file included from y8testcases/testcases.hm::testcases/testcases.cm15 =
::
hnote: 7/usr/include/x86_64-linux-gnu/asm/sigcontext.h_previous definition =
is here:
:s
In file included from 180t:testcases/testcases.ha8:t:  15 e184:
error:   | /usr/include/x86_64-linux-gnu/asm/sigcontext.hredefinition of '_=
ymmh_state'{s:
t180      r:  u| 8180c:       ^ | t=20
error:  _redefinition of '_ymmh_state'y
m/usr/include/x86_64-linux-gnu/bits/sigcontext.hm:h184s_:ts  r8tu180:c | a =
tstnote:  teprevious definition is here_r
uy      cm| tm       ^   h
184__ | yssmttmartuhec_ ts{ t
_a      yt| m       ^em
s      t/usr/include/x86_64-linux-gnu/bits/sigcontext.h| a:       ^t184
e:
8      :|  /usr/include/x86_64-linux-gnu/bits/sigcontext.h       ^note: :
previous definition is here184
:In file included from 8testcases/testcases.c:  :In file included from 184 =
7testcases/testcases.c | :
note: :sIn file included from previous definition is herettestcases/testcas=
es.h
r:u715c:
:
t  In file included from /usr/include/x86_64-linux-gnu/asm/sigcontext.h 184=
testcases/testcases.h:_ | :192ys15:mt8m:
r:hu /usr/include/x86_64-linux-gnu/asm/sigcontext.h_cerror: s:tredefinition=
 of '_xstate'40t=20
:a_8tIn file included from y:etestcases/testcases.cm=20
_
sIn file included from sttestcases/testcases.htr:au15tc:
et
/usr/include/x86_64-linux-gnu/asm/sigcontext.h       :_| 192x       ^:
s8   t:40a  | terror: seredefinition of '_xstate't In file included from=20
r{testcases/testcases.cu
:c      7t  | :
testcases/testcases.hfs:pt15x:
r/usr/include/x86_64-linux-gnu/bits/sigcontext.h_/usr/include/x86_64-linux-=
gnu/asm/sigcontext.hu:s:c189w192tIn file included from ::_ 88testcases/test=
cases.cb:_:: yx7error: t :
seredefinition of '_xstate'note: In file included from st
testcases/testcases.h previous definition is herea:{
t15
192 | /usr/include/x86_64-linux-gnu/asm/sigcontext.h | {       ^  s
:189t      192 | r:| su8       ^tc:
tr  uerror: _c/usr/include/x86_64-linux-gnu/bits/sigcontext.hredefinition o=
f '_xstate'x:
st189t :a_8t  e:x192   | s{note: s
ttprevious definition is herea      /usr/include/x86_64-linux-gnu/bits/sigc=
ontext.hr
| :ut       ^31ce
:t =20
8 189      :/usr/include/x86_64-linux-gnu/bits/sigcontext.h_ |  | :xnote:  =
      ^s189sprevious definition is here
:t
t8ra:ut c   enote: t31 previous definition is here  | {
_s
xt        s| r189tu       ^ | c
asttt e/usr/include/x86_64-linux-gnu/bits/sigcontext.hr_
:f      u189p| :x       ^8_
:s wnote: _previous definition is hereb
yte  s189
ruct _xstate
ct _xstate
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
In file included from testcases/testcases.c:In file included from 7testcase=
s/testcases.c:
:In file included from 7testcases/testcases.h:
:In file included from 15testcases/testcases.h:
:/usr/include/x86_64-linux-gnu/asm/sigcontext.h15:
:/usr/include/x86_64-linux-gnu/asm/sigcontext.h317::8317:In file included f=
rom : testcases/testcases.cIn file included from 8error: :testcases/testcas=
es.c:7redefinition of 'sigcontext'::
7In file included from error: :
testcases/testcases.hredefinition of 'sigcontext'In file included from :tes=
tcases/testcases.h
15::
15/usr/include/x86_64-linux-gnu/asm/sigcontext.h  :
317/usr/include/x86_64-linux-gnu/asm/sigcontext.h: |   In file included fro=
m :98317s317:testcases/testcases.c | t8::sr:87 ut::
error: c rIn file included from redefinition of '_xmmreg'terror: utestcases=
/testcases.h=20
redefinition of 'sigcontext'c:s
t15i :
tx  m{sm
ir      g  | ec317       ^g o
tt
139 {:s
8i      /usr/include/x86_64-linux-gnu/bits/sigcontext.h:g| :c        ^53/us=
r/include/x86_64-linux-gnu/bits/sigcontext.honote:=20
n::previous definition is heret8139e:
:x/usr/include/x86_64-linux-gnu/bits/sigcontext.h 8tnote: :: previous defin=
ition is here139   {:note:=20
8139previous definition is here      : | |=20
tprevious definition is herer
tn t ts _e  xsix139mig | mtgcrsc
eoto      grnn|=20
utt      c       ^ee| t
xx        ^tts
i            g| | c       ^       ^o
ntext
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
In file included from 7utestcases/testcases.h:
testcases/testcases.cc:
::testcases/testcases.httestcases/testcases.h7101: :
:101:_25testcases/testcases.hx:101:s:25 :t101error: :25a:invalid applicatio=
n of 'sizeof' to an incomplete type 'struct _aarch64_ctx': t25=20
error: :eerror: invalid application of 'sizeof' to an incomplete type 'stru=
ct _aarch64_ctx'
error:=20
| invalid application of 'sizeof' to an incomplete type 'struct _aarch64_ct=
x'       ^
H__DSSRZZtestcases/testcases.h)_:)
S28
note: | expanded from macro 'HDR_SZ'                               ^~~~~~
testcases/testcases.htestcases/testcases.h::2828testcases/testcases.h   :::=
282228 | :::         2note: s :expanded from macro 'HDR_SZ'inote: =20
zexpanded from macro 'HDR_SZ'note: e
oexpanded from macro 'HDR_SZ'f
(s   t   28r28    | u | 28        c         | tss         i_iszazeaieorzofc=
ehf(6o(s4sft_tcr(rtusuxc)tct
rt       u _| c_        ^     ~~~~~~~~~~~~~~~~~~~~~ata
a ar_rcach6hatestcases/testcases.h46r:_c495ch_:t6c22x4t:) _xnote:=20
c)forward declaration of 'struct _aarch64_ctx'      t
| x              ^     ~~~~~~~~~~~~~~~~~~~~~)|=20
|         ^     ~~~~~~~~~~~~~~~~~~~~~  =20
95testcases/testcases.h | :stestcases/testcases.h95t::atestcases/testcases.=
h2295t:::i 95c22note: : :forward declaration of 'struct _aarch64_ctx'i22=20
n:note: l forward declaration of 'struct _aarch64_ctx'inote:=20
nforward declaration of 'struct _aarch64_ctx'e
dr,r/usr/include/x86_64-linux-gnu/asm/sigcontext.he uu:urcc317i(tnt:st 8 t3=
_:r_2a ua_aerror: catrredefinition of 'sigcontext' tc
rm hca6_hg4ai6  _ac4c317,r_t |=20
cxs      ch t| t6ru*4xh_ ec*                     ^t_agxde ,t* _huheiseantad=
tad,3te2 e_ru
t(i       sn| mt       ^atr
g3ui2cc_t,t=20
grichc6,4
_      c| t                     ^x
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:192:8: error: redefinition o=
f '_xstate'
:testcases/testcases.he  :error: {invalid application of 'sizeof' to an inc=
omplete type 'struct _aarch64_ctx'104 =20
:104      27 | | :               ^ werror:=20
hinvalid application of 'sizeof' to an incomplete type 'struct _aarch64_ctx=
'i
l  /usr/include/x86_64-linux-gnu/bits/sigcontext.h104e: |  189        :(w8h=
o:  if 104lfnote:  | eprevious definition is heres        =20
ez      s|         ^v-
_ sHzD R-_ SHZD R&_&S
&
28_:s2z:testcases/testcases.h  :-note: 28 :Hexpanded from macro 'HDR_SZ'D2
R:_ Snote: Zexpanded from macro 'HDR_SZ'   =20
28& | &       =20
s         i| 28z                                 ^~~~~~ | e
_ctx)
r
ch64testcases/testcases.h_:c95   t:28x22 | ):       =20
eo| f        ^     ~~~~~~~~~~~~~~~~~~~~~(
strtestcases/testcases.h   u:95c95 | t:s 22_t:a aanote: triforward declarat=
ion of 'struct _aarch64_ctx'cc
h 6i4nline    s95ttestcases/testcases.h | r:us104ct:at27t :i_ ca_error:  ai=
nvalid application of 'sizeof' to an incomplete type 'struct _aarch64_ctx'c=
ir
tncxlh)i6
n4      | e_        ^     ~~~~~~~~~~~~~~~~~~~~~ c
st  tx104r  | u*        cgwtetestcases/testcases.hh t:i__l95ahe:ae 22ra:(cd=
 ohenote: f6rforward declaration of 'struct _aarch64_ctx'f4(
s_s ct<t=3Drx u rc*etsgv e__saza -    trH_cDhRh_e6Sa4Zd_ ec&&rt
95(x       |  s| st*                                 ^~~~~~trh
auetcaitdctestcases/testcases.h , :_ i28a:una2il:rni ctnote: nh3expanded fr=
om macro 'HDR_SZ'e62
xc28aIn file included from  t | testcases/testcases.hg*        : ihs15_cei:
a,za/usr/include/x86_64-linux-gnu/asm/sigcontext.h
aed:      or,| 317fc :(                     ^h8su
6:ti rnerror: utredefinition of 'sigcontext'c3
t2 __ta   am317ra | cgshit6cr4,u_
4cc      _tt| c x                     ^ts)
xi
tt_ehxeta testcases/testcases.htestcases/testcases.h{d:
:95e      105r:| :testcases/testcases.h(22       ^13:s:105
::t  13rnote: error: uforward declaration of 'struct _aarch64_ctx':/usr/inc=
lude/x86_64-linux-gnu/bits/sigcontext.hincomplete definition of type 'struc=
t _aarch64_ctx'c=20
:
terror: 139 incomplete definition of type 'struct _aarch64_ctx':_
8a:a r   note:   c95previous definition is here105 | h
gca      ei | aac       ^!dr
rm-      (a>| sgm                     ^tiarcug)i c{)c
_               ~~~~^a     =20
a| r               ~~~~^c
htestcases/testcases.h6
:4testcases/testcases.h95_::c9522t:x: 22 *:note: h forward declaration of '=
struct _aarch64_ctx'enote: a
dforward declaration of 'struct _aarch64_ctx',
error: i      iincomplete definition of type 'struct _aarch64_ctx'| nn
iinnee  ssttruct _raucatrtestcases/testcases.h c:_h105a6:a413r:_ ccerror: h=
t  incomplete definition of type 'struct _aarch64_ctx'6x105
4 |  _        *c gt ex    t 105*  | _g         he  et ha_ edh a eed ra- (d>=
hsemetraad(rg-siu>tcmcr atu!g ci=3Dc_t  a m!a_=3Dra camarhgc6ih4c6 _&4c&_t =
cxhaet ax*gd h-i*e>chm aea&da&g,d i ,hcue )ia ud{ni
-tn32t      3_| 2t               ~~~~^_=20
tm a>mgmaiagctestcases/testcases.hgci,:itc
95c :      ,s)22| i
| note: o
t| e               ~~~~^x
t {
:t95:105a:105t:22i:37:c37:  : note:  error: forward declaration of 'struct =
_aarch64_ctx'error: incomplete definition of type 'struct _aarch64_ctx'
incomplete definition of type 'struct _aarch64_ctx'
/usr/include/x86_64-linux-gnu/bits/sigcontext.h
i:nl139i:n    e8105105:  |  | s                 tnote: r  uprevious definit=
ion is here  c
&cia      t ng|  lhi_       ^iecan
a aed&r -cs&>htm6r4ua _cghctiet cxa_ )da* -ah>{e
ma      ad| ,g                                       ~~~~^ i
uci)n t{testcases/testcases.h3
:2_      95rt| :c                                        ~~~~^22hm:6
a4 g_note: icforward declaration of 'struct _aarch64_ctx'ct
,testcases/testcases.hx
:       95*| :g                     ^22e
:t note: _forward declaration of 'struct _aarch64_ctx'h  =20
e95a | dsetra(tisct    r95iu | ntestcases/testcases.hsl:ti105an:t37ei: c cs=
error:  tincomplete definition of type 'struct _aarch64_ctx'ir
nulcitn e_t   a 105s_ | at        arr acu rh cc 6ht 6 4 4_ __hacceattarxxdc=
  -h*>*6hmg4ea_eagcitdct_, xh ! u=3De* igamneadtgte3i_r2ch( _e&ts&at  rmhdu=
eecartd( -s>_tamaraaugicrctc) h _6{a4g
a_i      rcc| c,t                                       ~~~~^h
x6      4|  _                     ^*ctestcases/testcases.h
ht:ex95a: 22d*:,h  note: uforward declaration of 'struct _aarch64_ctx'i
nt32_t    e95 | mastestcases/testcases.hadt:g,a105it :icu37c:i,  ni
error: nt      incomplete definition of type 'struct _aarch64_ctx'l3|=20
i2                     ^n_
e ts tmraugcitc ,_
a      a| r                     ^c
h64_testcases/testcases.hc:tx106 :  *15105g:e  | terror:         _incomplet=
e definition of type 'struct _aarch64_ctx' h
c hh6e4a_dc  -t106>x s*ihzeea;cd
n | t        3        2o_ftestcases/testcases.htf: sm95a :gm+22ia=3D:cg,  i
note: hc      forward declaration of 'struct _aarch64_ctx'e |=20
a&                     ^d
&- >hseiazde-   ;>
95m       | a| sg                        ~~~~^ti
act)i testcases/testcases.hc{ testcases/testcases.h
:i      106:n| :95                                       ~~~~^15l:
:i22 nerror: :eincomplete definition of type 'struct _aarch64_ctx'=20
testcases/testcases.hru   c95t |    s106_t | aa        at        :roi95cfc:=
fh 22s6i:  n4+note: l=3D_forward declaration of 'struct _aarch64_ctx' ic
hnteexa  ds*->tgsreiutzc_e;th  =20
eatrra(ctstestcases/testcases.hiht:c6r95 4ui:_22cnc:tl t inote: x_nforward =
declaration of 'struct _aarch64_ctx' ae
*agrecth_6   4h95_e | castdtaxet ri*(c hs seittanrrdluui,cnc tetu   i_s_ant=
aatrar3urc2ccIn file included from hth_testcases/testcases.c 66t:_44 7a__m:
accartestcases/testcases.httcg:xhxi101 6 c:*425*,g_:he
e*
,ag deuetir_n(ht  e3101a2 | d_        etir f(m sa(tg!rsihutcec,rta
u d      c_ | ta|                     ^ a|
_r acrhae6rs4cv__hcs6tz4x _ <c* thHxeD aR*d_h,SeZ )atestcases/testcases.hu
di:      ,n107| t :                               ^~~~~~3u10
2i:_n tterror:  testcases/testcases.h3incomplete definition of type 'struct=
 _aarch64_ctx'm:2a28_g:ti2c:,=20
note:       expanded from macro 'HDR_SZ'|=20
u
T      c_| tR                     ^ E
_SaVa_r  Nc107Eh | 6X4        T_        _chHteEx)aA
dD       | (=3D        ^     ~~~~~~~~~~~~~~~~~~~~~h=20
eGaEdT)testcases/testcases.h_testcases/testcases.h;:Rtestcases/testcases.h:=
107E
95:S      :10V22:| _:                        ^~~~~~~~~~~~~~~~~~~~~~~~error:=
  N
incomplete definition of type 'struct _aarch64_ctx'note: Eforward declarati=
on of 'struct _aarch64_ctx'
X
Ttestcases/testcases.h_:H85E:  A43107D:: |    ( 106        95h:         | n=
ote: e15hsexpanded from macro 'GET_RESV_NEXT_HEAD'a:et
da aerror: )d;t=20
=3D       | G                       ^~~~~~~~~~~~~~~~~~~~~~~~ET_Rincomplete =
definition of type 'struct _aarch64_ctx'E
SV_NEXT  _106H
note:          hexpanded from macro 'GET_RESV_NEXT_HEAD'85| e
(-s>ttestcases/testcases.hr:u85   c:85t43 |          _(asatrrc:s huinote: 6=
czexpanded from macro 'GET_RESV_NEXT_HEAD'4te
_ c_taaxr    c85* | h)        6((4(s_tcrchutacrt;  *_
)a      (a| xh                        ~~~~^r )
c* h)+6( 4((_chchttestcases/testcases.h)xa:- r95*> :)s*22(i():cz (henote: a=
h)forward declaration of 'struct _aarch64_ctx'r)
()h )   +- 95>( | shsi)testcases/testcases.h-zt>:eas95)i:
ze      22)| :
note: |                                               ~~~^forward declarati=
on of 'struct _aarch64_ctx'
testcases/testcases.h:95testcases/testcases.h::2295::    22note: 95: | forw=
ard declaration of 'struct _aarch64_ctx' snote:=20
tforward declaration of 'struct _aarch64_ctx'a
tic itnli      i9595n |  | ess ttsaatttriccui  cciit nn ill_niialnnaieern  =
cessh tt6rsr4utu_ccrcttu t c_x_ta a a*a_rrgaccehhat66r_44c_h_hcec6tatx4dx _=
e cr*t(gxse tt_*rhgueecattd_ erh_(easaatdrr*ecughcre6tIn file included from=
 (t4 _s_testcases/testcases.c_htc:eart7aax:
du rtestcases/testcases.hec*cr:thh(1016e :s4a25_t_:darc ,auterror:  cxrinva=
lid application of 'sizeof' to an incomplete type 'struct _aarch64_ctx'ut=20
ci* hnh_6teaa3a4dr2_,c_c h  ttu6101 xi4 | m n_        at*ci3ghft2ie _xc(at =
!,d h
,mea       agu| dii                     ^ cn
*,|t
|3       2| r_                     ^et
s vm_asgzi c<,=20
_SZh)
e      a| d                               ^~~~~~,
:10g109:i: c10error: ,   :incomplete definition of type 'struct _aarch64_ct=
x'testcases/testcases.h
28=20
10i:z e  error: o109incomplete definition of type 'struct _aarch64_ctx'f   =
|=20
(109s         | ti        rfiu fc( th(   he109_e | aaa        dadi-r->fcm> =
ham(6g4ahi_geccia tcd=3Dx )=3D-=3D
iagcig)ci  {testcases/testcases.hc=3D
:)      95=3D | : {            ~~~~^22
:m       a| note: gforward declaration of 'struct _aarch64_ctx'            =
~~~~^testcases/testcases.hi
:c95): 22{:
testcases/testcases.h       :note: | 95   forward declaration of 'struct _a=
arch64_ctx'            ~~~~^95:
22s:t anote: ttestcases/testcases.hforward declaration of 'struct _aarch64_=
ctx'   i
:95c95 |  :si22tn:al tinote: inforward declaration of 'struct _aarch64_ctx'=
ce
(_eacstdtt_,xrh  u*ueihcanetdat d3e,2_r _aut(ai srnmtcatgh3ri26uc_4,tc_
c107a*, | r
h              ce        | ah                     ^hd6
e,4a _duc it=3Dnx t G*3Eh2Te__atRdE ,Sm Vau_giNinEtcX3,T
2_      _H| tE                     ^A=20
Dm(atestcases/testcases.hgi:c104,:
error: invalid application of 'sizeof' to an incomplete type 'struct _aarch=
64_ctx'
v      _| s                       ^~~~~~~~~~~~~~~~~~~~~~~~z
note:       expanded from macro 'GET_RESV_NEXT_HEAD'|=20
testcases/testcases.h:28:   285: |          note: (expanded from macro 'HDR=
_SZ'
_      c| t        ^     ~~~~~~~~~~~~~~~~~~~~~x
testcases/testcases.h *:)129(:testcases/testcases.h(7:c:95 h:error: 22ainco=
mplete definition of type 'struct _aarch64_ctx':
l+;error: i
e| h                 ~~~~^)s
t-  r>129  us | c129it         | z testcases/testcases.h                _e:=
ta95        )aa:tr
22iac      :lh| i-                                               ~~~^l>note=
:=20
-mforward declaration of 'struct _aarch64_ctx'>a
mgia6cg4 _ic=3Dct  x0=3D ;*=20
g0      e| t;   _                ~~~~^95
h
etrtestcases/testcases.hi(:cs95 t:itestcases/testcases.hrn22testcases/testc=
ases.hu:l::c95 it95nnote:  ::_2222a::a  rnote: note: cforward declaration o=
f 'struct _aarch64_ctx'h
6forward declaration of 'struct _aarch64_ctx'4eforward declaration of 'stru=
ct _aarch64_ctx'_
csttxr u*chte       a   95_d9595 | a, |  | sa sstruttaicaantthttii63ic42cc =
__  ictiint nnxml ali*gingineecte, _
ecurtc( st_t ar_auarcatc rh_c6ah4ar_6cl4chi_t6n4xce_ t c*xstg tx*r eg*utehc=
_ettha _de_h,aa eduaaeirdnrceth(r36s(24t__strct utrmcxuat cg *ti_gc e,a_tes=
tcases/testcases.h
taa      :_ra| 104cr:                     ^hc
276h:46 _error: 4cinvalid application of 'sizeof' to an incomplete type 'st=
ruct _aarch64_ctx'_t
cxt x* h*e  ha104ed | a,        d wtestcases/testcases.h,uh:ii 130lnu:eti 7=
h3(:ne2 otaerror: _fd3incomplete definition of type 'struct _aarch64_ctx'ft=
e2
sr_  (t<ms=3D at   mgrr130aiu | egc        csi        ,vtct
_ a,      si_
z| la                            ^-a-|=20
>r                      ^cs
HhiD6zR4e__ S=3DcZ t0 x;&=20
*&      h
| etestcases/testcases.h                      ~~~~^a|=20
:d                                 ^~~~~~130,
:7testcases/testcases.h:testcases/testcases.htestcases/testcases.h :error: =
:28incomplete definition of type 'struct _aarch64_ctx'130:
:27::  note: error: expanded from macro 'HDR_SZ'incomplete definition of ty=
pe 'struct _aarch64_ctx' =20
130 |          u           i28  tn | 130at         | i3s        li2        =
-z_ett>a osifmil(az-sgei> tcs=3Dr,iu
a       a0| r;                ~~~~^c
h      6| 4                ~~~~^_
testcases/testcases.hct:x95):testcases/testcases.h
22:      :95|         ^     ~~~~~~~~~~~~~~~~~~~~~ :
note: 22forward declaration of 'struct _aarch64_ctx':
:95:22   :95  | note: s   forward declaration of 'struct _aarch64_ctx't95
tr4xc_ hc*6tg4xe_ tc*_tghx ee*tag_deheter_ha(edsaetdrreu(rcs  (tts109 rt | =
_ur        acuitacf rt  _c(_ahhaae6arar4cdc_h-hc6>6t4m4x__a cgc*tithxcxe   =
a*=3D*hd=3Dhe, ae mdaua,dig ,niu ctiu3ni2tn3_t2t3_ 2tm_ at)mg  aim{gca
i,gc     =20
i,|      =20
c            ~~~~^|       ,
|                      ^
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_=
ctx'
testcases/testcases.h:105:13   :95  | error: sincomplete definition of type=
 'struct _aarch64_ctx'
testcases/testcases.h:95:22:_ hnote: eforward declaration of 'struct _aarch=
64_ctx'a
der(stsr   u95c | ts tt_aaattaiirccc  hii6nn4ll_iicnnete x s st*trhruecuatc=
d _aarcth 6_4a_act,rxc  hu*6ig4en_ttc_3th2xe_a td *emgrae(gtsi_tchr,eu
ac      dt| e                      ^r_
(asartcrhu6c4t_ c_taxa r*chhe6a4d_, uicnt32_t magic,
tx *head, utestcases/testcases.h:105i:n37:t error: 3incomplete definition o=
f type 'struct _aarch64_ctx'2
_t mag  i105c | ,       =20
gic) {
>magic    95! | =3Ds tmaatgiic ci n&l&i nhee asdtr-u>cmt a_gaiacr)c h{6
4      _| c               ~~~~^t
x *gettestcases/testcases.h_h:e95a:de22r:( snote: tforward declaration of '=
struct _aarch64_ctx'r
uct _aar   c95h | 6s4_ttestcases/testcases.hcat:tx129i :c*7 h:ie anerror: d=
lincomplete definition of type 'struct _aarch64_ctx',i=20
nuei nstt3r2u_ctt  m_aagaircc,  h
1296      4|  |                      ^_       =20
c        ttxa i*l->magegti_che a=3Dd er0testcases/testcases.h(;:s
t106r      :u| 15c                ~~~~^:t
testcases/testcases.h:  95106: | 22        :          onote: f_fforward dec=
laration of 'struct _aarch64_ctx'as
a r+c=3Dh h6e4a_dc-t>   xs95 i | *zshet;ea
atd      i,|                          ~~~~^cu
icct,
95r | csht6a4ti_cc tixn li*nge struct _aeatrtestcases/testcases.hc_:hh1056e=
:4a37_dc:te xrerror:  (incomplete definition of type 'struct _aarch64_ctx'*s
gtert_uhceta  d 105e_ | r        ( s t r u c t  ah_aearaacdrhc-6h>4m6_a4cg_=
ticxct  x*! h=3D*e haemdaa,dg ,iu ciu ni&tn&t 33h22e__attd  -mm>aamggaiigcc=
i,,c
)             | | {                     ^                     ^
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_=
ctx'
testcases/testcases.h:   13095: | 7s:t aerror: tincomplete definition of ty=
pe 'struct _aarch64_ctx'i
c inl  i130n | e                 sttaritestcases/testcases.hlu:-c107>:s10i:=
 zerror: eincomplete definition of type 'struct _aarch64_ctx'=20
t=3D  _0a;a
4h_ecatdx  =3D* gGeEtT__hReEaStestcases/testcases.hdV:e_95rN:(E22sX:tT r_no=
te: uHforward declaration of 'struct _aarch64_ctx'cE
tA D_(ahaerac   dh95)6 | ;4
_      c| t                       ^~~~~~~~~~~~~~~~~~~~~~~~x
ilnitn3e2    _85st | t         rm(uascgttir uc_c,ta
hr6c4h_64c_tcxtx  **g)e(t(_chheatestcases/testcases.hra: d106*e:)15(r:h )er=
ror:  incomplete definition of type 'struct _aarch64_ctx'+
t       | _                                              ~~~^a
a106 | r        ctestcases/testcases.hh        :6o954f:_f22cs:t  x+note:  =
=3Dforward declaration of 'struct _aarch64_ctx'*
2t      _| it                        ~~~~^c=20
22       :s|  tnote:                      ^rforward declaration of 'struct =
_aarch64_ctx'
u
ct _aar   c95h | 6s4t_ctxa t*get_heaic idern(lsitnreu cst _atarruccht6 4__a=
catrxc h*6h4e_acdt,x  u*get_heiandte3r2(_stt magic,
uct _aarch64_ctx *head, uint32testcases/testcases.h_t: 109:m10a:g icerror: =
,incomplete definition of type 'struct _aarch64_ctx'
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_=
ctx'
*      h| e                       ^~~~~~~~~~~~~~~~~~~~~~~~
ad, testcases/testcases.hu:in85t:3432: _note: texpanded from macro 'GET_RES=
V_NEXT_HEAD'=20
magic,  =20
85       | |                              ^(
struct _aarch64_ctx *)((char *)(h) + (h)->size)
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_=
ctx'
t mag  i129c | ,       =20
l->magic =3D 0;
:109:10:testcases/testcases.h :error: 95incomplete definition of type 'stru=
ct _aarch64_ctx':
22: note: forward declaration of 'struct _aarch64_ctx'
get_testcases/testcases.hh:e95a:d22e:r(stru ct _aarch64_ctx *heanote: d,for=
ward declaration of 'struct _aarch64_ctx'=20
uint32_t    95m | asgtiact,i
nline struct _aarchtestcases/testcases.h6:4130_:c7t:x  *error: gincomplete =
definition of type 'struct _aarch64_ctx'e
t_he  a130d | er        (        sttariulc-t> s_iazaer c=3Dh 60;4
_      c| t                ~~~~^x
c,
testcases/testcases.h:129:7: error: incomplete definition of type 'struct _=
aarch64_ctx'
forward declaration of 'struct _aarch64_ctx'      |=20
testcases/testcases.h:95:22:    note: 95forward declaration of 'struct _aar=
ch64_ctx' |=20
static    i95n | lsitnaet isct riunlcitne  _satraurccth 6_4a_acrtcxh 6*4g_c=
ettx_ h*egaedte_r(strhuecatd er_(asatrruccht6 4_a_acrtchx6 4*_hcetxa d*,he =
audi,n uti3n2t3_2t_t  mmaaggici,
c      | ,                     ^
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
testcases/testcases.ctestcases/testcases.c:9:36: :warning: 9declaration of =
'struct extra_context' will not be visible outside of this function [-Wvisi=
bility]:
36: warning: declaration of 'struct extra_context' will not be visible outs=
ide of this function [-Wvisibility]
rt
:ar36_a:c_ owarning: c    ndeclaration of 'struct extra_context' will not b=
e visible outside of this function [-Wvisibility]o9t
n | etbxe    o    tx9o9(t | l | s(b btosoorto    lurl9 cu v | ctvabt al eol=
ivexoaidxlldat atrivtradateaale_t___iceece_oxxoenttxtnrdrtteaaarex_t_axtcc_=
et ooc_ *nnoe*netetxtexxetettxxrxrtrta(taa(_s(,scts totrcrrhnuuauctcrcttet =
   x*eee,tx*xx( tettsrcrrratraah__,r_acc
cuoor      ocnn|  ttnt                                   ^*ete
xe *xtxee ttx*r  ter*r*xe,aetx
rx_t      atcr,r| o aan                                   ^c,,t
h  ecaxchthra ar * r*e* **x*et*errerrarr,,r,
h|                                    ^      a                             =
      ^
|=20
r                                   ^=20
**err,
testcases/testcases.ctestcases/testcases.ctestcases/testcases.ctestcases/te=
stcases.ctestcases/testcases.c:::::18181818::::3434testcases/testcases.c34:=
:34::  : 18error:  error: :error: incomplete definition of type 'struct ext=
ra_context'error: 34incomplete definition of type 'struct extra_context'inc=
omplete definition of type 'struct extra_context':incomplete definition of =
type 'struct extra_context'
error: incomplete definition of type 'struct extra_context'
18      :      1818341818 | : |  |                      |         error: tt=
18        teincomplete definition of type 'struct extra_context'e | trr    =
    ee
mtmrr emm =3Dr  =3Dm =3D =3D G G =3DGEGE ETTEGT__ET_   RRT_R18E_ERE | SRSES=
EV        VVS_St_VV_N_Ne_NENENErEEXXXXmTXTTT T_____=3DHHHHHE EEEAEAAGADADDE=
D(D(T((&&&(_ee&Re&xxeExettxxStrttVrarr_a-aaNr>--ah->E>e->hXhah>Tdeeh_aaHdd)=
);
a
)A      d      ;D| |=20
)                                   ~~~~~^(                                =
   ~~~~~^      ;
&
|=20
e      testcases/testcases.c                                   ~~~~~^x| :
t                                   ~~~~~^9r
:atestcases/testcases.c36testcases/testcases.c-:::>9 h9:note: e:36testcases=
/testcases.cforward declaration of 'struct extra_context'36testcases/testca=
ses.c:a:
36;36forward declaration of 'struct extra_context':
:
b    o    9o9 | l | bbtestcases/testcases.c     oo:9voo    a9 | l9ll:b i | =
 36ovdbv:oaaao lltlonote:  eiliforward declaration of 'struct extra_context=
'v_d d
aeavalxttaiteel_dr_iaeatd_ex    eaxc9t_ttreorex | na_ttbe_eroxcxaotot_lrn(c=
 atsove_tnaxcarltto_uie(ncxcsdtottta (rneestutxxcetetxttr_(rt ueas(exc_stxt=
tctrt rorurenuaaxtcc_t_tetrc c xaeoeo_xtnxntc ttotr*rneaeeatxx_x_ettctcx(o =
rtson*a ntt,*ter eeexcuxxxhtcttatr t ra* a*,e,ee x xxctctthrhrraaaaar,r_,  =
r c c *o*h*c*n*a*heteerraerr rrrxr*, ,t*,*
*            r*      | | r| e                                   ^e,        =
                           ^                                   ^x
r
a
har **err,
testcases/testcases.c      :| 18                                   ^testcas=
es/testcases.ctestcases/testcases.c:
testcases/testcases.c::341818::testcases/testcases.c:: 18:3434error: :18::i=
ncomplete definition of type 'struct extra_context'34:=20
error: incomplete definition of type 'struct extra_context'incomplete defin=
ition of type 'struct extra_context'
>t;dA      hr
)D| ea      ;(                                   ~~~~~^a| -
&
)h| x;e                                   ~~~~~^t
a
r      testcases/testcases.ctestcases/testcases.cda| ::)-9                 =
                  ~~~~~^9;>:
:
htestcases/testcases.c3636      e:::| a9                                   =
~~~~~^  testcases/testcases.c
note: d::note: forward declaration of 'struct extra_context')369forward dec=
laration of 'struct extra_context'
;::
36forward declaration of 'struct extra_context' | :
lo9 o
:lv    36a 9:l v | inote: a    dforward declaration of 'struct extra_contex=
t'bl9a
o | ti    oeb9d_lo | ae bxtoovte    lora_9l ale | v_ ixacbvlotdonaritoaalle=
d_ix acdtvtoa(eatns_letetti_rexdeuxetaxct_rtt(teear sx_a_ettc_exrrocxtauorn=
_natct_cterteco xaxnoet_ttnx(c(tetsosexrttxnattrt_( uescc*xtotetrnx (uttesr=
cexatxtrt,r tu rue ccacx*th_tte ac rxreoe txan*rtt*x_reaetacr,rro a,x_cn_t
cht       coa| *noer                                   ^etxn xet
*txt *rte*ea xe,r*tx re tc,x*rht
eaar      x,ar| t                                    ^ ,r*
c a*hc,eah rracr rh,* *
*ae      *rr| er                                    ^r,*
r
*,      e
|       r                                   ^| rtestcases/testcases.c
19      :|                                    ^19
: error: incomplete definition of type 'struct _aarch64_ctx'
testcases/testcases.c:19:19: error: incomplete definition of type 'struct _=
aarch64_ctx'  =20
19 | testcases/testcases.c        :i19f   : 1919( | :!         tierror: eft=
estcases/testcases.cincomplete definition of type 'struct _aarch64_ctx'r :m
( 19testcases/testcases.c!|::|t1919 e::t   testcases/testcases.cr e1919:err=
or: :rm | 19m incomplete definition of type 'struct _aarch64_ctx'         e=
rror: -|:i
incomplete definition of type 'struct _aarch64_ctx'>|19f
-e|19>r   | | mm19           | ti|        e|fi r    ftm(19 e-a! | (r>t!msg =
       -ietii>zrecfmmer a  )m|g(  ||i!{|| t|
c te        etr| t|erme                     ~~~~^|rmr =20
m-m|t-->e|>>rsm mmiata-zgge>eiirsIn file included from )mcctestcases/testca=
ses.c-i   >ztestcases/testcases.h|{|::
|me|       95a) t| g                      ~~~~^:it
e7{e22r
rc::
m       m -note: -|testcases/testcases.hIn file included from forward decla=
ration of 'struct _aarch64_ctx'>|| >:
stestcases/testcases.h                      ~~~~^:s95it15
:ie:
z22rz/usr/include/x86_64-linux-gnu/asm/sigcontext.h:eme: -)40)>testcases/te=
stcases.h :    s{note: 95:
forward declaration of 'struct _aarch64_ctx'958{     =20
:i | :=20
| 22error:                            ~~~~^:zsredefinition of '_fpx_sw_byte=
s'|=20
e                     ~~~~^note: a
)forward declaration of 'struct _aarch64_ctx't   =20
itestcases/testcases.h95{c: |=20
:ti: ni   22note: ec:95testcases/testcases.h forward declaration of 'struct=
 _aarch64_ctx'  | :
4022nra | ut:lscii    ctt95nnote:  r  | eforward declaration of 'struct _aa=
rch64_ctx'i_u s
ncsalttt   air95rnua  | ct_c   eisht c6f 95t4ps __ | aitcxsart_atnxsritulw =
caicc tnh*_iti6genbce  4 ly_tsit_t_iaehnrcnaseeutrl ac ci{tsh
x td6      rn4e _u| *are_ac       ^gr( ct
cessth ttt6x_rr _au4u*hca_cgetrcteac t th_dx__6ae aha4r*aer(_ragccsdhhcete6=
6ttrr44x/usr/include/x86_64-linux-gnu/bits/sigcontext.hu__ :(hc_ces*t31atxc=
tg:d r 8te*u_e:xgar ect(note:  attprevious definition is herers_*_cthh h
he_er6eaaau4ada   d_dcre31,cect tr |  rhxu((6iss_ ts4t*rntra_rtuahc3ucert2c=
tact d_ x_,h_ a 6a*au4ahri_ercncahcttd6hx34,6 2_ 4*_cu_httice nxtamt xda3* =
,gh2* ieh_ucatei,d a
n,md      t a,| u3g                      ^i2uin
_icttn3, 2t
m_      at3| g 2i                     ^mc_
a,tg
i     =20
c| u                     ^,tfatal error:=20
too many errors emitted, stopping now [-ferror-limit=3D]     =20
| fatal error:                      ^c too many errors emitted, stopping no=
w [-ferror-limit=3D]
mta gfatal error: _itoo many errors emitted, stopping now [-ferror-limit=3D=
]fc
fatal error: ,ptoo many errors emitted, stopping now [-ferror-limit=3D]
x
_bytes
fatal error: too many errors emitted, stopping now [-ferror-limit=3D]
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
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:139:8:     9note:  | previo=
us definition is hereb
ool   139v | asltirduactte _seixgtcroan_tceoxntt
e      x| t       ^(
struct extra_context *extra, char **err,
testcases/testcases.c:18:34: error: incomplete definition of type 'struct e=
xtra_context'
&etestcases/testcases.hx:t101r:a25-:> herror: eainvalid application of 'siz=
eof' to an incomplete type 'struct _aarch64_ctx'd
);
_      e| x                               ^~~~~~t
ra_ctestcases/testcases.ho:n28t:e2x:t (note: sexpanded from macro 'HDR_SZ't
ruct    e28x | t        rsai_zceoonft(esxttr u*cetx t_raaa, char **erch64_r=
crt,x
)     =20
|                                          ^|=20
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_=
ctx'
testcases/testcases.c:18:34: error:    incomplete definition of type 'struc=
t extra_context'95
u      c| t                                   ~~~~~^=20
_aarch64_testcases/testcases.cct:x 9*:h36e:a d,note:  forward declaration o=
f 'struct extra_context'u
int32_t     m9a | gbioco,l
lidate_extra_context(struct extra_contexttestcases/testcases.h :*104e:x27t:=
r aerror: ,invalid application of 'sizeof' to an incomplete type 'struct _a=
arch64_ctx'=20
char *  104* | e        rwrh,i
l      e|                                     ^(
offs <=3D resv_sz - HDR_SZ &&
testcases/testcases.h:28:testcases/testcases.c2:: 19note: :expanded from ma=
cro 'HDR_SZ'19
: error:    incomplete definition of type 'struct _aarch64_ctx'28
>      m|         ^     ~~~~~~~~~~~~~~~~~~~~~a
gictestcases/testcases.h :|95|: 22t:e rnote: mforward declaration of 'struc=
t _aarch64_ctx'-
>size)    95{ | s
t      a| t                     ~~~~^ic
aa      r| c                     ^h
64_ctx *head, uinttestcases/testcases.h3:2105_:t13 : merror: aincomplete de=
finition of type 'struct _aarch64_ctx'g
ic,
d->magic !=3D magic && head->magic) {
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
=3D magic) {
testcases/testcases.h:195 warning: and 2220: error snote:  generatedforward=
 declaration of 'struct _aarch64_ctx'
.
1testcases/testcases.h warning: and 12920 error:s7 generated:.
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_=
ctx'
testcases/testcases.h:130:7: error: incomplete definition of type 'struct _=
aarch64_ctx'
|                 ~~~~^
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
1 warning and 20 errors generated.
1 warning and 20 errors1 generated.
signals.S:16:19: error: expected ']' in brackets expression
signals.S:16:19: error: expected ']' in brackets expression
signals.S:16:19: error: expected ']' in brackets expression
signals.S:16:19: error: expected ']' in brackets expression
signals.S:16:19: error: expected ']' in brackets expression
signals.S:16:19: error: expected ']' in brackets expression
signals.S:16:19: error: expected ']' in brackets expression
signals.S:16:19: error: expected ']' in brackets expression
signals.Ssignals.Ssignals.Ssignals.S:::1717:17:22:: 2: signals.S: error: :s=
ignals.Sunknown use of instruction mnemonic without a size suffixerror: :er=
ror: 17
:unknown use of instruction mnemonic without a size suffix:17unknown use of=
 instruction mnemonic without a size suffix mov x29, sp217:
:  :2^ mov x29, sperror: :  mov x29, sp2
unknown use of instruction mnemonic without a size suffix
: error:=20
^
signals.S:signals.S19signals.Ssignals.Ssignals.S::::2:19: 191919error: ::si=
gnals.Sunknown use of instruction mnemonic without a size suffix::2
2:2 mov x20, x02: : 19:=20
: :error: error: error:  error: 2unknown use of instruction mnemonic withou=
t a size suffix^unknown use of instruction mnemonic without a size suffix: =

unknown use of instruction mnemonic without a size suffixunknown use of ins=
truction mnemonic without a size suffixerror:=20
unknown use of instruction mnemonic without a size suffix mov x20, x0
signals.S
:
2^
:=20
error: unknown use of instruction mnemonic without a size suffix
signals.Ssignals.Ssignals.Ssignals.S::::20202020signals.S:::::signals.S2222=
21:: : : : :error: 20error: error: 2error: unknown use of instruction mnemo=
nic without a size suffix:: unknown use of instruction mnemonic without a s=
ize suffixunknown use of instruction mnemonic without a size suffixunknown =
use of instruction mnemonic without a size suffix2
error: :=20
unknown use of instruction mnemonic without a size suffix mov x22, x2
^
^
^
signals.Ssignals.Ssignals.S:signals.S:::21212121::::2222: signals.S: : : er=
ror: :error: error: error: 21unknown use of instruction mnemonic without a =
size suffixunknown use of instruction mnemonic without a size suffixunknown=
 use of instruction mnemonic without a size suffix:unknown use of instructi=
on mnemonic without a size suffix
2
error:=20
unknown use of instruction mnemonic without a size suffix =20
^ ^^ mov x22, x2
^
signals.S:signals.S24::242signals.Ssignals.S: signals.S:error: ::2unknown u=
se of instruction mnemonic without a size suffix:2424
: 24:: add x0, x21, x22signals.Serror: :
22: 2unknown use of instruction mnemonic without a size suffix: ^24: :=20
error: :
error: error: unknown use of instruction mnemonic without a size suffix2unk=
nown use of instruction mnemonic without a size suffix add x0, x21, x22sign=
als.Sunknown use of instruction mnemonic without a size suffix
:=20
:
error:  add x0, x21, x2225  add x0, x21, x22unknown use of instruction mnem=
onic without a size suffix
^
: add x0, x21, x22
14  :=20
^ add x0, x21, x22error: ^
^
25 signals.S: : signals.S14signals.S25 :: :: 25error: 2514signals.S: unknow=
n token in expression:: 14:=20
1425error: :  : add x0, x0, #15: unknown token in expression
error:  14error:=20
unknown token in expression
:
26  : 14signals.S : signals.S: signals.Serror: signals.S :26:unknown token =
in expression:26 :26
:error:=20
14:  14unknown token in expression: error: : =20
error: unknown token in expression error: unknown token in expression bic x=
0, x0, #15
unknown token in expression
^
signals.S:28:2: error: unknown use of instruction mnemonic without a size s=
uffixsignals.S
: add x23, sp, x2227
: signals.Serror: :signals.Ssignals.S:unknown use of instruction mnemonic w=
ithout a size suffix27:30
:27: sub sp, sp, x02:10
2: :  : error: error: ^error: unknown token in expressionunknown use of ins=
truction mnemonic without a size suffix
unknown use of instruction mnemonic without a size suffix
:  sub sp, sp, x027
: 2^: signals.Serror: :unknown use of instruction mnemonic without a size s=
uffix28
: sub sp, sp, x02
signals.S: signals.S :error: :^27unknown use of instruction mnemonic withou=
t a size suffix28
::22: : error: error: unknown use of instruction mnemonic without a size su=
ffixunknown use of instruction mnemonic without a size suffix
^signals.S
signals.S:: add x23, sp, x223028
:: 102signals.S: : ^:error: signals.Serror: 31unknown use of instruction mn=
emonic without a size suffix:
:
28unknown token in expression2:
:unknown use of instruction mnemonic without a size suffixsignals.Serror: 28
:=20
:unknown use of instruction mnemonic without a size suffix^30  mov x1, x212
: :   add x23, sp, x22 ^10error:=20
: unknown use of instruction mnemonic without a size suffix  error: signals=
.S^ unknown token in expression:
30signals.S add x23, sp, x22  ldr x0, =3Dcall_fmt
:: =20
1032^signals.S^: :=20
:error: 2=20
30: unknown token in expression error: :
:   mov x2, x23
error:   :  ^unknown token in expression30 ^
: signals.S
:  31  error: :signals.S  unknown token in expression2: =20
: 33  : ldr x0, =3Dcall_fmterror: ^2=20
unknown use of instruction mnemonic without a size suffix:=20
signals.S  error:  mov x1, x21:  invalid instruction mnemonic 'bl'
31
:  ^error:  ~unknown use of instruction mnemonic without a size suffix=20
signals.S
: signals.S2^::=20
signals.Serror: 36signals.S:unknown use of instruction mnemonic without a s=
ize suffix::31
232::  mov x1, x21:2error:=20
2: unknown use of instruction mnemonic without a size suffix signals.S
error: ^:  mov x0, x23:unknown use of instruction mnemonic without a size s=
uffix
error: signals.S31=20
unknown use of instruction mnemonic without a size suffix^:: mov x1, x21
322
2error: ^ signals.S: unknown use of instruction mnemonic without a size suf=
fix:^
error: 37
:32:2:unknown use of instruction mnemonic without a size suffix
2:=20
error:  mov x2, x23unknown use of instruction mnemonic without a size suffix
^^ :=20
^
error:=20
unknown use of instruction mnemonic without a size suffix
signals.S:signals.S: 3338:signals.S^::signals.S2232:
:: :3233: error: 2::unknown use of instruction mnemonic without a size suff=
ixerror: : 2
2error: invalid instruction mnemonic 'bl' mov x2, x21: :=20
unknown use of instruction mnemonic without a size suffix
error:  error:=20
^invalid instruction mnemonic 'bl' bl printf
unknown use of instruction mnemonic without a size suffix mov x2, x23
signals.S
~:
signals.S 2 :^: ^39~error:=20
:
invalid instruction mnemonic 'bl'2:=20
error:  bl printfinvalid instruction mnemonic 'bl'
signals.S
:33 ^36signals.S:^~signals.S::2:2~
3336:=20
::error: 22: unknown use of instruction mnemonic without a size suffix: err=
or:=20
error: invalid instruction mnemonic 'bl'signals.S mov x0, x23unknown use of=
 instruction mnemonic without a size suffix:=20
:
error: 51signals.S mov x0, x23 bl printf::invalid instruction mnemonic 'bl'
236
:  : error: ^2 bl printf^invalid instruction mnemonic 'ldr'
:=20
~error:  ldr x0, current=20
unknown use of instruction mnemonic without a size suffix
^
~
signals.S ~ :^
^37
:signals.S
:2signals.S36: :signals.S:error: 52unknown use of instruction mnemonic with=
out a size suffix::22
36:  mov x1, x20: :error: error:=20
unknown use of instruction mnemonic without a size suffix 2unknown use of i=
nstruction mnemonic without a size suffix
^signals.S str x23, [x0]:=20
:
error:  mov x0, x23 37^unknown use of instruction mnemonic without a size s=
uffix:
signals.S2
unknown use of instruction mnemonic without a size suffixsignals.S:=20
:2^54 mov x1, x20:=20
:
2error: :  unknown use of instruction mnemonic without a size suffixerror: =
^unknown use of instruction mnemonic without a size suffix
signals.Ssignals.S mov x1, x20 mov sp, x23::
3738  :^:^signals.S
2
:2: signals.S37: error: ::error: 56unknown use of instruction mnemonic with=
out a size suffix2signals.Sunknown use of instruction mnemonic without a si=
ze suffix:
: :10
unknown token in expressionunknown use of instruction mnemonic without a si=
ze suffix 2signals.S
:   mov x8, #15 mov x1, x20^:^error:=20
38unknown use of instruction mnemonic without a size suffix  :=20
^ 2 mov x2, x21
signals.S  mov x2, x21: signals.S
^38signals.S:
:signals.S:: 2:: error: 257error: signals.Sunknown use of instruction mnemo=
nic without a size suffix: :invalid instruction mnemonic 'bl':2
error:=20
: 39unknown use of instruction mnemonic without a size suffix mov x2, x21er=
ror:  bl memcpy:
invalid instruction mnemonic 'svc'
2signals.S mov x2, x21
::  svc #0^ ^39
error: ~^
invalid instruction mnemonic 'bl'
^2~ bl memcpy: ~
error:=20
~signals.Ssignals.S bl memcpy
signals.S:
:signals.S:39 64::^39:51~22::
: : 2error: 2error: invalid instruction mnemonic 'b': :=20
signals.Sinvalid instruction mnemonic 'bl'error:  b .error: :
invalid instruction mnemonic 'ldr'invalid instruction mnemonic 'bl'
^ bl memcpy:
2
signals.S
2~
:  ldr x0, current
error:=20
invalid instruction mnemonic 'ldr'=20
^ ldr x0, current~signals.Ssignals.S
~::=20
51^51~::signals.S~22:
: : 52error: :error: 2invalid instruction mnemonic 'ldr'invalid instruction=
 mnemonic 'ldr'signals.S:=20
:error:  ldr x0, current ldr x0, current52unknown use of instruction mnemon=
ic without a size suffix
:
~52~error:  ~:~unknown use of instruction mnemonic without a size suffix^
2
:  str x23, [x0]error:=20
unknown use of instruction mnemonic without a size suffix=20
^ str x23, [x0]signals.S
signals.S
:: 5252^signals.S::
:2254: :: 2error: error: signals.S: unknown use of instruction mnemonic wit=
hout a size suffixunknown use of instruction mnemonic without a size suffix=
:error:=20
54unknown use of instruction mnemonic without a size suffix str x23, [x0] s=
tr x23, [x0]
:
: :^^error: =20
54unknown use of instruction mnemonic without a size suffix^:
2 mov sp, x23:=20
error:  unknown use of instruction mnemonic without a size suffix^signals.S=
signals.S
signals.S:: mov sp, x23:54
5654:: :signals.S102^2: :
: : error: 56error: error: unknown token in expression:unknown use of instr=
uction mnemonic without a size suffixunknown use of instruction mnemonic wi=
thout a size suffix
10
signals.S mov x8, #15:  mov sp, x23: mov sp, x23error:=20
56
^^:   mov x8, #15
error:=20
unknown token in expression =20
5656   ::  ^1010 =20
:  :  error:  error:   unknown token in expressionunknown token in expressi=
on =20
^  mov x8, #15 mov x8, #15signals.S
:^57 =20
:  2  :   error: signals.S  invalid instruction mnemonic 'svc': =20
57signals.S  ::  svc #0 57=20
2: ^ : 2^
^: error:=20
~error: invalid instruction mnemonic 'svc'~invalid instruction mnemonic 'sv=
c'
signals.S svc #0 svc #0:
signals.S
57  ::^^~257~~: :~
signals.Serror: 2
:invalid instruction mnemonic 'svc': 64
:error: 2 svc #0invalid instruction mnemonic 'svc':=20
error:  invalid instruction mnemonic 'b' svc #0signals.S^
signals.S:~  b .64:~^
:64
~ 2:~^: 2
error: : invalid instruction mnemonic 'b'error:=20
invalid instruction mnemonic 'b'signals.S b .
:
::^ 64
^2:
: 2error: : invalid instruction mnemonic 'b'error:=20
invalid instruction mnemonic 'b'
^=20
^
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
sve_helpers.csve_helpers.c:13:18: error: use of undeclared identifier 'SVE_=
VQ_MAX'
sve_helpers.c:13:18: error: use of undeclared identifier 'SVE_VQ_MAX'
:sve_helpers.c13:18: error: use of undeclared identifier 'SVE_VQ_MAX'
:25:12: error: use of undeclared identifier 'SVE_VQ_MAX'
sve_helpers.c:25:12: error: use of undeclared identifier 'SVE_VQ_MAX'
; --vq)    {
25 |         for (vq =3D SVE_VQ_MAX; vq > 0; --vq) {
sve_helpers.c:25:12: error: use of undeclared identifier 'SVE_VQ_MAX'
sve_helpers.c:41:12: error: sve_helpers.c:41:12: error: call to undeclared =
function 'sve_vq_from_vl'; ISO C99 and later do not support implicit functi=
on declarations [-Wimplicit-function-declaration]
sve_helpers.c:41:12: error: call to undeclared function 'sve_vq_from_vl'; I=
SO C99 and later do not support implicit function declarations [-Wimplicit-=
function-declaration]
sve_helpers.c:41:12: error: call to undeclared function 'sve_vq_from_vl'; I=
SO C99 and later do not support implicit function declarations [-Wimplicit-=
function-declaration]
call to undeclared function 'sve_vq_from_vl'; ISO C99 and later do not supp=
ort implicit function declarations [-Wimplicit-function-declaration]
ve_vq_from_vl(vl))
3 errors generated.
3 errors generated.
3 errors generated.
sve_helpers.c:13:18: error: use of undeclared identifier 'SVE_VQ_MAX'
sve_helpers.c:25:12: error: use of undeclared identifier 'SVE_VQ_MAX'
sve_helpers.c:41:12: error: call to undeclared function 'sve_vq_from_vl'; I=
SO C99 and later do not support implicit function declarations [-Wimplicit-=
function-declaration]
3 errors generated.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D


# Builds where the incident occurred:

## defconfig+arm64-chromebook+kselftest on (arm64):
- compiler: clang-21
- config: None
- dashboard: https://d.kernelci.org/build/maestro:69cd37eadcae953c056b530f


#kernelci issue maestro:b5ea0020699d6ea2fad0d46696c2f2ac1ef88d9c

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
