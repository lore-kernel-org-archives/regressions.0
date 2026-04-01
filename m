Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B454547CC85
	for <regressions@lists.linux.dev>; Wed,  1 Apr 2026 16:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775062751; cv=none; b=YYP0tfb7V3+a+6B4eJQZOjVsE9Fyj2wY01KX15LhAZvjVuc3HxBOHugG1vQ+01Uu/G70dpdKewdESUW8SRTpBeVUFH6sznfESpAGry6VRhun3XLWCNS01horfjFj9TVfJQQAGDZI7Sct2XI7Md3RLjb4NcZE7Sr4EvPNktCs12E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775062751; c=relaxed/simple;
	bh=bNshfI++nOVqxRgBDwFu5bGHQSGp+ouc5U65tdEwMvY=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=bCfLz2xh2xqNXvN4JYoyTEcnoJDNrdmvaVmi2oqeapgQBJjw7hrZ2qRDyxAprpaYXJyIacmhXnehh1hD7p+I3l+3qib4CXaYQDYwigKKLdvUVedmHMce1VhquBtZc/1Qjqs9smwBNEDBbVUfw1ykczSzGLdZS5vkLfRRDvJPDNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=I+det/fe; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="I+det/fe"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2c87871133dso47240eec.0
        for <regressions@lists.linux.dev>; Wed, 01 Apr 2026 09:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1775062746; x=1775667546; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YgO+1o0Uvemji26ZfMs79AnolCA5JMb+ktYTcoGw/7Q=;
        b=I+det/fe1Q7lkWwnKDVo5WCHfrZY7BWadV0MB9hpc7Wa+XF89cu3qKEdzaKhkj9mGA
         JN3lgVjh+qI4Vj9fhaYODrSOEV94BMjRO2v2Qw7nkubXJHFdrbf1MSraK8sxiG/2kbfr
         0eiO9SaKlKOovzhAkLnaA/can94Wp3XLHPRdWMcXYkSvYn/6j8nmb5IbrWM+t77oX95B
         V805zI6GlbMqZWTmjZWToZAdRV7udtWOwmPQI8/lrJ1P7k2mvWrBTIPBB06rG/AZbeeC
         in4AN3+w+K5fl680P+4BdfVdSNcPU41DT0ttrs4/uY5DVCZd4i4G66QmIr9rPfe2f0jy
         NGOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775062746; x=1775667546;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YgO+1o0Uvemji26ZfMs79AnolCA5JMb+ktYTcoGw/7Q=;
        b=ga0uB3pE3AADbn+AQnVK21W4rdFKUmIv8RyFZ7EM5gNClAhwNCNCfSHMb00w61PTVD
         gVi2G1q39T/ZNNsCU/I92DV7Qpu2xXyJvzY+sQSo329/MSCXENqEPFZ7mOretYglNav/
         ZtsG0VV1nojPFdcz3cwjIy3kg97T6wWftiDP+knzPQwT88f2vqlS5/E6AS7Jb/MtfqX2
         V92FDe+qifftJM+LLQ5ekmumSZONBhpVOcPRxBwB//pvJY9bgbBE+s9XFI3Eg7sibfmO
         RJG/eHcq0ytV46l4pq4cqUC9/7G2kITdSO6b/inmLreb7/co52aUT9UQsBIlgjfqHVsh
         Yq0Q==
X-Gm-Message-State: AOJu0Yzg3i7aT56q1Ten+TSA62ioZEah4bsCvp5erHljzOI5Pbz6eg1e
	mdlugoMvpnQjgP7T2brV21YaIJhMb8MGveP5DgZJgIBwBCR+A+mYasnLp3lNLkMTAyA=
X-Gm-Gg: ATEYQzxXgiHwybwSaykNPfkrvJqFRtWJMd0JZXq36QPvuAayvKp6gft8Bm66iICFeZ3
	8WsF3UgmcAXdApZsdPgF33ZDhGuioRsoZgAxUmxUs+cedWG0Dx4Jb1fawhDFcI62gxKSojI5aC3
	CyqtcQRejDJJ7oVtpIwDBBV6HUqDl/5ONunVsFrots1l/9HrHbqKMA8jH8fgcK4e9MVBl8Gg/YR
	Mh2Nt9i0xtzW1lR4wPOjPDX43xyaB6iGNEybbv7mH5/ftoD3y+UOdpnzRRH3mCPgIPW98s/7y+R
	v+5KDspMa9fZPQ0Prl92bzuT2plzk2go1e2bo8NXGC5hlRV4qhRx+BlBS+7VCSZsfriBaqWga2v
	KfginDAdQ4lHPKoJW2J+nobJVtbWFuCxBfpziQ+Ly7Ljbd4nEvr2op8gYYKSMqNd6QRos8uOzfy
	HRzqVOFC7pziFnRKBFhzYgw2lQ+MM=
X-Received: by 2002:a05:7300:371f:b0:2c7:8e1c:9573 with SMTP id 5a478bee46e88-2ca8f132b95mr32759eec.16.1775062745173;
        Wed, 01 Apr 2026 09:59:05 -0700 (PDT)
Received: from 984b78e0ad75 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7c20b2b1sm260059eec.18.2026.04.01.09.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 09:59:03 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [REGRESSION] next/master: (build) fatal error: :'asm/hwcap.h' file
 not found
 :./test_signals.h15::15...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 01 Apr 2026 16:59:03 -0000
Message-ID: <177506274342.1080.2053116554403966695@984b78e0ad75>





Hello,

New build issue found on next/master:

---
 fatal error: :'asm/hwcap.h' file not found :./test_signals.h15::1510::    =
     10 151515:fatal error:  |  |  |  'asm/hwcap.h' file not found###fatal =
error:  ./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found .=
/test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found ./test_sig=
nals.h:15:10: fatal error: 'asm/hwcap.h' file not found ./test_signals.h:15=
:10: fatal error: 'asm/hwcap.h' file not found ./test_signals.h:15:10: fata=
l error: 'asm/hwcap.h' file not found ./test_signals.h:15:10: fatal error: =
'asm/hwcap.h' file not found ./test_signals.h:15:10: fatal error: 'asm/hwca=
p.h' file not found ./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file=
 not found ./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not foun=
d ./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found ./test_=
signals.h:15:10: fatal error: 'asm/hwcap.h' file not found ./test_signals.h=
:15:10: fatal error: 'asm/hwcap.h' file not found ./test_signals.h:15:10: f=
atal error: 'asm/hwcap.h' file not found ./test_signals.h:15:10: fatal erro=
r: 'asm/hwcap.h' file not found ./test_signals.h:15:10: fatal error: 'asm/h=
wcap.h' file not found ./test_signals.h:15:10: fatal error: 'asm/hwcap.h' f=
ile not found ./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not f=
ound ./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found ./te=
st_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found /usr/include/=
x86_64-linux-gnu/asm/sigcontext.h:/usr/include/x86_64-linux-gnu/asm/sigcont=
ext.h8:::40 40:error: :88:redefinition of '_fpx_sw_bytes':  85In file inclu=
ded from :testcases/testcases.h8: error: redefinition of '_fpreg' :85:/usr/=
include/x86_64-linux-gnu/bits/sigcontext.h8::40 :error: 8:redefinition of '=
_fpreg'  8      :|         ^error: : error: redefinition of '_fpreg' 91:8  =
 /usr/include/x86_64-linux-gnu/bits/sigcontext.h46:: |  40serror: :tredefin=
ition of '_fpxreg'8r 8      :|         ^error:  error: In file included fro=
m       redefinition of '_fpxreg'testcases/testcases.c|  /usr/include/x86_6=
4-linux-gnu/asm/sigcontext.h:98:8: error: redefinition of '_xmmreg' /usr/in=
clude/x86_64-linux-gnu/asm/sigcontext.h:180:8: error: redefinition of '_ymm=
h_state' /usr/include/x86_64-linux-gnu/asm/sigcontext.h:192:8: error: redef=
inition of '_xstate' /usr/include/x86_64-linux-gnu/asm/sigcontext.h:180:8: =
error: redefinition of '_ymmh_state' /usr/include/x86_64-linux-gnu/asm/sigc=
ontext.h:192:8: error: redefinition of '_xstate' /usr/include/x86_64-linux-=
gnu/asm/sigcontext.h:317:8: error: redefinition of 'sigcontext' /usr/includ=
e/x86_64-linux-gnu/asm/sigcontext.h:317:8: error: redefinition of 'sigconte=
xt' testcases/testcases.h:101:25: error: invalid application of 'sizeof' to=
 an incomplete type 'struct _aarch64_ctx' testcases/testcases.h:104:27: err=
