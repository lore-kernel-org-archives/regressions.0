Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246D96BFCE
	for <regressions@lists.linux.dev>; Wed,  1 Apr 2026 17:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775066350; cv=none; b=eECFLG64/vxoS31xouOnoVsv/L5LlJ099Yg93r3rkvvfabzg2/dAcG0cAZ/iqeANkiGVGztmBbi5l8WQJ49AzUEu0tQBArng+Nu8BTR0EIAsVeDrLM6KAK0FBjWZoDVssXEIiqTnBK8Zsa8kkb6qBQJ70AyKd+TCZA7ls6d4coc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775066350; c=relaxed/simple;
	bh=g4NtoVTbHwKh+dZuocMkeKTEvwLQXJxQxcldulc+hTs=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=jM+7KLWVv+vZihZPVq+p7TK4UP1W5/IxWyzqWYTVywFeEOSvGDZCIofHs4FcI2T3yF/r2vLKftJ9sg8d/M9FzNuLm89p+g4aeLWPjvpm2f5DKMUQP5zc/GN2vl47xFHSbQnj5DEU9WqvILf32ltkii3G3XcGOX797mOF9mnM8yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=unBPDp2F; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="unBPDp2F"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2b6b0500e06so112663eec.1
        for <regressions@lists.linux.dev>; Wed, 01 Apr 2026 10:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1775066345; x=1775671145; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=buShVfgyAiy1NG8vFvjwtGuYbzj283mcWCa/9/Q+5gg=;
        b=unBPDp2FchB9XYq7VEZo5ZNdl/iN4xc1sx3ZUReCjC4J3ySsia7ViElJvbR297SDeY
         mjvJL16oTkXV0fnldMIszdm+oG39AmJeGFe/8Tic4ZWI37Zcd18vhDmN4Iza5MkEbhyP
         rsA/xobFTfnQmv0c1hEJf+k65W+f3XYOG53PzaWsHzZTUO0if3Txr3OI5Jvul+a9oRP0
         /lHGkUBbPS6Gs0zZGahdvgtrqT/QfSYuzedgmuHYCdQidl1RE8yR0n/xD4QdATrbEs0X
         B9uNuXfxnr2lbmAX7DaUfhuxC0qIT0XREJpTFcHsrDiFaz7UaKLO4QfleRoaHj1IFkrC
         Mqjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775066345; x=1775671145;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=buShVfgyAiy1NG8vFvjwtGuYbzj283mcWCa/9/Q+5gg=;
        b=jFysjXmiyj/uZnDZ2nuU+WHFUAFNJaFtljS6GZ/Y/peabdJ7UeYhZq5arq4ylCUsEI
         OWfyZps+Wck7UORij/QA0NDTCm9ydWdAnXf9siDU+6UKC8+EGvAxhFPsAHXW0PgsraYd
         JlDJ+QSZuDlqR0Ikp8PH7LUlU1T3EM4QJLgd1K4i9JfK3PJuP5Go/H+ZUBSiiquxRfJS
         dsZvIyCKmbmbpwxzfyBCA7/96iSAK6ZLRmVpf0Z5t4Du9e+c5BHRTTMvC5SoL8R03Lam
         2MoysEHPkW1d9kzsiDhKywX1pDJmUOuAUsN+nHtDic9CHxFO7oZKoMg4Fulur8YySJzP
         nu/w==
X-Gm-Message-State: AOJu0YzdEa78Y9v5d2RTs8KWM8cJDW0sslV6BEr7kVQE93vfECCrToAR
	2Pos66rA7fshwKmBKNk7iAjw7F9Mwj/wsfyxQ10ZddkNGgs2LOQQadmVmZCY+UY9iSD0qRnlZzV
	NC0pe
X-Gm-Gg: ATEYQzxhII5dcWPa2hILspeIEdUGGs5IBAx9XegxGexF/SuSzHwLc+5frhw5kmaGReL
	NzuioIfxpiTHkWhilFVXcxb/el9XY/dQv3lqepGrdrrXFAIAyjFm2VQ49lNedQPy7DAF2gI+2rD
	IGbfjjoMkDJg3gHjlq2Xc4wSNLKAN5EPcZQcOZjZcyGKXPVRUGWDN1HmgjlvVToHgR6/3CQ4poO
	jsMYzPlLpIyWOkgu4GCqUeD+ZnWhgSAtNIVy8scQvjAj2s/9Zd9UD8Og890ZWhi2Y9wtDWOuoXU
	CSxjAlx2ED0f/UbBf6dtof8/U2jGOfvEnMwllKQnqHtTPW29bNgMcWWBczJkoGUvmvVsXseu5/+
	nFrDSNktBLj8qkij9YeMq0ShnEB5A955JIsLSJu/7YKDZFqQKlm3L8hvNvQhb5+Zdky2dCGly3k
	G1qeoLfWfMtM6I5NNNLJAFRiCf2mI=
X-Received: by 2002:a05:7300:2150:b0:2c6:55cf:de42 with SMTP id 5a478bee46e88-2ca8d488a0cmr153441eec.7.1775066344699;
        Wed, 01 Apr 2026 10:59:04 -0700 (PDT)
Received: from 984b78e0ad75 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7d31c7c6sm337917eec.31.2026.04.01.10.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 10:59:03 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (build) 15:./test_signals.h
 :testcases/fake_sigreturn_bad_magic.c:fatal er...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 01 Apr 2026 17:59:03 -0000
Message-ID: <177506634319.1099.13117949635186651552@984b78e0ad75>





Hello,

New build issue found on next/master:

---
 15:./test_signals.h :testcases/fake_sigreturn_bad_magic.c:fatal error: In file included from  :'asm/hwcap.h' file not found./test_signals_utils.hfatal error: in testcases/fake_sigreturn_bad_size_for_magic0 (Makefile:31) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:8cc57e5821deb5227525147cda7a7e53246e10c3
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  bd0f139e5fc11182777b81cefc3893ea508544ec
- tags: next-20260401

Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================
In file included from In file included from testcases/fake_sigreturn_duplicated_fpsimd.c:testcases/fake_sigreturn_bad_size.cIn file included from :In file included from testcases/fake_sigreturn_bad_size_for_magic0.c:testcases/fake_sigreturn_missing_fpsimd.c1313:
:13In file included from :
./test_signals_utils.h:
In file included from In file included from :14./test_signals_utils.h./test_signals_utils.h14In file included from :
:::
In file included from 14testcases/fake_sigreturn_sme_change_vl.c14./test_signals.h:
./test_signals_utils.h:
:./test_signals.h::15:./test_signals.h:141510:::
1410:In file included from :
15:./test_signals.h :testcases/fake_sigreturn_bad_magic.c:fatal error: In file included from  :'asm/hwcap.h' file not found./test_signals_utils.hfatal error: 
10:'asm/hwcap.h' file not found15
:14:13:
 10:
fatal error: ./test_signals.hIn file included from 'asm/hwcap.h' file not found:./test_signals_utils.h15
::1410:
:./test_signals.h :fatal error: 15'asm/hwcap.h' file not found:
10      :1515 : |  | fatal error:  ##'asm/hwcap.h' file not foundiifatal error: 
n   nc'asm/hwcap.h' file not foundcl15
lu | udde    15 | #<   aes#15 m<i | /ans#hmcw/iclhanwupcc.dahlp>e.i
u h      >n| 
d<c         ^~~~~~~~~~~~~      e
l| a u         ^~~~~~~~~~~~~s<d
mae/ sh<maw/schm   aw/pc15h.a | whp#c>.ia
hnp      >.c| 
hl         ^~~~~~~~~~~~~      >u

d|       e         ^~~~~~~~~~~~~
|           ^~~~~~~~~~~~~<
asm/hwcap.h>
      |          ^~~~~~~~~~~~~
In file included from testcases/fake_sigreturn_sve_change_vl.c:14:
In file included from ./test_signals_utils.h:14:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
   15 | #include <asm/hwcap.h>
In file included from       | testcases/fake_sigreturn_misaligned_sp.c         ^~~~~~~~~~~~~:
13:
In file included from ./test_signals_utils.h:14:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
   15 | #include <asm/hwcap.h>
      |          ^~~~~~~~~~~~~
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
   15 | #include <asm/hwcap.h>
      |          ^~~~~~~~~~~~~
1 error generated.
In file included from test_signals.c:16:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
   15 | #include <asm/hwcap.h>
      |          ^~~~~~~~~~~~~
1In file included from test_signals.c:16:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
   15 | #include <asm/hwcap.h>
      |          ^~~~~~~~~~~~~
 error generated.
1 error generated.
In file included from test_signals.c:16:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
   15 | #include <asm/hwcap.h>
      | In file included from test_signals.c:16:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
   15 | #include <asm/hwcap.h>
      |          ^~~~~~~~~~~~~
         ^~~~~~~~~~~~~
In file included from test_signals.c:16:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
   15 | #include <asm/hwcap.h>
      |          ^~~~~~~~~~~~~
11 error error generated generated.
.
1 error generated.
In file included from test_signals.c:16:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
   15 | #include <asm/hwcap.h>
      |          ^~~~~~~~~~~~~
In file included from test_signals.c:16:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
   15 | #include <asm/hwcap.h>
      |          ^~~~~~~~~~~~~
1 error generated.
1 error generated.
In file included from In file included from test_signals_utils.c:18:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
   15 | #include <asm/hIn file included from In file included from wtest_signals_utils.cctest_signals_utils.ca::p.18h18:
>:

./test_signals.h./test_signals.h      ::| 1515         ^~~~~~~~~~~~~::
1010::  fatal error: fatal error: 'asm/hwcap.h' file not found'asm/hwcap.h' file not found

      1515 |  | ##iinncclluuddee  <<aassmm//hhwwccaapp..hh>>

            | |          ^~~~~~~~~~~~~         ^~~~~~~~~~~~~

In file included from test_signals_utils.c:18:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
   15 | #include <asm/hwcap.h>
      |          ^~~~~~~~~~~~~
In file included from test_signals_utils.c:18:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
   15 | #include <asm/hwcap.h>
      |          ^~~~~~~~~~~~~
test_signals_utils.c:18:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
   15 | #include <asm/hwcap.h>
      |          ^~~~~~~~~~~~~
In file included from test_signals_utils.c:18:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
   15 | #include <asm/hwcap.h>
      |          ^~~~~~~~~~~~~
In file included from test_signals_utils.c:18:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
   15 | #include <asm/hwcap.h>
      |          ^~~~~~~~~~~~~
1 error generated.
1 error generated.
1 error generated.
1 error generated.
1 error generated.
1 error generated.
1 error generated.
1 error generated.
In file included from In file included from testcases/testcases.cIn file included from :testcases/testcases.c:7:
7In file included from In file included from :
testcases/testcases.htestcases/testcases.cIn file included from ::testcases/testcases.h15::
157/usr/include/x86_64-linux-gnu/asm/sigcontext.h:
:
:/usr/include/x86_64-linux-gnu/asm/sigcontext.hIn file included from 40testcases/testcases.h:::84015:::
8 /usr/include/x86_64-linux-gnu/asm/sigcontext.h:error:  :In file included from 40error: redefinition of '_fpx_sw_bytes':redefinition of '_fpx_sw_bytes'testcases/testcases.c8