or: invalid application of 'sizeof' to an incomplete type 'struct _aarch64_=
ctx' : error: redefinition of '_fpreg' testcases/testcases.h/usr/include/x8=
6_64-linux-gnu/bits/sigcontext.h::10540::138::  error: note: incomplete def=
inition of type 'struct _aarch64_ctx'previous definition is here 8: error: =
redefinition of '_fpxreg' a/usr/include/x86_64-linux-gnu/asm/sigcontext.h/u=
sr/include/x86_64-linux-gnu/asm/sigcontext.hd::e4098r::(88s::t  error: rerr=
or: redefinition of '_fpx_sw_bytes'uredefinition of '_xmmreg' a98testcases/=
testcases.ha | :rs101ct:hr25   6u:404c  | _tserror: c tinvalid application =
of 'sizeof' to an incomplete type 'struct _aarch64_ctx'tr_ t37r:u cerror: t=
   incomplete definition of type 'struct _aarch64_ctx' 28_ nt/usr/include/x=
86_64-linux-gnu/asm/sigcontext.hex:  180s*tg:re8ut:c_ therror: e redefiniti=
on of '_ymmh_state'a_ u ierror: n  redefinition of '_fpreg't184 error: :inc=
omplete definition of type 'struct _aarch64_ctx'27 :/usr/include/x86_64-lin=
ux-gnu/bits/sigcontext.h :error: 40invalid application of 'sizeof' to an in=
complete type 'struct _aarch64_ctx':   sf 8In file included from is:_testca=
ses/testcases.h z f:<eerror: 15=3D;redefinition of '_xstate'p: /usr/include=
/x86_64-linux-gnu/bits/sigcontext.h_testcases/testcases.h/usr/include/x86_6=
4-linux-gnu/asm/sigcontext.h:a:s:t18928t91i:::ac288t :::ei   note:  nnote: =
expanded from macro 'HDR_SZ'error: {l error: tIn file included from redefin=
ition of '_xstate'xtestcases/testcases.h e192/usr/include/x86_64-linux-gnu/=
asm/sigcontext.ht | :_s98ht:e8ra:ud ceerror: trredefinition of '_xmmreg' ( =
_ xerror: mincomplete definition of type 'struct _aarch64_ctx'm testcases/t=
estcases.h        :        105h:e13a:d  error: =3Dincomplete definition of =
type 'struct _aarch64_ctx'  317(:(8c:h aerror: rredefinition of 'sigcontext=
'     :d -error: >testcases/testcases.hredefinition of 'sigcontext'/usr/inc=
lude/x86_64-linux-gnu/bits/sigcontext.hm:: 109a184:g:10i8:c: ) error:   not=
e:  incomplete definition of type 'struct _aarch64_ctx'317previous definiti=
on is here{ t_ /usr/include/x86_64-linux-gnu/asm/sigcontext.ht_ :am192aa:rg=
8cih:c6 ,4error:  15: error: incomplete definition of type 'struct _aarch64=
_ctx'/usr/include/x86_64-linux-gnu/bits/sigcontext.h testcases/testcases.h:=
107:10: error: incomplete definition of type 'struct _aarch64_ctx' testcase=
s/testcases.h:  129107: | 7        :         herror: eincomplete definition=
 of type 'struct _aarch64_ctx'a Xctestcases/testcases.hT _:i101Hn:ElA25iD:n=
( eherror:  einvalid application of 'sizeof' to an incomplete type 'struct =
_aarch64_ctx'sa 95:testcases/testcases.h:8:2295:::    22error: note: 130:re=
definition of 'sigcontext'forward declaration of 'struct _aarch64_ctx' |   =
testcases/testcases.h:104:27: error: invalid application of 'sizeof' to an =
incomplete type 'struct _aarch64_ctx' testcases/testcases.h:105:13: error: =
incomplete definition of type 'struct _aarch64_ctx' d-testcases/testcases.h=
>:m101a:g25i:c )error:  invalid application of 'sizeof' to an incomplete ty=
pe 'struct _aarch64_ctx'{ struct _aarch64_ctx *get_headetestcases/testcases=
.hr:(105s:t37r:u cerror: t incomplete definition of type 'struct _aarch64_c=
tx'_ t xu i*testcases/testcases.hnh:te1053a:d213,_    : t9 u  | error: imbi=
ncomplete definition of type 'struct _aarch64_ctx'nao error: 22      invali=
d application of 'sizeof' to an incomplete type 'struct _aarch64_ctx':|  :s=
      a | ta                                              ~~~^error: ra tsx=
t a*thieca testcases/testcases.cid:n,l18 i:un34ietestcases/testcases.h:n : =
ts105error: t3:incomplete definition of type 'struct extra_context'2r13 _:u=
t c error: tmincomplete definition of type 'struct _aarch64_ctx' a :ha eger=
ror: aiincomplete definition of type 'struct _aarch64_ctx'd =3D: 7bmtestcas=
es/testcases.h:o:a 95ogerror: :li22incomplete definition of type 'struct _a=
arch64_ctx' c: gu95aec | atts_r thc_aeahaat6dri4ecc_rh (c6si4tt_nxrcl uticx=
*tn h *eetestcases/testcases.c_g aa:esdat18t,r_:r hc34uueh:cai6 dtn4error: =
e tincomplete definition of type 'struct extra_context'r__ t_a: Ha37mEraA:g=
Dc i(error: h&cincomplete definition of type 'struct _aarch64_ctx'e6, im: c=
aerror: ,gincomplete definition of type 'struct _aarch64_ctx' c7,!t:  t ute=
stcases/testcases.h_eerror: i:arnincomplete definition of type 'struct _aar=
ch64_ctx'a85mt error: ttincomplete definition of type 'struct _aarch64_ctx'=
testcases/testcases.cr  2fatal error: x__ ctoo many errors emitted, stoppin=
g now [-ferror-limit=3D]t*t a10:g testcases/testcases.hierror: :cincomplete=
 definition of type 'struct _aarch64_ctx'95, 109 |         if (   h95e | as=
dta-t>imca giinc line struct _aarch64_ctx *get_headetestcases/testcases.hr(=
:s107t:r10uc:t  error: _incomplete definition of type 'struct _aarch64_ctx'=
a testcases/testcases.c:18:34: error: incomplete definition of type 'struct=
 extra_context' date_ex   t95r | as_tatic incloinntee xstt(rsutcrtu _cata r=
ecxht6r4testcases/testcases.ca_:_c18ct:ox34n :t *eerror: gxincomplete defin=
ition of type 'struct extra_context'et testcases/testcases.c19:::9 :36error=
: :incomplete definition of type 'struct _aarch64_ctx'7  /usr/include/x86_6=
4-linux-gnu/asm/sigcontext.h   :19    40 | 9: |         8bi:of o error: l(r=
edefinition of '_fpx_sw_bytes' ! :t       r| error: u       ^incomplete def=
inition of type 'struct extra_context'c 85_:c8t:testcases/testcases.c x:err=
or:  9redefinition of '_fpreg'*: 129te:x7   t:40( |  fatal error: sserror: =
tttoo many errors emitted, stopping now [-ferror-limit=3D]incomplete defini=
tion of type 'struct _aarch64_ctx'rr 8: error: redefinition of '_fpxreg' i:=
c8 :i nerror: lredefinition of '_xmmreg'i ne s   t98r | uscttr u_catatestca=
ses/testcases.h r:_c130xh:m67m4:r_ ecerror: gtincomplete definition of type=
 'struct _aarch64_ctx' x c inline sfatal error: ttoo many errors emitted, s=
topping now [-ferror-limit=3D]r r/usr/include/x86_64-linux-gnu/asm/sigconte=
xt.ha:_180c:o8n:t eerror: xredefinition of '_ymmh_state't /usr/include/x86_=
64-linux-gnu/asm/sigcontext.h:192:8: error: redefinition of '_xstate' testc=
ases/testcases.c:18:34: error: incomplete definition of type 'struct extra_=
context' c/usr/include/x86_64-linux-gnu/asm/sigcontext.ho:n317t:e8x:t (erro=
r: sredefinition of 'sigcontext't error: incomplete definition of type 'str=
uct extra_context' testcases/testcases.h:101:25: error: invalid application=
 of 'sizeof' to an incomplete type 'struct _aarch64_ctx' c inl   i95n | es =
tsattriucc ti n_laianrec hs6t4r_uccttx  _*agaertestcases/testcases.cct:h_19=
6h:4e19_a:cde trerror: x( sincomplete definition of type 'struct _aarch64_c=
tx't* testcases/testcases.h:testcases/testcases.h105::1395:: 22error: :inco=
mplete definition of type 'struct _aarch64_ctx'  raudcetr (esxttrruac_tcon =
fatal error: t_too many errors emitted, stopping now [-ferror-limit=3D]ea t=
estcases/testcases.h:105:37: error: incomplete definition of type 'struct _=
aarch64_ctx' testcases/testcases.h:106:testcases/testcases.c15:: 18error: :=
incomplete definition of type 'struct _aarch64_ctx'34 : error: incomplete d=
efinition of type 'struct extra_context'   testcases/testcases.c:18:34: err=
or: incomplete definition of type 'struct extra_context' GET_RESV_testcases=
/testcases.hN:EX107T:_10H:E Aerror: D(incomplete definition of type 'struct=
 _aarch64_ctx'& :95  | error: sincomplete definition of type 'struct _aarch=
64_ctx't line struct _aarch64_ctx *get_header(struct _atestcases/testcases.=
har:c109h:6104:_ cerror: tincomplete definition of type 'struct _aarch64_ct=
x'x fatal error: testcases/testcases.htoo many errors emitted, stopping now=
 [-ferror-limit=3D]: testcases/testcases.h:129:7: error: incomplete definit=
ion of type 'struct _aarch64_ctx' testcases/testcases.h:130:7: error: incom=
plete definition of type 'struct _aarch64_ctx' testcases/testcases.c:18:34:=
 error: incomplete definition of type 'struct extra_context' testcases/test=
cases.c:18:34: error: incomplete definition of type 'struct extra_context' =
testcases/testcases.c:19:19: error: incomplete definition of type 'struct _=
aarch64_ctx' fatal error: too many errors emitted, stopping now [-ferror-li=
mit=3D] /usr/include/x86_64-linux-gnu/asm/sigcontext.h:40:8: error: redefin=
ition of '_fpx_sw_bytes' /usr/include/x86_64-linux-gnu/asm/sigcontext.h:85:=
8: error: redefinition of '_fpreg' /usr/include/x86_64-linux-gnu/asm/sigcon=
text.h:91:8: error: redefinition of '_fpxreg' /usr/include/x86_64-linux-gnu=
/asm/sigcontext.h:98:8: error: redefinition of '_xmmreg' /usr/include/x86_6=
4-linux-gnu/asm/sigcontext.h:180:8: error: redefinition of '_ymmh_state' /u=
sr/include/x86_64-linux-gnu/asm/sigcontext.h:192:8: error: redefinition of =
'_xstate' /usr/include/x86_64-linux-gnu/asm/sigcontext.h:317:8: error: rede=
finition of 'sigcontext' testcases/testcases.h:101:25: error: invalid appli=
cation of 'sizeof' to an incomplete type 'struct _aarch64_ctx' testcases/te=
stcases.h:104:27: error: invalid application of 'sizeof' to an incomplete t=
ype 'struct _aarch64_ctx' testcases/testcases.h:105:13: error: incomplete d=
efinition of type 'struct _aarch64_ctx' testcases/testcases.h:105:37: error=
: incomplete definition of type 'struct _aarch64_ctx' testcases/testcases.h=
:106:15: error: incomplete definition of type 'struct _aarch64_ctx' testcas=
es/testcases.h:107:10: error: incomplete definition of type 'struct _aarch6=
4_ctx' testcases/testcases.h:109:10: error: incomplete definition of type '=
struct _aarch64_ctx' testcases/testcases.h:129:7: error: incomplete definit=
ion of type 'struct _aarch64_ctx' testcases/testcases.h:130:7: error: incom=
plete definition of type 'struct _aarch64_ctx' testcases/testcases.c:18:34:=
 error: incomplete definition of type 'struct extra_context' testcases/test=
cases.c:18:34: error: incomplete definition of type 'struct extra_context' =
testcases/testcases.c:19:19: error: incomplete definition of type 'struct _=
aarch64_ctx' fatal error: too many errors emitted, stopping now [-ferror-li=
mit=3D] /usr/include/x86_64-linux-gnu/asm/sigcontext.h:40:8: error: redefin=
ition of '_fpx_sw_bytes' /usr/include/x86_64-linux-gnu/asm/sigcontext.h:85:=
8: error: redefinition of '_fpreg' /usr/include/x86_64-linux-gnu/asm/sigcon=
text.h:91:8: error: redefinition of '_fpxreg' /usr/include/x86_64-linux-gnu=
/asm/sigcontext.h:98:8: error: redefinition of '_xmmreg' /usr/include/x86_6=
4-linux-gnu/asm/sigcontext.h:180:8: error: redefinition of '_ymmh_state' /u=
sr/include/x86_64-linux-gnu/asm/sigcontext.h:192:8: error: redefinition of =
'_xstate' /usr/include/x86_64-linux-gnu/asm/sigcontext.h:317:8: error: rede=
finition of 'sigcontext' testcases/testcases.h:101:25: error: invalid appli=
cation of 'sizeof' to an incomplete type 'struct _aarch64_ctx' testcases/te=
stcases.h:104:27: error: invalid application of 'sizeof' to an incomplete t=
ype 'struct _aarch64_ctx' testcases/testcases.h:105:13: error: incomplete d=
efinition of type 'struct _aarch64_ctx' testcases/testcases.h:105:37: error=
: incomplete definition of type 'struct _aarch64_ctx' testcases/testcases.h=
:106:15: error: incomplete definition of type 'struct _aarch64_ctx' testcas=
es/testcases.h:107:10: error: incomplete definition of type 'struct _aarch6=
4_ctx' testcases/testcases.h:109:10: error: incomplete definition of type '=
struct _aarch64_ctx' testcases/testcases.h:129:7: error: incomplete definit=
ion of type 'struct _aarch64_ctx' testcases/testcases.h:130:7: error: incom=
plete definition of type 'struct _aarch64_ctx' testcases/testcases.c:18:34:=
 error: incomplete definition of type 'struct extra_context' testcases/test=
cases.c:18:34: error: incomplete definition of type 'struct extra_context' =
testcases/testcases.c:19:19: error: incomplete definition of type 'struct _=
aarch64_ctx' fatal error: too many errors emitted, stopping now [-ferror-li=
mit=3D] signals.S:16:19: error: expected ']' in brackets expression signals=
.S:16:19: error: expected ']' in brackets expression signals.S:16:19: error=
: expected ']' in brackets expression signals.Ssignals.S::1717::22: : error=
: error: unknown use of instruction mnemonic without a size suffixunknown u=
se of instruction mnemonic without a size suffix signals.S:signals.S19::192=
:: 2error: : unknown use of instruction mnemonic without a size suffixerror=
:  signals.Ssignals.S::2020::22: : error: error: unknown use of instruction=
 mnemonic without a size suffixunknown use of instruction mnemonic without =
a size suffix signals.Ssignals.S:21::212:: 2error: : unknown use of instruc=
tion mnemonic without a size suffixerror:  signals.S:24:2: error: unknown u=
se of instruction mnemonic without a size suffix signals.S:25:14: error: un=
known token in expression signals.S:26:14: error: unknown token in expressi=
on signals.S:27:2: error: unknown use of instruction mnemonic without a siz=
e suffix signals.S:28:2: error: unknown use of instruction mnemonic without=
 a size suffix signals.S:30:10: error: unknown token in expression signals.=
S:31:2: error: unknown use of instruction mnemonic without a size suffix si=
gnals.S:32:2: error: unknown use of instruction mnemonic without a size suf=
fix signals.S:33:2: error: invalid instruction mnemonic 'bl' signals.S:36:2=
: error: unknown use of instruction mnemonic without a size suffix signals.=
S:37:2: error: unknown use of instruction mnemonic without a size suffix si=
gnals.S:38:2: error: unknown use of instruction mnemonic without a size suf=
fix signals.S:39:2: error: invalid instruction mnemonic 'bl' signals.S:51:2=
: error: invalid instruction mnemonic 'ldr' signals.S:52:2: error: unknown =
use of instruction mnemonic without a size suffix signals.S:54:2: error: un=
known use of instruction mnemonic without a size suffix signals.S:56:10: er=
ror: unknown token in expression signals.S:16:signals.S19:: 57error: :expec=
ted ']' in brackets expression2 : error: invalid instruction mnemonic 'svc'=
 stp x29, x30, [sp, #-16]! signals.S:17:2: error: unknown use of instructio=
n mnemonic without a size suffix signals.S:19:2: error: unknown use of inst=
ruction mnemonic without a size suffix signals.S:20:2: error: unknown use o=
f instruction mnemonic without a size suffix signals.S:21:2: error: unknown=
 use of instruction mnemonic without a size suffix signals.S:24:2: error: u=
nknown use of instruction mnemonic without a size suffix signals.S:25:14: e=
rror: unknown token in expression signals.S:26:14: error: unknown token in =
expression signals.S:27:2: error: unknown use of instruction mnemonic witho=
ut a size suffix signals.S:28:2: error: unknown use of instruction mnemonic=
 without a size suffix signals.S:30:10: error: unknown token in expression =
signals.S:31:2: error: unknown use of instruction mnemonic without a size s=
uffix signals.S:32:2: error: unknown use of instruction mnemonic without a =
size suffix signals.S:33:2: error: invalid instruction mnemonic 'bl' signal=
s.S:36:2: error: unknown use of instruction mnemonic without a size suffix =
signals.S:37:2: error: unknown use of instruction mnemonic without a size s=
uffix signals.S:38:2: error: unknown use of instruction mnemonic without a =
size suffix signals.S:39:2: error: invalid instruction mnemonic 'bl' signal=
s.S:51:2: error: invalid instruction mnemonic 'ldr' signals.S:52:2: error: =
unknown use of instruction mnemonic without a size suffix signals.S:54:2: e=
rror: unknown use of instruction mnemonic without a size suffix signals.S:5=
6:10: error: unknown token in expression signals.S:57:2: error: invalid ins=
truction mnemonic 'svc' signals.S:64:2: error: invalid instruction mnemonic=
 'b' signals.S:17:2: error: unknown use of instruction mnemonic without a s=
ize suffix signals.S:19:2: error: unknown use of instruction mnemonic witho=
ut a size suffix signals.S:20:2: error: unknown use of instruction mnemonic=
 without a size suffix signals.S:21:2: error: unknown use of instruction mn=
emonic without a size suffix signals.S:24:2: error: unknown use of instruct=
ion mnemonic without a size suffix signals.S:25:14: error: unknown token in=
 expression signals.S:26:14: error: unknown token in expression signals.S:2=
4:2: error: unknown use of instruction mnemonic without a size suffix signa=
ls.S:27:2: error: unknown use of instruction mnemonic without a size suffix=
signals.S error: unknown token in expression :2: error: unknown use of inst=
ruction mnemonic without a size suffix 14: error: unknown token in expressi=
on : 30 : 10 :  error:  unknown token in expression  signals.S:31:2: error:=
 unknown use of instruction mnemonic without a size suffix : error: unknown=
 use of instruction mnemonic without a size suffix signals.S:32:2: error: u=
nknown use of instruction mnemonic without a size suffix signals.S:28:2: er=
ror: unknown use of instruction mnemonic without a size suffix :2: error: i=
nvalid instruction mnemonic 'bl' error: unknown token in expression signals=
.Ssignals.S:31:2: error: unknown use of instruction mnemonic without a size=
 suffix signals.S:32:2: error: unknown use of instruction mnemonic without =
a size suffix signals.S:33:2: error: invalid instruction mnemonic 'bl' sign=
als.S:36:2: error: unknown use of instruction mnemonic without a size suffi=
x signals.S:37:2: error: unknown use of instruction mnemonic without a size=
 suffix signals.S:38:2: error: unknown use of instruction mnemonic without =
a size suffix signals.S:39:2: error: invalid instruction mnemonic 'bl' sign=
als.S:51:2: error: invalid instruction mnemonic 'ldr' signals.S:52:2: error=
: unknown use of instruction mnemonic without a size suffix signals.S:54:2:=
 error: unknown use of instruction mnemonic without a size suffix signals.S=
:56:10: error: unknown token in expression signals.S:57:2: error: invalid i=
nstruction mnemonic 'svc' signals.S:64:2: error: invalid instruction mnemon=
ic 'b' :36:2: error: unknown use of instruction mnemonic without a size suf=
fix signals.S:37:2: error: unknown use of instruction mnemonic without a si=
ze suffix signals.S:38:2: error: unknown use of instruction mnemonic withou=
t a size suffix signals.S:39:2: error: invalid instruction mnemonic 'bl' si=
gnals.S:51:2: error: invalid instruction mnemonic 'ldr' signals.S:52:2: err=
or: unknown use of instruction mnemonic without a size suffix signals.S:54:=
2: error: unknown use of instruction mnemonic without a size suffix signals=
.S:56:10: error: unknown token in expression signals.S:57:2: error: invalid=
 instruction mnemonic 'svc' signals.S:64:2: error: invalid instruction mnem=
onic 'b' signals.S:16:19: error: expected ']' in brackets expression signal=
s.S:17:2: error: unknown use of instruction mnemonic without a size suffix =
signals.S:19:2: error: unknown use of instruction mnemonic without a size s=
uffix signals.S:20:2: error: unknown use of instruction mnemonic without a =
size suffix signals.S:21:2: error: unknown use of instruction mnemonic with=
out a size suffix signals.S:24:2: error: unknown use of instruction mnemoni=
c without a size suffix signals.S:25:14: error: unknown token in expression=
 signals.S:26:14: error: unknown token in expression signals.S:27:2: error:=
 unknown use of instruction mnemonic without a size suffix signals.S:28:2: =
error: unknown use of instruction mnemonic without a size suffix signals.S:=
30:10: error: unknown token in expression signals.S:31:2: error: unknown us=
e of instruction mnemonic without a size suffix signals.S:32:2: error: unkn=
own use of instruction mnemonic without a size suffix signals.S:33:2: error=
: invalid instruction mnemonic 'bl' signals.S:36:2: error: unknown use of i=
nstruction mnemonic without a size suffix signals.S:37:2: error: unknown us=
e of instruction mnemonic without a size suffix signals.S:38:2: error: unkn=
own use of instruction mnemonic without a size suffix signals.S:39:2: error=
: invalid instruction mnemonic 'bl' signals.S:51:2: error: invalid instruct=
ion mnemonic 'ldr' signals.S:52:2: error: unknown use of instruction mnemon=
ic without a size suffix signals.S:54:2: error: unknown use of instruction =
mnemonic without a size suffix signals.S:56:10: error: unknown token in exp=
ression signals.S:57:2: error: invalid instruction mnemonic 'svc' signals.S=
:64:2: error: invalid instruction mnemonic 'b' signals.S:16:19: error: expe=
cted ']' in brackets expression signals.S:17:2: error: unknown use of instr=
uction mnemonic without a size suffix signals.S:19:2: error: unknown use of=
 instruction mnemonic without a size suffix signals.S:20:2: error: unknown =
use of instruction mnemonic without a size suffix signals.S:21:2: error: un=
known use of instruction mnemonic without a size suffix signals.S:24:2: err=
or: unknown use of instruction mnemonic without a size suffix signals.S:25:=
14: error: unknown token in expression signals.S:26:14: error: unknown toke=
n in expression signals.S:27:2: error: unknown use of instruction mnemonic =
without a size suffix signals.S:28:2: error: unknown use of instruction mne=
monic without a size suffix signals.S:30:10: error: unknown token in expres=
sion signals.S:31:2: error: unknown use of instruction mnemonic without a s=
ize suffix signals.S:32:2: error: unknown use of instruction mnemonic witho=
ut a size suffix signals.S:33:2: error: invalid instruction mnemonic 'bl' s=
ignals.S:36:2: error: unknown use of instruction mnemonic without a size su=
ffix signals.S:37:2: error: unknown use of instruction mnemonic without a s=
ize suffix signals.S:38:2: error: unknown use of instruction mnemonic witho=
ut a size suffix signals.S:39:2: error: invalid instruction mnemonic 'bl' s=
ignals.S:51:2: error: invalid instruction mnemonic 'ldr' signals.S:52:2: er=
ror: unknown use of instruction mnemonic without a size suffix signals.S:54=
:2: error: unknown use of instruction mnemonic without a size suffix signal=
s.S:56:10: error: unknown token in expression signals.S:57:2: error: invali=
d instruction mnemonic 'svc' signals.S:64:2: error: invalid instruction mne=
monic 'b' signals.S:16:19: error: expected ']' in brackets expression signa=
ls.S:17:2: error: unknown use of instruction mnemonic without a size suffix=
 signals.S:19:2: error: unknown use of instruction mnemonic without a size =
suffix signals.S:20:2: error: unknown use of instruction mnemonic without a=
 size suffix signals.S:21:2: error: unknown use of instruction mnemonic wit=
hout a size suffix signals.S:24:2: error: unknown use of instruction mnemon=
ic without a size suffix signals.S:25:14: error: unknown token in expressio=
n signals.S:26:14: error: unknown token in expression signals.S:27:2: error=
: unknown use of instruction mnemonic without a size suffix signals.S:28:2:=
 error: unknown use of instruction mnemonic without a size suffix signals.S=
:30:10: error: unknown token in expression signals.S:31:2: error: unknown u=
se of instruction mnemonic without a size suffix signals.S:32:2: error: unk=
nown use of instruction mnemonic without a size suffix signals.S:33:2: erro=
r: invalid instruction mnemonic 'bl' signals.S:36:2: error: unknown use of =
instruction mnemonic without a size suffix signals.S:37:2: error: unknown u=
se of instruction mnemonic without a size suffix signals.S:38:2: error: unk=
nown use of instruction mnemonic without a size suffix signals.S:39:2: erro=
r: invalid instruction mnemonic 'bl' signals.S:51:2: error: invalid instruc=
tion mnemonic 'ldr' signals.S:52:2: error: unknown use of instruction mnemo=
nic without a size suffix signals.S:54:2: error: unknown use of instruction=
 mnemonic without a size suffix signals.S:56:10: error: unknown token in ex=
pression signals.S:57:2: error: invalid instruction mnemonic 'svc' signals.=
S:64:2: error: invalid instruction mnemonic 'b' signals.S:16:19: error: exp=
ected ']' in brackets expression signals.S:17:2: error: unknown use of inst=
ruction mnemonic without a size suffix signals.S:19:2: error: unknown use o=
f instruction mnemonic without a size suffix signals.S:20:2: error: unknown=
 use of instruction mnemonic without a size suffix signals.S:21:2: error: u=
nknown use of instruction mnemonic without a size suffix signals.S:24:2: er=
ror: unknown use of instruction mnemonic without a size suffix signals.S:25=
:14: error: unknown token in expression signals.S:26:14: error: unknown tok=
en in expression signals.S:27:2: error: unknown use of instruction mnemonic=
 without a size suffix signals.S:28:2: error: unknown use of instruction mn=
emonic without a size suffix signals.S:30:10: error: unknown token in expre=
ssion signals.S:31:2: error: unknown use of instruction mnemonic without a =
size suffix signals.S:32:2: error: unknown use of instruction mnemonic with=
out a size suffix signals.S:33:2: error: invalid instruction mnemonic 'bl' =
signals.S:36:2: error: unknown use of instruction mnemonic without a size s=
uffix signals.S:37:2: error: unknown use of instruction mnemonic without a =
size suffix signals.S:38:2: error: unknown use of instruction mnemonic with=
out a size suffix signals.S:39:2: error: invalid instruction mnemonic 'bl' =
signals.S:51:2: error: invalid instruction mnemonic 'ldr' signals.S:52:2: e=
rror: unknown use of instruction mnemonic without a size suffix signals.S:5=
4:2: error: unknown use of instruction mnemonic without a size suffix signa=
ls.S:56:10: error: unknown token in expression signals.S:57:2: error: inval=
id instruction mnemonic 'svc' signals.S:64:2: error: invalid instruction mn=
emonic 'b' sve_helpers.c:13:18: error: use of undeclared identifier 'SVE_VQ=
_MAX' sve_helpers.c:13:18: error: use of undeclared identifier 'SVE_VQ_MAX'=
 sve_helpers.c:13:18: error: use of undeclared identifier 'SVE_VQ_MAX' sve_=
helpers.c:25:12: error: use of undeclared identifier 'SVE_VQ_MAX' sve_helpe=
rs.c:25:12: error: use of undeclared identifier 'SVE_VQ_MAX' sve_helpers.c:=
25:12: error: use of undeclared identifier 'SVE_VQ_MAX' : error: use of und=
eclared identifier 'SVE_VQ_MAX' sve_helpers.csve_helpers.c:41:12: error: ca=
ll to undeclared function 'sve_vq_from_vl'; ISO C99 and later do not suppor=
t implicit function declarations [-Wimplicit-function-declaration] :25:12: =
error: use of undeclared identifier 'SVE_VQ_MAX' :41:12: error: sve_helpers=
.c:41:12: error: call to undeclared function 'sve_vq_from_vl'; ISO C99 and =
later do not support implicit function declarations [-Wimplicit-function-de=
claration]call to undeclared function 'sve_vq_from_vl'; ISO C99 and later d=
o not support implicit function declarations [-Wimplicit-function-declarati=
on] sve_helpers.c:41:12: error: call to undeclared function 'sve_vq_from_vl=
'; ISO C99 and later do not support implicit function declarations [-Wimpli=
cit-function-declaration] sve_helpers.c:13:18: error: use of undeclared ide=
ntifier 'SVE_VQ_MAX' in testcases/fake_sigreturn_bad_magic (Makefile:31) [l=
ogspec:kbuild,kbuild.other]
---

- dashboard: https://d.kernelci.org/i/maestro:d166940bcec52a85c09cac77aa377=
0239f1f22ee
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
.c'asm/hwcap.h' file not foundIn file included from 'asm/hwcap.h' file not =
found:=20
testcases/fake_sigreturn_misaligned_sp.c
fatal error: :'asm/hwcap.h' file not found
13:
13In file included from :
./test_signals_utils.hIn file included from :./test_signals_utils.h14::
14./test_signals.h:
:./test_signals.h15::1510::         10 151515:fatal error:  |  |  |  'asm/h=
wcap.h' file not found###fatal error:=20
iii'asm/hwcap.h' file not foundnnn
cccllluuuddede e < <aa<ssamm/s   h/m15wh/    | cwh#acwipcan.achpl>p.u
.h      dh>| 15e>
<#      | ai|          ^~~~~~~~~~~~~sn
/lhuwdcea p<.ahs>m
/      h| w         ^~~~~~~~~~~~~c
ap.h>
In file included from testcases/fake_sigreturn_duplicated_fpsimd.c:13:
In file included from ./test_signals_utils.h:14:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
In file included from testcases/fake_sigreturn_sve_change_vl.c:14:
In file included from ./test_signals_utils.h:14:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
In file included from testcases/fake_sigreturn_sme_change_vl.c:14:
In file included from ./test_signals_utils.h:14:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
11 error generated.
1 error generated.
1 error generated.
1 error generated.
1 error generated.
1 error generated.
1 error generated.
In file included from In file included from test_signals.c:16:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
test_signals.c:16:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
In file included from test_signals.c:16:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
In file included from test_signals.c:16:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
In file included from test_signals.c:16:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
In file included from test_signals.c:16:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
1 error generated.
1 error generated.
1 error generated.
1 error generated.
1 error generated.
In file included from test_signals.c:16:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
1 error generated.
1 error generated.
1 error generated.
In file included from test_signals_utils.c:18:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
In file included from test_signals_utils.c:18:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
test_signals_utils.c:18:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
In file included from test_signals_utils.c:18:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
In file included from test_signals_utils.c:18:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
In file included from test_signals_utils.c:18:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
1 error generated.
1 error generated.
1 error generated1 error generated.
.
1 error generated.
1 error generated.
In file included from test_signals_utils.c:18:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
In file included from test_signals_utils.c:18:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
1 error generated.
1 error generated.
In file included from In file included from testcases/testcases.c:In file i=
ncluded from testcases/testcases.c7testcases/testcases.c::
:In file included from testcases/testcases.h7:7:
15:
In file included from :
In file included from testcases/testcases.h/usr/include/x86_64-linux-gnu/as=
m/sigcontext.htestcases/testcases.h::15:15:
40:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:/usr/include/x86_64-linux-gn=
u/asm/sigcontext.h8:::40 40:error: :88:redefinition of '_fpx_sw_bytes':=20
{           =20
| |              ^       ^|=20
/usr/include/x86_64-linux-gnu/bits/sigcontext.h/usr/include/x86_64-linux-gn=
u/bits/sigcontext.h::3131:/usr/include/x86_64-linux-gnu/bits/sigcontext.h:8=
:8:31: : note: 8note: previous definition is here:previous definition is he=
re
note: previous definition is here  =20
31    | 31s |    ts31rt | urscuttcr tu_ cft_p fx_p_fxsp_wxs_ws_wb_ybtyetse
s     =20
|              ^|=20
_bytes
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:In file included from 15testcas=
es/testcases.c:
:/usr/include/x86_64-linux-gnu/asm/sigcontext.h7::
85In file included from :testcases/testcases.h8: error: redefinition of '_f=
preg'
:      15| :
:85:/usr/include/x86_64-linux-gnu/bits/sigcontext.h8::40 :error: 8:redefini=
tion of '_fpreg'=20
note: previous definition is here
:|        ^
/usr/include/x86_64-linux-gnu/bits/sigcontext.h15::
40:/usr/include/x86_64-linux-gnu/asm/sigcontext.h8::85 :note: 8previous def=
inition is here
tIn file included from  testcases/testcases.h_:f15:
p/usr/include/x86_64-linux-gnu/asm/sigcontext.hr:e91g:
8      :|         ^error: :
redefinition of '_fpxreg'=20
error: redefinition of '_fpreg'
p      r| e       ^In file included from g
testcases/testcases.c :{7
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:
:      In file included from 46| testcases/testcases.h:       ^:8
15::
91:8   /usr/include/x86_64-linux-gnu/bits/sigcontext.h46:: |  40serror: :tr=
edefinition of '_fpxreg'8r
:u cnote: tprevious definition is here   =20
_91f | ps   xtr40re | ugsc
tt      r | u_       ^cf
tp x_rfeprge g{
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:46:8: note: previous defini=
tion is here
x/usr/include/x86_64-linux-gnu/asm/sigcontext.hr:e98g:
8      :|         ^error:=20
redefinition of '_xmmreg'
ruIn file included from ctestcases/testcases.ht: 15_:
xm/usr/include/x86_64-linux-gnu/asm/sigcontext.hm:r91e:g8 :{=20
error: In file included from       redefinition of '_fpxreg'testcases/testc=
ases.c|=20
:       ^7
:
In file included from    /usr/include/x86_64-linux-gnu/bits/sigcontext.htes=
tcases/testcases.h91:: | 5315s::
t8/usr/include/x86_64-linux-gnu/asm/sigcontext.hr::u 98cnote: :tprevious de=
finition is here8
sxtrreug {
truc/usr/include/x86_64-linux-gnu/bits/sigcontext.ht :_46x:m8m:r enote: gpr=
evious definition is here=20
{
str/usr/include/x86_64-linux-gnu/bits/sigcontext.hu:c53t: 8_:f note: pprevi=
ous definition is herex
reg  =20
53       | | s       ^tr
uct _xmmreg
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
7      :
| In file included from        ^testcases/testcases.h
:15:
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
fIn file included from stestcases/testcases.h :<15=3D:
testcases/testcases.h   :4028 | :s2:t rnote: uexpanded from macro 'HDR_SZ'c
t _fp   x28_ | s        ws_ibzyetoefs( s{t
r      u| c       ^t
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:31testcases/testcases.h::89=
5:: 22note: :previous definition is here=20
note: forward declaration of 'struct _aarch64_ctx'
uct _aarch64_ctx *get_header(struct _aarch64_ctx *head, uint3In file includ=
ed from 2testcases/testcases.c_:t7 :
mIn file included from atestcases/testcases.hg:i15c:
,/usr/include/x86_64-linux-gnu/asm/sigcontext.h
:      85| :                     ^8
: error: redefinition of '_fpreg'
testcases/testcases.h/usr/include/x86_64-linux-gnu/bits/sigcontext.h::10540=
::138::  error: note: incomplete definition of type 'struct _aarch64_ctx'pr=
evious definition is here
e      a| d       ^-
>magic !=3D magic && head->magicIn file included from )testcases/testcases.=
c :{7
:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:| 91               ~~~~^:
8: error: redefinition of '_fpxreg'
testcases/testcases.h:95:   2291: |  snote: tforward declaration of 'struct=
 _aarch64_ctx'r
uct _fpxreg {
ct /usr/include/x86_64-linux-gnu/bits/sigcontext.h_:x46mm:r8e:g=20
note:       previous definition is here|=20
t      a| t       ^i
c inline struct _aarch64_In file included from cttestcases/testcases.cxIn f=
ile included from : testcases/testcases.c*:77g:
:
eIn file included from In file included from ttestcases/testcases.htestcase=
s/testcases.h_::h1515e:
:
a/usr/include/x86_64-linux-gnu/asm/sigcontext.h/usr/include/x86_64-linux-gn=
u/asm/sigcontext.hd::e4098r::(88s::t  error: rerror: redefinition of '_fpx_=
sw_bytes'uredefinition of '_xmmreg'
In file included from=20
ctestcases/testcases.ct: _7   :
a98testcases/testcases.ha | :rs101ct:hr25   6u:404c  | _tserror: c tinvalid=
 application of 'sizeof' to an incomplete type 'struct _aarch64_ctx'tr_
uxxc mt*m h_rfeepagx  d _101,{ | s=20
(t3!e2hs/usr/include/x86_64-linux-gnu/bits/sigcontext.h_e :a{td53
r ienote: csprevious definition is here,v
_
s      z|                          ^53<
_/usr/include/x86_64-linux-gnu/bits/sigcontext.h      x:m| 31m             =
                  ^~~~~~:r
8e:g=20
note: testcases/testcases.h      previous definition is here:|=20
28       ^:
2:   testcases/testcases.h 31:note:  | 105expanded from macro 'HDR_SZ's:
t37r:u cerror: t   incomplete definition of type 'struct _aarch64_ctx' 28_
haeaardc-h>6m4a_gcitcx )!
=3D       | m        ^     ~~~~~~~~~~~~~~~~~~~~~a
gic &&testcases/testcases.h :h95e:a22d:- >note: mforward declaration of 'st=
ruct _aarch64_ctx'a
gic) {
statestcases/testcases.ht:i95c: 22i:n lnote: iforward declaration of 'struc=
t _aarch64_ctx'n
e struc   t95  | In file included from _stestcases/testcases.cat:aatr7ic:
cIn file included from h 6itestcases/testcases.hn4:l_15ic:
nt/usr/include/x86_64-linux-gnu/asm/sigcontext.hex:  180s*tg:re8ut:c_ therr=
or: e redefinition of '_ymmh_state'a_
daearr(csht6  r4180u_ | ccsttt xr_ ua*cagtre ct_h_y6hm4em_ahcd_tesxrt (a*st=
hteer au{dc
,t        | u_       ^iaIn file included from=20
natestcases/testcases.ctr:3c72h:
_6/usr/include/x86_64-linux-gnu/bits/sigcontext.hIn file included from t4: =
_testcases/testcases.h184cm::ta15x8g :
:i*/usr/include/x86_64-linux-gnu/asm/sigcontext.hc h,:enote:=20
85a      previous definition is here:d| ,
8                     ^ :
u ierror: n  redefinition of '_fpreg't184
3 | 2s_ttr um   ac85gt | i cs,_t
yr      mu|                      ^mc
ht_ s_tfaptre
egtestcases/testcases.h :{106
:testcases/testcases.h      15| ::       ^ 104
error: :incomplete definition of type 'struct _aarch64_ctx'27
:/usr/include/x86_64-linux-gnu/bits/sigcontext.h :error: 40invalid applicat=
ion of 'sizeof' to an incomplete type 'struct _aarch64_ctx': =20
8106: |          note:         previous definition is hereo
In file included from f  testcases/testcases.cf104:s | 7            :
+40wIn file included from =3Dh | testcases/testcases.h is:hlt15eeIn file in=
cluded from :
ar testcases/testcases.c/usr/include/x86_64-linux-gnu/asm/sigcontext.hd(u::=
-oc1927>ft::
sf 8In file included from is:_testcases/testcases.h z f:<eerror: 15=3D;rede=
finition of '_xstate'p:
rr/usr/include/x86_64-linux-gnu/asm/sigcontext.h      ee| :gs              =
          ~~~~^
v180
c:st22z : _ -xnote:    sforward declaration of 'struct _aarch64_ctx'180Ht
Da | Rts_etS In file included from rZ{u testcases/testcases.c
c&:      t&| 7=20
testcases/testcases.h                                 ^~~~~~ | m:
ms15ht:
/usr/include/x86_64-linux-gnu/bits/sigcontext.h_testcases/testcases.h/usr/i=
nclude/x86_64-linux-gnu/asm/sigcontext.h:a:s:t18928t91i:::ac288t :::ei   no=
te:  nnote: expanded from macro 'HDR_SZ'error: {l
previous definition is hereredefinition of '_fpxreg'
i
s | 91 | t         | srsst/usr/include/x86_64-linux-gnu/bits/sigcontext.hiu=
rtz:cuer184tcou: ftc8_( t:as_  atx_note: rrsfprevious definition is herecutp
hcax6ttr4 e__e =20
acg      184at|  r | x       ^c{s=20
h
*t6      gr4| e_       ^ut
cc_ttx/usr/include/x86_64-linux-gnu/bits/sigcontext.hh) :e
_a46      yd| :e        ^     ~~~~~~~~~~~~~~~~~~~~~m8
rm:( hsnote: _tprevious definition is heresr
testcases/testcases.htu:a95c   :tt2246e : |=20
_ s      anote: t| arforward declaration of 'struct _aarch64_ctx'ur       ^
cc
th 6_4f_pcx   tr95xe |  gs*
th      ae| ta       ^id
,c  uiinnltiIn file included from 3n2testcases/testcases.ce_ :ts7t :
rmIn file included from uatestcases/testcases.hcgt: i15_c:
a,/usr/include/x86_64-linux-gnu/asm/sigcontext.ha
r:c      192h| :In file included from 6                     ^testcases/test=
cases.c84:
:_7 c:
error: tIn file included from redefinition of '_xstate'xtestcases/testcases=
.h
e192/usr/include/x86_64-linux-gnu/asm/sigcontext.ht | :_s98ht:e8ra:ud ceerr=
or: trredefinition of '_xmmreg' (
_sxtsr   tu98ca | tts te_r au{ac
rt      c|  h       ^6_
4x_mcm/usr/include/x86_64-linux-gnu/bits/sigcontext.htr:xe189 g:* 8h{:e
_gxis   ct53,a |=20
ts      testcases/testcases.het| :                     ^
r
107      u:c| 10t       ^ :
_ xerror: mincomplete definition of type 'struct _aarch64_ctx'm
reg
testcases/testcases.h        :        105h:e13a:d  error: =3Dincomplete def=
inition of type 'struct _aarch64_ctx'=20
GET_RES  V105_ | N        E X T _ H E A Dh(ehaeda-d>)m;a
g      i| c                       ^~~~~~~~~~~~~~~~~~~~~~~~=20
!=3D testcases/testcases.hm:a85g:i43c:  &note: &expanded from macro 'GET_RE=
SV_NEXT_HEAD'=20
head-   >85m | a        g(isct)r u{c
t       | _               ~~~~^a
In file included from artestcases/testcases.cc:h7testcases/testcases.h6:
:4In file included from 95_testcases/testcases.h:c:22t15:x:
317(:(8c:h aerror: rredefinition of 'sigcontext'   =20
95* | )s(th  )a317 t | +i s(cthr )ui-cn>tls iisnzieeg )cs
ot      nr| tu                                              ~~~^ec
xtt  _{a
testcases/testcases.ha      :r| 95c       ^:h
226:4 /usr/include/x86_64-linux-gnu/bits/sigcontext.h_note: :cforward decla=
ration of 'struct _aarch64_ctx'139t
:x8 :* gnote: eprevious definition is heret
_   95h | e  s139at | dasettrir(cus ctitrn ulsciitng ec_ oasnattrrecuxhct6t
4       __| ca       ^ta
xr c*hh6e4a_dc,t xu i*ngte3t2__hte amdaegri(cs,t
r      u| c                     ^t
incomplete definition of type 'struct _aarch64_ctx'tIn file included from=20
3testcases/testcases.h2:_15t:
atIn file included from gatestcases/testcases.hit:ce15  :
&{/usr/include/x86_64-linux-gnu/asm/sigcontext.h&
:       317h| :e       ^8a
:d -error: >testcases/testcases.hredefinition of 'sigcontext'/usr/include/x=
86_64-linux-gnu/bits/sigcontext.hm::
109a184:g:10i8:c: ) error:   note:  incomplete definition of type 'struct _=
aarch64_ctx'317previous definition is here{
s      t| r                                         ~~~~^u =20
184c109 |  | ts         ttestcases/testcases.hirs:ufi95c :tg22( c:_ho yenno=
te: matmforward declaration of 'struct _aarch64_ctx'd
eh-x_>tsmt aa{gt
ie      c
t am/usr/include/x86_64-linux-gnu/bits/sigcontext.hta:ig139ic:c 8)i: n {lno=
te:=20
iprevious definition is here      n|=20
e            ~~~~^=20
s  t139r | testcases/testcases.hus:ct95tr: u22_:ca atnote: r forward declar=
ation of 'struct _aarch64_ctx'cs
hi6g4co_ncttexx    t95*
hteica dienrl(isnet rsutcrtu c_ta a_racahr6c4h_6c4_ctx *tgxe t*_hhIn file i=
ncluded from eeaatestcases/testcases.cdd:,e 7ru:
(iIn file included from snttestcases/testcases.htr3:u215c:
t_ /usr/include/x86_64-linux-gnu/asm/sigcontext.ht_ :am192aa:rg8cih:c6 ,4er=
ror:=20
_redefinition of '_xstate'      c
| t                     ^x
testcases/testcases.h            :| | 106                     ^       ^:
15: error: incomplete definition of type 'struct _aarch64_ctx'/usr/include/=
x86_64-linux-gnu/bits/sigcontext.h
:189:8:   106note:  | previous definition is here       =20
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_=
ctx'
testcases/testcases.h:107:10: error: incomplete definition of type 'struct =
_aarch64_ctx'
testcases/testcases.h:  129107: | 7        :         herror: eincomplete de=
finition of type 'struct _aarch64_ctx'a
d =3D GE  129 |                 tail->magic =3D 0;
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_=
ctx'
T_   R95E | In file included from SsVtestcases/testcases.ct_:aNt7Ei:
Xctestcases/testcases.hT _:i101Hn:ElA25iD:n( eherror:  einvalid application=
 of 'sizeof' to an incomplete type 'struct _aarch64_ctx'sa
tdr)u;ct
c101h | 6        4i_fc t(xtestcases/testcases.h! :h*85eg:ea43td:_  h|note: =
e|expanded from macro 'GET_RESV_NEXT_HEAD'a=20
dreers(vs_tsrz   u 85c< | t          H(_DaRs_atSrrZcu)hc
6t      4 | __                               ^~~~~~ca
taxr c*testcases/testcases.hhh:6e284a:_d2c:,t  xnote: u expanded from macro=
 'HDR_SZ'i*
n)t(32(_ct   h 28am | ra         gs*ii)zc(e,h
o)       f| +(                     ^=20
s(thr)u-ct> s_iazaerc)h
6      4| In file included from _                                          =
    ~~~^c
testcases/testcases.cttestcases/testcases.h:x:7):
130
In file included from       :testcases/testcases.h| 7:        ^     ~~~~~~~=
~~~~~~~~~~~~~~:15
:
95:testcases/testcases.h:8:2295:::    22error: note: 130:redefinition of 's=
igcontext'forward declaration of 'struct _aarch64_ctx' | =20
ai  l-317   > | 95ss | itzsre   tu 95ac=3D | tt s i0sct;i a
gi      cnt| oli                ~~~~^ni
cn ei ntestcases/testcases.hsl:ti95r:nu22ec: t s tnote: t_rforward declarat=
ion of 'struct _aarch64_ctx'aua
crtc h_a6a4r_cch   t6954 | x_s ct*tagxte it*c_eg hxeiettna _ld{hi
en      ae| d        ^s
eterrr(u(scs/usr/include/x86_64-linux-gnu/bits/sigcontext.httt:rr 139u_u:ca=
8ct:at  r note: c__previous definition is herehaa
6aa4rr_c  cch139ht6 | 6xs44 t__r*ccutgtcxext  t **_shhhieegeacaadodd,ne,t r=
 ue(uixsinttnt
rt3      u32| c2_       ^tt_
4,      _|=20
ctx *head,       u| i                     ^n
t32_t ma                     ^g
ic,
testcases/testcases.h:104:27: error: invalid application of 'sizeof' to an =
incomplete type 'struct _aarch64_ctx'
resv_sz   -109  | H        DiRf_ S(Zh e&a&d
-      >| m                                 ^~~~~~a
gitestcases/testcases.hc: 28=3D:=3D2 :m anote: gexpanded from macro 'HDR_SZ=
'i
c) {  =20
28       | |         s            ~~~~^i
zeoftestcases/testcases.h(:s95t:r22u:c t note: _forward declaration of 'str=
uct _aarch64_ctx'aa
rch64_   c95t | xs)t
c inltestcases/testcases.hi:n95e: 22s:t note: rforward declaration of 'stru=
ct _aarch64_ctx'u
ct _a   95 | static inline struct _aarch64_ctx *get_header(struct _aarch64_=
ctx *head, uint32_t magic,
testcases/testcases.h:105:13: error: incomplete definition of type 'struct =
_aarch64_ctx'
d-testcases/testcases.h>:m101a:g25i:c )error:  invalid application of 'size=
of' to an incomplete type 'struct _aarch64_ctx'{
testcases/testcases.h  :10195 | :        22:i fnote:  forward declaration o=
f 'struct _aarch64_ctx'(
!head || resv_sz    <95  | HsDtRa_tSiZc)=20
i      n| l                               ^~~~~~i
ne stestcases/testcases.ht:r28:u2c:t  note: _expanded from macro 'HDR_SZ'aa
rch64   _28c | t        x s*igzeeto_fh(esatrucdte r_(asarch64_cttxr)u
c      t|         ^     ~~~~~~~~~~~~~~~~~~~~~=20
_aarchtestcases/testcases.h6:495_:22c:t xnote:  forward declaration of 'str=
uct _aarch64_ctx'*
head, uin   t953 | 2s_tta tmiacg iicn,l
i      n| e                     ^=20
struct _aarch64_ctx *get_headetestcases/testcases.hr:(105s:t37r:u cerror: t=
 incomplete definition of type 'struct _aarch64_ctx'_
aarch64  _105c | t        x   * h e a d head->ma,g icu i!n=3Dt 3m2a_gtic  m=
&a&gi ch,e
a      d| -                     ^>
magic) {
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_=
ctx'
c      dh| 6                                  ^~~~~~4|
_|c trxtestcases/testcases.he: s28:2: note: expanded from macro 'HDR_SZ'
v*_hsze   a 28d< | ,          HusiDinRzt_e3So2Zf_)(t=20
sm      ta| rg                               ^~~~~~ui
cc,t
a28r:c2h:6 4note: _expanded from macro 'HDR_SZ'c
tx)
c
t _aarch64   _95  c | 106ts | xt        )a       =20
to      if| cf        ^     ~~~~~~~~~~~~~~~~~~~~~s =20
i+n=3Dli nheetestcases/testcases.h ad:s-95t>:rs22uiz:ce t;note: =20
_      forward declaration of 'struct _aarch64_ctx'a|=20
a                        ~~~~^r
ch64testcases/testcases.h_:c95t:x22 :   * 95gnote:  | eforward declaration =
of 'struct _aarch64_ctx's
tt_ahteiacd e   ir95n | (slsttirnauteci tcs  t_iranlauircncteh  6_s4at_arcr=
utccxht 6 4_*_ahcaetraxcd h,*6 g4ue_itcnt_txh3 e2*a_gdtee trm_(hasegtairdcu=
e,crtestcases/testcases.c
t(       :s| _9t                     ^a:r
a36ur:cc th 64__acatrxc *hh6e4warning: a_ddeclaration of 'struct extra_cont=
ext' will not be visible outside of this function [-Wvisibility]c,
t xu i*testcases/testcases.hnh:te1053a:d213,_    : t9 u  | error: imbincomp=
lete definition of type 'struct _aarch64_ctx'nao
tgoi3lc2 ,_
v      ta|  l                       ^mi105
ad | ga        it  ec _, e
e_acdo-n>tmeaxgti(cs t!r=3Du cmatg iecx t&r&a _hceoandt-e>xmta g*iecx)t r{a
,       | c               ~~~~^h
atestcases/testcases.hr: 104**:testcases/testcases.he27:r:95r :,
error: 22      invalid application of 'sizeof' to an incomplete type 'struc=
t _aarch64_ctx':|=20
forward declaration of 'struct _aarch64_ctx'
(toaftfis  c 107 < | i        =3Dn         lhrieaendse v =3Ds_ tGsErzTu _c-=
Rt E SHV_D_aRNa_ErSXcZTh _6&H4&E_
A      cD| t(                                 ^~~~~~hx
e a*dgtestcases/testcases.h)e:;t28
_:      h2| e:                       ^~~~~~~~~~~~~~~~~~~~~~~~ a
note: dexpanded from macro 'HDR_SZ'etestcases/testcases.hr
:(s85t:r43u   :c 28tnote:  |  expanded from macro 'GET_RESV_NEXT_HEAD'     =
   _
saiazrceho   6f854( | _s        ct(trsxut cr*tuh cet_a ad_a,ar acurhic6nh4t=
6_34c2_t_cxtta) xr
m c      ah*| g6)        ^     ~~~~~~~~~~~~~~~~~~~~~i4(
c_(c,cth
xa       rtestcases/testcases.h| * :                     ^g*
e)95t(:_h22h):e  a+note: d forward declaration of 'struct _aarch64_ctx'e(
rh()s-t>rstestcases/testcases.hui:cz   105te95: ) | 37_
:s      a | ta                                              ~~~^error: ra
cincomplete definition of type 'struct _aarch64_ctx'th
i6c4testcases/testcases.h _:ic95nt:lx22i :n*   ehnote: 105 eforward declara=
tion of 'struct _aarch64_ctx' | sa
etn      axe| d                       ^s*-
tg>rmeuacttg_ ih_cea aa!rd=3Dce h6rm4(a_sgctitxrc u *&c&t  h_eaaadr->cmha6g=
4i_cc)t x{=20
*      h| ge                                       ~~~~^ea
td_,h eutestcases/testcases.ha:id95en:r22t(:s3 t2note: ru_forward declarati=
on of 'struct _aarch64_ctx'ct
t  m_aagaircc,h
6         4| 95_                     ^c |=20
tsxt a*thieca testcases/testcases.cid:n,l18 i:un34ietestcases/testcases.h:n=
 : ts105error: t3:incomplete definition of type 'struct extra_context'2r13
_:ut c error: tmincomplete definition of type 'struct _aarch64_ctx' a
g_iaca,r  =20
c18      h | |   6                     ^105        4
t      109x=3D| :                                     ~~~~~^10*m
:ha egerror: aiincomplete definition of type 'struct _aarch64_ctx'd
c, testcases/testcases.c &:u9&i: n36  ht:1093e  | 2anote:         _dforward=
 declaration of 'struct extra_context'it-
f > mm(aahggeiiadcc-,)    >
g                     ^      itestcases/testcases.h
| c :               ~~~~^=3D129
=3D: 7bmtestcases/testcases.h:o:a 95ogerror: :li22incomplete definition of =
type 'struct _aarch64_ctx' c:
v) note:  aforward declaration of 'struct _aarch64_ctx'{l
i      dtestcases/testcases.h  | a:129            ~~~~^t106 | :e
:_-t22c>a:ot nimnote: c  atforward declaration of 'struct _aarch64_ctx'g 10=
6e
ii | xcn        t (        ls=3Doit nfr0ufe;cs    t
chrateat a_i_dcc-ao >atestcases/testcases.hinsr:tnic95elz:hxie226nt:;4e=20
ttx                        ~~~~^xrt
(lr_sirctn,tre
ux c      st|  t                                    ^*r_  =20
gu95aec | atts_r thc_aeahaat6dri4ecc_rh (c6si4tt_nxrcl uticx*tn h *eetestca=
ses/testcases.c_g aa:esdat18t,r_:r hc34uueh:cai6 dtn4error: e tincomplete d=
efinition of type 'struct extra_context'r__
(3acs2att_rxrut cc* hthm6 e   _a4a18ag_d | aic,r        ct ct,xhue
t2 x__Gh tEe* Tahdme_eaaRrdgE(,si StucVri,_un
Ntc      Etestcases/testcases.ht3| X2:                      ^_T_105
t_a: Ha37mEraA:gDc i(error: h&cincomplete definition of type 'struct _aarch=
64_ctx'e6,
x4
t_      rc| at                     ^-x
> h*eh  ae105d)a | ;d       =20
,       |                                      ~~~~~^u=20
i n t 3testcases/testcases.c :29h_:et36testcases/testcases.ha: : dm130note:=
 a-:forward declaration of 'struct extra_context'g>7
im: caerror: ,gincomplete definition of type 'struct _aarch64_ctx'
i   =20
o  =3Do130 l | m         av        gatilaciid la-&t>e&s_ iehzxeeta rd=3Da- =
_>0cm;oa
ng      ti| ec                ~~~~^x)
t ({s
ttestcases/testcases.hr      :u| 95c                                       =
~~~~^:t
22 :e xnote: testcases/testcases.htforward declaration of 'struct _aarch64_=
ctx':r
95a:_22c:o nnote: t   forward declaration of 'struct _aarch64_ctx'e95x
ch(heh6ae4da_   ced19tr) | x;( testcases/testcases.h       =20
s*i:th      fer| 129 au                       ^~~~~~~~~~~~~~~~~~~~~~~~:(d
c7,!t:  t utestcases/testcases.h_eerror: i:arnincomplete definition of type=
 'struct _aarch64_ctx'a85mt
:r3 432|c:_|h t 6note:  t4  eexpanded from macro 'GET_RESV_NEXT_HEAD'm_
r129acmg | t-ix        c>         ,m*
tah         age85| iia |                      ^cld       =20
e6      )n4|  t_{                ~~~~^3c
2t      | x_                     ~~~~^ t
testcases/testcases.h* :)m95(:a(22gtestcases/testcases.h:ci: hc95note: ,a:f=
orward declaration of 'struct _aarch64_ctx'
r22
(forward declaration of 'struct _aarch64_ctx'
h) +    95( | hs)t-   a>95t | isct aitnilcsi initestcases/testcases.hzene: =
l)106si
:tn15      er:|  u                                              ~~~^ sc
error: ttincomplete definition of type 'struct _aarch64_ctx'testcases/testc=
ases.cr=20
:_u9actestcases/testcases.h:at:36   r:95106_c : | warning: a22h        decl=
aration of 'struct extra_context' will not be visible outside of this funct=
ion [-Wvisibility]:a6
t6sx4      _+9*=3Dc |  gthbxeo a*d   g-95e> | tss_ithzaeoateldi; ec
vr       a(li| sint                        ~~~~^dlra
iutnceet_  etestcases/testcases.hs_x:atta95rrra:uc_22hcc6:to4 n _tnote: _ce=
eforward declaration of 'struct _aarch64_ctx'atxt
atx_r( hcshet*6rah4ud_ceectatr    xd(e95 ,sx | * ttsgrurteaiuat_ncct_ttoih3=
 ncet2_ aea_ixdtatne r lr*cmi(ehaxns6gtet4ir r_casuc,,tct=20
trcx       hu|  _ac                     ^*rat
i      _nh| tc6                                   ^3t4
2fatal error: x__ ctoo many errors emitted, stopping now [-ferror-limit=3D]=
t*t
ta3d2e_rt( smtargiucctestcases/testcases.h,t:
aarch  61304 | _        c        ttxa i*lh-e>asdi,z eui n=3Dt 302;_testcase=
s/testcases.h
a10:g testcases/testcases.hierror: :cincomplete definition of type 'struct =
_aarch64_ctx'95,
:
22      :|                       ^note:=20
forward declaration of 'struct _aarch64_ctx' =20
109 |         if (   h95e | asdta-t>imca giinc line struct _aarch64_ctx *ge=
t_headetestcases/testcases.hr(:s107t:r10uc:t  error: _incomplete definition=
 of type 'struct _aarch64_ctx'a
arch64_c  t107x  | *        h        ehaeda,d  u=3Di nGtE3T2__RtE SmVa_gNiE=
cX,T
_      H| E                     ^A
D(head);
testcases/testcases.h:85:43: note: expanded from macro 'GET_RESV_NEXT_HEAD'
ArD *()&(ehx)    t 9 | +rb ao(-ohl>) -hv>easalidiz)ed;)a
t            e| | _                                   ~~~~~^               =
                               ~~~^e
xtra_testcases/testcases.cctestcases/testcases.h:o:9n95:t:36e22:x: t note: =
(note: forward declaration of 'struct extra_context'sforward declaration of=
 'struct _aarch64_ctx'
t
ruct e    x   995t |  | rbsato_aoctlo invtcae lxiintld ia*netexe t_sretaxr,=
tu rccath_ ac_rao an*rt*ceehrx6rt4,(_
sc      t| tr                                   ^xu
u      i| n                                   ^t
32_t magic,
testcases/testcases.c:18:34: error: incomplete definition of type 'struct e=
xtra_context'
XT_HE  A109D | (        &iefx t(rhae-a>dh->emaadg)i;c
magtestcases/testcases.c:9:i36c:)  note: {forward declaration of 'struct ex=
tra_context'
date_ex   t95r | as_tatic incloinntee xstt(rsutcrtu _cata recxht6r4testcase=
s/testcases.ca_:_c18ct:ox34n :t *eerror: gxincomplete definition of type 's=
truct extra_context'et
t _*heexadterra(   ,s18 t | cr        hutaecrrtm   *_=3D*a eaGrErrTc,_hR
6E4      S| V__                                   ^cN
tExX T*_hHEeAaDd(,& euxitrnat-3>2h_eta dm);a
g      i| c                                   ~~~~~^,
testcases/testcases.c19:::9 :36error: :incomplete definition of type 'struc=
t _aarch64_ctx'7=20
:
note: In file included from forward declaration of 'struct extra_context'te=
stcases/testcases.h
:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h   :19    40 | 9: |         8=
bi:of o error: l(redefinition of '_fpx_sw_bytes' !
vtaelridma t|e_|e xttrear_m   c40-o | n>stmteraxugtc(itsc t _r|fupc|xt _ st=
ewxe_trbrmya-t_e>csso n{it
ez      x| et       ^)=20
t      r| a                     ~~~~^,
:t       r| error: u       ^incomplete definition of type 'struct extra_con=
text'c
t _aa   r18c |         ht6er4m_ c=3D tGxE T*_RgEeStV__NhEXeTa_dHEeArD((s&te=
rxutrcaIn file included from t-testcases/testcases.c >:h_7ea:
aaIn file included from dtestcases/testcases.hr):;c15
h:
85_:c8t:testcases/testcases.c x:error:  9redefinition of '_fpreg'*:
h36:e anote:    dforward declaration of 'struct extra_context'85,
gi      id| ac       ^
t,e
_      /usr/include/x86_64-linux-gnu/bits/sigcontext.he| :x                =
     ^40t
:r8a:_ testcases/testcases.hcnote: o:previous definition is heren
129te:x7   t:40( |  fatal error: sserror: tttoo many errors emitted, stoppi=
ng now [-ferror-limit=3D]incomplete definition of type 'struct _aarch64_ctx=
'rr
uucctt  e_xftp  rre129ag | _
ielx-t >*meaxgtirca ,=3D  c0h;a
r       | *                ~~~~^*e
rIn file included from rtestcases/testcases.c,:
7testcases/testcases.h      :
:| In file included from 95                                   ^testcases/te=
stcases.h:
:2215::
8: error: redefinition of '_fpxreg'
t      r| u       ^c
t    19_/usr/include/x86_64-linux-gnu/bits/sigcontext.h | a:        a46ir:f=
c8 h:(6 !note: 4tprevious definition is here_e
crtm x   | 46|* |  gtseettrr_muh-ce>tam da_gefirpc(x sr|te|r gut
ce      tr|  m       ^_
-a>asirzceh)6 4{_
_In file included from ttestcases/testcases.c :m7a:
gIn file included from itestcases/testcases.h   c:95, | 15
s:
i:c8 :i nerror: lredefinition of '_xmmreg'i
ne s   t98r | uscttr u_catatestcases/testcases.h r:_c130xh:m67m4:r_ ecerror=
: gtincomplete definition of type 'struct _aarch64_ctx' x
{=20
*      g| e       ^t =20
_130h | e/usr/include/x86_64-linux-gnu/bits/sigcontext.h        a:        d=
53te:ra8(i:sl t-note: r>previous definition is hereus
cit z   _e53a  | a=3Dsr tc0h;64
_      c|                 ~~~~^t
xr u*chttestcases/testcases.he :a_95dx:,m22 m:ur ienote: ngforward declarat=
ion of 'struct _aarch64_ctx'
t
t ma   g95i | cs,t
a      t|                      ^i
c inline sfatal error: ttoo many errors emitted, stopping now [-ferror-limi=
t=3D]r
uct _aarch64_ctx *get_header(struct _aarch64_ctx *head, uint32_t magic,
testcases/testcases.c:9:36: warning: declaration of 'struct extra_context' =
will not be visible outside of this function [-Wvisibility]
tIn file included from  testcases/testcases.he:x15t:
r/usr/include/x86_64-linux-gnu/asm/sigcontext.ha:_180c:o8n:t eerror: xredef=
inition of '_ymmh_state't
s      t| a                                   ^t
e {
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:184:8: note: previous defin=
ition is here
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:192:8: error: redefinition o=
f '_xstate'
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:189:8: note: previous defin=
ition is here
testcases/testcases.c:18:34: error: incomplete definition of type 'struct e=
xtra_context'
testcases/testcases.c:9:36: note: forward declaration of 'struct extra_cont=
ext'
xIn file included from ttestcases/testcases.hr:a15_:
c/usr/include/x86_64-linux-gnu/asm/sigcontext.ho:n317t:e8x:t (error: sredef=
inition of 'sigcontext't
ruct   317e | xsttrrauc_tc osnitgecxontt e*xetx t{r
a      ,|         ^c
har/usr/include/x86_64-linux-gnu/bits/sigcontext.h :*139*:e8r: rnote: ,prev=
ious definition is here
139 | struct sigconttestcases/testcases.ce:x18t:
34      :|         ^
error: incomplete definition of type 'struct extra_context'
testcases/testcases.c:9:36: note: forward declaration of 'struct extra_cont=
ext'
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_=
ctx'
:7:
testcases/testcases.h:101:25: error: invalid application of 'sizeof' to an =
incomplete type 'struct _aarch64_ctx'
testcases/testcases.h:28:2: note: expanded from macro 'HDR_SZ'
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_=
ctx'
4_ctx   129 |                 tail->m*ahgeiacd ,=3D  u0i;n
t      3| 2_t magi                ~~~~^c
,
95:22: note: forward declaration of 'struct _aarch64_ctx'
eader(  s104t | r        ucwth i_laea r(cohf6f4s_ c<t=3Dx  r*ehsve_asdz,  -=
u iHnDtR3_2S_Zt  &m&a
g      i| c                                 ^~~~~~
,
testcases/testcases.h      :| 28                     ^:
2: note: expanded from macro 'HDR_SZ'
ta ,_ acah  rca130hr | 6         4_        *c*ttaxi)l
>siezrertestcases/testcases.h ,:=3D95
note:=20
|                 ~~~~^
testcases/testcases.h:   9595: | 22s:t anote: tforward declaration of 'stru=
ct _aarch64_ctx'i
c inl   i95n | es tsattriucc ti n_laianrec hs6t4r_uccttx  _*agaertestcases/=
testcases.cct:h_196h:4e19_a:cde trerror: x( sincomplete definition of type =
'struct _aarch64_ctx't*
rguectt_ h_eaaadr   ec19rh | (64        s_itcrtfux  c(*th! et_aeararmc h|6|=
4 _tcetrxm -*>hmeaaddg,,i  cuu in|it|n3 t2_t3te2 r_mamtg imca,g
size) {
testcases/testcases.h:testcases/testcases.h105::1395:: 22error: :incomplete=
 definition of type 'struct _aarch64_ctx'=20
note: forward declaration of 'struct _aarch64_ctx'
d      | e               ~~~~^r
(strtestcases/testcases.hutestcases/testcases.c:c95:1t:9 warning22 : and :3=
6_20 : erroranote:  saforward declaration of 'struct _aarch64_ctx'warning: =
 generated
rdeclaration of 'struct extra_context' will not be visible outside of this =
function [-Wvisibility].
c
h64_c   t95x |      s*t9ah | tebicoa odi,lnl  ivunaieln istdrautcett __3ea2=
xa_rtctrh a6_m4ca_ocgtnixt ce*,xg
te      (t| s_                     ^the
raudcetr (esxttrruac_tcon fatal error: t_too many errors emitted, stopping =
now [-ferror-limit=3D]ea
xatr c*he6x4t_rcat,x  c*hhaera d*,* eurirn,t
3      2| _                                   ^t
testcases/testcases.h:105:37: error: incomplete definition of type 'struct =
_aarch64_ctx'
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_=
ctx'
testcases/testcases.h:106:testcases/testcases.c15:: 18error: :incomplete de=
finition of type 'struct _aarch64_ctx'34
: error: incomplete definition of type 'struct extra_context' =20
106 |                 offs    18+ | =3D         theeramd -=3D> sGiEzTe_;R
E      S| V                        ~~~~^_
NEXTtestcases/testcases.h_:H95E:AD22(:&extra ->note: hforward declaration o=
f 'struct _aarch64_ctx'e
ad);
ct _aarc    h96 | 4b_ocotxl  *vgaelti_dheaatdee_re(xsttrruac_tc o_nataercxh=
t6(4s_tcrtuxc *th eeaxdt,ra_context *extra, c huairn t*3*2e_rtr ,m
a      g| i                                   ^c
,
testcases/testcases.c:18:34: error: incomplete definition of type 'struct e=
xtra_context'
GET_RESV_testcases/testcases.hN:EX107T:_10H:E Aerror: D(incomplete definiti=
on of type 'struct _aarch64_ctx'&
extra->h  e107ad | )        ;       =20
h      e| a                                   ~~~~~^d
EXT_H    E9A | Db(ohoela dv)a;l
i      d| at                       ^~~~~~~~~~~~~~~~~~~~~~~~e
_extrtestcases/testcases.ha:_85c:o43n:t enote: xexpanded from macro 'GET_RE=
SV_NEXT_HEAD't
(stru   c85t |          e(xsttrrau_ccto n_taeaxrtch 6*4e_xcttxr a*,) (c(hca=
harr  ***)(ehr)r ,+
->size)
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_=
ctx'1
:95  | error: sincomplete definition of type 'struct _aarch64_ctx't
atic in   l19i | n        ei fs t(r!utcet _aarch6r4m_ c||t xt e*rgme-t>_mha=
egaidce r|(|s ttreurcmt- >_siazaer)c h{
6      4| _                     ~~~~^c
tx *htestcases/testcases.he:a95d:,22 : unote: iforward declaration of 'stru=
ct _aarch64_ctx'n
t32_t    m95a | gsitcat,i
c       | i                     ^n
line struct _aarch64_ctx *get_header(struct _atestcases/testcases.har:c109h=
:6104:_ cerror: tincomplete definition of type 'struct _aarch64_ctx'x
ic) {
fatal error: testcases/testcases.htoo many errors emitted, stopping now [-f=
error-limit=3D]:
95:22: note: forward declaration of 'struct _aarch64_ctx'
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
1 warning and 20 errors generated.
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
1 warning and 20 errors generated.
signals.S:16:19: error: expected ']' in brackets expression
signals.S:16:19: error: expected ']' in brackets expression
signals.S:16:19: error: expected ']' in brackets expression
signals.Ssignals.S::1717::22: : error: error: unknown use of instruction mn=
emonic without a size suffixunknown use of instruction mnemonic without a s=
ize suffix
^
signals.S:signals.S19::192:: 2error: : unknown use of instruction mnemonic =
without a size suffixerror:=20
unknown use of instruction mnemonic without a size suffix mov x20, x0
^=20
^
signals.Ssignals.S::2020::22: : error: error: unknown use of instruction mn=
emonic without a size suffixunknown use of instruction mnemonic without a s=
ize suffix
signals.Ssignals.S:21::212:: 2error: : unknown use of instruction mnemonic =
without a size suffixerror:=20
unknown use of instruction mnemonic without a size suffix mov x22, x2
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
signals.S:16:signals.S19:: 57error: :expected ']' in brackets expression2
: error: invalid instruction mnemonic 'svc' stp x29, x30, [sp, #-16]!
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
signals.S:24:2: error: unknown use of instruction mnemonic without a size s=
uffix
signals.S:27:2: error: unknown use of instruction mnemonic without a size s=
uffixsignals.S
: sub sp, sp, x025
: 14^:=20
error: unknown token in expression
:2: error: unknown use of instruction mnemonic without a size suffix
: 26^:
14: error: unknown token in expression
: 30 : 10 :  error:  unknown token in expression=20
signals.S:31:2: error: unknown use of instruction mnemonic without a size s=
uffix
signals.S mov x1, x21:
27 :^2
: error: unknown use of instruction mnemonic without a size suffix
signals.S:32:2: error: unknown use of instruction mnemonic without a size s=
uffix
signals.S:28:2: error: unknown use of instruction mnemonic without a size s=
uffix
:2: error: invalid instruction mnemonic 'bl'
signals.S bl printf:
30 :^10~:=20
error: unknown token in expression
signals.Ssignals.S:31:2: error: unknown use of instruction mnemonic without=
 a size suffix
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
:36:2: error: unknown use of instruction mnemonic without a size suffix
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
signals.S:16:19: error: expected ']' in brackets expression
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
signals.S:16:19: error: expected ']' in brackets expression
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
signals.S:16:19: error: expected ']' in brackets expression
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
signals.S:16:19: error: expected ']' in brackets expression
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
sve_helpers.c:13:18: error: use of undeclared identifier 'SVE_VQ_MAX'
sve_helpers.c:13:18: error: use of undeclared identifier 'SVE_VQ_MAX'
sve_helpers.c:25:12: error: use of undeclared identifier 'SVE_VQ_MAX'
sve_helpers.c:25:12: error: use of undeclared identifier 'SVE_VQ_MAX'
sve_helpers.c:25:12: error: use of undeclared identifier 'SVE_VQ_MAX'
: error: use of undeclared identifier 'SVE_VQ_MAX'
sve_helpers.csve_helpers.c:41:12: error: call to undeclared function 'sve_v=
q_from_vl'; ISO C99 and later do not support implicit function declarations=
 [-Wimplicit-function-declaration]
:25:12: error: use of undeclared identifier 'SVE_VQ_MAX'
3 errors generated.
:41:12: error: sve_helpers.c:41:12: error: call to undeclared function 'sve=
_vq_from_vl'; ISO C99 and later do not support implicit function declaratio=
ns [-Wimplicit-function-declaration]call to undeclared function 'sve_vq_fro=
m_vl'; ISO C99 and later do not support implicit function declarations [-Wi=
mplicit-function-declaration]
< sve_vq_from_vl(vl))
3 errors generated.
sve_helpers.c:41:12: error: call to undeclared function 'sve_vq_from_vl'; I=
SO C99 and later do not support implicit function declarations [-Wimplicit-=
function-declaration]
3 errors generated.
sve_helpers.c:13:18: error: use of undeclared identifier 'SVE_VQ_MAX'

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D


# Builds where the incident occurred:

## defconfig on (arm64):
- compiler: clang-21
- config: None
- dashboard: https://d.kernelci.org/build/maestro:69cd37eddcae953c056b5321


#kernelci issue maestro:d166940bcec52a85c09cac77aa3770239f1f22ee

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