:: error: redefinition of '_fpx_sw_bytes'
7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:      4040:408 |  | : sIn file included from error: ttestcases/testcases.credefinition of '_fpx_sw_bytes'r:
uct7 :
_In file included from ftestcases/testcases.hp:x15s_:
ts/usr/include/x86_64-linux-gnu/asm/sigcontext.hw:   _40b:y8rt:ue cserror: t  redefinition of '_fpx_sw_bytes'{_

f40      p | | xs       ^t_
rsuwct_ b_ytfe   sp40    x{ | _
40s      s | t| ws       ^_t
bryutcet s _/usr/include/x86_64-linux-gnu/bits/sigcontext.h{f:
p      31x| _:       ^s8w
:_ bnote: yprevious definition is heret
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:es31 :   {831
: |        s| note: t       ^previous definition is here
r
uct _fpx_sw_b   y31 | st/usr/include/x86_64-linux-gnu/bits/sigcontext.hrruuc:t31 :t_8e:fs p
note: x      previous definition is here_| s       ^w
_b
cy/usr/include/x86_64-linux-gnu/bits/sigcontext.htt :e   _31s31f
: |       p8s| :t       ^ r
note: uprevious definition is herec
t _   f31p | xs_tsruwc_tb y_tfepxx__sws_In file included from btestcases/testcases.cy:tes
7      :
w| In file included from _       ^testcases/testcases.hbs
y:
t15      e:
| s       ^ /usr/include/x86_64-linux-gnu/asm/sigcontext.h
{:
40      :| 8       ^: error: redefinition of '_fpx_sw_bytes'

   40 | struct _fpx_sw_bytes {
      |        ^
In file included from In file included from testcases/testcases.ctestcases/testcases.c::7:
7In file included from :
In file included from testcases/testcases.htestcases/testcases.h:15::
15/usr/include/x86_64-linux-gnu/asm/sigcontext.h:
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:/usr/include/x86_64-linux-gnu/asm/sigcontext.h:8531:::8588::: 8 error: :note: redefinition of '_fpreg' In file included from previous definition is here
error: 
testcases/testcases.credefinition of '_fpreg':
7   :
In file included from 85   testcases/testcases.h |    31:s85 | t15 | srs:
uttc/usr/include/x86_64-linux-gnu/asm/sigcontext.hrrt:uu 85cc_:ttf8  p:__r ffeerror: pgpredefinition of '_fpreg'xr 
_{e
sg      w | _{          ^b
In file included from 
85      ytestcases/testcases.c | | :ts       ^7et
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:
sr:In file included from 
u40testcases/testcases.h      :c:/usr/include/x86_64-linux-gnu/bits/sigcontext.h8| t15:::
       ^ 40 /usr/include/x86_64-linux-gnu/asm/sigcontext.h
_:note: :f8previous definition is here85p:
:r 8enote: :g   previous definition is here  40
error: { | redefinition of '_fpreg's

t         r| 40u       ^ | c
   st85t  | /usr/include/x86_64-linux-gnu/bits/sigcontext.h_rs:fu40tpc:r8te: g 
_note:       fprevious definition is herer| p
u       ^rc
e   tg40 
 | /usr/include/x86_64-linux-gnu/bits/sigcontext.h      s| t       ^ru
c_tf p_rfepr:e31g
      | g       ^ 
{
In file included from       testcases/testcases.c| :       ^7
:
:In file included from 8testcases/testcases.h::15In file included from In file included from :
testcases/testcases.ctestcases/testcases.c/usr/include/x86_64-linux-gnu/asm/sigcontext.h:::7/usr/include/x86_64-linux-gnu/bits/sigcontext.h91:
7::In file included from :
408testcases/testcases.hIn file included from :::8 testcases/testcases.h15:error: ::
 redefinition of '_fpxreg'15/usr/include/x86_64-linux-gnu/asm/sigcontext.hnote: 
:
:In file included from previous definition is here/usr/include/x86_64-linux-gnu/asm/sigcontext.h 85testcases/testcases.c
:::   91note: 87:91::
 | 8 In file included from s:error: testcases/testcases.ht redefinition of '_fpreg'rerror: :   
uredefinition of '_fpxreg'1540c:

 | t/usr/include/x86_64-linux-gnu/asm/sigcontext.hs :   t_91r   fprevious definition is here:u8591p8c |  | x:ssr teterror: rgredefinition of '_fpxreg'r u
u{cc
ttt         | _   _       ^_f91f
f | pp/usr/include/x86_64-linux-gnu/bits/sigcontext.hpsrter
gucrx :tr{e46 eg
:_g
8      f       :| p{        ^x
note: 
r      previous definition is heree| 
g       ^ /usr/include/x86_64-linux-gnu/bits/sigcontext.h|    :
{46       ^40
 | 
:/usr/include/x86_64-linux-gnu/bits/sigcontext.hs8:t46:r: u8note: c:previous definition is heret  
note: _previous definition is heref      p   
| x40       ^r   
 |    es4631t | gr/usr/include/x86_64-linux-gnu/bits/sigcontext.hs
ut:      cr| 46t       ^u:
 c8t_: f _note: pfprevious definition is hererp
ex | gr
se         tg| 46r
       ^ |       u
s| ct       ^tr
u c_tf p_xf_psIn file included from xwtestcases/testcases.cr_:ebg7y
:
t      In file included from e| testcases/testcases.hs       ^:

15      :
| /usr/include/x86_64-linux-gnu/asm/sigcontext.h       ^
In file included from :testcases/testcases.c98::7In file included from 8:
testcases/testcases.c::In file included from  7error: :
redefinition of '_xmmreg'In file included from 
testcases/testcases.h:15:
testcases/testcases.h   /usr/include/x86_64-linux-gnu/asm/sigcontext.h:In file included from 98:15testcases/testcases.c91 | :
::s/usr/include/x86_64-linux-gnu/asm/sigcontext.h78t::
:rIn file included from  utestcases/testcases.herror: c:redefinition of '_fpxreg't15
 :
_/usr/include/x86_64-linux-gnu/asm/sigcontext.hIn file included from 91x:   m:testcases/testcases.c98m918::r | :87e:s:
 gtIn file included from error:  rtestcases/testcases.hredefinition of '_xmmreg'{u: 

c15error:       t:
redefinition of '_fpxreg'|     /usr/include/x86_64-linux-gnu/asm/sigcontext.h       ^98_
: | f98sp:t/usr/include/x86_64-linux-gnu/bits/sigcontext.h
x8r:u53:rc: et8error: g :redefinition of '_xmmreg'     _
{91xnote: 
 | mprevious definition is here      sm
| tr       ^   re
   u98g53c |   | s{s/usr/include/x86_64-linux-gnu/bits/sigcontext.hIn file included from 
tt:      testcases/testcases.crr46| :uu:       ^c7c8t
:
:t tIn file included from  _  testcases/testcases.hf__:/usr/include/x86_64-linux-gnu/bits/sigcontext.hnote: xx15:previous definition is heremm:
53m
m/usr/include/x86_64-linux-gnu/asm/sigcontext.h:rr:8ee   g85:g46
: p  |       8note: x{s| :previous definition is herer
       ^t 
e      r
error: g| uredefinition of '_fpreg'        ^c   
{
t53
 |  s_/usr/include/x86_64-linux-gnu/bits/sigcontext.ht   f:r85p53u | x:csr8tte:      r g | u_
note:        ^cx      previous definition is here
mt| 
m       ^ r
_   ef53gp | 
s      t| r/usr/include/x86_64-linux-gnu/bits/sigcontext.h       ^u:c
46t :_r8xe:m gmnote:  rprevious definition is here{e
g
      
|              ^| 
       ^
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:   40:In file included from 8testcases/testcases.c:: 7note: :
previous definition is here
In file included from testcases/testcases.h   :464015 |  | :
ss/usr/include/x86_64-linux-gnu/asm/sigcontext.htt:r98u:c8t:  _error: fredefinition of '_xmmreg'rp
urcegt   
98       | | s       ^t
ruc t_ f_pxxmmrreeg {
      |        ^g

      | /usr/include/x86_64-linux-gnu/bits/sigcontext.h:       ^53In file included from :testcases/testcases.c8::7 :
note: In file included from previous definition is heretestcases/testcases.h

:15   :
53/usr/include/x86_64-linux-gnu/asm/sigcontext.h | :s91t:r8u:c terror:  redefinition of '_fpxreg'_
xmm   r91e | gs
t      r| u       ^c
t _fpxreg {
      |        ^
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:46:8: note: previous definition is here
   46 | struct In file included from _testcases/testcases.cf:pxreg
      | 7       ^
:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:98:8: error: redefinition of '_xmmreg'In file included from 
testcases/testcases.c:7   :
98In file included from testcases/testcases.h | :s15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:98:8t:r uerror: credefinition of '_xmmreg't
   98 | st r_uxcmtm r_exmgm r{e
g       In file included from {
testcases/testcases.c      :| 7       ^:

In file included from testcases/testcases.h| /usr/include/x86_64-linux-gnu/bits/sigcontext.h:       ^:15
53:
:/usr/include/x86_64-linux-gnu/asm/sigcontext.h8:: 180note: :previous definition is here8
:In file included from  /usr/include/x86_64-linux-gnu/bits/sigcontext.h   error: testcases/testcases.c:53redefinition of '_ymmh_state': | 53
s7:t:
rIn file included from utestcases/testcases.hc:  t15180 :
 | _/usr/include/x86_64-linux-gnu/asm/sigcontext.hsxIn file included from :tm180rtestcases/testcases.c:mu:8rc:7te 8:
 error: :gIn file included from _redefinition of '_ymmh_state' 
ytestcases/testcases.hnote: m      
previous definition is here:m| 
h15       ^_:

s/usr/include/x86_64-linux-gnu/asm/sigcontext.h  t:180a180 | t:se8t :r{ u
error: c      redefinition of '_ymmh_state't| 
        ^_
ymm  /usr/include/x86_64-linux-gnu/bits/sigcontext.hh180:_ | 184ss:tt8ar:tu ec note: t{previous definition is here 

_      y| m       ^  m
184h |    _s53/usr/include/x86_64-linux-gnu/bits/sigcontext.hst | :trs184aut:tc8ret: u  {_note: 
yIn file included from previous definition is here      m| testcases/testcases.c
m       ^:h
7_:
sc  In file included from tt/usr/include/x86_64-linux-gnu/bits/sigcontext.htestcases/testcases.h184a: :t184 | e:15s
8:
t      :/usr/include/x86_64-linux-gnu/asm/sigcontext.h r| note: :       ^_uprevious definition is here180
xc
:mt8m :r  e_ 184gy | 
error: msredefinition of '_ymmh_state'mt
rhu_cstt       a| _  In file included from t       ^y180
etestcases/testcases.cm | 
m:      sh7| _:
tsIn file included from        ^rttestcases/testcases.h
ua:ct15te:
 
/usr/include/x86_64-linux-gnu/asm/sigcontext.h_      :y| 192m       ^:m
8h:_ sterror: aredefinition of '_xstate't
e {  
192       | | s       ^t
In file included from rtestcases/testcases.cuIn file included from :c/usr/include/x86_64-linux-gnu/bits/sigcontext.htestcases/testcases.c7t:: :
1847_:
:In file included from xIn file included from 8stestcases/testcases.htestcases/testcases.h:t:: a15:
15note: t/usr/include/x86_64-linux-gnu/asm/sigcontext.h:
previous definition is heree:
 192/usr/include/x86_64-linux-gnu/asm/sigcontext.h{::8
192:        : | 184error: 8       ^ | redefinition of '_xstate'
:s
 t/usr/include/x86_64-linux-gnu/bits/sigcontext.herror: r:  redefinition of '_xstate'u189192
c: | t8s:  _  note: y192previous definition is herem | 
msht  _r189 | sustctatr tu_cetx
 s      _t| xa       ^st
tea t{e

            | |        ^       ^

/usr/include/x86_64-linux-gnu/bits/sigcontext.h:189t:8:r unote: cprevious definition is heret
 _In file included from x  testcases/testcases.cs189:t | 7as:
tteIn file included from  rtestcases/testcases.h{:u
15      c| :
t       ^ /usr/include/x86_64-linux-gnu/asm/sigcontext.h
_:x192s:t8/usr/include/x86_64-linux-gnu/bits/sigcontext.h:a: t189eerror: :
8redefinition of '_xstate':      
 | note:        ^previous definition is here

  192 |   s189t | rsutcrtu ct_ x_sxtsattaet e{

            | |        ^       ^

/usr/include/x86_64-linux-gnu/bits/sigcontext.h:189:8:In file included from  testcases/testcases.cnote: :previous definition is here7
:
In file included from   testcases/testcases.h189: | 15s:
t/usr/include/x86_64-linux-gnu/asm/sigcontext.hr:u180c:t8 :_ xerror: sredefinition of '_ymmh_state't
ate
        180|  |        ^s
truct _ymmh_state {
      |        ^
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:184:8: note: previous definition is here
  184 | struct _ymmh_state
      |        ^
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:192:8: error: redefinition of '_xstate'
In file included from testcases/testcases.c:7:
  In file included from 192testcases/testcases.h | :s15t:
r/usr/include/x86_64-linux-gnu/asm/sigcontext.huIn file included from :c317testcases/testcases.ct: 8_:x serror: taredefinition of 'sigcontext':t
7e:
 In file included from {  
testcases/testcases.h317      : | | s       ^
tru/usr/include/x86_64-linux-gnu/bits/sigcontext.hc15:t:
189 :/usr/include/x86_64-linux-gnu/asm/sigcontext.hs8i:g cnote: oprevious definition is heren
t:e  180x189:t | 8 s:{t 
error: In file included from r      redefinition of '_ymmh_state'testcases/testcases.cu
| :c       ^7t
:
 In file included from _  testcases/testcases.h/usr/include/x86_64-linux-gnu/bits/sigcontext.hx::s15139t:
:a/usr/include/x86_64-linux-gnu/asm/sigcontext.h8t::e317
 180:      note:  | 8| previous definition is heres:       ^
t 
rerror: redefinition of 'sigcontext'  u
139 | st  r317u | ccsttt  r_suyicmgtc osingtceoxmntht
e_      xs| tt       ^ a
{t
      In file included from | In file included from testcases/testcases.c       ^testcases/testcases.c:
:77:
:
eIn file included from In file included from  /usr/include/x86_64-linux-gnu/bits/sigcontext.htestcases/testcases.htestcases/testcases.h{::
:15      13915:
| ::
/usr/include/x86_64-linux-gnu/asm/sigcontext.h       ^8:/usr/include/x86_64-linux-gnu/asm/sigcontext.h
:317:: 3178note: ::previous definition is here 
error: redefinition of 'sigcontext'/usr/include/x86_64-linux-gnu/bits/sigcontext.h
  :184139:  8 | 317:s |  tsnote: rtprevious definition is hereur
cutct  ssiig  gc184co | onsnttterxutc
t       | e_yx       ^mt
m {h
      |        ^
_s/usr/include/x86_64-linux-gnu/bits/sigcontext.ht:a139t:e8
:       | note:        ^previous definition is here

  139 | struct sigcontextIn file included from 
testcases/testcases.c      | :       ^
7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:192:8: error: redefinition of '_xstate'
  192 | struct _xstate {
      |        ^
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:189:8: note: previous definition is here
In file included from   testcases/testcases.c:7:
In file included from testcases/testcases.h:15189:
 | /usr/include/x86_64-linux-gnu/asm/sigcontext.hs:t317r:u8c:t  error: redefinition of 'sigcontext'
  _317x | ssttartuec
t       | s       ^igconte
xt {
      |        ^
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:139:8: note: previous definition is here
  139 | struct sigcontext
      |        ^
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h8:15::
 /usr/include/x86_64-linux-gnu/asm/sigcontext.herror: :redefinition of 'sigcontext'317:
In file included from 8:testcases/testcases.c :error: 7redefinition of 'sigcontext':
  
testcases/testcases.h317: | 101st:  r25317u: | c tserror:  tinvalid application of 'sizeof' to an incomplete type 'struct _aarch64_ctx'rs
uigccto nstiexgtc  o101n | t        eixft  ({!
h      e| a       ^d
 In file included from ||testcases/testcases.c :r7es:
vtestcases/testcases.h_/usr/include/x86_64-linux-gnu/bits/sigcontext.hs::z101139 ::<258 :H: D note: Rerror: previous definition is here_ invalid application of 'sizeof' to an incomplete type 'struct _aarch64_ctx'
S{
Z
)        
| 139             ^ | | 
s                               ^~~~~~tIn file included from 
testcases/testcases.c:  7testcases/testcases.h101:
: | /usr/include/x86_64-linux-gnu/bits/sigcontext.htestcases/testcases.h28        r:::iu2139101c:f::t  825 note: (::sexpanded from macro 'HDR_SZ'!  
ihegnote: error: a   cinvalid application of 'sizeof' to an incomplete type 'struct _aarch64_ctx'd28o
  | |n        |st irezeexprevious definition is hereso
t  vf
101_(       | ss|         tz       ^i  r 
f139u<  | c (stH! tDh_rRea_uaaScrdZtc ) h
|6s      |4i|  _g                               ^~~~~~crc
teoxsn)v
ttestcases/testcases.he_xt
      |              ^
|         ^     ~~~~~~~~~~~~~~~~~~~~~
testcases/testcases.htestcases/testcases.c:95::22:7:
In file included from testcases/testcases.h :note: 15forward declaration of 'struct _aarch64_ctx':

/usr/include/x86_64-linux-gnu/asm/sigcontext.h:40:8: error: redefinition of '_fpx_sw_bytes'
   95 | static in   40 | stIn file included from rtestcases/testcases.cu:ct7 :
_lIn file included from fitestcases/testcases.hpn:xe15:
_ s/usr/include/x86_64-linux-gnu/asm/sigcontext.hsw:t_40r:bu8yc:tt error:  eredefinition of '_fpx_sw_bytes'_s
a a{r
c      h|        ^
64   _40c | tsxt r*ugcett __hfepaxd_eswr_(bsy/usr/include/x86_64-linux-gnu/bits/sigcontext.httr:eu31s :c{8t
:        _| note:        ^a
previous definition is herea
rch6   431_ | ctsxt r*uhceta/usr/include/x86_64-linux-gnu/bits/sigcontext.h :d31_,:f 8pu:ix nnote: _tprevious definition is heres3
w2__bt    y31mt | saegsti
rc      u,| c
       ^t       
| _                     ^f
px_sw_bytes
      |        ^
testcases/testcases.h:104:27: error: invalid application of 'sizeof' to an incomplete type 'struct _aarch64_ctx'
In file included from   104testcases/testcases.cIn file included from  | :testcases/testcases.c        7::
w7In file included from h:
testcases/testcases.hiIn file included from testcases/testcases.h:l:15e15:
 :
(/usr/include/x86_64-linux-gnu/asm/sigcontext.h/usr/include/x86_64-linux-gnu/asm/sigcontext.ho::f8585:f:8s8::   error: <error: redefinition of '_fpreg'=
redefinition of '_fpreg' 
re   s85v | _   sst85rz | u sc-tt  rH_ufDpcRrt_e Sg _Z{ f
&p      &| r       ^
e
      g|                                   ^~~~~~/usr/include/x86_64-linux-gnu/bits/sigcontext.h{
:
40      :| 8testcases/testcases.h       ^::
 note: 28previous definition is here:
2/usr/include/x86_64-linux-gnu/bits/sigcontext.h:    :40note: 40 | expanded from macro 'HDR_SZ's:t
8r:u note: cprevious definition is heret
    28_ | f           p40sr | iegsz
teIn file included from       ro| testcases/testcases.cu       ^f:
c(7ts:
t testcases/testcases.hr_:uf101cp:25tr: e _gerror: a
invalid application of 'sizeof' to an incomplete type 'struct _aarch64_ctx'a      
r| c       ^h
64_ctx  )101
 |       In file included from         | testcases/testcases.ci        ^     ~~~~~~~~~~~~~~~~~~~~~:
f7 :
(In file included from testcases/testcases.h!testcases/testcases.h::h9515e::
a22/usr/include/x86_64-linux-gnu/asm/sigcontext.h:d:  91note: |:forward declaration of 'struct _aarch64_ctx'|8: In file included from  rerror: testcases/testcases.ceredefinition of '_fpxreg':s
7v:
_In file included from s   testcases/testcases.hz91:  | 15<:
s t/usr/include/x86_64-linux-gnu/asm/sigcontext.hHr:uD91Rc:_t8S: Z _)error: f
predefinition of '_fpxreg'      x| 
r                               ^~~~~~e
g    91{testcases/testcases.h
 | :      s28| :t       ^2r
In file included from u:testcases/testcases.cc :tnote: /usr/include/x86_64-linux-gnu/bits/sigcontext.h7 expanded from macro 'HDR_SZ'::
_
46ftestcases/testcases.h:p:8x101:
r   : 28e25note: g | : previous definition is here         {
sIn file included from error: 
itestcases/testcases.cinvalid application of 'sizeof' to an incomplete type 'struct _aarch64_ctx'      z:
|    e7       ^46:
o
    | testcases/testcases.hf95s:( | 101ts:/usr/include/x86_64-linux-gnu/bits/sigcontext.hrs25tu::trc 46au  error: t:101invalid application of 'sizeof' to an incomplete type 'struct _aarch64_ctx'c8 
 | tt:_        i  fi_cnote: fpa previous definition is here axi
(r  rnc!101leh | h   ig        6en
446ie      _af | c|   dts       ^ (stx!|
t)r|hr
ueu       accr| dtte        ^     ~~~~~~~~~~~~~~~~~~~~~ s 
 |v_|__a sfrazepr stestcases/testcases.hx<v:cr _95Hshe:zD6g22R 4
_<:_       S Hc| Znote: D)       ^Rtforward declaration of 'struct _aarch64_ctx'
_
x
S       Z| *)                               ^~~~~~g

e      | t                               ^~~~~~_
testcases/testcases.hh:e28atestcases/testcases.h   ::d95In file included from 2e28 | r:testcases/testcases.cs(: :st2note: t:a7 rexpanded from macro 'HDR_SZ':
tnote: uexpanded from macro 'HDR_SZ'In file included from c
i
testcases/testcases.htc:  15   _i:
28a | /usr/include/x86_64-linux-gnu/asm/sigcontext.hna           :rls28c98ii | hzn:        e6In file included from se8testcases/testcases.ci o4:z:sf_ e(t7csoerror: rt:
redefinition of '_xmmreg'utfx
rc (ut*cs htt_e    ra_98auaa | dacIn file included from rrs,tcctestcases/testcases.h th h:6ur_415i6u_a:
n4cct/usr/include/x86_64-linux-gnu/asm/sigcontext.htt_x :)3_c98
2xt      :_m| x8m        ^     ~~~~~~~~~~~~~~~~~~~~~t 
:r * meagtestcases/testcases.herror: agr:eredefinition of '_xmmreg'g95 ct:
i{h22c_:
6, h      4
   e|       a       ^| d                     ^e
rnote: _98
(forward declaration of 'struct _aarch64_ctx' | c
sstttx/usr/include/x86_64-linux-gnu/bits/sigcontext.hrr):uu
c53   ct      :95t  | | 8 _s        ^     ~~~~~~~~~~~~~~~~~~~~~:xt_
 maamtnote: airprevious definition is herecre
 cginh testcases/testcases.h   l6{i:534
n95 | e_      : cs| s22t       ^tt:xr
r u ucnote: *tc/usr/include/x86_64-linux-gnu/bits/sigcontext.hforward declaration of 'struct _aarch64_ctx' ht:_
ea 53aa_:rdxc8,hm:6 m 4urnote: _ieprevious definition is herecgn
t
testcases/testcases.htx         : 395*105   | 2 | g:53       ^_es13 | ttt
:_ sah mtteerror: aiarincomplete definition of type 'struct _aarch64_ctx'cgdu
 eicirctn(, sl
ti_      rnxu| mec  t m                     ^ 105sr
_ | taera        gru c
ch       6t 4|  _        ^_c 
ta xa  r*hcheehaa6dd4-,_ >cumtiaxngt 3i*cge t!_=h emaadgeirc( s&t&r uhceta d2testcases/testcases.h_-_a:ta104r :cm27ha:6>g 4mierror: _accinvalid application of 'sizeof' to an incomplete type 'struct _aarch64_ctx'g,t
i
xc       )| *                      ^h{
e
  a      104d| , |                ~~~~^         
uwihnitl3testcases/testcases.he2: _95(t: o22mf:a fgnote: siforward declaration of 'struct _aarch64_ctx' c
s<,=z
        r| <e                     ^ s
   Hv95D | _Rs_stSzaZ t)-i
 c      H | testcases/testcases.hDi                               ^~~~~~n:Rl
_104iS:nZe27  :s &terror: &rinvalid application of 'sizeof' to an incomplete type 'struct _aarch64_ctx'
utestcases/testcases.h
      c:| t28                                 ^~~~~~ :
_2a:a testcases/testcases.hr  note: :c10428hexpanded from macro 'HDR_SZ': | 6
2        4:w_ hcnote: itexpanded from macro 'HDR_SZ'lx
e     *g28(testcases/testcases.he |    o:t        28f104_s | :hf        27eiss:az id ezerror: e<oeinvalid application of 'sizeof' to an incomplete type 'struct _aarch64_ctx'rfo
(=(fs (tsrrstuetrc  srtu104v u | c_c_        tatws a hr__izcalah aea6- rr4( cc_oHhchfDt6f6xR44s ___ *cc<hSt=teZx ax r)d)e&,

s &v            u_
| i| s      nz        ^     ~~~~~~~~~~~~~~~~~~~~~|         ^     ~~~~~~~~~~~~~~~~~~~~~t 
                                 ^~~~~~
3-:
2 28_H:testcases/testcases.htD2: R:testcases/testcases.h28m_ :aS:2gZnote: 95:i : cexpanded from macro 'HDR_SZ'testcases/testcases.h22&note: :,
&:expanded from macro 'HDR_SZ'

95       
      note: :| | 22                     ^forward declaration of 'struct _aarch64_ctx'                                 ^~~~~~:


 note:    28forward declaration of 'struct _aarch64_ctx'testcases/testcases.h | 
:        28:s   2i95:z |  esnote: otfexpanded from macro 'HDR_SZ'a(
   ts   testcases/testcases.hit95:cr |  105   usi:28ct37 | nat        :lt i serror: in_iincomplete definition of type 'struct _aarch64_ctx'ceza
  eaiosrnf(ltcsirth  nr1056euu | 4c c        _tts c  t __t raax uaa )crr 
tc c       hhhe| _66a4        ^     ~~~~~~~~~~~~~~~~~~~~~ad4_
a-_c>rtcmcxtah)xg6testcases/testcases.h
 i      4:*c| _95 g        ^     ~~~~~~~~~~~~~~~~~~~~~c!:e
=t22t x_:m h a*enote: In file included from gtestcases/testcases.haforward declaration of 'struct _aarch64_ctx'gi:dtestcases/testcases.c
e95ce:t :r_227&h(::
&es In file included from  atnote: testcases/testcases.hhdforward declaration of 'struct _aarch64_ctx'r:e   eu
15a95cr:
d | t(-/usr/include/x86_64-linux-gnu/asm/sigcontext.h ss>_:ttma180raaa   :utrg958ci | ic:tcsch   t)error: 6_ia 4redefinition of '_ymmh_state'atn_{
aicl
rct      ic | xnhi                                       ~~~~^   
*6enIn file included from h4180l _etestcases/testcases.c | ica:stnstestcases/testcases.hd7tet:x,:
r95   ursIn file included from u:iutc*testcases/testcases.hn22t:c:rht u15t ce3:
_a note: t2a/usr/include/x86_64-linux-gnu/asm/sigcontext.h_d ayforward declaration of 'struct _aarch64_ctx'__:,
tarm  180cmam:uahhr8ig_6c:ins4 ctth_error: a   6c,3t95redefinition of '_ymmh_state'4t2
e | 
_x_       sct {tt *
axmg         aet| *180gti       ^|  | icg_c
                     ^e hs,
tiet
n/usr/include/x86_64-linux-gnu/bits/sigcontext.h      _rl:| ahui184                     ^dec:n
eat8erd :( e_ ssrynote: ttm(previous definition is hererrms
uuthccr_ttu    stestcases/testcases.h_184c_t: | aata105asat: rrte_ccra hhua{66c4
r4t_      c_ c| hct_       ^xty6 
mx4* hm13_e*/usr/include/x86_64-linux-gnu/bits/sigcontext.hh:acg: _dte184error: s,xt:incomplete definition of type 'struct _aarch64_ctx' t _u
8*hai:hent etaenote: a3d
2dprevious definition is heree      _  ,
rt105 | (  | u       ^sm        i  
ta n184rg t | ui 3cc st2, t 
 _r_testcases/testcases.h       auth| :a ce                     ^r104mact
:ahd 276-g:_>4i m_yerror: ccaminvalid application of 'sizeof' to an incomplete type 'struct _aarch64_ctx't,gIn file included from 
xim
testcases/testcases.cc       h :*| !_7h=                     ^s  :
 ettestcases/testcases.hm
104In file included from aa:atestcases/testcases.h | gd105:ti        ,15:ecw:

13  h      &/usr/include/x86_64-linux-gnu/asm/sigcontext.hu:i| &i:l        ^ n192he
error: et :a3(incomplete definition of type 'struct _aarch64_ctx'd82o
-:_f> tfmerror:  sa redefinition of '_xstate'gmtestcases/testcases.h<
ia:=cg  105) i:105rc 13  ,e{: | 192

 s                     | error: | v|                 ~~~~^In file included from _sincomplete definition of type 'struct _aarch64_ctx'                     ^
 testcases/testcases.c
st
: zr7  utestcases/testcases.h:
 c-:In file included from t  95testcases/testcases.h  ::H_22h15xD:  :
esR 105ta_note:  | /usr/include/x86_64-linux-gnu/asm/sigcontext.haforward declaration of 'struct _aarch64_ctx'd        :S
t- 192Ze>  : m &8{a &
: g
                 | 95i| error:        ^ |  c
s                                 ^~~~~~hredefinition of '_xstate' t

e!a/usr/include/x86_64-linux-gnu/bits/sigcontext.ha=t:d testcases/testcases.hi189-  mc::>192 a828i | m:g:ns a2iltgnote: :icriprevious definition is here n ucnote: 
e&cexpanded from macro 'HDR_SZ'  &t
s!    t189=_hr | eu xacsm   tdsat 28-tgr_ | >aai        utmscaceai rt gz& c{ie&h_
oc6x       4)fsh| _ (te       ^c{saat

ttxd       re-| */usr/include/x86_64-linux-gnu/bits/sigcontext.hu>
               ~~~~^g:cme
      189tt| a: _       ^8_gh
:atestcases/testcases.hie a:acnote: r95d)previous definition is here:ce 
22hr{:6(
 4  s      note: _t189| rforward declaration of 'struct _aarch64_ctx'c |                ~~~~^u
ts
cxtt)r 
u_      ca| ttestcases/testcases.ha        ^     ~~~~~~~~~~~~~~~~~~~~~r: 
c95   _h95:x6 | 22ss:tttestcases/testcases.h aa:note: ttestcases/testcases.h95t4eforward declaration of 'struct _aarch64_ctx'::i
_
22106cc      ::t|  15x        ^i: 
note: n* forward declaration of 'struct _aarch64_ctx'herror: l
eincomplete definition of type 'struct _aarch64_ctx'ia
nde,  suti  rn   106ut95 |    c3 |         95t2        s | _o ttfs_a fttmsia act+g =iii cnch,la e
ia      nai| erd                     ^n -
cls>tishrin6uzcee4t;  _
s_      cat| ta                        ~~~~^rrx
testcases/testcases.hcu :hc*1056ttestcases/testcases.hg4:: _37e95c:_t:t 22a_xerror: :ah incomplete definition of type 'struct _aarch64_ctx' *r
note: egcforward declaration of 'struct _aarch64_ctx'ae
htd6_e4h  e_r105ac( | dt   se        95xtr  |  ( rss* utt gra ecu tttc i_t hc he __eaiaadnaaa-lrd>icremnhrae6cg(4 hi_sscc6tt tr4!xru_= cu *tccmh tte_axaag d ai_,rc* c ahuh&aei6&nr4 at_ch3dceh2ta,6_xdt4  - *_>umgmcaieagtntgixt_ic3h, e2a*_d
hte      er|  (                     ^ams
dat,rgu icucti, n
_t      a3| ar                     ^2c
_hct6testcases/testcases.h 4:)m105 a:{g37
i:      c _,| error: c
                                       ~~~~^incomplete definition of type 'struct _aarch64_ctx't      

x|                       ^*
testcases/testcases.hh:e105atestcases/testcases.h:  d:37105,95: |  :         u22error:  i:incomplete definition of type 'struct _aarch64_ctx' n 
 tnote:  3forward declaration of 'struct _aarch64_ctx' 2
 _ th em  aa105gdtestcases/testcases.h | i   -c:95>        , | m105 
sa:       tg| 13 ai                     ^:t c
 i  cerror:  ! incomplete definition of type 'struct _aarch64_ctx' =ih nemlaaidgnie-c  
>s&mt&ar guhicecta  d  _-!105a> | =am        ra c gmhi a6c g4) _ ic{ ct
  x       & | *                                       ~~~~^&hg
 eeIn file included from hta_etestcases/testcases.hdtestcases/testcases.ch:a-:e95d>7a:-md22:
ea>:In file included from rg m(testcases/testcases.hnote: ias:forward declaration of 'struct _aarch64_ctx't15g
cr:
iu /usr/include/x86_64-linux-gnu/asm/sigcontext.hcctestcases/testcases.h!:t):= 317  107   _:{m95:a8 | 
10aa:s      : t| gr aerror: icterror:                                        ~~~~^chiredefinition of 'sigcontext'incomplete definition of type 'struct _aarch64_ctx'
c6 
 
4&i_&nc lttestcases/testcases.hh  ix:e317n 95 | e*  :a hs10722dset | :-atr        d> ru        note: u,chmforward declaration of 'struct _aarch64_ctx'ce ataug
 tidsi In file included from c in_testcases/testcases.c)=tg: 3ac {72a
oG_:
r      ntEIn file included from c t|    mTetestcases/testcases.hha               ~~~~^95_x:g6
 | 154s:
t/usr/include/x86_64-linux-gnu/asm/sigcontext.ha:testcases/testcases.h317Rt:i_t:8c Eci95,:{St
c: Vx
       22error: _       | i:redefinition of 'sigcontext'N*|                      ^ng       ^ 
el
E
note: tiX_forward declaration of 'struct _aarch64_ctx'nTh
_e/usr/include/x86_64-linux-gnu/bits/sigcontext.heH   a:E317sd139At | e:Drsr8(ut(:ch   rs 95tutnote: e |  crprevious definition is herea_sttestcases/testcases.h
ud:tac )106at:s  ta i139;15irg_ | 
c:acs      ca  thoir| rn6error: n                       ^~~~~~~~~~~~~~~~~~~~~~~~ut4lcincomplete definition of type 'struct _aarch64_ctx'
che_it
6xc n4tstestcases/testcases.het_ i: xc{  g85s 106
tc:t* |       xo43r        g|  u        ne       ^*cott
tefh_ :fexh_ /usr/include/x86_64-linux-gnu/bits/sigcontext.hastaenote: : aad139
expanded from macro 'GET_RESV_NEXT_HEAD'd,+re :      
u=c| ir8        ^h(n:h
6st e4t3note:    a_r285dprevious definition is herecu_ | -
tct        >xt(s  sm   i*ta139z_gr | egae;suiat
tccr_      rt,hc|  u
e                        ~~~~^_hc      
aa6t| ad4 r                     ^etestcases/testcases.hc
_shr:i6c(95g4st:c_22ocxt:tn r xtnote:  eu*forward declaration of 'struct _aarch64_ctx'*xch
)tte(
( a      c| _dh       ^aa,
ra     95ru* | testcases/testcases.hcis):ht(106n6ah:t4t15)i3: _c 2+c error:  _tiincomplete definition of type 'struct _aarch64_ctx'(tn
hxl ) im-n*a>e  hs 106geis | azt        ierd        c)uo,
c,f       t
f|  us      _                                              ~~~^i a| 
+na                     ^=rt
 c3htestcases/testcases.hh2e:6_a954td:_ -22cm>:tas xginote:  izforward declaration of 'struct _aarch64_ctx'*ce
g,;e

t            _| | h                     ^                        ~~~~^e

   atestcases/testcases.h95d: | e106stestcases/testcases.hr:t(15:as:95tt :irerror: 22cuincomplete definition of type 'struct _aarch64_ctx': c
 itnote: n testcases/testcases.hforward declaration of 'struct _aarch64_ctx'l_:
ia105n  a:er106 37c | sh:t        6 r   4        uerror: 95_co | incomplete definition of type 'struct _aarch64_ctx'ctfs
t tfx_as at *ia+hc=re  aih  dne,l105 ai | und        ie-n  t>s 3ts2 ri_u tz c ce tmh ; 6a_
4hag      _aie| crca                        ~~~~^tc,d
xh
-6       >4| *m_                     ^gatestcases/testcases.hc
eg:tti95x_c h:* e22g!ae:=dt  e_note: mrhforward declaration of 'struct _aarch64_ctx'e(aa
sgdtiercru (c&st&t  r_huae   caat95r dc | _h-sa6>a4tmr_aacchttg6xii4 cc_*c) ht iex{n a
*dl      h,i| e testcases/testcases.h                                       ~~~~^un
a:ied107n ,:ts 103testcases/testcases.hu:t2i: r_error: 95nt:tuincomplete definition of type 'struct _aarch64_ctx' 223
m:c2a t_gnote:  ti _cforward declaration of 'struct _aarch64_ctx'  ma,
107a
a | g      r        | ic                             ^hhc
6e,4a
_d      c |    t=                     ^95x 
 | G Es*Ttg_aReEttSi_Vch_N eEiaXndTl_eHirEn(AeDs (thsretaurdcu)tc;testcases/testcases.ht 
:       _109| _a:                       ^~~~~~~~~~~~~~~~~~~~~~~~a10a
:ar rcerror: testcases/testcases.hchincomplete definition of type 'struct _aarch64_ctx':h685
:64434_:_ ctestcases/testcases.hnote: c  t:expanded from macro 'GET_RESV_NEXT_HEAD't109107
x | x:         10 i:**f gherror:     eeincomplete definition of type 'struct _aarch64_ctx'85(ta
 | h_        edh(a,eds at-rd>  uuem107cira | t(         ng        s_hittaecar3 aru=2dc=c_ h tt6=m4  a _G_gcEmiatTcaax_)g R r*E{ci)S
h(V      c6(_| 4N            ~~~~^,_Ec
X
chT      t_a| xHrtestcases/testcases.h                     ^ : 
**95h):e(22ah:d) ,E note:  A+forward declaration of 'struct _aarch64_ctx'uD 
i((nhh)te-a3>d2s   )_i95;tz | 
 es      m)t| a
a                       ^~~~~~~~~~~~~~~~~~~~~~~~g      t
i| ic                                              ~~~^c,
 testcases/testcases.h
i      :n| 85ltestcases/testcases.h                     ^:i:
43n95:e:  22snote: :t expanded from macro 'GET_RESV_NEXT_HEAD'rnote: 
uforward declaration of 'struct _aarch64_ctx'c
t _a   a85rtestcases/testcases.hc | :   h        106956 | :4(s15_st:ct arterror: utxincomplete definition of type 'struct _aarch64_ctx'c i
t* ctestcases/testcases.hg_ e:atai107r_n:  chl10106ehi:a6 | nd 4e        e_error:  r        csincomplete definition of type 'struct _aarch64_ctx'to(tx
fs rft*usr)c u(+tc(=tc   h_h  _aae107araa | a rd        *rc)-        c(h>hhh6s6e)4i a4_z+d_ ce c(t;=thx
x)        - *G| >*g                        ~~~~^sEh
eTa_dR,E testcases/testcases.hSeiu:Vtiz95_n_e:tN)h322
EXT      _|                                               ~~~^
2:He_ Etestcases/testcases.htnote: A: aforward declaration of 'struct _aarch64_ctx'D95md:
(ae22hgr:ei( acsnote: d,tforward declaration of 'struct _aarch64_ctx')
r
;u
c         t| 95                        ^~~~~~~~~~~~~~~~~~~~~~~~ | _      
sa| t                        ^aa95
rttestcases/testcases.h | ci:shct6In file included from a485 ttestcases/testcases.c_i:i:cn43ct7:l x:
 i itestcases/testcases.hnote: *nn:expanded from macro 'GET_RESV_NEXT_HEAD'hel
ei ansdet,r us 28ct101 | t   r: 85        u25_ | c:sa        t ia( error: zsr_invalid application of 'sizeof' to an incomplete type 'struct _aarch64_ctx'tcea
hroaufrcc(ths6 t4r__uc6ac  t4at101x_r  |  cc_        *htaig6xaef4 rt _*c_(cghh!et6ehtx4a_e _dha*eced)rta ((dx|s(e)|tcr
r h(      uras| cert        ^     ~~~~~~~~~~~~~~~~~~~~~ts r
 vu*__c)ast(az hr _)c< ah +au6Hr 4Dc(_Rhhtestcases/testcases.hc_6):St495-Zx_:>) c22
st:*      xi h|  znote: e                               ^~~~~~*eforward declaration of 'struct _aarch64_ctx'a
h)
de
,      a | testcases/testcases.hud                                              ~~~^:i,   
n28 95tu3 | i2sntestcases/testcases.h_tt::ta3952 t2:m:i_22a ct:gnote:    iexpanded from macro 'HDR_SZ'imnote: cniaforward declaration of 'struct _aarch64_ctx',lg


iin      nc| t,e                     ^3

       2   s| _28                     ^tt | 
   r         95usm | icaszttgea oit_fic(ac,sa t
ir      run| ccl                     ^thi
 n6_e4a _ascrttcrxhu 6c*4tg_ ec_tt_axha)e
ra      cd| hetestcases/testcases.h        ^     ~~~~~~~~~~~~~~~~~~~~~6r4
:(_109sc:tt10rx:u  c*testcases/testcases.herror: tg :incomplete definition of type 'struct _aarch64_ctx'testcases/testcases.he_95
:ta:129a22_:r:h7c e:hnote: a6 forward declaration of 'struct _aarch64_ctx'd  4error: 
e_109incomplete definition of type 'struct _aarch64_ctx'testcases/testcases.hr | c
        t(:ixs107f  :t*(10hrhe:eu  aa c129dd   error:  | ,testcases/testcases.h-95tincomplete definition of type 'struct _aarch64_ctx'         :> 
         | 109mu_s:taiat10gaan:aiir ttcc3il  error: h2 107incomplete definition of type 'struct _aarch64_ctx'c-6=
 | > 4_=        mi_t         c anmthm  agelgxiaai109dcgic ) |  ni*          c==ehi{ , 
fG 
      Ee      s0 | | Tat                     ^;_d

(R,            ~~~~^r       hE
ueu| Siac                ~~~~^dnV
t-t_testcases/testcases.h >3N:m_E2testcases/testcases.h95aaX_::aT95t22g:_ :ri22mHcc: aE  hnote: =note: gA6forward declaration of 'struct _aarch64_ctx'=forward declaration of 'struct _aarch64_ctx'iD
 
4c(m_,hacg
eti      xca|  )d*                     ^    g   )
{95e95;
 | t |       
s_|       ts            ~~~~^| th
                       ^~~~~~~~~~~~~~~~~~~~~~~~aae
tatiditestcases/testcases.htestcases/testcases.hcec: :r 95i85i(n::n43sl22:lt: iir note: nnnote: uexpanded from macro 'GET_RESV_NEXT_HEAD'eeforward declaration of 'struct _aarch64_ctx'
c 
 tss ttr_ur   ac85uat    | cr 95        t | (c testcases/testcases.hss_h_testcases/testcases.htat:aa6a:tra104r4109iur::cc1027_ch:ch6 :t6c 4 4iterror:  error: n__incomplete definition of type 'struct _aarch64_ctx'xc_linvalid application of 'sizeof' to an incomplete type 'struct _aarch64_ctx'
c ita
*xtna hxer*e g c  ase*h109ttdg | _  e6rht4ue_,        104h_  | icaueftdic        ae  wdr(nt(_hexshirtael(3at s2aedt_r -*tr(r) c(uum>ohc(cft6ct f4 mas_h_a_caagatr agai rxr*cc <ih)c,6*=ch4(  
_g6=r      hce4| e=)                     ^st t_ x
mv_ +ca_h*t gex(shahiz ed)c* ae-)hd-re >,( sa{ dsHi,
Dut      z Rr| eiuu_            ~~~~^)ncSi
t
t      Zn 3| t _2                                              ~~~^3&testcases/testcases.h2a&:__
95
att:        22| rmm:                                 ^~~~~~ca a
gnote: testcases/testcases.hhgiforward declaration of 'struct _aarch64_ctx'6:ic
testcases/testcases.h4c95,:_,:
28
c      22      :t| :| 2x testcases/testcases.h                     ^                     ^note: : :
forward declaration of 'struct _aarch64_ctx' 
104note: *
   :expanded from macro 'HDR_SZ'h2795
e: |  aserror: dtinvalid application of 'sizeof' to an incomplete type 'struct _aarch64_ctx',a   
    28t95u | i | i        cssn  t it104ai | z3tn        e2ilwo_hicftin testcases/testcases.h (lie:msen 130 tals:(rgt7uiri:occunf t,ecferror:  
s tincomplete definition of type 'struct _aarch64_ctx'       _s|  
<ta                     ^_=ra
a rur  acec130hrst6 | cv4         _h__        sc6tazta4a xi-r_)l c
c-H      ht>D| 6xR        ^     ~~~~~~~~~~~~~~~~~~~~~s_
4 Si_Zz* ctestcases/testcases.heg&: t&95=xe
:  t      220| _*:;                                 ^~~~~~h 
g
note: e      eforward declaration of 'struct _aarch64_ctx'a| testcases/testcases.ht
                ~~~~^:_d
28he:e2r:atestcases/testcases.h( :ds   note: 95e95expanded from macro 'HDR_SZ't:r | 
r22s(ut:sa ct   tnote: t28irforward declaration of 'struct _aarch64_ctx' |  cu
         c_stiain azl_eiraoncf   ae(95hr s | 6scstt4htrr_au6utccc4itttc_  x _c_ aiata*anrxhrcl chih*6n6h4e4e_ _accstetdtxxa,r )d u*
,g      uce | tit        ^     ~~~~~~~~~~~~~~~~~~~~~u _n
i_htnae3taa23drtestcases/testcases.h_2ec:rht_956( t:4s22 mt_:macr tunote: gaxforward declaration of 'struct _aarch64_ctx'cig 
tc*i g,c_e
a,ta      
_r         | h95c|                      ^ | eh                     ^
a6s
d4te_arct(tisxct  *rihuneclatid n,_e a uaisrntctrh3u62c4testcases/testcases.h_t_t :c _109tma:xaa10g r:i*c chherror: ,e6incomplete definition of type 'struct _aarch64_ctx'
a4
      d_| ,c                     ^ t
xu   i109*n | gt        e3it2f__ testcases/testcases.hht( he:mea129aaddg:-7>:m aerror: gieiincomplete definition of type 'struct _aarch64_ctx'ccr
 testcases/testcases.h,(=:s
=105t       :rm| 13ua                     ^:c  g
 it129error: c incomplete definition of type 'struct _aarch64_ctx') | _
 a        {a
              rt| ac            ~~~~^  i
h105l | 6-        4 >_testcases/testcases.h mtestcases/testcases.h: ca95:tg: 12922xi:: c7 * :note: h=forward declaration of 'struct _aarch64_ctx' e
 error: a0incomplete definition of type 'struct _aarch64_ctx' d;
 ,
        h|    e                ~~~~^95a
 | d  s-129t> | autestcases/testcases.hmt        i:ia        c95ngt :iai22tcin:3l l 2i!-note: _n=>forward declaration of 'struct _aarch64_ctx't m
 mamagagigeiic cc s,t =
r   &       u95&0|  | c ;                     ^tsh
 
te_      aaa| tai                ~~~~^drcc-
 h>i6mn4al_gictestcases/testcases.hnit:exc 95 )s*:t g22r{e:ut
 _c      note: ht| eforward declaration of 'struct _aarch64_ctx' a               ~~~~^
_d
aearrtestcases/testcases.h(c:testcases/testcases.hsh:105t956:r   :413u9522_:c: | c t sterror:  note: tx_incomplete definition of type 'struct _aarch64_ctx'aforward declaration of 'struct _aarch64_ctx' a

t*atestcases/testcases.hgirec:ct h129_ih6n:el4  a7i_105d   :cn | e95 ter         | error: x ( s incomplete definition of type 'struct _aarch64_ctx'ss t*
tt harre tuau icdc c,tt      129_ h_u | iaeai        naaanl        drtric-t3cnh>2ahe6_m6i 4ta4sl _g_tm-cicra>tctugmxx cai ! gt*=*ci gh ,c_ee
mat       aa_a=| drhg                     ^ ,eci
0 hac;u6d
 i4      en&_| r&t                ~~~~^c( 3
tsh2xte_ testcases/testcases.htra:* ud95mgc:-a22et>g: t mi__cnote: aah,forward declaration of 'struct _aarch64_ctx'gae

iar      cdc| )eh                     ^ r6
{(4
   s_      95t|  | c               ~~~~^srt
txua cttestcases/testcases.h*ti:h c95e :_i22aan:dal testcases/testcases.h,rinote: : ncforward declaration of 'struct _aarch64_ctx'130ehu
: 6i7s4n:t_t rcerror: u3incomplete definition of type 'struct _aarch64_ctx't2c
x_t     t95_*  | ahm  saea130rtag | cadih        t,6c        i 4,tcu_
 aicii      ntnlt| xl-                     ^ 3i>*
2ngs_eetit  z_mseha teg=arid uce,c0r
t;(      testcases/testcases.h s| 
:t_                     ^      r130a| u
:ac                ~~~~^7tr
: c h_error: 6aincomplete definition of type 'struct _aarch64_ctx'4atestcases/testcases.h
r_:cc95ht:  6x221304 | : _         c*testcases/testcases.h        tnote: g:txforward declaration of 'struct _aarch64_ctx'e105 a
t:*i_h37hle:In file included from a- edtestcases/testcases.ca>error: ,:dsincomplete definition of type 'struct _aarch64_ctx' e7
iur   :
zi(95etestcases/testcases.hn | s t:s=t1013 t:2r0a25_;ut:t
  ci        105ctm|  | error:   a                ~~~~^        invalid application of 'sizeof' to an incomplete type 'struct _aarch64_ctx'i_g
 
ina cl a, ir
testcases/testcases.h       nc: | eh95                     ^  6
:  hs422101et_ | :arc         dutinote: -cxf>forward declaration of 'struct _aarch64_ctx't  m
 *(a_hg!aiheacear a!dcd=, h    | 6m|95testcases/testcases.h4u a | :_irgs130ceni:tstt7cav3:x t_ 2 &serror: i_*z&incomplete definition of type 'struct _aarch64_ctx'cgt 
  e <hit men_Haal  Dhgdi130Rie-n | _ca>e        S,dtestcases/testcases.h         m
eZ:tsa      r)tg129a| (
ir:                           ^icus7| 
lc)t:                               ^~~~~~-rt 
 >u {error: cs
_tincomplete definition of type 'struct _aarch64_ctx'itestcases/testcases.h      a 
:z| a28e_                                       ~~~~^r: a
ca2=testcases/testcases.hrh: :c60   testcases/testcases.hh1054;note: :1296
:_954      expanded from macro 'HDR_SZ'37 | | 
c::        _ t                ~~~~^        22cerror: x
t:tincomplete definition of type 'struct _aarch64_ctx' a x   
i*note: 28 lg | *-forward declaration of 'struct _aarch64_ctx'ehtestcases/testcases.h        
e:>sat95mid_:a  zh,22ge105e :ioa | ufd c        i(enote:  nsr    tt(=forward declaration of 'struct _aarch64_ctx'953 rs 
 | 2 0tus_; rc
tt tu      a  | c mt                ~~~~^_tai 
a cg   ha_ 95eria | iaccatestcases/testcases.hnd,s:rlh
-95ti      >:ac6| nm22t4                     ^eh:a
i _ g6sccinote: 4t tcforward declaration of 'struct _aarch64_ctx'_rxi 
c)!nut=l
cx i      tn|  me         ^     ~~~~~~~~~~~~~~~~~~~~~a *_
gshaitecra   au r95dc&testcases/testcases.hc | t,&:hs 95 6 t:_h422uae_:aiaa ctndnote: irt-tforward declaration of 'struct _aarch64_ctx'ccx>3
 hm 2i6a*_ng4gtli_ ecicmt)nta ex_   g{  95h
is* |       cetgs| ,ar                                       ~~~~^e
tu
d      acte| t_tr                     ^testcases/testcases.h h(i:
_es95cat:a r22adiu:recn ctlnote: rh iforward declaration of 'struct _aarch64_ctx'(6_n
as4eat_ rrsccuthtrc6xu4t c_    *tc95_g t | ae_xsa tat*r_aahchretehcaia6dhcd,46 e 4_iur_nci(clntstitxtxn3  re2**u _gchstete tt amr__audhacge,taia  rdc_uce,ahira6
n(r4      tcs| _3ht                     ^c6r2
tu4_xc_t tc*  tmh_xaea gaa*ridgcc,eh t,6_u
4h      i_e| nca                     ^ttdtestcases/testcases.h3
xe:2 r_106*t(:h s15met:aa rdgerror: u,iincomplete definition of type 'struct _aarch64_ctx'c c
tu,
i       n_| t  a                     ^3106
a2 | _r        tc         ohfm6fa4sg_ ci+t=cx testcases/testcases.h,h :
e*130      a:h| d7e                     ^-:a
> dserror: ,iincomplete definition of type 'struct _aarch64_ctx' z
eu;i
n        t| 1303                        ~~~~^ | 2
        _        tta imtestcases/testcases.hla:-g95>:is22ci:z, e
note:        forward declaration of 'struct _aarch64_ctx'=| 
                      ^0
;
      |                 ~~~~^
testcases/testcases.h   :9595 | :s22t: anote: tforward declaration of 'struct _aarch64_ctx'testcases/testcases.hi
:c 104:testcases/testcases.hi27n::l106 :ierror: 15ninvalid application of 'sizeof' to an incomplete type 'struct _aarch64_ctx':e
     error: 95sincomplete definition of type 'struct _aarch64_ctx' | t
srtuactt  i 106c_ |  a        ia        rnocl  fhi104f6 | ns4        e _ w+cs=ht tirxhlue eca* td(g o-_e>atsa_irhczehea6;4d
_e      crf| t(                        ~~~~^xf
 s *<ge=testcases/testcases.hst :_t95rh:ree22sau:vdc _note: forward declaration of 'struct _aarch64_ctx'e
tsr z( _s-at arHurDccR   h_956S | 4Zs_ tct &ta_&xta
 ai      r*c| chh                                  ^~~~~~e6i
4an_dcl,tix testcases/testcases.h nu*:ehi28 en:sadt2t,3 r:u2u icnnote: _ttexpanded from macro 'HDR_SZ'3t 
2__ tam amaraggc   iih28c6,c | 
4,              _
| sc                     ^      i
t| zx                     ^e 
o*fg(estt_rhuecatd e_ra(asrtcrhu6c4t_ c_taxa)r
      c| h        ^     ~~~~~~~~~~~~~~~~~~~~~6
4_ctx *testcases/testcases.hh:e95a:testcases/testcases.cd22::, 9 note: :uforward declaration of 'struct _aarch64_ctx'36i
:n ttestcases/testcases.c3warning: :29declaration of 'struct extra_context' will not be visible outside of this function [-Wvisibility]_:
t36    :95m  | awarning: gsdeclaration of 'struct extra_context' will not be visible outside of this function [-Wvisibility]testcases/testcases.htia:
ct107,i:    
10c9      :  | |  ierror:                      ^bnincomplete definition of type 'struct _aarch64_ctx'
ol
oi    ln9 e | v basoltotestcases/testcases.cir  l:du107 a9c | v:tt36 ae:        _l_testcases/testcases.c         eahi:warning: aexd9declaration of 'struct extra_context' will not be visible outside of this function [-Wvisibility]tara:r
cdt36ahe _:6_c =4oewarning:  _nxdeclaration of 'struct extra_context' will not be visible outside of this function [-Wvisibility]cGtt
teErx    xTa 9t__ | *(RbcsgoEoteoSrntl    utV_ c9e_thv | x NaebetElaxo(XidtsTodert_laarrH t(_uEvesccAto_aDtrnel( utxiheectdexxtratat a dt_r*_)aeeaca;_testcases/testcases.hx_ort
c:er      n107a| tco:                       ^~~~~~~~~~~~~~~~~~~~~~~~xenh,10
tx:t6 rte 4c(axtestcases/testcases.herror: h_s_t:aincomplete definition of type 'struct _aarch64_ctx'ctc 85rt
ro*:x une43 *ct:**xteeh t renote: rxeraexpanded from macro 'GET_RESV_NEXT_HEAD'a  xtd,
107t(,
, | rs                actu|         h_ri                                   ^hacun
e   rocta85 nt3d | *t 2 *        ee_=e(xxt srtG trtm E,ra*rT
g_uea      RicxE_| ctStc                                   ^ ,o
V
nr__      taaN| ea,E                     ^xr X
tccTh h_6*aH4Ere_Ac xDt*t(x*rh ea*er)a,(rd (),cc;
h
h      a      testcases/testcases.h| ar| : r                                   ^                       ^~~~~~~~~~~~~~~~~~~~~~~~105* 

:)*13(*:hetestcases/testcases.h )r:error:  r85+incomplete definition of type 'struct _aarch64_ctx',: 

43(      :h|  )                                   ^-note: 
>expanded from macro 'GET_RESV_NEXT_HEAD'  s
105i | z        e ) 
           | 85                                               ~~~^  | 
         h(esatestcases/testcases.htd:r-95u>:cm22ta: g _inote: acforward declaration of 'struct _aarch64_ctx'a 
r!c=h 6m4a_gcit   c95 x | & s&*t )ah(te(aicdch- a>irmna lg*ii)nc(e)h  )s{ t
+      r | u(               ~~~~^ch
t) -_>testcases/testcases.has:ai95rz:ce22h):6
       note: 4| forward declaration of 'struct _aarch64_ctx'_                                              ~~~^
c
tx *testcases/testcases.hg:e95t   :_2295h: | e asnote: dtforward declaration of 'struct _aarch64_ctx'ea
rt(isct riu   nc95lt | i sn_teaaa trisccth r6iu4nc_ltci tnx_e  a*shterauct _daa,ar rcuchih6n64t43__2cc_tttxx   m**agggeeitt_c_h,eh
ae      da| e                     ^dr
e(rs(trsutcrtu c_ta a_racahr64c_hc6t4x_ c*thxe a*dh,testcases/testcases.he au:id109n,:t 103u2i_ntt 3m2ag_itc ,m
a      g| i                     ^c
,
:       |                      ^error: 
incomplete definition of type 'struct _aarch64_ctx'testcases/testcases.c
:18:34:   109error:  | incomplete definition of type 'struct extra_context'        
itestcases/testcases.hf :(105h:e37a:   d 18-error:  | >incomplete definition of type 'struct _aarch64_ctx'        m
taegrimc  == =G mtestcases/testcases.ca  g:105testcases/testcases.ci18 | :c:        34)18 :  :  {34Eerror:  
:incomplete definition of type 'struct extra_context'T        
 _| error:  R            ~~~~^incomplete definition of type 'struct extra_context'hEtestcases/testcases.h

eS:aV109d_:testcases/testcases.c-Ntestcases/testcases.h10>:   E:18m   18X::95a18 | T34 |  :        _:        error: g22Ht tincomplete definition of type 'struct _aarch64_ctx'iEeeerror: :
rc Arincomplete definition of type 'struct extra_context' mnote: D
m! forward declaration of 'struct _aarch64_ctx'( ==
&=    e mG109xGEa | tETg           _rTi18icR |     fa_E        &95 -RSt | (&EVe>s hSht_heVeaNea_atEadNdridX-)c-Em>T ;>X m_iT
mH=a_      anE gH| lAgGiE                                   ~~~~~^iEiADccDn(T (
&)=e_&e = Rx{e Estx
mSrtt      Vaarrtestcases/testcases.c| g_-ua:                                       ~~~~^iN>c9-
cEht:>)Xe36ha T:edtestcases/testcases.h{_ a):H
note: d;95forward declaration of 'struct extra_context')E      
;:22: note:  
A| forward declaration of 'struct _aarch64_ctx'_
            ~~~~^            a
| 
a                                   ~~~~~^r
ch    testcases/testcases.h69: | 495b   _:testcases/testcases.coc2295:ot: | 9lx s:  tnote: 36*avforward declaration of 'struct _aarch64_ctx':gta
 eilnote: tciforward declaration of 'struct extra_context' _d
ihan   tltestcases/testcases.c95ei_: | ne9exs: te    t36sar9ata | :dr_ tebuwarning: crocdeclaration of 'struct extra_context' will not be visible outside of this function [-Wvisibility]oot
(nl s_ ttaveiaraxcru tlcci(ihtn6sd l    4ta_i9_rta | nacuebertcoc xtoh sl 6*et 4gxrve__tuacterclt_axxthi_te d cra*_aoadhatnee_aertcr(_eoscexnthxttr6te ur4x*ca_tet_c(x ctst_oxtarn raat*ure,cgcx thet 6ct(4eh_s_xahtctretrr xaua* cd_**teche roere(anxdtsrte,tr,x ra
tuu_       iccn*| tote                                   ^ 3nx
2_tt_eartxaa ,trm  acc*ghheiac6xr, t4
*r_      *ac| e,tr                     ^r x
, c
*h      ha| e                                   ^r
a testcases/testcases.cd*:,*18: e34ur:ir error: n,incomplete definition of type 'struct extra_context't

      3| 2                                   ^_
t   testcases/testcases.h 18:m | 106atestcases/testcases.c        :g:t15i18e:c: r,error: 34
mincomplete definition of type 'struct _aarch64_ctx'      : | 
 =                     ^error:  
incomplete definition of type 'struct extra_context'G
E  T106_ | R        E        SoV   f_18faN | sE         X+tT=ed _r,hHm eE auA=diD -n(>GtsE&3iTe2z_x_eR;ttE
r       Sma| | Va                        ~~~~^-_                                   ~~~~~^
g>N
ihEceX,testcases/testcases.hTa
:_      d95H| ):E                     ^22;A
:
D       (note: | &forward declaration of 'struct _aarch64_ctx'                                   ~~~~~^e

xtra->testcases/testcases.ch:   e995a: | d36s):t; a
note: t      forward declaration of 'struct extra_context'itestcases/testcases.c| 
c:                                   ~~~~~^9 
:i36n: ltestcases/testcases.cnote:     :iforward declaration of 'struct extra_context'99n
 | :eb 36so:t or    note: ul9forward declaration of 'struct extra_context'c |  t
bv oa_olalia dvaratcl    ehi9_6d | ea4btx_eotc_ortelxxa t _*rvcagao_elctnio_tndheteaxeatxtdte(e(_srset(txrsrtuutrccrtatu _c etcex oxt_ntartaraer_axcc_thoc(6nos4ttne_xtrcteut cx*xtestcases/testcases.htte  :x *te129h*rx:eaet7a,xrd :t,c ah r_error: aucaincomplete definition of type 'struct _aarch64_ctx'rio,
 nn *tt*3cee2hrx_  rat129,tr  | 
  *              m*e|         a                                   ^x*t
gteairircal,r,-
, >      
c| mh                           ^aa| 
gr                                   ^i 
c* *=e r0r;,

            | |                 ~~~~^testcases/testcases.c                                   ^
:
18:34testcases/testcases.h:: 95error: :incomplete definition of type 'struct extra_context'22
: note: forward declaration of 'struct _aarch64_ctx'
   18 |         t   testcases/testcases.ctestcases/testcases.c95e: | r:19sm19: t:=a19 t19:Gi: Ec error: T _incomplete definition of type 'struct _aarch64_ctx'error: iR
incomplete definition of type 'struct _aarch64_ctx'nE
SlV_iNntestcases/testcases.cEe   testcases/testcases.hX    19T::s19_ | 107t18 |         H:r:        E10i34ui:A:fc   fDterror: error: ( ( incomplete definition of type 'struct _aarch64_ctx'incomplete definition of type 'struct extra_context'(&
_!
e!atxtatererrcrahm-m6  >  4107h||_ | e||c   a          testcases/testcases.htd        18tx):hte |  ;129eer        
:*armt      7dgm-e:|  e>r                                    ~~~~~^t-merror: 
=m>_ incomplete definition of type 'struct _aarch64_ctx' amh=
Ggae EigaGTcitestcases/testcases.cd_E :ceTR|9   r_E|:129|(RS  | 36sEtV|        :teS_          rrVtnote: Nu_eforward declaration of 'struct extra_context'tEmcrN
aX-tEm>iTX -sl_T_-Hi>_>EzHsmaAeEaiD    a)Ag(z9 rD | e{hcib(
e)hco       & ao6| {dle=
) 4                      ~~~~^x_v0
      ;cta;| 
trl
                     ~~~~^      axi      
-testcases/testcases.hd | | :>a                       ^~~~~~~~~~~~~~~~~~~~~~~~*95                ~~~~^
testcases/testcases.hhth
::eee22_95atestcases/testcases.ha:e::x 22d85tdtestcases/testcases.h:note: r)::,a forward declaration of 'struct _aarch64_ctx' _;note: 
95c43
uforward declaration of 'struct _aarch64_ctx':o:      i
22n | n:note: t                                   ~~~~~^t expanded from macro 'GET_RESV_NEXT_HEAD'e
3note: 
x   2forward declaration of 'struct _aarch64_ctx't95_   
(t | 95s s | ttestcases/testcases.cmtrsa   uat:c85gtat9 | it :        icei36(   xc,c:st95  
 tr | inote: ria      forward declaration of 'struct extra_context's_nn
ut| lcal                     ^citoi
tinn cee_     a9  ia | ssnrbttolcorrinuuhnlt6cce 4ett _x  sct__tttestcases/testcases.h aax:r*a a130uer*:rcxvc)7ctt(h:a hr(6l 6ac_i4error: 4,hd_incomplete definition of type 'struct _aarch64_ctx'aaac 
ratt_ cre*ch_ct)eahx(  xr6 h130t *)4x* |  rg_+ ec*         at*t(e        __gxrhthec r)aeto*,-ia_g
nl>dhe      -teest| >erai_                                   ^xsd
z(hiteeesz()rate
d(sr es      tur=| tc(r                                               ~~~^srtu
t0u cr;_cut
cat       ta  etestcases/testcases.h| r__x                ~~~~^:aact
95aahr:ra22cr6_:hc4ctestcases/testcases.h6 ho:note: _46n95forward declaration of 'struct _aarch64_ctx'_c4t:t
ec22x_tx:c xt t* note:  *hxforward declaration of 'struct _aarch64_ctx'*testcases/testcases.che 
e:ea*x19at   dh:rd95,ea19, | ,a : s du tucierror: ,hanincomplete definition of type 'struct _aarch64_ctx'   itat 
95nir3u | tc 2i3s *_2nit*_ttnaet   l 3tr 19im2ir | nm_c,        eta 
ia  gif      gsim|  tncai(                                   ^,rgc
!
lu,ti      ic
ect|       rn,                     ^ 
_
ae      am | r s                     ^c|t
hr|6 u4tc_fatal error: tectoo many errors emitted, stopping now [-ferror-limit=] rt
_mxa- afatal error: >r*too many errors emitted, stopping now [-ferror-limit=]mc
gahtestcases/testcases.ceg6:ti418_c:_h 34ec|:a|t d xerror: te incomplete definition of type 'struct extra_context're*(r
sgmte-rt>u_shcietza    ed_18)ea |  ra        {rt
ce      hr| 6m                     ~~~~^4 
_=c( tsxGt Ertestcases/testcases.h*Tu:h_c95eRt:aE 22dS_:,Va  _anote: uNforward declaration of 'struct _aarch64_ctx'riE
ncXthT3_62H_4tE_ AcmDta(   gx&95i e | c*xs,ht
tera      aat| d-i                     ^c,>
  hieunaildni)tn;3e
2       _s| tt                                   ~~~~~^r 
umcatg i_ctestcases/testcases.ca,:a
9r      :c| 36h                     ^:6
 4note: _forward declaration of 'struct extra_context'ct
x *testcases/testcases.hg:e    109t9_: | 10hb:eoa oderror: leincomplete definition of type 'struct _aarch64_ctx' rv
(aslitdr  ua109ct | te         _i_eafxat rr(ach_hec6ao4dn_t-ce>txmtxa( gs*ithcre uac=dt= , em xautigrnai_tcc3)o2 n_{tte
 x      mt| a             ~~~~^*g
eixct,rtestcases/testcases.h
a:      ,95|  :                     ^c22
h:a r note: *forward declaration of 'struct _aarch64_ctx'*
err,
      fatal error: | too many errors emitted, stopping now [-ferror-limit=]                                   ^   

95 | static inlinetestcases/testcases.c :s9t:r36u:c twarning:  declaration of 'struct extra_context' will not be visible outside of this function [-Wvisibility]_
aarctestcases/testcases.ch:6194:    _199c: | t bxerror: o incomplete definition of type 'struct _aarch64_ctx'o*g
le tv_alhiedaa   dt19eer | _(        esixtftr ru(ac!t_t ce_oaranmrt ce|hx|6t4 _(tcsettrxrm u-*c>htmea agedix,t cur ia|n_|tc 3o2t_netrt mem-ax>gtsi ic*z,ee
x)      t|  r                     ^{
a
,       | c                     ~~~~^
har *testcases/testcases.h*:e95r:r22,:
       note: | forward declaration of 'struct _aarch64_ctx'                                   ^

   95 | static inline struct _aarch64_ctx *get_header(struct _aarch64_ctx *head, uint32_t magic,
      |                      ^
fatal error: too many errors emitted, stopping now [-ferror-limit=]
testcases/testcases.h:129:7: error: incomplete definition of type 'struct _aarch64_ctx'
  129 |                 tail->magic = 0;
      |                 ~~~~^
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_ctx'
testcases/testcases.c:18   :3495: |  serror: tincomplete definition of type 'struct extra_context'a
tic inl   i18 | n        et esrmt r=u cGtE T__aRaESrVc_hN6E4X_Tc_tHxE AD*(g&eetx_threaa->dheera(ds)tr;u
      c| t                                   ~~~~~^ 
_aarctestcases/testcases.ch:694:_36c:t xnote:  forward declaration of 'struct extra_context'*
head, ui    n9t | 3b2_oto lm Davg(ai&lcei,xd
      ta| rt                     ^ae
-_>ehxetarda)_;c
o      n| t                                   ~~~~~^e
xt(structestcases/testcases.h:130:testcases/testcases.c7:t:9  :eerror: x36incomplete definition of type 'struct _aarch64_ctx't:
r anote: _forward declaration of 'struct extra_context'  c
130o | nt        e        xtta i*    le9-x | >tbsroiaoz,le   =vc ah0la;ir
d       a| *                ~~~~^t*
ee_rerx,testcases/testcases.ht
:r      95a| :_22                                   ^c:
o note: nforward declaration of 'struct _aarch64_ctx'te
xt(struct    95e | xtsrtaa_tciocn ttestcases/testcases.cie:nxl18ti:n 34e*: e sxerror: ttincomplete definition of type 'struct extra_context'rr
uac,t c h_aara    r*18c* | h6e        4rt_rec,rt
mx        | =*                                   ^ g
GeEtT__hReEaSdVe_NrE(XsTt_rHuEcAtD( &_eaxatrrcahtestcases/testcases.c-6:>418h_:ce34ta:xd  )*error: h;incomplete definition of type 'struct extra_context'e

a      d| ,                                   ~~~~~^
 ui   n18testcases/testcases.ct | :39        2:t_t36e :rm manote:  gforward declaration of 'struct extra_context'=i
 cG,E
T      _| R                     ^ES    
V9_ | NbEoXoTl_ HvEaAlDi(d&aetxter_ae-x>threaa_dc)o;n
      t| | e                     ^                                   ~~~~~^x

t(strtestcases/testcases.cu:c9t: 36e:x tnote: rforward declaration of 'struct extra_context'a
_contex    t9  | *beoxotltestcases/testcases.cr a:v9,a: l36ci:h dwarning: aadeclaration of 'struct extra_context' will not be visible outside of this function [-Wvisibility]rt
 etestcases/testcases.h*_:*e130ex:r7t:rr ,    aerror: 
_9incomplete definition of type 'struct _aarch64_ctx'      c | 
| ob                                   ^on
otle x  vt130(a | sl        ti        rdtuacatti ele_-xe>txsrtiazr_eca o_=n ct0oe;xn
t      t | e*                ~~~~^xe
txtestcases/testcases.c(t:sr19tar:testcases/testcases.h,u:19c 95:t:c 22 herror: :ea incomplete definition of type 'struct _aarch64_ctx'xnote: r
tforward declaration of 'struct _aarch64_ctx' r
*a*e_rcro,   n   
19t95      e |  | | xs                                           ^tti
 aft* ie(cx! ttirenarlmi, n |ec|  hstaterrru mc*-t*> em_raagrai,rc
c       h|| 6|                                   ^4 _t
testcases/testcases.ccet:rx19m :*-g19>e:st i_error: zheeincomplete definition of type 'struct _aarch64_ctx'a)
d e{r
(      s| t                     ~~~~^r
   u19c | t         i_testcases/testcases.hfaa :r(95c!:h226t4:e_ rnote: m forward declaration of 'struct _aarch64_ctx'|
| term->cm   a95g | isc t|a|t itce rmi-n>lsiinzee)  st{tx
r       u*| hc                     ~~~~^et
a d_,a uatestcases/testcases.hir:nc95t3:h2226_:4t  _note: mcforward declaration of 'struct _aarch64_ctx'a
tgixc ,*
g      e| t                     ^_
h   e95a | dsteart(isct riunclti n_ea asrtcrhu6c4t_ c_tx *heada,a ruchi6n4t_3c2t_xt  *mgaegti_ch,e
a      d| e                     ^r
(struct _aarfatal error: ctoo many errors emitted, stopping now [-ferror-limit=]h
64testcases/testcases.c_c:t9x: 36*:h ewarning: adeclaration of 'struct extra_context' will not be visible outside of this function [-Wvisibility]d
, uint32    _9t |  bmoaogli cv,a
l      i| d                     ^a
te_extra_fatal error: cotoo many errors emitted, stopping now [-ferror-limit=]n
text(struct extestcases/testcases.ct:ra18_:c34o:n terror: eincomplete definition of type 'struct extra_context'xt
 *extra, c   ha18r |          *t*erm = eGrrE,T
_      R| E                                   ^S
V_NEXT_HEAD(&extra->head);
      |                                    ~~~~~^
testcases/testcases.c:9:36: note: forward declaration of 'struct extra_context'
    9 | bool validate_extra_context(struct extra_context *extra, char **err,
      |                                    ^
testcases/testcases.c:18:34: error: incomplete definition of type 'struct extra_context'
   18 |         term = GET_RESV_NEXT_HEAD(&extra->head);
      |                                    ~~~~~^
testcases/testcases.c:18testcases/testcases.c:34::9 :error: 36incomplete definition of type 'struct extra_context':
 note: forward declaration of 'struct extra_context'
   18 |             9t | erbmo o=l  GvEaTl_iREdSaVt_eN_EeXxTt_rHEaA_Dc(&oenxtetxrta(-s>threuacd)t; 
e      | x                                   ~~~~~^t
ra_contestcases/testcases.ct:9e:x36t:  *note: eforward declaration of 'struct extra_context'x
tra,     c9h | baoro l* *vearlri,d
a      t| e                                   ^_e
xtra_context(struct extra_contestcases/testcases.ct:e19x:t19 :* eerror: xincomplete definition of type 'struct _aarch64_ctx't
ra, cha   r19  | *        *iefr r(,!
      t| e                                   ^r
m || term->magic || tetestcases/testcases.cr:m18-:>34s:i zerror: eincomplete definition of type 'struct extra_context')
 {
      |                      ~~~~^   
18 |         tertestcases/testcases.hm: 95=: 22G:E Tnote: _Rforward declaration of 'struct _aarch64_ctx'E
SV_NEXT_   95 | static Hinline struct _aarch64_ctx *get_header(struct _aarch64_ctx *EhAeaDd(,&e xutirnat-3>2h_eta dm)a;gi
c      | ,                                   ~~~~~^

      |                      ^
testcases/testcases.c:9:36fatal error: :too many errors emitted, stopping now [-ferror-limit=] 
note: forward declaration of 'struct extra_context'
    9 | bool validate_extra_context(struct extra_context *extra, char **err,
      |                                    ^
testcases/testcases.c:19:19: error: incomplete definition of type 'struct _aarch64_ctx'
   19 |         if (!term || term->magic || term->size) {
      |                      ~~~~^
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_ctx'
   95 | static inline struct _aarch64_ctx *get_header(struct _aarch64_ctx *head, uint32_t magic,
      |                      ^
fatal error: too many errors emitted, stopping now [-ferror-limit=]
1 warning and 20 errors generated.
1 warning and 20 errors generated.
1 warning and 20 errors generated.
1 warning and 20 errors generated.
1 warning and 20 errors generated.
1 warning and 20 errors generated.
1 warning and 20 errors generated.
1 warning and 20 errors generated.
signals.Ssignals.Ssignals.S::1616::1919signals.S: : ::error: error: 1616expected ']' in brackets expressionexpected ']' in brackets expression:

19:: 19error: : expected ']' in brackets expression stp x29, x30, [sp, #-16]!error: 
 stp x29, x30, [sp, #-16]!
expected ']' in brackets expression
 
     stp x29, x30, [sp, #-16]!  
   stp x29, x30, [sp, #-16]!   
                                                 ^  
^  
      ^ 
^
signals.S:16:19: error: expected ']' in brackets expression
 stp x29, x30, [sp, #-16]!
                  ^
signals.S:16:19: error: expected ']' in brackets expression
 stp x29, x30, [sp, #-16]!
                  ^
signals.S:16:19: error: expected ']' in brackets expression
 stp x29, x30, [sp, #-16]!
                  ^
signals.S:16:19: error: expected ']' in brackets expression
 stp x29, x30, [sp, #-16]!
                  ^
signals.Ssignals.Ssignals.Ssignals.S::17:172:: ::17error: 2:17unknown use of instruction mnemonic without a size suffix: 2
:: error:  mov x29, sperror: unknown use of instruction mnemonic without a size suffixsignals.S
unknown use of instruction mnemonic without a size suffix
 
:^
 mov x29, sp mov x29, sp17

:  2^: 
error: unknown use of instruction mnemonic without a size suffix
 mov x29, sp
 ^
2: error: unknown use of instruction mnemonic without a size suffix
 mov x29, sp
 ^
signals.S^signals.S::
1919::22: : signals.Serror: error: :unknown use of instruction mnemonic without a size suffixunknown use of instruction mnemonic without a size suffix19

:2 mov x20, x0 mov x20, x0: 

error:  unknown use of instruction mnemonic without a size suffix 
^^ mov x20, x0


 ^
signals.S:19signals.S:signals.S::2signals.S20signals.S20: ::::error: 219202: unknown use of instruction mnemonic without a size suffix::: error: 
22unknown use of instruction mnemonic without a size suffixerror: :  mov x20, x0: 
unknown use of instruction mnemonic without a size suffixerror: 
error:  mov x21, x1
unknown use of instruction mnemonic without a size suffix unknown use of instruction mnemonic without a size suffix
 mov x21, x1
 ^

^
 mov x21, x1
  mov x20, x0
^
 
 ^^

signals.S:21:2: signals.Serror: :unknown use of instruction mnemonic without a size suffixsignals.S20
: mov x22, x2signals.S:21
signals.S:2 :^:2: 
21: 20error: :error: :unknown use of instruction mnemonic without a size suffix2unknown use of instruction mnemonic without a size suffix2
: 
:  mov x21, x1error:  mov x22, x2error: 
unknown use of instruction mnemonic without a size suffix
unknown use of instruction mnemonic without a size suffix 
 
^ mov x22, x2^ mov x21, x1



  ^^

signals.S:signals.S21::212:: 2error: : unknown use of instruction mnemonic without a size suffixerror: 
unknown use of instruction mnemonic without a size suffix mov x22, x2

 mov x22, x2 
^
 ^
signals.S:24:2: error: unknown use of instruction mnemonic without a size suffix
 add x0, x21, x22
 ^
signals.S:25:14: error: unknown token in expression
 add x0, x0, #15signals.S
: 24 : 2 :  error:  unknown use of instruction mnemonic without a size suffix 
   add x0, x21, x22 
   ^ 
^
signals.Ssignals.S::2625::1414: : error: error: unknown token in expressionunknown token in expression

 bic x0, x0, #15 add x0, x0, #15

                          ^^

signals.S:26:14: error: unknown token in expression
 bic x0, x0, #15
            signals.S :^27
:2: error: unknown use of instruction mnemonic without a size suffix
 sub sp, sp, x0
 ^
signals.S:28:signals.S2:: 27error: :unknown use of instruction mnemonic without a size suffix2
:  add x23, sp, x22error: 
unknown use of instruction mnemonic without a size suffix 
^ sub sp, sp, x0

 ^signals.S
:30:10: error: unknown token in expressionsignals.S
: ldr x0, =call_fmt28
: 2 :  error:  unknown use of instruction mnemonic without a size suffix 
  add x23, sp, x22 
   ^^

signals.S:30:signals.S10:: 31error: :unknown token in expression2
:  ldr x0, =call_fmterror: 
unknown use of instruction mnemonic without a size suffix 
  mov x1, x21 
   ^ 
   ^
signals.S:32:2: signals.Serror: :unknown use of instruction mnemonic without a size suffix31
: mov x2, x232
:  error: ^unknown use of instruction mnemonic without a size suffix

 mov x1, x21
 ^
signals.S:33signals.S::232: :error: 2invalid instruction mnemonic 'bl': 
error:  bl printfunknown use of instruction mnemonic without a size suffix

  mov x2, x23^
~ 
^
signals.S:36signals.S::233: :error: 2unknown use of instruction mnemonic without a size suffix: 
error:  mov x0, x23invalid instruction mnemonic 'bl'

  bl printf^

 ^~
signals.S:37:signals.S2:: 36error: :unknown use of instruction mnemonic without a size suffix2
:  mov x1, x20error: 
unknown use of instruction mnemonic without a size suffix 
^ mov x0, x23

 ^
signals.S:38:2signals.S: :error: 37unknown use of instruction mnemonic without a size suffix:
2 mov x2, x21: 
error:  unknown use of instruction mnemonic without a size suffix^

 mov x1, x20
 ^
signals.Ssignals.S::3938::22: : error: error: invalid instruction mnemonic 'bl'unknown use of instruction mnemonic without a size suffix

 bl memcpy mov x2, x21

  ^^~

signals.S:signals.S51::392:: 2error: : invalid instruction mnemonic 'ldr'error: 
invalid instruction mnemonic 'bl' ldr x0, current

 bl memcpy 
^ ~^~~

signals.Ssignals.S::5251::22: : error: error: unknown use of instruction mnemonic without a size suffixinvalid instruction mnemonic 'ldr'

 str x23, [x0] ldr x0, current

  ^^
~~
signals.S:54signals.S::252: :error: 2unknown use of instruction mnemonic without a size suffix: 
error:  mov sp, x23unknown use of instruction mnemonic without a size suffix

  str x23, [x0]^

 ^signals.S
:56:10: signals.Serror: :unknown token in expression54
: mov x8, #152
:  error:  unknown use of instruction mnemonic without a size suffix 
  mov sp, x23 
   ^ 
 ^signals.S
:56:10signals.S: :error: 57unknown token in expression:
2 mov x8, #15: 
error:  invalid instruction mnemonic 'svc' 
  svc #0 
   ^ ~ ~ 
^
signals.S:64:2signals.S: :error: 57invalid instruction mnemonic 'b':
2 b .: 
error:  invalid instruction mnemonic 'svc'^

 svc #0
 ^~~
signals.S:64:2: error: invalid instruction mnemonic 'b'
 b .
 ^
signals.S:signals.S24::2: 24error: :unknown use of instruction mnemonic without a size suffix2
:  add x0, x21, x22error: 
 unknown use of instruction mnemonic without a size suffix^

 add x0, x21, x22
 ^
signals.Ssignals.S:25::1714:: 2error: : unknown token in expressionsignals.Serror: 
:unknown use of instruction mnemonic without a size suffix add x0, x0, #1525

:  mov x29, sp 14
 :   ^ error: 
 unknown token in expression  
  add x0, x0, #15  
    ^
  signals.S : 26 :14 :  error:  unknown token in expressionsignals.S 
:  bic x0, x0, #1519 
:^2 :  
error: unknown use of instruction mnemonic without a size suffix
 mov x20, x0
 ^
signals.S:26:signals.S14:: 20:error:  2unknown token in expression : 
error:  unknown use of instruction mnemonic without a size suffix bic x0, x0, #15 
 
 mov x21, x1  
    ^  
    ^ 
signals.S :21 : 2 : error:  unknown use of instruction mnemonic without a size suffix 
  mov x22, x2
^ 
^signals.S:27:2: error: unknown use of instruction mnemonic without a size suffix
 sub sp, sp, x0
 ^
signals.S:28:2: error: unknown use of instruction mnemonic without a size suffix
 add x23, sp, x22signals.S
 :^17
:2: signals.Serror: :unknown use of instruction mnemonic without a size suffix30
:signals.S10 mov x29, sp: signals.S:
error:  :unknown token in expression27^
24:
 ldr x0, =call_fmt:2
2:  : error:  error:  unknown use of instruction mnemonic without a size suffixunknown use of instruction mnemonic without a size suffix 

   sub sp, sp, x0 add x0, x21, x22 


    ^^^


signals.S:19signals.S::225signals.S: :signals.S:error: 14:31unknown use of instruction mnemonic without a size suffix: :24
error: 2 mov x20, x0unknown token in expression:: 

error: 2  add x0, x0, #15signals.S: unknown use of instruction mnemonic without a size suffix^
:

error:  28 mov x1, x21unknown use of instruction mnemonic without a size suffix 

:   add x0, x21, x22 ^2
 
:   ^error:  
unknown use of instruction mnemonic without a size suffix 
 signals.S  add x23, sp, x22signals.S: 
:20  25: :signals.S^2signals.S:
^14:: 32
: 17:error: error: :2unknown use of instruction mnemonic without a size suffixsignals.Sunknown token in expression2: 
:signals.S
: error:  mov x21, x1:30 add x0, x0, #15error: 
unknown use of instruction mnemonic without a size suffix26:
 unknown use of instruction mnemonic without a size suffix:10^
 
14
:   mov x2, x23:  mov x29, sp error: 
error: 
 unknown token in expression unknown token in expression  ^
 ^
 bic x0, x0, #15 

     signals.S  : 
  21  ldr x0, =call_fmt :^signals.S
 2
:  : 33  :error: signals.S  2unknown use of instruction mnemonic without a size suffix: : 
 26 error:  mov x22, x2 :invalid instruction mnemonic 'bl' 
14 
  : ^^ bl printferror:  


unknown token in expression 
signals.S^ 
: bic x0, x0, #15^19
~: 
2 :  error:  unknown use of instruction mnemonic without a size suffix signals.S 
 : mov x20, x0 31
 signals.S: signals.S 2: : : ^3624error:  
::unknown use of instruction mnemonic without a size suffix^2

2:  mov x1, x21: 
error: error:  signals.Sunknown use of instruction mnemonic without a size suffixunknown use of instruction mnemonic without a size suffix^:


27 mov x0, x23 add x0, x21, x22signals.S:

2:  : ^20^error: 
:
unknown use of instruction mnemonic without a size suffix2
:  sub sp, sp, x0error: 
unknown use of instruction mnemonic without a size suffix signals.S
signals.S^: mov x21, x1
32
: signals.S2^:: 
37error: :unknown use of instruction mnemonic without a size suffix2
::  mov x2, x2325signals.Serror: 
::unknown use of instruction mnemonic without a size suffix 2714
^:: 
 mov x1, x202
signals.S: signals.Serror:  :error: unknown token in expression:^28unknown use of instruction mnemonic without a size suffix

21:
 add x0, x0, #152: sub sp, sp, x0
2: 
 : error: signals.S  error: :unknown use of instruction mnemonic without a size suffix ^unknown use of instruction mnemonic without a size suffix33
 

: signals.S mov x22, x22 :
:  38 error:  :^ add x23, sp, x22 invalid instruction mnemonic 'bl'2
 

:   error:  bl printf ^unknown use of instruction mnemonic without a size suffix
 

 ^signals.S mov x2, x21^
:
~28
 :^signals.S2
:signals.S30: ::error: 1026unknown use of instruction mnemonic without a size suffix: :error: 
14unknown token in expression add x23, sp, x22: 
signals.S
error: :  ldr x0, =call_fmtunknown token in expressionsignals.S36^

:
: 39 bic x0, x0, #152 :
:   signals.S2signals.S error:  : : :unknown use of instruction mnemonic without a size suffix 24error: 30 
:invalid instruction mnemonic 'bl' : mov x0, x232 
10
:   bl memcpy :   error:  error: 
^ unknown use of instruction mnemonic without a size suffix  unknown token in expression
 
 ^
 ^~ add x0, x21, x22 ldr x0, =call_fmt
 


   ^^ 

 signals.S : 37 : 2signals.S : signals.S:error:  :51signals.Sunknown use of instruction mnemonic without a size suffix^25::
2:
31 mov x1, x20: 14:error: 
: 2invalid instruction mnemonic 'ldr'error:  : 
unknown token in expression^error: 
 ldr x0, current
unknown use of instruction mnemonic without a size suffix add x0, x0, #15


  mov x1, x21 ^
 ~  ~signals.S^
 :
 31signals.S :: 2signals.S38 : ::2error:  27:  unknown use of instruction mnemonic without a size suffixerror: :signals.Ssignals.S unknown use of instruction mnemonic without a size suffix:
2:
52 : 32 mov x1, x21 : mov x2, x21error: 
^:2
unknown use of instruction mnemonic without a size suffix
  2: 
^^: error: 
 sub sp, sp, x0
error: unknown use of instruction mnemonic without a size suffix
signals.Sunknown use of instruction mnemonic without a size suffix
 :
 str x23, [x0]^26 mov x2, x23

:
 14 ^: ^
error: 
signals.Sunknown token in expression:signals.S
32: bic x0, x0, #15:39
2: : 2signals.S: error:  :signals.Sunknown use of instruction mnemonic without a size suffix 33error: :
 :signals.S54invalid instruction mnemonic 'bl'  mov x2, x23::
2 
282:  bl memcpy  : :error: 
 2error: ^invalid instruction mnemonic 'bl' :  unknown use of instruction mnemonic without a size suffix

error: ^
 unknown use of instruction mnemonic without a size suffix~ bl printf  mov sp, x23

 

 add x23, sp, x22   
^^^ 
~
^

signals.S:33signals.Ssignals.S:::signals.S25156:30:: :2:error: : 1010invalid instruction mnemonic 'bl'error: : 
signals.S: invalid instruction mnemonic 'ldr'error:  bl printf:error: 
unknown token in expression
36unknown token in expression
  ldr x0, current:
^ ldr x0, =call_fmt
2~ mov x8, #15
 
: 
 ^signals.S  error: ~:  unknown use of instruction mnemonic without a size suffix~27  

 :  mov x0, x23 2 
:    error:   ^unknown use of instruction mnemonic without a size suffix signals.S 
^
 :
^ sub sp, sp, x036
signals.S
:: 252^:: 2
error: : unknown use of instruction mnemonic without a size suffixsignals.Serror: 
signals.S:unknown use of instruction mnemonic without a size suffix mov x0, x23:37

57signals.S: :: str x23, [x0]2^2: 
: 
31error: error: : unknown use of instruction mnemonic without a size suffixinvalid instruction mnemonic 'svc'2^

: 
signals.S svc #0 mov x1, x20error: :

unknown use of instruction mnemonic without a size suffixsignals.S28  
::^^ mov x1, x2137
~2
:~:  
2signals.S^error: : :
unknown use of instruction mnemonic without a size suffixerror: 54
unknown use of instruction mnemonic without a size suffix:
2signals.S add x23, sp, x22 mov x1, x20: :

error: 38signals.S  unknown use of instruction mnemonic without a size suffix::^^
642

:signals.S mov sp, x23: 2:
error: : 32signals.Sunknown use of instruction mnemonic without a size suffix error: ::
invalid instruction mnemonic 'b'2^30 mov x2, x21
:
: 
 b .10signals.S error: 
: :^unknown use of instruction mnemonic without a size suffix error: 38

^signals.Sunknown token in expression: mov x2, x23
:
2
56 ldr x0, =call_fmt:  :
error: 10^ unknown use of instruction mnemonic without a size suffix: 
 
error:  signals.S mov x2, x21unknown token in expression :

 39  mov x8, #15 :^
 2
  : signals.S  :error:  ^33invalid instruction mnemonic 'bl' 
:
 2  bl memcpy:  error: 
signals.S invalid instruction mnemonic 'bl': 
39^ bl printf:~
2signals.S
 :: ^31error: ~:invalid instruction mnemonic 'bl'
2
signals.S:  bl memcpy:error: 
51unknown use of instruction mnemonic without a size suffix :
2^: signals.S mov x1, x21~error: :

invalid instruction mnemonic 'ldr'36
: ldr x0, current2
:  error: ^signals.S ~unknown use of instruction mnemonic without a size suffix:^~
51

 mov x0, x23:
2 : ^error: invalid instruction mnemonic 'ldr'
signals.S
: ldr x0, current52
: 2^signals.S: ~:error: ~32unknown use of instruction mnemonic without a size suffix

:signals.S 2 str x23, [x0]:: ^
37error: 
 :unknown use of instruction mnemonic without a size suffix^
2
 mov x2, x23: 
error: signals.S unknown use of instruction mnemonic without a size suffix:^

52signals.S mov x1, x20::signals.S
257: : :54error: ^2unknown use of instruction mnemonic without a size suffix:

: 2 str x23, [x0]error: : signals.S
error: invalid instruction mnemonic 'svc': unknown use of instruction mnemonic without a size suffix
33^
: svc #0 mov sp, x23
2

:   signals.Serror: ^^:invalid instruction mnemonic 'bl'~
38
~: bl printf

2 : signals.S^error: :~signals.Sunknown use of instruction mnemonic without a size suffix56
:
:5410 mov x2, x21:: signals.S
2error: ::  unknown token in expression64error: ^
:unknown use of instruction mnemonic without a size suffix

 mov x8, #152 mov sp, x23signals.S: 

:error:   36 invalid instruction mnemonic 'b':^ 
2
  b .:  signals.Serror: 
 :unknown use of instruction mnemonic without a size suffix  39
signals.S^ : mov x0, x23:
 2
56^:  :
error: ^10invalid instruction mnemonic 'bl'
: 
error: signals.S bl memcpyunknown token in expression:

57  mov x8, #15:^
2~ : 
 error:  invalid instruction mnemonic 'svc'signals.S 
 : svc #0 
37  : ^2signals.S ~: :^~error: 51

:unknown use of instruction mnemonic without a size suffix2
:  mov x1, x20
error:  invalid instruction mnemonic 'ldr'signals.S^
:
signals.S ldr x0, current64:
:57 2:^: 2~error: : ~invalid instruction mnemonic 'b'error: 

invalid instruction mnemonic 'svc' b .
signals.S
 svc #0: ^38
 
:^2~~: signals.S
error: :unknown use of instruction mnemonic without a size suffixsignals.S52
::64 mov x2, x212:
: 2 : ^error: 
invalid instruction mnemonic 'b'
error:  b .unknown use of instruction mnemonic without a size suffix
 
^ str x23, [x0]
 signals.S^:

39:2: error: invalid instruction mnemonic 'bl'
 bl memcpy
 signals.S^:~54
:2: error: unknown use of instruction mnemonic without a size suffixsignals.S
: mov sp, x2351
: 2^: 
error: invalid instruction mnemonic 'ldr'
 ldr x0, currentsignals.S
: 56^:~10~: 
error: unknown token in expression
 mov x8, #15
 signals.S : 52 : 2 :  error:   unknown use of instruction mnemonic without a size suffix^

 str x23, [x0]
 ^
signals.S:57:signals.S2:: 54error: :invalid instruction mnemonic 'svc'2
:  svc #0error: 
unknown use of instruction mnemonic without a size suffix 
^~ mov sp, x23~

 ^
signals.S:signals.S56::6410:: 2error: : unknown token in expressionerror: 
invalid instruction mnemonic 'b' mov x8, #15

 b . 
   ^ 
     ^
signals.S:57:2: error: invalid instruction mnemonic 'svc'
 svc #0
 ^~~
signals.S:64:2: error: invalid instruction mnemonic 'b'
 b .
 ^
sve_helpers.csve_helpers.c:13:18:: 13error: :use of undeclared identifier 'SVE_VQ_MAX'18
: error: use of undeclared identifier 'SVE_VQ_MAX'
      1313 |  | uunnssiiggnende di nitn tvl sv[lSsV[ES_VVEQ__VMQsve_helpers.c_AMX:A]X;13]
:      ;18| 
:                 ^~~~~~~~~~       error: | 
use of undeclared identifier 'SVE_VQ_MAX'                 ^~~~~~~~~~

sve_helpers.c:13:18: error: use of undeclared identifier 'SVE_VQ_MAX'
   13 | un   s13i | gunnesdi ginnetd  vilnst[ SvVlEs[_SVQ_MAX]V;E
_      V| Q                 ^~~~~~~~~~_M
AX];
      |                  ^~~~~~~~~~
sve_helpers.c:13:18: error: use of undeclared identifier 'SVE_VQ_MAX'
   13 | unsigned int vls[SVE_VQ_MAX];
      |                  ^~~~~~~~~~
sve_helpers.c:25:12sve_helpers.c:sve_helpers.c25::2512::12 :error:  use of undeclared identifier 'SVE_VQ_MAX'error: 
use of undeclared identifier 'SVE_VQ_MAX'
      2525 |  |                 ffoorr  ((vvqq  ==  SSVVEE__VVQQ__MMAAXX;;  vvqq  >>  00;;  ----vvqq))  {{

            | |                   ^~~~~~~~~~                  ^~~~~~~~~~

: error: use of undeclared identifier 'SVE_VQ_MAX'
   25 |         for (vq = SVE_VQ_MAX; vq > 0; --vq) {
      |                   ^~~~~~~~~~
sve_helpers.c:25:12: error: use of undeclared identifier 'SVE_VQ_MAX'
   25 |         for (vq = SVE_VQ_MAX; vq > 0; --vq) {
      |                   ^~~~~~~~~~
sve_helpers.c:25:12: error: use of undeclared identifier 'SVE_VQ_MAX'
   25 |         for (vq = SVE_VQ_MAX; vq > 0; --vq) {
      |                   ^~~~~~~~~~
sve_helpers.c:13:18: error: use of undeclared identifier 'SVE_VQ_MAX'
   13 | unsigned int vls[SVE_VQ_MAX];
      |                  ^~~~~~~~~~
sve_helpers.c:41:12: error: call to undeclared function 'sve_vq_from_vl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
sve_helpers.c:41:12: error:    call to undeclared function 'sve_vq_from_vl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]41
 |                 if (v   q41  | <                 sivfe _(vvqq_ f<r osmv_ev_lv(qvl_)f)r
o      m| _                         ^
vl(vl))
      |                          ^
sve_helpers.c:41:12: error: call to undeclared function 'sve_vq_from_vl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   41 |                 if (vq < sve_vq_from_vl(vl))
      |                          ^
sve_helpers.c:41:12: error: call to undeclared function 'sve_vq_from_vl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   41 |                 if (vq < sve_vq_from_vl(vl))
      |                          ^
sve_helpers.c:41:12: error: call to undeclared function 'sve_vq_from_vl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   341 |  error        s         generatedi.
f (v3q error <s  generateds.
ve_vq_from_vl(vl))
      |                          ^
3 errors generated.
sve_helpers.c:25:12: error: use of undeclared identifier 'SVE_VQ_MAX'
   25 |         for (vq = SVE_VQ_MAX; vq > 0; --vq3) error s{ generated
.
      |                   ^~~~~~~~~~
3 errors generated.
sve_helpers.c:13:18: error: use of undeclared identifier 'SVE_VQ_MAX'
   13 | unsigned int vls[sve_helpers.c:41:12: error: call to undeclared function 'sve_vq_from_vl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   41 |                 if (vq < sve_vq_from_vl(vl))
      |                          ^
SVE_VQ_MAX];
      |                  ^~~~~~~~~~
3 errors generated.
sve_helpers.c:25:12: error: use of undeclared identifier 'SVE_VQ_MAX'
   25 |         for (vq = SVE_VQ_MAX; vq > 0; --vq) {
      |                   ^~~~~~~~~~
sve_helpers.c:41:12: error: call to undeclared function 'sve_vq_from_vl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   41 |                 if (vq < sve_vq_from_vl(vl))
      |                          ^
3 errors generated.
sve_helpers.c:13:18: error: use of undeclared identifier 'SVE_VQ_MAX'
   13 | unsigned int vls[SVE_VQ_MAX];
      |                  ^~~~~~~~~~
sve_helpers.c:25:12: error: use of undeclared identifier 'SVE_VQ_MAX'
   25 |         for (vq = SVE_VQ_MAX; vq > 0; --vq) {
      |                   ^~~~~~~~~~
sve_helpers.c:41:12: error: call to undeclared function 'sve_vq_from_vl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   41 |                 if (vq < sve_vq_from_vl(vl))
      |                          ^

=====================================================


# Builds where the incident occurred:

## defconfig+CONFIG_ARM64_64K_PAGES=y on (arm64):
- compiler: clang-21
- config: None
- dashboard: https://d.kernelci.org/build/maestro:69cd37f1dcae953c056b5324


#kernelci issue maestro:8cc57e5821deb5227525147cda7a7e53246e10c3

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
