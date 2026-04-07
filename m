Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31BB347BBD
	for <regressions@lists.linux.dev>; Tue,  7 Apr 2026 17:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775584750; cv=none; b=JOaJ0TjtWEQlwfinXg1n5Ph5jFThSMULMsayHhtFoMqeaMv+pC9iWjPXRVpNzRUoEQ/ICrZt6M4JNLq5WvUp30ROy2GL6kOZ75ZMPkmvv56zmQcKlH4x8AwirNSCzsad/RGx2fJxHRtCr50qZWqq8sHcApuX/rH66HEwbYYrQpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775584750; c=relaxed/simple;
	bh=PI0VM0EPBRgJhqFlX+1KslCYS9Vpe4V+B+9CW9uMWdM=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=LqLt/1iYzJOKIqXYHPN5xGX3axdVIo29jTddyQ8A8tb21ki6ci5Hsgd3BlnpE+vofqt+QTF95r4Xy5d/MauNk2x+WhySvocZQ2h3FMAdAk8qc4RIJWGwx3t/JLLoilRN3Ol9LDh4m4IbVESzYuJo2GswT0tQ46fUBk3dsjpUDhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20251104.gappssmtp.com header.i=@kernelci-org.20251104.gappssmtp.com header.b=FO1V340j; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20251104.gappssmtp.com header.i=@kernelci-org.20251104.gappssmtp.com header.b="FO1V340j"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-12c0b72dac7so2960076c88.0
        for <regressions@lists.linux.dev>; Tue, 07 Apr 2026 10:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20251104.gappssmtp.com; s=20251104; t=1775584746; x=1776189546; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1GWIepEhzC5O9eWSFAgBHSYfPBBdK31zDOFO0bZ5kFg=;
        b=FO1V340jeGvfOY8GBPROTeZzVnREwQEBU04SBVXwd5d/wJJtUEA03TQVwInmBd96LU
         Spukzhj0gsYGC5S8GCHzWsoMbxiuoQzQpAgph8W3gj0AYeZehNi/j37aMcdz7782b/Ga
         Oqcrhywv5R6mTut/hyCPPAT2Ce08BNOG1Fmh13YnXVwR4wSs5gCEIHRDXfmX2Na45M9+
         QiiMgafo1rm8nNlDXxUK57JEAXx0ye6ta0jzTO79zDF+A6bWrb5mWXCAWm0JSzlEEVE2
         bECJwD51qaR44EI+fgQMMQ4EmHMeem6fZpV7tUFwXLjrKlD2wahAb1PFF/Iv3M9NUEYY
         CD7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775584746; x=1776189546;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1GWIepEhzC5O9eWSFAgBHSYfPBBdK31zDOFO0bZ5kFg=;
        b=JBgufBIysmGYJfE4gzRAUd/sknPv2QKH6XNukpGVVbZPmMD+6L5jR0yI1XGUXb8G+j
         MmTb9z4koChec2F7b9h40IQRHyLnEOgBY2OWCXGzd8vJYP76c9jKBB4D28HJrrYVli4q
         ZBci7xSc1O1AQsbbijQ6PD+wOgz2Ky8JwOpqOeFfoP3ZUL2L5ldtw41vT/fwxPX/epSz
         633BmtmQ22HGQw3dcL3qg4G/eBDqOMf56h9QTN52u6n3gZ9DenahFVfLz6jxRoDL2fap
         6y0Wq/90rxs0sGNj2xzVv902GX3yTHTEu8iMiUvul95W5rs2OQ0XGS74d3ECxkCYpYO/
         Brsg==
X-Gm-Message-State: AOJu0YyP9p2rA4DZiR4C6f9HQeSaVoZ/NOfCJsG1Qy4GqctsBk8CFchC
	BbMkHiOXJb7oWBYBJ91/5TknZ6SmnC5rI0yMR1IKbzlJJBgg9ZfnBI8JVot42FDDChU=
X-Gm-Gg: AeBDietgSpm7syGrs38lZtpQGeNMKxW+vK68LQux7/jMVoValGDF3pE7jfN7qOyFVua
	q5/kD8FfFkWnsFthkt8VcSeUwjtR772qA+auEiFytxVlaKby7Q+PQ9GuexDM2KymzUkpvwP4cyR
	4zBr5kLQGq6vnbiWYBwaVhkblrLEJ+4ulkJqpY/kiBaC1XRSxYIbMc5oAPkFEun8PaD1DrYpa98
	p51ZOytP5kz85gc3lQ5e4KFX8d4v/pnb0lvEI3XnTt2kYvAuug7x4U+4jUAJmdZpvEn+EVXmZel
	3ywSfb7ivkj3RS7vzUvNXMgkfYLQggmsP1MM91t9/z+P+xp2seFz5i2Xf29nWv437tDNFRmTWi/
	c30s4ZEzlGdylSaAK/AJy6zwX9rrOP3dsn2R6eZXJ7qb1CaJk20FrPfi1/uSwjw6/hlURGSgw7X
	l3HEGAPxzuoSDGRuFH
X-Received: by 2002:a05:7022:48c:b0:128:d084:e921 with SMTP id a92af1059eb24-12bfb70dd27mr8822442c88.14.1775584745105;
        Tue, 07 Apr 2026 10:59:05 -0700 (PDT)
Received: from 8692ffc4d55e ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c05a7beffsm9853157c88.15.2026.04.07.10.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 10:59:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (build) ./test_signals.h:15:10: fatal
 error:
 'asm/hwcap.h' file not found ...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 07 Apr 2026 17:59:04 -0000
Message-ID: <177558474358.2474.8332387727108206093@8692ffc4d55e>





Hello,

New build issue found on next/master:

---
 ./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found in testcases/fake_sigreturn_bad_size (testcases/fake_sigreturn_bad_size.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:8c89db6682c0d5b29725a23216a9f033a9cc5a5e
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  f3e6330d7fe42b204af05a2dbc68b379e0ad179e
- tags: next-20260407

Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================
In file included from testcases/fake_sigreturn_bad_size.c:13:
In file included from ./test_signals_utils.h:14:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
   15 | #include <asm/hwcap.h>
      |          ^~~~~~~~~~~~~
In file included from testcases/fake_sigreturn_duplicated_fpsimd.c:13:
In file included from ./test_signals_utils.h:14:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
   15 | #include <asm/hwcap.h>
      |          ^~~~~~~~~~~~~
1 error generated.
1 error generated.
1 error generated.
11 error error generated generated.
.
1 error generated.
1 error generated.
1 error generated.
In file included from test_signals.c:16:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
   15 | #iIn file included from nclude <asm/hwcap.h>
      |          ^~~~~~~~~~~~~
test_signals.c:16:
./test_signals.hIn file included from test_signals.c:16:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
   15 | #include <asm/hwcap.h>
      |          ^~~~~~~~~~~~~
:15:10: fatal error: 'asm/hwcap.h' file not found
   15 | #include <asm/hwcap.h>
      |          ^~~~~~~~~~~~~
11 error generated.
 error generated1.
 error generated.
In file included from In file included from test_signals.c:16:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
   15 | #include <asm/hwcap.h>
      |          ^~~~~~~~~~~~~
test_signals.c:16:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
   15 | #include <asm/hwcap.h>
      |          ^~~~~~~~~~~~~
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
1 error generated.
1 error generated.
In file included from test_signals.c:16:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
   15 | #include <asm/hwcap.h>
      |          ^~~~~~~~~~~~~
1 error generated.
In file included from In file included from test_signals_utils.c:18:
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
1 error generated.
1 error generated.
In file included from test_signals_utils.c:18:
./test_signals.h:15:10: 1fatal error: 'asm/hwcap.h' file not found
   15 | #include <asm/hwcap.h>
      |          ^~~~~~~~~~~~~
 error generated.
In file included from In file included from test_signals_utils.c:18:
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
1 error generated.
1 error generated.
11 error generated.
 error generated.
In file included from test_signals_utils.c:18:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
   15 | #include <asm/hwcap.h>
      |          ^~~~~~~~~~~~~
1 error generated.
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:40:8: error: In file included from In file included from redefinition of '_fpx_sw_bytes'testcases/testcases.ctestcases/testcases.c
::77:
:
In file included from In file included from In file included from testcases/testcases.htestcases/testcases.hIn file included from In file included from :testcases/testcases.c::1515:
testcases/testcases.ctestcases/testcases.c:
:/usr/include/x86_64-linux-gnu/asm/sigcontext.h:/usr/include/x86_64-linux-gnu/asm/sigcontext.h:40::7408:
::In file included from 778 testcases/testcases.h:
:error: :In file included from 15 redefinition of '_fpx_sw_bytes'testcases/testcases.h
:
error: /usr/include/x86_64-linux-gnu/asm/sigcontext.h:
:redefinition of '_fpx_sw_bytes'15In file included from    
:
40testcases/testcases.h/usr/include/x86_64-linux-gnu/asm/sigcontext.h | ::s1540t:
:/usr/include/x86_64-linux-gnu/asm/sigcontext.h40:rIn file included from :testcases/testcases.c::8u840:::c7 8 t:
error: :error: redefinition of '_fpx_sw_bytes' redefinition of '_fpx_sw_bytes'_In file included from f 

ptestcases/testcases.herror: x:redefinition of '_fpx_sw_bytes'15_      4040
:
s |  | s/usr/include/x86_64-linux-gnu/asm/sigcontext.htw:sr_40buyt:rcutce8t: t  s_ error: _ff{predefinition of '_fpx_sw_bytes'p
x      
| x_       ^_
ssww__bbyy   tt40ee      40 | ss | 40s  ts | t{{
r
u   rsu            | c       ^t40ct| t       ^

 r | u c_ts_ff tpp_rxuxf_cs_ptws_x _wsb__wb/usr/include/x86_64-linux-gnu/bits/sigcontext.hyytft_:beypex31stse_:  {ss8{
 w:/usr/include/x86_64-linux-gnu/bits/sigcontext.h
      {_ /usr/include/x86_64-linux-gnu/bits/sigcontext.h:      | | 
bnote: :3131       ^       ^      
| yprevious definition is heret:e8:
       ^
s:8 
 :   {note:  31previous definition is here | 
note:       previous definition is here

s| t       ^r
uc      t3131  |  | _ssfttprrxuu_cctst w ___fbfpypxt_xes_s/usr/include/x86_64-linux-gnu/bits/sigcontext.h
w      _sb:| 31w:_y/usr/include/x86_64-linux-gnu/bits/sigcontext.h       ^/usr/include/x86_64-linux-gnu/bits/sigcontext.h/usr/include/x86_64-linux-gnu/bits/sigcontext.h8bt:y:
::e st
313131:note: e      previous definition is here| :       ^8::8s:

      8| 
       ^  :
note:    previous definition is herenote:  31
 | previous definition is herenote: 
sprevious definition is here   t
31r |    us31   ct | 31t | rs tsruu_cttc ftrpu_xc f_t_spfwx p__xbs_y_wsftp_we_sxbb
y_y      tt| sewse_       ^
sb
      
y|       t       ^| e
       ^s

      |        ^
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:40:8: error: redefinition of '_fpx_sw_bytes'
   40 | struct _fpx_sw_bytes {
      |        ^
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:31:8: note: previous definition is hereIn file included from 
testcases/testcases.c:7:
   In file included from 31testcases/testcases.h | :s15t:
r/usr/include/x86_64-linux-gnu/asm/sigcontext.huc:t85 :_8In file included from :f testcases/testcases.cperror: x:redefinition of '_fpreg'7_:

sIn file included from wtestcases/testcases.h_b:   y1585t:
 | e/usr/include/x86_64-linux-gnu/asm/sigcontext.hsst:
85r      u:In file included from | c8       ^tIn file included from testcases/testcases.c:: 
error:  redefinition of '_fpreg'testcases/testcases.c
7_:
:f7pIn file included from    :
rtestcases/testcases.he85In file included from  | testcases/testcases.h::g15 s{15
:
t:
r      /usr/include/x86_64-linux-gnu/asm/sigcontext.h/usr/include/x86_64-linux-gnu/asm/sigcontext.hu:c| t:       ^8585 :_
f:8p8::In file included from rIn file included from testcases/testcases.c/usr/include/x86_64-linux-gnu/bits/sigcontext.h  error: error: eredefinition of '_fpreg'In file included from 
testcases/testcases.c:::7redefinition of '_fpreg':

gtestcases/testcases.c740:
In file included from  testcases/testcases.h   :::   8In file included from :{8515 | 7s85ttestcases/testcases.hr unote: 
previous definition is here:
:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h | In file included from :ctestcases/testcases.h      
| :s15   :
t/usr/include/x86_64-linux-gnu/asm/sigcontext.h:       ^85
t40r  | /usr/include/x86_64-linux-gnu/bits/sigcontext.h::1540::In file included from 8u:_ snote: 85previous definition is here:

/usr/include/x86_64-linux-gnu/asm/sigcontext.h8::testcases/testcases.c85c:tf t:    :7p_rre840:error: 8:
:u gerror:  |  redefinition of '_fpreg'In file included from c t{f
redefinition of '_fpreg'      serror: 
redefinition of '_fpreg'testcases/testcases.h
 p
r| et   :_       ^g
r   85u15   f85 /usr/include/x86_64-linux-gnu/bits/sigcontext.h | 85s | tsrtruct _fpreg {
      |        ^
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:40:8: note: previous definition is here
   40 | struct _f | cstruct _fpreg {
      |        ^
:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:/usr/include/x86_64-linux-gnu/bits/sigcontext.hp{:
u      pt85 ::r4040ecg| 
r      _| 8f:::8t       ^ e       ^p r8::
_g

error:       e|  gnote:  fredefinition of '_fpreg'/usr/include/x86_64-linux-gnu/bits/sigcontext.h       ^
previous definition is herenote: p
previous definition is here:

40      
r:e   |    840:    g85       ^ | 40
note:  previous definition is here
   40 | str | s | t{In file included from 
utestcases/testcases.cs:rsu      cctt7 t_| rtru:
f       ^In file included from p u_cct
 testcases/testcases.hrftIn file included from  _/usr/include/x86_64-linux-gnu/bits/sigcontext.hfIn file included from :testcases/testcases.c::e7p_rftestcases/testcases.cpp4015g:
:

e      :| rre:In file included from /usr/include/x86_64-linux-gnu/asm/sigcontext.htestcases/testcases.hg:7       ^:
egg8 ::{

15      
In file included from 
testcases/testcases.h91       | note:       previous definition is here:

| ::15       ^8| :/usr/include/x86_64-linux-gnu/asm/sigcontext.h       ^   
:

/usr/include/x86_64-linux-gnu/asm/sigcontext.h       ^ :error: 40:/usr/include/x86_64-linux-gnu/bits/sigcontext.h
redefinition of '_fpxreg'91
 | 91s::40:88t   r:918:: uerror:  | :s credefinition of '_fpxreg' 
note: tprevious definition is hereerror: rt   In file included from 
redefinition of '_fpxreg'u    91_testcases/testcases.c
c40t | f:p | 7 s   rset:
In file included from In file included from _tf91gr | testcases/testcases.ctestcases/testcases.h:In file included from 7pr
uus:ttestcases/testcases.c15:
xIn file included from       c| cr:t:
rtestcases/testcases.ht       ^u c7t :
/usr/include/x86_64-linux-gnu/asm/sigcontext.hIn file included from etestcases/testcases.h:
15_:
 /usr/include/x86_64-linux-gnu/asm/sigcontext.h_::91g91: f_ffppxxreg {
      |        ^
::158{:p rr/usr/include/x86_64-linux-gnu/bits/sigcontext.h8::
46
:error: eredefinition of '_fpxreg'e
:g/usr/include/x86_64-linux-gnu/asm/sigcontext.h8::       gnote:   error: 
redefinition of '_fpxreg'         9191| previous definition is here:In file included from {testcases/testcases.c
:| 7       ^ | 
       ^

8
::
 s   t      /usr/include/x86_64-linux-gnu/bits/sigcontext.h   :In file included from error: 91r | | 4646:testcases/testcases.h8redefinition of '_fpxreg'u:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:s91
       ^ | :
t:sr    8note: t:previous definition is hereu91/usr/include/x86_64-linux-gnu/bits/sigcontext.h | :srt r
c46tu error: u:   c_redefinition of '_fpxreg'c8
46tfIn file included from pcxt: |  testcases/testcases.ct:   7r  snote: t_r 91:
_ | e_sfprevious definition is heretfuIn file included from fg
p p{r   pcxttestcases/testcases.h xxr
e      ugc46  | r:e_grf| ptx{s15
e      g       ^  {r

      t      :
| 
       ^_
e| r       ^| 
/usr/include/x86_64-linux-gnu/asm/sigcontext.hfg/usr/include/x86_64-linux-gnu/bits/sigcontext.hu:       ^:p/usr/include/x86_64-linux-gnu/bits/sigcontext.h
:c46
91x      t46 :/usr/include/x86_64-linux-gnu/bits/sigcontext.h::8r:| :_846e:g         ^8f:
 error: {:p8note: :In file included from  
redefinition of '_fpxreg'note:       previous definition is here | note: x       ^previous definition is here
testcases/testcases.c

:previous definition is herer7

e/usr/include/x86_64-linux-gnu/bits/sigcontext.h      46:
 |    s   tg46:46In file included from 91r | 
 |       46|  |        ^testcases/testcases.hus:s15:
sIn file included from tcttr:
8testcases/testcases.c::rtr u_/usr/include/x86_64-linux-gnu/asm/sigcontext.h :7note: uprevious definition is hereuccttf98:

In file included from ctestcases/testcases.ht    46  | __p:: 15sftfrpx8r_e:
gp
xux:f p/usr/include/x86_64-linux-gnu/asm/sigcontext.hx      rreecggrerror: eIn file included from g:testcases/testcases.c98| t       ^
       _ fredefinition of '_xmmreg'p
:      :| 
| {       ^

x78:
       ^In file included from 
testcases/testcases.hr:   
       error: :e1598|  | redefinition of '_xmmreg'       ^g
:

s/usr/include/x86_64-linux-gnu/asm/sigcontext.ht
      /usr/include/x86_64-linux-gnu/bits/sigcontext.h| r:u       ^:98   c
46:98t8 :: | _8 sx:error: tm redefinition of '_xmmreg'rmnote: 
uprevious definition is hererc
etg     98_{   In file included from  | 46x
In file included from testcases/testcases.csIn file included from t | m      mtestcases/testcases.c:r7utestcases/testcases.ccs| r       ^t::
:tIn file included from  e
r7In file included from 7testcases/testcases.htestcases/testcases.c:_15g:
u/usr/include/x86_64-linux-gnu/asm/sigcontext.h:
c:
tIn file included from /usr/include/x86_64-linux-gnu/bits/sigcontext.htestcases/testcases.h::x m:In file included from 98 :_7f15p{xmtestcases/testcases.h::538:
::
In file included from /usr/include/x86_64-linux-gnu/asm/sigcontext.h
:r98r:15::
 testcases/testcases.h      :ee88:/usr/include/x86_64-linux-gnu/asm/sigcontext.h :error: error: | 15g:
g
:98 redefinition of '_xmmreg'note: redefinition of '_xmmreg'       ^

/usr/include/x86_64-linux-gnu/asm/sigcontext.h       /usr/include/x86_64-linux-gnu/bits/sigcontext.h:
:previous definition is here:
98{:
         | 853   :988   898|        ^: | :53: |  |        ^ss
 serror:   note: 
tttredefinition of '_xmmreg'rprevious definition is hereuerror: crtr 
u_/usr/include/x86_64-linux-gnu/bits/sigcontext.hx
redefinition of '_xmmreg'uc   t:53m | m   s98c | 
 53rttrs_:e8 :_u   txrg xIn file included from ctestcases/testcases.c98:mum r{enote: gmt | 7c
previous definition is here m s:
t      
{r_tIn file included from    r53u | csttruct _x | _
extestcases/testcases.hg: 15m_       ^xx
      m
| :
/usr/include/x86_64-linux-gnu/bits/sigcontext.h/usr/include/x86_64-linux-gnu/asm/sigcontext.hm:m98m:m             ^r:r53m:m8| :       ^
eg
      | /usr/include/x86_64-linux-gnu/bits/sigcontext.h       ^:53:e8r8r:
 
error: g:redefinition of '_xmmreg'

      e| ge g{          ^{note: 
         
note:       
previous definition is here98
 | str   u53 | s| tprevious definition is here| c       ^tr 
       ^
u   _53
/usr/include/x86_64-linux-gnu/bits/sigcontext.h | c:xs/usr/include/x86_64-linux-gnu/bits/sigcontext.ht53m:t:r 8m:rue53g:_ c 8note: :previous definition is herex
t{     m53
 | _snote: m      xrtprevious definition is herer| ume
       ^c
m   gt/usr/include/x86_64-linux-gnu/bits/sigcontext.hr53
 | : e_gs
      53x:m      t| r| u8m:       ^       ^cr 

tenote:  gprevious definition is here_

x      m| m          ^r53
e | gs
t      | r       ^u
ct _xmmreg
      |        ^
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
In file included from /usr/include/x86_64-linux-gnu/asm/sigcontext.htestcases/testcases.c::1807::
8In file included from :testcases/testcases.h :error: 15redefinition of '_ymmh_state':

/usr/include/x86_64-linux-gnu/asm/sigcontext.h:180:8: error:   redefinition of '_ymmh_state'180
 | strIn file included from   u180ctestcases/testcases.ct | : s7_t:
ryIn file included from umtestcases/testcases.hcmth:_ 15s_:
tya/usr/include/x86_64-linux-gnu/asm/sigcontext.htm:em180 h:{_8
s:      t | aerror:        ^tredefinition of '_ymmh_state'
e
 {
/usr/include/x86_64-linux-gnu/bits/sigcontext.h      :| 184       ^:
8:   180note: /usr/include/x86_64-linux-gnu/bits/sigcontext.h | previous definition is here:
184s:t8  r:184u  | csnote: ttrprevious definition is hereu c
t_ y  _m184ym | mhsm_htsIn file included from _rtuatestcases/testcases.ctsc:et7at  {:

t_In file included from       e| 
y      testcases/testcases.h|        ^m:       ^15
:
mIn file included from hIn file included from 
testcases/testcases.c/usr/include/x86_64-linux-gnu/asm/sigcontext.htestcases/testcases.c:_180/usr/include/x86_64-linux-gnu/bits/sigcontext.h::s::77:
:
t8184In file included from In file included from a::testcases/testcases.httestcases/testcases.h 8::e :note: error: previous definition is hereIn file included from 15In file included from 
:
15redefinition of '_ymmh_state'

testcases/testcases.c      testcases/testcases.c| /usr/include/x86_64-linux-gnu/asm/sigcontext.h  ::
180::       ^:8184  :/usr/include/x86_64-linux-gnu/asm/sigcontext.h7:
:
7 | :
180  | error: 180sredefinition of '_ymmh_state':In file included from sIn file included from t
8ttestcases/testcases.htestcases/testcases.hr:ur ::  c15uerror: 15redefinition of '_ymmh_state'In file included from t180 :
_cy:
t
 testcases/testcases.c_ | /usr/include/x86_64-linux-gnu/asm/sigcontext.hm:/usr/include/x86_64-linux-gnu/asm/sigcontext.h192::y7sm  tm180h:8:
180mrhu | c_t:In file included from  :error: _sss testcases/testcases.h_8yredefinition of '_xstate'mt
ttaIn file included from :testcases/testcases.c:mrta  15: herror: _usecttte192:
 | str7u:
redefinition of '_ymmh_state'c

a        | /usr/include/x86_64-linux-gnu/asm/sigcontext.hIn file included from :ttestcases/testcases.ht_{       ^
 192  :ey
      :_18015 m| x8       ^ | :
s{m
s:      t
a/usr/include/x86_64-linux-gnu/asm/sigcontext.ht:rhu | error: tredefinition of '_xstate'e 180{_
/usr/include/x86_64-linux-gnu/bits/sigcontext.h      c| t       ^ 

:s:       ^In file included from   _8ytm184/usr/include/x86_64-linux-gnu/bits/sigcontext.h:
testcases/testcases.c192:a m:h8:_ | /usr/include/x86_64-linux-gnu/bits/sigcontext.hterror: 184:7 ss:terredefinition of '_ymmh_state'u:cnote: :
t189 
8tprevious definition is hereIn file included from 
atestcases/testcases.h:{:8 :_tx:  15  :

  enote: sprevious definition is here180t
184/usr/include/x86_64-linux-gnu/asm/sigcontext.h      :  note:   | as | | 192       ^189
previous definition is here{t
t      :|  | 
set   {/usr/include/x86_64-linux-gnu/bits/sigcontext.h
r8u       ^cstr184u:c184      :| 
       ^t
  | ts t:r urc_t/usr/include/x86_64-linux-gnu/bits/sigcontext.h __/usr/include/x86_64-linux-gnu/bits/sigcontext.h8:error: uyc:t189yy:184redefinition of '_xstate'm :mm m:
8m:_h8m  hnote: _hs xnote: _previous definition is here:
192previous definition is here | _stssst a
t  e184tartttnote:   previous definition is here

 |       uactea184tse   189|  | te
 |       t{       ^s
 
_| sr
utcxrt             ^t
      rsuuc ct| t| t_        ^        ^a_y_m
m
txeyhs_ /usr/include/x86_64-linux-gnu/bits/sigcontext.hmts{:mattIn file included from e

184      h:a8testcases/testcases.c      :| _:t7| :
sIn file included from        ^       ^ ettestcases/testcases.ha

note: 
previous definition is here      t:
e/usr/include/x86_64-linux-gnu/bits/sigcontext.h| 15In file included from :

testcases/testcases.c:         ^/usr/include/x86_64-linux-gnu/asm/sigcontext.h      :189184
:| 7: | 192       ^:
:8
:s In file included from note: 8previous definition is heret
testcases/testcases.h:r: u  15error: :
189redefinition of '_xstate'c/usr/include/x86_64-linux-gnu/asm/sigcontext.h | t:
192s: t8_:r  u 192yerror: credefinition of '_xstate' | mt
sm th_  In file included from r_testcases/testcases.cIn file included from x192u | cst:ttestcases/testcases.css 7a:ttt_:
7In file included from a:
eIn file included from rxtestcases/testcases.hut
testcases/testcases.hs:c15e      
:      t| t       ^:
 | 15a:

/usr/include/x86_64-linux-gnu/asm/sigcontext.h_       ^x
t/usr/include/x86_64-linux-gnu/asm/sigcontext.h:s192e:t: 192a8{:t:
8e       : error:  redefinition of '_xstate'| error: {
       ^redefinition of '_xstate'


        | 192/usr/include/x86_64-linux-gnu/bits/sigcontext.h       ^ | :  
s189t192r: | In file included from 8testcases/testcases.c:u s/usr/include/x86_64-linux-gnu/bits/sigcontext.ht:note: c:r7189previous definition is heret
u:
c:   189_In file included from t8 | xtestcases/testcases.h :ss:_ 15ttxrnote: :
astueprevious definition is here/usr/include/x86_64-linux-gnu/asm/sigcontext.ht:c 
{a192t:
t       | 8  e_ x       ^{

:      189s | /usr/include/x86_64-linux-gnu/bits/sigcontext.h | :t189error:        ^s
a:tredefinition of '_xstate'et8/usr/include/x86_64-linux-gnu/bits/sigcontext.hr:
189
:      u :c|   tnote: 8previous definition is here       ^

192  | :_  xstate
      |        ^
 s189tIn file included from rnote:  | previous definition is hereustestcases/testcases.c
ct:tr7   u:
_189xcIn file included from stttestcases/testcases.ha | :s ttr15_eu:
x c/usr/include/x86_64-linux-gnu/asm/sigcontext.hs{t:t
 317a      _:tx| 8es
t       ^a      :t
|         ^e/usr/include/x86_64-linux-gnu/bits/sigcontext.h
:
189      :| 8       ^:
 note: previous definition is here
  189error:  | sredefinition of 'sigcontext't
ruIn file included from ctestcases/testcases.ct:   7_317:
x | In file included from sstestcases/testcases.htt:ar15tu:
ec/usr/include/x86_64-linux-gnu/asm/sigcontext.h
:t       317| :s       ^8i:g
c oerror: nredefinition of 'sigcontext't
ext {  
317       | | s       ^t
ruct /usr/include/x86_64-linux-gnu/bits/sigcontext.hs:i139g:c8o:n tnote: eprevious definition is herex
t {  
139       | | s       ^t
ruct/usr/include/x86_64-linux-gnu/bits/sigcontext.h :s139i:g8c:o nnote: tprevious definition is heree
xt
        139|  |        ^s
truct sigcontext
      |        ^
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:317:8: error: redefinition of 'sigcontext'
  317 | struct sigcontext {
      |        ^
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:139:8: note: previous definition is here
  139 | struct sigcontext
      |        ^
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:317:8: error: redefinition of 'sigcontext'
  317 | struct sigcontext {In file included from 
testcases/testcases.c      :|        ^
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:139:8: note: previous definition is here
7:
  In file included from 139testcases/testcases.h | :s15t:
r/usr/include/x86_64-linux-gnu/asm/sigcontext.hu:c317t: 8: error: redefinition of 'sigcontext'
  317 | ssitIn file included from grtestcases/testcases.ccu:o7cn:
ttIn file included from  etestcases/testcases.hsx:it15g
:
c      /usr/include/x86_64-linux-gnu/asm/sigcontext.ho| :n       ^317t
:e8x:t  error: {redefinition of 'sigcontext'

      |        ^
  317 | /usr/include/x86_64-linux-gnu/bits/sigcontext.hIn file included from s:testcases/testcases.ct139:r:7u:
8In file included from c:ttestcases/testcases.h  :note: s15previous definition is herei:

g/usr/include/x86_64-linux-gnu/asm/sigcontext.hc:o317n  t:1398e | :xs tterror:  rredefinition of 'sigcontext'{u

c      t|         ^s
  i317g | cs/usr/include/x86_64-linux-gnu/bits/sigcontext.hot:nr139tu:ec8xt:t  
snote:       iprevious definition is here| g
       ^c
o  n139t | eIn file included from sxtestcases/testcases.ctt:r 7u{:

c      In file included from t| testcases/testcases.h        ^:s
15i:
g/usr/include/x86_64-linux-gnu/bits/sigcontext.h/usr/include/x86_64-linux-gnu/asm/sigcontext.h:c139o::n3178t::e8x :tnote:  
previous definition is hereerror:       
redefinition of 'sigcontext'| 
       ^  
139 | struc  t317  | ssitgrcuocntt seixgtc
o      n| t       ^e
xt {
      |        ^
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:139:8: note: previous definition is here
  139 | struct sigcontext
      |        ^
In file included from In file included from testcases/testcases.ctestcases/testcases.c::77:
:
testcases/testcases.hIn file included from testcases/testcases.h:testcases/testcases.c:101:101:7:25:
25::testcases/testcases.h : error: 101error: invalid application of 'sizeof' to an incomplete type 'struct _aarch64_ctx'invalid application of 'sizeof' to an incomplete type 'struct _aarch64_ctx':

25: error: invalid application of 'sizeof' to an incomplete type 'struct _aarch64_ctx'
  101 |             101101i |  | In file included from ftestcases/testcases.c :                (i7!fi:
h f(testcases/testcases.h!e h:(101a:ed25a d:|  ||error:  invalid application of 'sizeof' to an incomplete type 'struct _aarch64_ctx'|!rh
 eerasedvs _v|s_|z  s101  z | r< e        < siH vHf_ DDRs(z!R _<_Sh SHZeDaZ))R
d
_       |       S| |                               ^~~~~~Z                               ^~~~~~|
 resv_In file included from testcases/testcases.c:
)testcases/testcases.hIn file included from stestcases/testcases.c7testcases/testcases.h:
:
testcases/testcases.h:z28:28      : :<7:| 101                               ^~~~~~ 2H:
D2:
:testcases/testcases.hR:_:S25Z )testcases/testcases.h101: :28:
note:       note: expanded from macro 'HDR_SZ'25: | In file included from In file included from expanded from macro 'HDR_SZ'
:2 error: error:                                ^~~~~~invalid application of 'sizeof' to an incomplete type 'struct _aarch64_ctx'
testcases/testcases.ctestcases/testcases.c:invalid application of 'sizeof' to an incomplete type 'struct _aarch64_ctx'
   

::    287 | testcases/testcases.h        note: 287:
:
:sexpanded from macro 'HDR_SZ' | 28  :testcases/testcases.htestcases/testcases.hi  z
        1012:::   101e | s         | 101101 :note: 28expanded from macro 'HDR_SZ'o | ii        :25
f(str   28 |         siz        ezsfi25:uoife f:  cerror: z(o( error: te invalid application of 'sizeof' to an incomplete type 'struct _aarch64_ctx'sf!((invalid application of 'sizeof' to an incomplete type 'struct _aarch64_ctx'o
f_
atah!s(rreuhtesatcacrdurhudt  |c|6c  t 101|_|t  rr  4101 _ | a         ee | _cataarircc_h64_ss        xiffh 6acavvr) 
(      !head || r(4!t__c| he6_hcxss)zs4ve        ^     ~~~~~~~~~~~~~~~~~~~~~tzx
       __asd
 )<< | cz 
| |H D        ^     ~~~~~~~~~~~~~~~~~~~~~R
t x      H| testcases/testcases.hr_<S)Z
testcases/testcases.hD:        ^     ~~~~~~~~~~~~~~~~~~~~~95:e 95)      
R      
| :sH:| 22_                               ^~~~~~22testcases/testcases.hvD        ^     ~~~~~~~~~~~~~~~~~~~~~R:S
::_95
s_testcases/testcases.h Znote:  testcases/testcases.hnote: :z22S:)forward declaration of 'struct _aarch64_ctx':
forward declaration of 'struct _aarch64_ctx' :Z28
95
:<  ):      222   :note: H
|                                      ^~~~~~:95     | note: forward declaration of 'struct _aarch64_ctx'sD| 
 95expanded from macro 'HDR_SZ' | 
Rt                               ^~~~~~anote: 
testcases/testcases.hs_
tforward declaration of 'struct _aarch64_ctx':itSa   
   testcases/testcases.h28:cZ ti2895 | :        28)ni | c   295:s | i:
l2s ti nnote: sexpanded from macro 'HDR_SZ't      aztei:nael 
i| n                               ^~~~~~i
o tnote: seexpanded from macro 'HDR_SZ'    c28f |  iitestcases/testcases.hnt:
rsu(ts        rcl28ct   rsuuc ti :t228  | icin_:_         azatnea ssinote: zer laitneexpanded from macro 'HDR_SZ'o
c_rhcreuocfa(hs664 fst    at4r_c(ht28r_r_cs6t | uauact4r        ucscrttx_c tt i_ca xc*) 
zha6r_tgax_      aea4oceha r| cr_ft6*        ^     ~~~~~~~~~~~~~~~~~~~~~ghc6hc4t(_s4t_
cet6_xh rtu_cxt4)c
e      a*dtestcases/testcases.heh: 95_:t22| :gre_acx        ^     ~~~~~~~~~~~~~~~~~~~~~) 
e(adte
note:       ts_axrrforward declaration of 'struct _aarch64_ctx'(| th ec
htestcases/testcases.h6s:        ^     ~~~~~~~~~~~~~~~~~~~~~95r
u*ag4dt:rtestcases/testcases.h22cet    _ecru(:s:ttr95u_tacxt95 :_22 | :ct _aa rarch6) note: 
_h      snote: cforward declaration of 'struct _aarch64_ctx'4forward declaration of 'struct _aarch64_ctx'a
e| atdhae
_a        ^     ~~~~~~~~~~~~~~~~~~~~~6trcrt
4   i_(   cx95h95 | 6ccs t | sr4testcases/testcases.h_ citnx*shttaua:ttil i*etac95x:cnhiedat  22 ec ,d*,h _u:ii s ea anrnituanote: tcforward declaration of 'struct _aarch64_ctx'3lniridh,
2lnun6t _uiecn 4e3tits_    95s2t rn t_ca | _smtuattritca tiancgt3i2uxcr l c__ ttc mia,ga*a _hn
eihcr,ma6a      r esc
ha4g| catd      ,6_4i                     ^ch,r
|                             ^c
_
c6tux|  ut4xc                     ^t* i_ c
*_ggnettae3tx_at2_ hhr_*eegcettaah 6_dhdemra4eeard(eg_(sricst(tsctr,uxcttr 
_ r*uactestcases/testcases.h      :ugcatt104|                       ^e r:_27
ata__aca:rrhcchh6 6testcases/testcases.h4e:a104testcases/testcases.h:h:46error: 4_invalid application of 'sizeof' to an incomplete type 'struct _aarch64_ctx'd27104:_ _error: cinvalid application of 'sizeof' to an incomplete type 'struct _aarch64_ctx'

e:ccttxr27(ts   *xh:exa  t104  *error:  dr,104  | uhinvalid application of 'sizeof' to an incomplete type 'struct _aarch64_ctx'e*u |                 iwtestcases/testcases.h
ahcewtnh:tidlahd ,_104a3  2,_e i l:ea 104(t  umu27irn | o        (fia:gticwhofns 3error: cinvalid application of 'sizeof' to an incomplete type 'struct _aarch64_ctx'h
6f4ft 322,_
i      _| s<  =_ttl cm                      ^<104= |   remat
aggx          ew i(i*cr,shvc_osfhfes
i      ,| z                     ^e - s l<e=  (a
dH,Dv
roe      s vRu_fis| n__f                     ^sz  t<s=z resv_sz - HDRS
-3  H_-D ZR2_SSH _ZZ &Dt &&&R
_ testcases/testcases.h&
&      Sm:a
104| Zg      i| :                                 ^~~~~~ 27c                                 ^~~~~~&
&:
,
       testcases/testcases.h
error: | :                                 ^~~~~~      testcases/testcases.h| invalid application of 'sizeof' to an incomplete type 'struct _aarch64_ctx'28

:                     ^:28testcases/testcases.h
2:::228 :  :2note:  :expanded from macro 'HDR_SZ' 104note: testcases/testcases.h | :        note: 
expanded from macro 'HDR_SZ'testcases/testcases.h
104w::h104expanded from macro 'HDR_SZ'27      28i | :
:28 l        27s      i | | error: e                                 ^~~~~~   :z        esoinvalid application of 'sizeof' to an incomplete type 'struct _aarch64_ctx' 
(
28 ifzoe | error: testcases/testcases.h(fsofts           :sinvalid application of 'sizeof' to an incomplete type 'struct _aarch64_ctx'fr
(104<28ius | c=: zte        ot2 rrewf:_(  testcases/testcases.hush anote: s104:c | tvialexpanded from macro 'HDR_SZ't104         :_rsez
rw_h27a  cui:a   r(-chhc6t l 28o 64error: _e_ | f        fHsD4 invalid application of 'sizeof' to an incomplete type 'struct _aarch64_ctx'c
 asaR__<ctt(xricSz=   xo)fhZ6e4o104_ | r)
f
 fc        ewshv      s|               ^     ~~~~~~~~~~~~~~~~~~~~~&| &(t
i      _| s 
        ^     ~~~~~~~~~~~~~~~~~~~~~sx
l                                 ^~~~~~z
< t)-testcases/testcases.hetestcases/testcases.h=testcases/testcases.h rru
esv_sz - HDR_SZ :H ::c       28D:(9595t| &        ^     ~~~~~~~~~~~~~~~~~~~~~2Ro:f f&_
:_22:
sa Sa22:       note: Zexpanded from macro 'HDR_SZ'testcases/testcases.hr: | <
 :c note:                                  ^~~~~~=
   &95hnote: forward declaration of 'struct _aarch64_ctx'testcases/testcases.h 28&
      |                                  ^~~~~~
testcases/testcases.h:28:2: note: expanded from macro 'HDR_SZ'
   28 |         sizeof(struct _aarch64_ctx)
      |         ^     ~~~~~~~~~~~~~~~~~~~~~

:r | 28e        s:testcases/testcases.hs2i::z enote: 95   expanded from macro 'HDR_SZ':o
f(stru   28 |         size6forward declaration of 'struct _aarch64_ctx'
   95 | static inl:i4vn_cet22 x_s):s
t       rz|  unote: c        ^     ~~~~~~~~~~~~~~~~~~~~~t-forward declaration of 'struct _aarch64_ctx'
  
_HaDaRr_cSZh 6&&4
_      | c                                 ^~~~~~95t
x |  s   *ttestcases/testcases.h95ga: | te28sti:t_c2ah :tei inaclnote: dexpanded from macro 'HDR_SZ'ie r
ni(testcases/testcases.hens :   lt28s95rti | :urcn        22sut: ei_cz  atenote: sat o_forward declaration of 'struct _aarch64_ctx'rr
fcau(hacsr6ttc4 rh_u_   6ccat95ax4rt |   _scct_*thaahx6tae 4*irgcca_e ct22hdit_,h euaid6enr4(t_s3ctt2rx_u)tc
 t       m| _a        ^     ~~~~~~~~~~~~~~~~~~~~~ag
aircc,h
6      4| _                     ^ctestcases/testcases.h
t:xn 95l*:ih22ne:e a note: dsforward declaration of 'struct _aarch64_ctx',t
r uucitn: t_ 3a   2note: a_95rt | cforward declaration of 'struct _aarch64_ctx's ch
tmx6a4a t_g*icigctce x,ti 
n_*      lg| testcases/testcases.hhtie                     ^:te_ n
105ah_oe: 13   dea95f | ss:eaa (tstrrdurcerror: tt incomplete definition of type 'struct _aarch64_ctx'ra(etcih_6
usrctctr au4c(_ _a  ts cttestcases/testcases.hiarn105l_itara:racr | cnxu)105ch        6h4e6c
t:h13 :_  4       6 _cerror: tsx_ | 4 _acincomplete definition of type 'struct _aarch64_ctx'at*c        ^     ~~~~~~~~~~~~~~~~~~~~~ t 
xr rgt
x *c   ue)hhh1056ec4t
_e       | a        td_hcaet|    - a>ddexr         ^     ~~~~~~~~~~~~~~~~~~~~~_
 m ,a(g*iac a suhi  !rtestcases/testcases.ht:enrh=ucc95h:ate t6224:d3amtestcases/testcases.h __ a,2da:cnote: a forward declaration of 'struct _aarch64_ctx'u_-g95tr
it>i:x22 c*ng mc:a hte3m2    &g&note: 6forward declaration of 'struct _aarch64_ctx't
a_95 i | 4s__gthhece tci acmd,aa   d!at=- 
g95ei | txs>m      argci ,ct
 m      | (                     ^i
*ahienal| i                     ^scttragdn,
e uii  u&ccc is&t)i nn{t  htl
r_e3aid      -uac2tn_et  smtarguicct, 
_      a| a                     ^
| >a rm_a               ~~~~^arcag
richhcc664h_)testcases/testcases.h46c :_4t{95testcases/testcases.h:c_x
:22t:c  note:       forward declaration of 'struct _aarch64_ctx'105
xt **| :x               ~~~~^13gh e
:e t   *testcases/testcases.h95testcases/testcases.haerror: dincomplete definition of type 'struct _aarch64_ctx',
 uint32_t   m105a | g        i c , 
      |                      ^
testcases/testcases.h:105:13: error: incomplete definition of type 'struct _aarch64_ctx'
  105 |                head->magic != ma_g: | 95:: 22g:hes105 :i13 cnote: eforward declaration of 'struct _aarch64_ctx'tt_ h:  a&
a& e herror: dincomplete definition of type 'struct _aarch64_ctx't
ahdeeeri   eard(c95  | ai(-ssdnsl>titrnte- mraugca>tsmuitci ct aic n_lrignt!auicec =a trm a)g_ a acrscihtestcases/testcases.h{_hatc6
:6a4r 4      105r:_cu&_&| c13t: error: incomplete definition of type 'struct _aarch64_ctx'
  ctx hc6t                ~~~~^x105* 4h  
e105a  | h |         __ d* e          testcases/testcases.ha:c-thxa d   a 95>:me22a :,  note: rforward declaration of 'struct _aarch64_ctx' agd*,  uci
 ig euhihnn6t 4hcete   ta3_2)_at_953 | dsct d{- >h2e-t>am
mm_aaxgta      a| t               ~~~~^d  iiggi
em*atestcases/testcases.hg:i95c:,22: note: forward declaration of 'struct _aarch64_ctx'
   95 | static inline strucci ccrg,c

       i!n =! magic && head->magic) {
      |                ~~~~^
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_ctx'
   95 | static inline struct _aarch64_ctx *get_header(struct _aarch64_ctx (struct _aarch64_ctx *head, uint32_t magic,
      |                      ^
testcases/testcases.ht       | _l=*ih|                      ^a ne
maeraad gci,c  u&i&n th3eshe2at6dtestcases/testcases.h_r4-:_tu:>cc105 t:tmtm13105_ axa                     ^::h _error: aga i*g37ei
cincomplete definition of type 'struct _aarch64_ctx'rcg:a,d
c)e 
eerror: h t{      _incomplete definition of type 'struct _aarch64_ctx'r6
| h                       ^
(
s4      _e105t | c        t| ard ex               ~~~~^  ur
    * c (ts105ttestcases/testcases.hg:  testcases/testcases.h | r        uec105th:_:  e testcases/testcases.h37:a10595:_a13 :a:ad22:   rerror: incomplete definition of type 'struct _aarch64_ctx'-a: >error: tincomplete definition of type 'struct _aarch64_ctx' 
r c
hm6_ac note: 4forward declaration of 'struct _aarch64_ctx'hgehah  e105_a
di-  6105d4 | c        tcx>  | e_  m*   h!95        rc( ae= |  ts ga sm xt  i* dhta r c,e augi nu  ati tc3th!dic 2 _e=,acd - >h_mta   u&ea&  amrmiangiaghaceliicndi g-ihca6ntc3&>,md4e _!2c_&t 
ha-g =t xm      aeg>aids t r| uimc-cm *                     ^hcat >a&!m
=e g i&gaamd_,c  igaia)au ihc{,cg
rne
i)      testcases/testcases.hcta      dc | :h3| 2- {                     ^105
6               ~~~~^4__>&
:
ct&tm      37|                                         ~~~~^ xatestcases/testcases.h:gh
em : iaa*95error: cdgg:testcases/testcases.h22incomplete definition of type 'struct _aarch64_ctx':
)-ie:95 :>22ct _{h:m,anote:   g
e       | 
                                       ~~~~^forward declaration of 'struct _aarch64_ctx'
105ianote:       
 | cd)testcases/testcases.hforward declaration of 'struct _aarch64_ctx':| 95        e r{

                     ^      :|                 ~~~~^(   
9522 | : 
s   s t note: ttestcases/testcases.h95testcases/testcases.h | a s forward declaration of 'struct _aarch64_ctx'r
::t105t aut95c:i   :c  it223795:testcases/testcases.hih:c:105  _error: aincomplete definition of type 'struct _aarch64_ctx'
  105 |            |  ne  :as lainote: n37rt idforward declaration of 'struct _aarch64_ctx'l:ca n-e
i hnerror: et  i>cm 6incomplete definition of type 'struct _aarch64_ctx'4sh ai   gs
_ten95itrcural |   sct cxudi105t!t c-nt |  a= *_>e        _t  hmam aia eraagasc ac i cr gt drh,u c hi6ci6 4c_&cht 4!n=u tm&aegxi_ li n ta3dcc*i_gnh2-e_ taeet>atd&xa_ hsmta g-&>  mrermui*hacaha6cctgeegdg4i  atid_-h>emaadgeirc()s t{r
u      c| t                                       ~~~~^ 
_aarch64testcases/testcases.h_:c95t:x22: note: forward declaration of 'struct _aarch64_ctx'
   95 | static inline struct _aarch64e_c!c,_c _=crt
xa)* ht(x       a|  mes *rg                     ^{at*ect

dr,gh_e6ht4      u e__ahcde| acute                                       ~~~~^dt
 ixren(_ r*testcases/testcases.htsa(gas:t3terrtcu_95hre2hc_tt:u22a6 d ecr:(4__testcases/testcases.hcmt sanote: :forward declaration of 'struct _aarch64_ctx't
a ta_r105uxcgtra:    * i_caa37a95: | hchrrc hse,a6cerror: 6t
da,4t_hiincomplete definition of type 'struct _aarch64_ctx'4       c6utc
 _i| ni4lxc                     ^n_ti3 t
cnt2*_  tx emxh 105 a *gehs | *iaetestcases/testcases.hthdcea,ad        d,:r,
  , u105ui        u:ucn| tt                     ^  i_37ni
3t 23:an a2 ra_ tt_ cm error: 3t2h a6mhgaincomplete definition of type 'struct _aarch64_ctx'_g4ei_agd
ticc i&- >mc  t105xc | &m        a g,i 
,* ghaegt ic      
e_ hc| , a!d->magtestcases/testcases.h:106:       e a d ehre(asdt-r>umcatg i_ca a!r=c hm6agic && head->m4a_gcitcx)  =15| {*                     ^

: h       | merror: iaincomplete definition of type 'struct _aarch64_ctx'g
c)i c{ 
&&         h106 |                 offs +=                                       ~~~~^

testcases/testcases.h:ead, uint32      |                      ^
                     ^
| etestcases/testcases.h                                        ~~~~^95
_a:hd:t-e10622 >a::mmad15 :ag-inote: >testcases/testcases.h :gcforward declaration of 'struct _aarch64_ctx'serror: i95,c

)iincomplete definition of type 'struct _aarch64_ctx'z:e       
| {22                     ^
;      :

           | |                         ~~~~^                                       ~~~~^ 
95106 |  | 
        note: s        forward declaration of 'struct _aarch64_ctx'totestcases/testcases.htestcases/testcases.h
fa::f9595t::s22i 22:c    note: 95+ | =:  forward declaration of 'struct _aarch64_ctx'si h
tnanote: elaitnforward declaration of 'struct _aarch64_ctx'   testcases/testcases.hdi-ce> stestcases/testcases.hi
z95e: 106testcases/testcases.h:i:n | l;ss:t15r105:    ierror: n106e
 tsua:c95tincomplete definition of type 'struct _aarch64_ctx' :
15      t| rtu37i:   | 106_ | :                                 ~~~~^cct  sat        aerror: 
 error: i_aotfincomplete definition of type 'struct _aarch64_ctx'fincomplete definition of type 'struct _aarch64_ctx'naltestcases/testcases.hr:cihc
6s4
ia95 :_ inr22+cnec:h=6 t4l_ic n   106note:  |   hxts xeforward declaration of 'struct _aarch64_ctx'        105         | e        t*  *
goefaf sr ug   s95tt_dr +c=e  | hh-u cttt __saeae>as i zh_taartdiecr(struct _aarch64_ctx *head, uint32_ eeacatr;a 
dhcmeh      6a4r6(| 4g__                        ~~~~^sctircc,
ttux
xtestcases/testcases.hc t*       *: 95g| g                     ^_eata:_re
t22hc:_eh h6note: ae4forward declaration of 'struct _aarch64_ctx'da_e
dcre(trs(tsrturcut c_ta a_x rda    ac*95rh-ienh | cs>tasdli6ha,i z46t_incu ei4nceti;ntestcases/testcases.h_tl3 isx
 :      c2t_nxt*106| te                        ~~~~^ rh:  e
*u15msaag hc e:atddi,cthtestcases/testcases.h  _ra,a  u,e:
error:       uruica95incomplete definition of type 'struct _aarch64_ctx':| c                     ^inhtd3
222t: 
_na6a4-_> m  a106t | r_tcnote: tforward declaration of 'struct _aarch64_ctx'g
3i        c x2 cm h_*t6 4m_acgic,
      testcases/testcases.h| :106:15: error: incomplete definition of type 'struct _aarch64_ctx'
  106 |                 offs += head->size;
      |                         ~~~~^
testcases/testcases.h:95:22:   !gt                     ^x95=e | t  s*_mtgaahetetia_c  inote: nforward declaration of 'struct _aarch64_ctx'l
ine struct    95 | s
ta_        aataircc hio6nf4lf_iscng tei+ xc=s , t*h
rge      uec| att                     ^_d 
h-_e>agaasrdiiceczhr6 (e4&s;_&tc
r uthcx      e| at                         ~~~~^d *_
-ga>eamtra_chghei6acd4)e_ drc{(t
setx      rr | u                                       ~~~~^testcases/testcases.h(*c:ht
es95 at_:dra22,ua: ctestcases/testcases.h rtestcases/testcases.hutinote: h:c106:e anforward declaration of 'struct _aarch64_ctx'h
:95_:d22t:3 2note: _forward declaration of 'struct _aarch64_ctx't615a:e 
4m rerror: aincomplete definition of type 'struct _aarch64_ctx'_
a(rg   citsxc 95c | tsh*,hr
        t6testcases/testcases.he:u106c| t                     ^ 
_aarch64_ctx *head, ui   95 | sa4a_107 |                 offs n+ttadc:t=t ii,t103hc cx:2e u   _*aiiinnerror: th dnmltal3incomplete definition of type 'struct _aarch64_ctx'2e-ig>ni_
asien tdic,es  zse,t   tm;ra
ugru107ui
      c      i | c        n| t| c                        ~~~~^t        t 3                     ^ ,


h_e2a_      a_da atestcases/testcases.ha| r                     ^t
r=: 95c: 22c:G hnote: mforward declaration of 'struct _aarch64_ctx'hE6a4
_6Tgc4_it_Rxcct,x
E           95S | V**| s                     ^_
ggtNeetatE_t_hXeiahtestcases/testcases.hTcde:_107 eaiH:rdnE10(:eslA rtiDerror: (rnu(eincomplete definition of type 'struct _aarch64_ctx's
cth tres ut_raauc  adrc)t107 cth; | _ 6
        a_4a        aar      _hcertcx|  a*dch                       ^~~~~~~~~~~~~~~~~~~~~~~~6h4e ahtestcases/testcases.h
:_107=:d 6testcases/testcases.h4testcases/testcases.hc10t,xG :_107::  Eerror: uincomplete definition of type 'struct _aarch64_ctx'c
:8510*:Tit:g43_nRxE e:tt 3 2Serror: V_incomplete definition of type 'struct _aarch64_ctx'N
  107 |                 head   =107  | G        E        Thead = GET_RESV_NEXT_HEAD(head);
      |                        ^~~~~~~~~~~~~~~~~~~~~~~~
testcases/testcases.h:85:43: note: expanded from macro 'GET_RESV_NEXT_HEAD'
   85 |         (struct _a_note: expanded from macro 'GET_RESV_NEXT_HEAD'
   85 |         (struct _aarch64_ctx **testcases/testcases.h_:Et_a h)eha107X:RT10rm:(e(dEce_caHg aerror: Shrh(Esitdrincomplete definition of type 'struct _aarch64_ctx'V
a6A4c,,u c_trD_
u        N E X(chien| 107                     ^_ | 
*Ttata        )a_xrHd3        ( EcA)2hhe*hD6(;_a
d))4h(te       a  _=c(tmxa|  d+ *cg                       ^~~~~~~~~~~~~~~~~~~~~~~~) G;hhi
c(E,
eaahT
      rtestcases/testcases.h d)_      | | :*,R-                        ^~~~~~~~~~~~~~~~~~~~~~~~u                     ^85)E>
i
:(43htestcases/testcases.hSsn:):Vi85t 3 note: z_expanded from macro 'GET_RESV_NEXT_HEAD':2+43eN
_: t )E
(      note:  expanded from macro 'GET_RESV_NEXT_HEAD'XhT|    m
)_                                              ~~~^H85E | a-        
   A>gs(85Ditestcases/testcases.hics, | (:zht
        95e:e22r:      ( )a
du| stestcases/testcases.hnote:       forward declaration of 'struct _aarch64_ctx')| c                     ^t:r
;                                              ~~~^t

 106_u
:ac         testcases/testcases.h15at95|  :_:r |                        ^~~~~~~~~~~~~~~~~~~~~~~~a
a95r :cshc6error: 422testcases/testcases.htestcases/testcases.ht:ha85_:incomplete definition of type 'struct _aarch64_ctx':
 :6t4c_43note: 107  :itcxc:tforward declaration of 'struct _aarch64_ctx'x106 10* :  *
 | )i note: )        (nerror: lexpanded from macro 'GET_RESV_NEXT_HEAD'incomplete definition of type 'struct _aarch64_ctx'(        
((ci   n
eocfhf95s  h+a= |  s  ht107ea   s85atr |  a*td | r        r()s        i- >*u(cth) +tcr uicn        lsi)h  _t(inhz(ea e)e ;ha)a_r-as
d       c| >ha6t+                         ~~~~^s
4i_rzr =utestcases/testcases.hccetestcases/testcases.hh)(6h c:t107:
495)Gtx:       *_-c:E T10__| g>etsx22i:aR                                              ~~~^t _:*z aeEr)
chhe )error: S
6V      anote: d(forward declaration of 'struct _aarch64_ctx'incomplete definition of type 'struct _aarch64_ctx'testcases/testcases.h4_| e(

:_N                                              ~~~^rc95c
E(hX:Tt_   HsEtaArr  u10722ctestcases/testcases.hx95:D95 : | 22::t   | *(g*e        t         note:  note: sht)_hforward declaration of 'struct _aarch64_ctx'_forward declaration of 'struct _aarch64_ctx'eaa(he
aa
atrdch)ed;iahd)e
r          | c                       ^~~~~~~~~~~~~~~~~~~~~~~~   
6 4+(95= |   iG95_ sstestcases/testcases.htnE | c(tt:alTshtr)x-85ti_iauc>  *:nRtcitsiihn43leE cSz eei:i  _Vnote: )annsla_expanded from macro 'GET_RESV_NEXT_HEAD'N
Edet,ia n
u      X rrei | s                                              ~~~^t   Tr85_sucnht
6u | H        tcEr3testcases/testcases.h4c(ttAu2c_:_s t Dt(t95c:t_xr _* h_ a22auacheemaad:atracaha6rgc,i c ,rd4h_ note: _
ac)h6cuforward declaration of 'struct _aarch64_ctx'      a;64
ti
| r4_      xn                     ^c_chc6| t4 t_*
gte   x95                       ^~~~~~~~~~~~~~~~~~~~~~~~x3ctt x |  
* 2__*hgse)*tgtestcases/testcases.he:atdt( em85a:e43_:( tnote: aexpanded from macro 'GET_RESV_NEXT_HEAD't
ri(hsct_hgai   cce,r
h      r85|   |          aiuec                     ^*t( dnea
d)s_tlrrue(ra(i(csha)s n+t t r_taea( hrcurrus)ttestcases/testcases.hrhccch-u>c:t6 4tt_6sc4i109_  tz_:a_10a_xaeca:a  a)t
r      r| error: *rhxc testcases/testcases.hh:c109                                              ~~~^:incomplete definition of type 'struct _aarch64_ctx'
c
e*a6h10h)d64testcases/testcases.h_6:4  ,(4(:c _error:  _ucci95t:tcincomplete definition of type 'struct _aarch64_ctx'hnax22 *hex *get_heatd109
t | r:axe3        2  d r*i_f*note: ),((ht  e a dhs )109m (+u, it(arg | forward declaration of 'struct _aarch64_ctx'h eunihui        
iant)ccft,d3t-     95
_      -| >23>( | sa                     ^m
agic == magic) {
      |             ~~~~^
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_ctx'
   95 | static inline struct testcases/testcases.h:109:10: error: incomplete definition of type 'struct _aarch64_ctx'
  109 |         if (head->ma_2h_eta dm_gt-a>gimaa iacgcrmc,aiacs
 r=      c=| h 6                     ^m
4at_atii gcczi=ec )=it)  
n{xm       l
a| g*i                                                    ~~~^nih
| ec            ~~~~^e 
)as dt{,r
 u      uc| ittestcases/testcases.h            ~~~~^n :
t_953a:a2testcases/testcases.h22r::c 95hnote: testcases/testcases.h:6forward declaration of 'struct _aarch64_ctx':224htestcases/testcases.h_
_95:6t :c: 4note: 10922t::m_10 a   :note: 95forward declaration of 'struct _aarch64_ctx' | sforward declaration of 'struct _aarch64_ctx'x
cg i
t terror: ca*txgi   incomplete definition of type 'struct _aarch64_ctx', 
ec95t    | 
95s* | tg _e      t  _saihn| el109hitet                     ^aanaei
 ddtc | seeir         (trcriuis( ncfitltn i( r_lnhuaeiec aantsdr-e>  t_cmsrahuaa6tscgri4rc_ttcu testcases/testcases.h=c:=r109 hc6ttx  mu_:c_4ta a*agg10_ea ai:ct r_rcct_error: achh)x h incomplete definition of type 'struct _aarch64_ctx'e
aa6r46{_*dc4eh
rch  _6      (te109sc4t_| rxa | tc            ~~~~^tu
 cd        xx*tig,  testcases/testcases.h fe_ **ug: e95ta:tah_i(_n22hrheht:eeceha63 anote: aadd42d_forward declaration of 'struct _aarch64_ctx'_d
,e -cute   r95>itm rm( | nsxtta(as 3ta2tgsg*r_uicittirhtucc  c_e c ti=,aamdna =_
al,rg a      ia| c                      ^imnarhu
ceg ci6i,cs
th4rn)u      6c| t_t                     ^ 4 _c3c
{_t2t_
xaxt       a * | r*hm            ~~~~^ac
hheegaa6id4dtestcases/testcases.h,c_ ,:,cut i95u
xn :i*      22ntgt3| :et_hea dnote: forward declaration of 'struct _aarch64_ctx'
32                     ^e2
_r_t(t  smm   taa95grg | iiusccct,,t
a
       t_      | ia|                      ^ca                     ^
 r
icnhl6i4n_ec tsxt r*uhcetad ,_ auainrtc3h26_4t_ cmatgxi c*,
g      e| t                     ^
_header(struct _aarch64_ctx *head,testcases/testcases.h u:i109n:t103:2 _error: tincomplete definition of type 'struct _aarch64_ctx' testcases/testcases.h
m:a109g:i10c,:  
 109       | error: |         incomplete definition of type 'struct _aarch64_ctx'                     ^i

f (hea  d109- | >        mif (head->magic == amgaigci c=)=  {m
a      g| i            ~~~~^c
) {
      testcases/testcases.h| :            ~~~~^95
:22: note: forward declaration of 'struct _aarch64_ctx'testcases/testcases.h
:95:22: note: forward declaration of 'struct _aarch64_ctx'
   95 | static in   l95i | nset asttircu citn l_ianaer csht6r4u_cctt x_ a*agrecth_6h4e_acdtexr (*sgtertu_chte a_daearr(csht6r4u_cctt x_ a*ahrecahd6,4 _ucitnxt 3*2h_eta dm,a guiicn,t
3      2| _                     ^t
 magic,
      |                      ^
testcases/testcases.h:129:7: error: incomplete definition of type 'struct _aarch64_ctx'
  129 |                 tail->magic = 0;
      testcases/testcases.h| :                ~~~~^129
:7: error: incomplete definition of type 'struct _aarch64_ctx'
testcases/testcases.h:  95129: | 22                :t ainote: lforward declaration of 'struct _aarch64_ctx'->
magic = 0;
      |                 ~~~~^
   testcases/testcases.h95:95 | :22s:t note: aforward declaration of 'struct _aarch64_ctx't
itestcases/testcases.htestcases/testcases.hctestcases/testcases.h: ::   i12912912995::: | 77s7::t : aerror:  error: tnincomplete definition of type 'struct _aarch64_ctx'ierror: incomplete definition of type 'struct _aarch64_ctx'

lcincomplete definition of type 'struct _aarch64_ctx'i 
ni    ne129129l  | i           | sn        e        tail->magic = 0129        t t; | a
r              s        ttiul| rac-                ~~~~^uit>
cmlta -gtestcases/testcases.h _>i:_amc95aaa r:ag=c22ri h:cc0 6h ;note: 
46=forward declaration of 'struct _aarch64_ctx'      _
4|  _c                ~~~~^0tc
;xt 
   *x       testcases/testcases.h95*g| g:                ~~~~^e | e
t95st_:_htestcases/testcases.ht22:heeaa:95t ad:inote: de22cforward declaration of 'struct _aarch64_ctx'err: 
(( issnnote: tltforward declaration of 'struct _aarch64_ctx'rir
unu   cect95 t  |  s_s_at   taaatrr95airccu | ch csih6ttn6l44 a_i__tcnctatiex axc s*r  t*hcirhhenua6el4c_daitc,d n uet,_xi  as nutat*ir3rcgn2hu_e6ttct3t4_ 2 m__h_aacettgx aarid mcce*,r
(ahgg6      si4| etc_                     ^ct
t,_x
h       e*| ag                     ^red
utectestcases/testcases.h_rt(:h130 se:_7tatestcases/testcases.h:atestcases/testcases.hdr: :aue129129error: rtestcases/testcases.hcincomplete definition of type 'struct _aarch64_ctx'r::c7::t
 (error: 7h130:6:  s_  incomplete definition of type 'struct _aarch64_ctx'47error: taincomplete definition of type 'struct _aarch64_ctx'130
_:rca
trxc   *h129  e | a        d | , uerror: h129                6 cuincomplete definition of type 'struct _aarch64_ctx't
t |         4        i n_aarch64_at_i          ltcact130-t3itxx |  >a*2il -        *m        ha_el>htgtas-ie>ai dcm,zaaemi   gdal=g =ui,- i0 ;ic>nuci 0n
,st
=;t       3i| 3      
02z                ~~~~^2| e;      __| 
t                ~~~~^                      ^
=
t       testcases/testcases.h
 testcases/testcases.h m0m| ::                ~~~~^a;a95g95
g
:i:i22      22c:testcases/testcases.htestcases/testcases.hc:::| , 130,note: :
95                       ~~~~^
forward declaration of 'struct _aarch64_ctx'
7
:note: |       testcases/testcases.h                     ^| :22forward declaration of 'struct _aarch64_ctx'   :                     ^
 
:
9595error:   | :incomplete definition of type 'struct _aarch64_ctx'note: s22
forward declaration of 'struct _aarch64_ctx't:
    a  95note: t130 | forward declaration of 'struct _aarch64_ctx'is |    testcases/testcases.htestcases/testcases.h
95ct        :: |  ai           130130tstn95:l: | i7antii7s::et altc  as-ti rerror: ierror: tn>csuincomplete definition of type 'struct _aarch64_ctx'incomplete definition of type 'struct _aarch64_ctx'i
l iic
ncizntee    l i  in n=_130s130e | l a0a;r
      |                 ~~~~^
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_ctx'
   95 | static inline struct _aarch64_ctx *get_header(struct  | _t a        sa        irc        r        tcnhhetutra66 a4sciutli4l_t c-t_-ccttrxx_> >u sc a*sa_*aithirgzaz ee_c eh=eraata6_  c0dr,4h=_hc;6 ceu t0
4;haidxn      _
6e      4r tc| 3| _(*                ~~~~^tg2
                ~~~~^cs
xe_tt tr*tugxtestcases/testcases.htestcases/testcases.h :_mcea :95htetg*95:i ac__g:h22d,ea
22ee:aarrd      :t|  _c(ehs                      ^hnote: r6(tnote: 
eforward declaration of 'struct _aarch64_ctx'4a
srforward declaration of 'struct _aarch64_ctx'u_
dtccerttru x   c(95_ t   s | 95as*a tt | hr_arsecattaiuhaadcc6rt,  it4ci un__lhcci ai6at4ninr_xctnec lt3 xh*6i2s h4n_te*eh_ tcrate sumtdxac ar*,dtguihc e, ct,ua _d 
,_iua       | aniau                     ^a
tnrr3ictc2nh3h6_t264t3__4t  2mc_m_caattgxtgx i i mc*acg*g,g,e
it      
ec      _t| ,| h
_                     ^                     ^e      h

a| ed                     ^ea
rd(esrt(rsutcrtu c_ta a_rtestcases/testcases.htestcases/testcases.hac::ah1301306r::4c77_h::6c  4terror: error: _xincomplete definition of type 'struct _aarch64_ctx'cincomplete definition of type 'struct _aarch64_ctx' 
t
x* h*eha    de130130, | a |          du                i,        tn tatua3iii2ln_l-tt- >>3sms2iaiz_gzetie  c =m,= a
 0g      0;i| ;
c                     ^
      ,
      | 
|                 ~~~~^      
                ~~~~^| 
                     ^testcases/testcases.h
:testcases/testcases.h95::9522::22 :note:  forward declaration of 'struct _aarch64_ctx'note: 
forward declaration of 'struct _aarch64_ctx'
   95    | 95s | tsattaitci ci nilnilnien es tsrturgcutc t_ a_aaracrhc6h46_4c_tcxt x* g*eigtec_t,h_
eha      de| aed                     ^re
r((ssttrruucctt  __aaaarrcchh6644__ccttxx *head, uint32_t magic,
      |                      ^
 *head, uint32_t magic,
      |                      ^
testcases/testcases.h:107:10: error: incomplete definition of type 'struct _aarch64_ctx'
  107 |                 head = GET_RESV_NEXT_HEAD(head);
      |                        ^~~~~~~~~~~~~~~~~~~~~~~~
testcases/testcases.h:85:43: note: expanded from macro 'GET_RESV_NEXT_HEAD'
   85 |         (struct _aarch64_ctx *)((char *)(h) + (h)->size)
      |                                               ~~~^
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_ctx'
   95 | static inline struct _aarch64_ctx *get_header(struct _aarch64_ctx *head, uint32_t magic,
      |                      ^
testcases/testcases.h:109:10: error: incomplete definition of type 'struct _aarch64_ctx'
  109 |         if (head->magic == magic) {
      |             ~~~~^
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_ctx'
   95 | static inline struct _aarch64_ctx *get_header(struct _aarch64_ctx *head, uint32_t magic,
      |                      ^
testcases/testcases.h:129:7: error: incomplete definition of type 'struct _aarch64_ctx'
  129 |                 tail->magic = 0;
      |                 ~~~~^
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_ctx'
   95 | static inline struct _aarch64_ctx *get_header(struct _aarch64_ctx *head, uint32_t magic,
      |                      ^
testcases/testcases.h:130:7: error: incomplete definition of type 'struct _aarch64_ctx'
  130 |                 tail->size = 0;
      |                 ~~~~^
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_ctx'
   95 | static inline struct _aarch64_ctx *get_header(struct _aarch64_ctx *head, uint32_t magic,
      |                      ^
testcases/testcases.c:9:36: warning: declaration of 'struct extra_context' will not be visible outside of this function [-Wvisibility]
    9 | bool validate_extra_context(struct extra_contestcases/testcases.ctext: *9e:x36t:r awarning: , declaration of 'struct extra_context' will not be visible outside of this function [-Wvisibility]c
har **err,
      |                                    ^
    9 | bool validate_extra_contetestcases/testcases.cxt:testcases/testcases.c(9:s:t369r::u 36cwarning: :t  declaration of 'struct extra_context' will not be visible outside of this function [-Wvisibility]warning: e
xdeclaration of 'struct extra_context' will not be visible outside of this function [-Wvisibility]t
ra_context *ext    r    9a9 | , | bb oocoohlla  vvraa l*l*iieddraatrte,e_
_e      ex| xtt                                   ^rr
aa__ccoonntteexxtt((ssttrruucctt  eexxttrraa__ccoonntteexxtt  **eexxttrraa,,  cchhaarr  ****eerrrr,,

            | |                                    ^                                   ^

testcases/testcases.c:18:34: error: incomplete definition of type 'struct extra_context'
   18 |         term = GET_RESV_NEtestcases/testcases.cXT_:9:36: warning: declaration of 'struct extra_context' will not be visible outside of this function [-Wvisibility]
testcases/testcases.c:18:34: error: incomplete definition of type 'struct extra_context'
    9 | b   18o | o        tle rmv =a GlEiTd_aREtSeV__NeEXxT_tHrEAaD(_&cexotnrat->ehxeta(ds);t
      r|                                    ~~~~~^u
ct exttestcases/testcases.c:r9a:36_: cnote: oforward declaration of 'struct extra_context'
ntext     *9e | xbtoroal, v aclihdaatre _*e*xterra_rc,o
nt      e| x                                   ^t(
struct extra_context *extestcases/testcases.ctestcases/testcases.ct::1818r::34a34:,:   error: cerror: incomplete definition of type 'struct extra_context'h
incomplete definition of type 'struct extra_context'a
r **err,
      |                                    ^
      1818 |  |                 tteerrmm  ==  GGEETT__RREESSVV__NNEEXXTT__HHEEAADD((&&eexxttrraa-->>hheeaadd));;

            testcases/testcases.c| | :                                   ~~~~~^                                   ~~~~~^

18Htestcases/testcases.ctestcases/testcases.cE::9A:936D::( 36&note: e:xtra->hforward declaration of 'struct extra_context'ea
d);
      |                                    ~~~~~^
    9  | note: bforward declaration of 'struct extra_context'o
ol valida    t9e | _betestcases/testcases.cox:to9rl:a 36v_:ac lonote: niforward declaration of 'struct extra_context'dt
eatxet_(esxttrruac_tc oe    xnt9tr | eabx_otco(olsn ttvreauxlctit d *aeetxxett_rreaax_,tc rocahn_atcreo xn*tttestcases/testcases.c* e*:exet9(:r36xsrt:t r,ar
uwarning: ,      c declaration of 'struct extra_context' will not be visible outside of this function [-Wvisibility]t| c 
                                   ^he
axrt r*a*_ecrorn,t
e      x| t                                   ^ 
*extr    a9, |  bcohoalr  v*a*leirdra,t
testcases/testcases.ce      _:e| 18                                   ^x:t
34testcases/testcases.cr::a18_:c34o:n terror: eincomplete definition of type 'struct extra_context'x 
terror: (incomplete definition of type 'struct extra_context's
truct    e18x |    t        18rt | ae        _rtcmeor nm=t  e=Gx Etestcases/testcases.ctTG: E_18*TR:e34_ExRt:rSEa Serror: VV_,_Nincomplete definition of type 'struct extra_context' NE
EcXXhTTa__rHH EE   *AA18*DD | e(        (r&&treeex,xrtmt
rra       -| >a                                   ^-
=h> ehGaeEdaT)d_;)R
;      E
| S                                         ~~~~~^V| 
_                                   ~~~~~^N
EXT_testcases/testcases.cH:Etestcases/testcases.c9A::D936(::&36 e:note: x forward declaration of 'struct extra_context'tnote: 
rforward declaration of 'struct extra_context'a
->head)    ;9
     |       b9|  | o                                   ~~~~~^bo
olo lv avlaildtestcases/testcases.cia:dt9ae:_t36ee:_x etnote: xrforward declaration of 'struct extra_context'ta
r_ac_ocnotnetxet    x(9ts | (tbsrotuorclut  cvetax lteixrdtaarta_e_c_coeonxtntterexax_ttc  o**neetxetxxrttar(,s atc,rh uaccrth  aer*x *t*err*are_,rc
ro      ,n| 
t                                   ^      
|                                    ^
ext *extra, char **err,
      |                                    ^
testcases/testcases.ctestcases/testcases.c::1919::1919::  error: error: incomplete definition of type 'struct _aarch64_ctx'incomplete definition of type 'struct _aarch64_ctx'

      1919 |  |                 iiff  ((!!tteerrmm  ||||  tteerrmm-->>mmaaggiicc  ||||  tttestcases/testcases.cee:rr19mm:--19>>:ss iierror: zzincomplete definition of type 'struct _aarch64_ctx'ee
))  {{

            | |                      ~~~~^                     ~~~~^   

19 |         iftestcases/testcases.htestcases/testcases.h ::(9595!::t22testcases/testcases.c22:e:  :r9note: note: m:forward declaration of 'struct _aarch64_ctx'forward declaration of 'struct _aarch64_ctx'
 36
|| term-   95 |    s95t | asttiact iicn liinnlei nset rsutcrtu c_ta a:>_r macwarning: aagrhcideclaration of 'struct extra_context' will not be visible outside of this function [-Wvisibility]h66c
44 __|cc|tt xxt  e**rggmee    -tt9_>_ | hbsheoioeazladede )rv (a{sl
ti      rd| ua                     ~~~~^ct
te e__re(axsattrrrcatestcases/testcases.huh:6_c954tc_:c t22o:xn _ ata*rnote: cehhforward declaration of 'struct _aarch64_ctx'e6
x4at_d(c,stt xruu ic*ntth   e 3ea95d2,x  | u_stitntartt3 ai2m__tc acg imiocan,ngtle
ixic      t| n                     ^,e 

 *      es| xt                     ^trr
uac,tfatal error:   too many errors emitted, stopping now [-ferror-limit=]c_
hafatal error: aatoo many errors emitted, stopping now [-ferror-limit=]rr
 c*h*6e4r_rc,ttestcases/testcases.c
:x       18| *:                                   ^34g
:e terror: _hincomplete definition of type 'struct extra_context'e
ader(struct _   a18a | r        cthe6r4m_ c=t xG E*Th_eRaEdS,testcases/testcases.cV _:NuE18Xi:nT34t_:3H 2Eerror: _Aincomplete definition of type 'struct extra_context'tD
 (m&aegxitcr,a
-      >| h                     ^e
ad);
         18|  |                                    ~~~~~^        
term = GEtestcases/testcases.cT:_9R:E36fatal error: Stoo many errors emitted, stopping now [-ferror-limit=]:V
 _note: Nforward declaration of 'struct extra_context'E
XT_H    E9A | Db(o&oelx tvraal-i>dhaetaed_)e;x
t      r| a                                   ~~~~~^_
context(struct testcases/testcases.ce:x9t:r36a:_ cnote: oforward declaration of 'struct extra_context'n
text *ex    t9r | ab,o oclh avarl id*a*teer_rex,t
r      a| _c                                   ^o
ntext(struct extra_context *extra, char **err,
      |                                    ^
testcases/testcases.c:18:34: error: incomplete definition of type 'struct extra_context'
   18 |         term = GET_REStestcases/testcases.cV:_18N:E34X: Terror: _incomplete definition of type 'struct extra_context'H
EAD(&ex   t18r | a        t-e>rmh e=a GdE)T_;R
ES      V| _N                                   ~~~~~^E
XT_HEAD(&extestcases/testcases.ct:r9a:-36>:h enote: aforward declaration of 'struct extra_context'd
);
      |                                    ~~~~~^
    9 | booltestcases/testcases.c v:a9l:i36d:a tnote: eforward declaration of 'struct extra_context'_
extra_co    n9t | ebxoto(ls tvarluicdta teex_terxat_rcao_ncteoxntt *eexxtt(rsat,r ucchta r e*x*terrra,_
c      o| n                                   ^t
ext *extra, char **err,
      |                                    ^
testcases/testcases.c:19:19: error: incomplete definition of type 'struct _aarch64_ctx'
   19 |         if (!term || term->magic || ttestcases/testcases.ce:r19m:-19>size) {
      |                      ~~~~^
: error: incomplete definition of type 'struct _aarch64_ctx'testcases/testcases.h
:95:22: note: forward declaration of 'struct _aarch64_ctx'
   19 |         if (!t   e95r | ms testcases/testcases.ct|:a18|t: i34tc:e  rierror: mnincomplete definition of type 'struct extra_context'-
l>imnaeg isct r|   u|18c  | tt         te_reamra-mr> cs=h i6Gz4eE_)Tc _tR{x
E       | S*                     ~~~~^Vg_
eNtE_XhTtestcases/testcases.he_:aH95d:Ee22Ar:D( (snote: &tforward declaration of 'struct _aarch64_ctx'er
xutcrta -_>ahae   ra95cd | h)s6;t4
a_t      ci| tc                                   ~~~~~^x
  in*lhietestcases/testcases.cnae:d 9,s: t36uriunctt3 2__a:ta  rnote: mforward declaration of 'struct extra_context'cah
6g4i_cc,t
x           9*|  | gb                     ^eo
to_lh evaadleird(astter_uecxtt r_aa_acrocnht6e4x_tc(tfatal error: xtoo many errors emitted, stopping now [-ferror-limit=] s
*threuacdt,  euxitnrta3_2c_otn tmeaxgti c*,e
x      t| r                     ^a
, char **err,
      |                                    ^
fatal error: too many errors emitted, stopping now [-ferror-limit=]
testcases/testcases.c:18:34: error: incomplete definition of type 'struct extra_context'
   18 |         term = GET_RESV_NEXT_HEAD(&extra->head);
      |                                    ~~~~~^
testcases/testcases.c:9:36: note: forward declaration of 'struct extra_context'
    9 | bool validate_extra_context(struct extra_context *extra, char **err,
      |                                    ^
testcases/testcases.c:19:19: error: incomplete definition of type 'struct _aarch64_ctx'
   19 |         if (!term || term->magic || term->size) {
      |                      ~~~~^
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_ctx'
   95 | static inline struct _aarch64_ctx *get_header(struct _aarch64_ctx *head, uint32_t magic,
      |                      ^
fatal error: too many errors emitted, stopping now [-ferror-limit=]
testcases/testcases.c:9:36: warning: declaration of 'struct extra_context' will not be visible outside of this function [-Wvisibility]
    9 | bool validate_extra_context(struct extra_context *extra, char **err,
      |                                    ^
testcases/testcases.c:18:34: error: incomplete definition of type 'struct extra_context'
   18 |         term = GET_RESV_NEXT_HEAD(&extra->head);
      |                                    ~~~~~^
testcases/testcases.c:9:36: note: forward declaration of 'struct extra_context'
    9 | bool validate_extra_context(struct extra_context *extra, char **err,
      |                                    ^
testcases/testcases.c:18:34: error: incomplete definition of type 'struct extra_context'
   18 |         term = GET_RESV_NEXT_HEAD(&extra->head);
      |                                    ~~~~~^
testcases/testcases.c:9:36: note: forward declaration of 'struct extra_context'
    9 | bool validate_extra_context(struct extra_context *extra, char **err,
      |                                    ^
testcases/testcases.c:19:19: error: incomplete definition of type 'struct _aarch64_ctx'
   19 |         if (!term || term->magic || term->size) {
      |                      ~~~~^
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_ctx'
   95 | static inline struct _aarch64_ctx *get_header(struct _aarch64_ctx :*h34e:a d,error:  uincomplete definition of type 'struct extra_context'i
nt32_t magic,
      |                      ^
   18 |         term = GETfatal error: _too many errors emitted, stopping now [-ferror-limit=]R
ESV_NEXT_HEAD(&extra->head);
      |                                    ~~~~~^
testcases/testcases.c:9:36: note: forward declaration of 'struct extra_context'
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
signals.S:16:19: error: expected ']' in brackets expression
 stp x29, x30, [sp, #-16]!
                  ^
signals.S:16:19: error: expected ']' in brackets expression
 stp x29, x30, [sp, #-16]!
                  ^
signals.S:16:19: error: expected ']' in brackets expression
 stp x29, x30, [sp, #-16]!signals.S
 : 16 : 19 :  error:  expected ']' in brackets expression 
       stp x29, x30, [sp, #-16]! 
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
signals.Ssignals.Ssignals.S::1717::22: signals.S: error: :signals.Ssignals.S17error: ::unknown use of instruction mnemonic without a size suffix17unknown use of instruction mnemonic without a size suffix:
17:217: 
::22: : error:  mov x29, sp:
2  mov x29, sp^error: unknown use of instruction mnemonic without a size suffixerror: : 

 unknown use of instruction mnemonic without a size suffix

unknown use of instruction mnemonic without a size suffixerror: ^unknown use of instruction mnemonic without a size suffix
 mov x29, sp

 mov x29, sp 

 mov x29, sp^
 
  mov x29, sp^^


 ^
signals.S:19signals.S:signals.S2::: 1919error: ::unknown use of instruction mnemonic without a size suffix22
: :  mov x20, x0error: 
error: unknown use of instruction mnemonic without a size suffix unknown use of instruction mnemonic without a size suffix
signals.S^
 mov x20, x0
signals.S: mov x20, x0signals.S
:1919::
 signals.S:^219 :2^
: :20: 
error: 2:: error: unknown use of instruction mnemonic without a size suffixerror: unknown use of instruction mnemonic without a size suffix2unknown use of instruction mnemonic without a size suffixsignals.S:20:2: error: unknown use of instruction mnemonic without a size suffix
 mov x21, x1
 ^
signals.S:: error: 21unknown use of instruction mnemonic without a size suffix:
2 mov x21, x1
:  error: ^unknown use of instruction mnemonic without a size suffix

 mov x22, x2
 ^
signals.S:21:2: error: unknown use of instruction mnemonic without a size suffix
 mov x22, x2
 ^

 mov x20, x0
 ^

signals.S:20 mov x20, x0:
2 : signals.S^error: :unknown use of instruction mnemonic without a size suffix

20
 mov x20, x0 mov x21, x1:

 2^ : 
^error: unknown use of instruction mnemonic without a size suffix

 mov x21, x1
 ^signals.S
signals.S::2021::22: error: : unknown use of instruction mnemonic without a size suffix
error:  mov x22, x2
unknown use of instruction mnemonic without a size suffix ^

 mov x21, x1signals.Ssignals.S:
:20 21:^:22
: : error: error: unknown use of instruction mnemonic without a size suffixunknown use of instruction mnemonic without a size suffix
 mov x22, x2

  mov x21, x1^

 signals.S^:
21:2: error: unknown use of instruction mnemonic without a size suffix
 mov x22, x2
 ^signals.S
:21:2: error: unknown use of instruction mnemonic without a size suffix
 mov x22, x2
 ^
signals.S:24:2: error: unknown use of instruction mnemonic without a size suffixsignals.S
:24 add x0, x21, x22:
2 : ^error: 
unknown use of instruction mnemonic without a size suffix
 add x0, x21, x22
 ^
signals.S:25:signals.S14: :error: 25unknown token in expression:
14 add x0, x0, #15: signals.Ssignals.S
:error: : 2424:unknown token in expression :
2 add x0, x0, #15 2: 
error:  unknown use of instruction mnemonic without a size suffix:   error: 
unknown use of instruction mnemonic without a size suffix 
   add x0, x21, x22 
  add x0, x21, x22   ^
     
     ^ 
   ^^

signals.S:25signals.Ssignals.S:signals.S14:::: 262625error: :::unknown token in expression141414
: : error: : unknown token in expressionerror:  add x0, x0, #15error: 
unknown token in expression bic x0, x0, #15

 unknown token in expression 
 
    bic x0, x0, #15 add x0, x0, #15

                               ^    
     ^ 
     ^^signals.S

:26:14signals.S: :error: 26unknown token in expression:
14 bic x0, x0, #15: 
error:  unknown token in expression 
  bic x0, x0, #15signals.S 
     :  24 : 2signals.S:   : error: signals.S 27  unknown use of instruction mnemonic without a size suffix:
:  272^:   add x0, x21, x22:
2
: error:  unknown use of instruction mnemonic without a size suffix error: 
 ^unknown use of instruction mnemonic without a size suffix
 sub sp, sp, x0 

   sub sp, sp, x0^^


 ^
signals.S:28:2: signals.Serror: :unknown use of instruction mnemonic without a size suffix28
: add x23, sp, x222
:  error: signals.S^unknown use of instruction mnemonic without a size suffix

:signals.S add x23, sp, x2227signals.S::2
: :25 :error: 30^14
: :unknown use of instruction mnemonic without a size suffix10signals.S
signals.S sub sp, sp, x0:error: : unknown token in expression
 add x0, x0, #15
       :
30error: : 1027 unknown token in expression : :^
 ldr x0, =call_fmt2: error: 
unknown use of instruction mnemonic without a size suffix
 sub sp, sp, x0
  error: 
 unknown token in expression
^   ldr x0, =call_fmt
  signals.S 
  : ^ 
 28  :  2 signals.S: signals.S :^28
:error:  unknown use of instruction mnemonic without a size suffix:
26  add x23, sp, x222
: signals.S:  14^ :error: 31unknown use of instruction mnemonic without a size suffix:: 2
: ^

error: error: unknown token in expression add x23, sp, x22unknown use of instruction mnemonic without a size suffixsignals.S


: mov x1, x2130:10: error: unknown token in expression
 ldr x0, =call_fmt
         ^
signals.S:31:2: error: unknown use of instruction mnemonic without a size suffix
 mov x1, x21
 ^
signals.S:32:2: error: unknown use of instruction mnemonic without a size suffix
 mov x2, x23
 bic x0, x0, #15 ^
             ^
 ^
signals.S:27:
signals.Ssignals.S
2: :^: 
3133error: :unknown use of instruction mnemonic without a size suffixsignals.S
:22: sub sp, sp, x0signals.S: :: 30error: 
error: 32invalid instruction mnemonic 'bl':: unknown use of instruction mnemonic without a size suffix

210^ bl printf mov x1, x21: : error: 


error: unknown use of instruction mnemonic without a size suffixunknown token in expression
  
 mov x2, x23^^~ ldr x0, =call_fmt



 ^ 
 signals.S :signals.S :28 32:signals.S:signals.S : 2 : 23633: ^error: : unknown use of instruction mnemonic without a size suffixerror: ::

unknown use of instruction mnemonic without a size suffix2
2: :  add x23, sp, x22error:  mov x2, x23error: 
unknown use of instruction mnemonic without a size suffix
invalid instruction mnemonic 'bl' 
signals.S :^31
:^2 mov x0, x23
 bl printf

: 
 error:  ^^~

signals.S:30:10: error: unknown token in expression
 ldr x0, =call_fmtsignals.Ssignals.Ssignals.S:
:unknown use of instruction mnemonic without a size suffix37::36 :
2 2 mov x1, x21: :  
error: error:  unknown use of instruction mnemonic without a size suffix 
unknown use of instruction mnemonic without a size suffix 
^ mov x0, x23 
 mov x1, x20 

   ^ 
^^

33signals.S::signals.S237::: 232signals.Ssignals.S:error: 31: :::invalid instruction mnemonic 'bl'error: 2unknown use of instruction mnemonic without a size suffix38
:  bl printferror: 2
: mov x1, x20
unknown use of instruction mnemonic without a size suffix: 

error: 2 :   mov x1, x21unknown use of instruction mnemonic without a size suffix

^error: ~unknown use of instruction mnemonic without a size suffix

^ mov x2, x21 
 mov x2, x23
^

  ^^
signals.S
:signals.S36::signals.S382::: signals.Serror: 2unknown use of instruction mnemonic without a size suffix32:: signals.S
: mov x0, x2333
: 2error: :unknown use of instruction mnemonic without a size suffix2^: 39
:
: error:  mov x2, x212error: 
invalid instruction mnemonic 'bl': unknown use of instruction mnemonic without a size suffix 
error: ^ bl printfinvalid instruction mnemonic 'bl'


 bl memcpysignals.S

 mov x2, x23: 37^ ~

signals.S::^39 ~:2^: 
signals.S:51:2: error: invalid instruction mnemonic 'ldr'
 ldr x0, current
 ^~~
signals.S:33:2: error: invalid instruction mnemonic 'bl'
signals.S:52:2: error: unknown use of instruction mnemonic without a size suffix
 str x23, [x0]
 ^
2error:  bl printf
: unknown use of instruction mnemonic without a size suffixerror: 

 invalid instruction mnemonic 'bl'^ mov x1, x20
~
 bl memcpy 

signals.S^ 
^signals.S:~:
3654::22signals.Ssignals.S:signals.S36: :error: : unknown use of instruction mnemonic without a size suffix:
:251: :error: 38unknown use of instruction mnemonic without a size suffix mov x0, x23error: 
2:: 
unknown use of instruction mnemonic without a size suffix 
^2error:  mov sp, x23invalid instruction mnemonic 'ldr' mov x0, x23

 ldr x0, current: 

 
 error: ^ ^unknown use of instruction mnemonic without a size suffixsignals.S~:^~

37

 mov x2, x21:signals.S
2: : ^signals.S56
:error: :unknown use of instruction mnemonic without a size suffixsignals.S
5210 mov x1, x20::2: 
37 : error: :^error: unknown token in expressionsignals.S2
: unknown use of instruction mnemonic without a size suffix
:error: 
 mov x8, #1539
unknown use of instruction mnemonic without a size suffixsignals.S str x23, [x0]: 
 : 
382: mov x1, x202   : 
error:  : ^ invalid instruction mnemonic 'bl'^
error:  bl memcpyunknown use of instruction mnemonic without a size suffix


 
  mov x2, x21 ^
 signals.S ~^^:
signals.S

54::382:: 2signals.Ssignals.S:error: 51: :unknown use of instruction mnemonic without a size suffixsignals.S
:error: 57: mov sp, x2339
2 unknown use of instruction mnemonic without a size suffix::: ^error: 
invalid instruction mnemonic 'ldr' mov x2, x212
: 2
: 
error: signals.Sinvalid instruction mnemonic 'bl': 56^:error:  ldr x0, current


 bl memcpy10invalid instruction mnemonic 'svc' : 

^error:  ~^ svc #0unknown token in expression~~



  mov x8, #15signals.S^
: ~39 ~:
signals.Ssignals.S 2:: :error:  invalid instruction mnemonic 'bl' 
signals.S51:5264 : bl memcpy2:: 2
: : error: 2unknown use of instruction mnemonic without a size suffix:  error:   invalid instruction mnemonic 'ldr'error: 

invalid instruction mnemonic 'b'^ ldr x0, current^
 str x23, [x0]

~ 
^ b .signals.S
: 57^:~2

~signals.S
:  :error: ^invalid instruction mnemonic 'svc'51
signals.S
: svc #0:signals.S54
2 :^:: 52error: ~2:: invalid instruction mnemonic 'ldr'~2
error: 
: unknown use of instruction mnemonic without a size suffix ldr x0, currenterror: 
unknown use of instruction mnemonic without a size suffix
signals.S : mov sp, x2364
: str x23, [x0]^

2~ ~ : ^error: ^


invalid instruction mnemonic 'b'
 b .
signals.S :^56
signals.S:signals.S:10:52: 54error: ::unknown token in expression22
 mov x8, #15
     :  error:  unknown use of instruction mnemonic without a size suffix 
 ^ mov sp, x23

 ^
signals.S:57signals.S::256: :error: : 10invalid instruction mnemonic 'svc'error: : unknown use of instruction mnemonic without a size suffix
error: 
 svc #0 str x23, [x0]unknown token in expression

 
^  mov x8, #15^

~ ~ 
    signals.S : signals.S54 :^64:
2:: 2error: : unknown use of instruction mnemonic without a size suffixerror: 
invalid instruction mnemonic 'b' mov sp, x23
signals.S
 b . :
^57
 :^2
signals.S: error: invalid instruction mnemonic 'svc'
 svc #0
 ^~~
:56:10: error: unknown token in expression
signals.S mov x8, #15
:  64 :  2 :  error:   invalid instruction mnemonic 'b'^

 b .
 ^
signals.S:57:2: error: invalid instruction mnemonic 'svc'
 svc #0
 ^~~
signals.S:64:2: error: invalid instruction mnemonic 'b'
 b .
 ^
signals.S:17:2: error: unknown use of instruction mnemonic without a size suffix
 mov x29, sp
 ^
signals.S:19:2: error: unknown use of instruction mnemonic without a size suffix
 mov x20, x0
 ^
signals.S:20:2: error: unknown use of instruction mnemonic without a size suffix
 mov x21, x1
 ^
signals.S:21:2: error: unknown use of instruction mnemonic without a size suffix
 mov x22, x2
 ^
signals.S:24:2: error: unknown use of instruction mnemonic without a size suffix
 add x0, x21, x22
 ^
signals.S:25:14: error: unknown token in expression
 add x0, x0, #15
             ^
signals.S:26:14: error: unknown token in expression
 bic x0, x0, #15
             ^
signals.S:27:2: error: unknown use of instruction mnemonic without a size suffix
 sub sp, sp, x0
 ^
signals.S:28:2: error: unknown use of instruction mnemonic without a size suffix
 add x23, sp, x22
 ^
signals.S:30:10: error: unknown token in expression
 ldr x0, =call_fmt
         ^
signals.S:31:2: error: unknown use of instruction mnemonic without a size suffix
 mov x1, x21
 ^
signals.S:32:2: error: unknown use of instruction mnemonic without a size suffix
 mov x2, x23
 ^
signals.S:33:2: error: invalid instruction mnemonic 'bl'
 bl printf
 ^~
signals.S:36:2: error: unknown use of instruction mnemonic without a size suffix
 mov x0, x23
 ^
signals.S:37:2: error: unknown use of instruction mnemonic without a size suffix
 mov x1, x20
 ^
signals.S:38:2: error: unknown use of instruction mnemonic without a size suffix
 mov x2, x21
 ^
signals.S:39:2: error: invalid instruction mnemonic 'bl'
 bl memcpy
 ^~
signals.S:51:2: error: invalid instruction mnemonic 'ldr'
 ldr x0, current
 ^~~
signals.S:52:2: error: unknown use of instruction mnemonic without a size suffix
 str x23, [x0]
 ^
signals.S:54:2: error: unknown use of instruction mnemonic without a size suffix
 mov sp, x23
 ^
signals.S:56:10: error: unknown token in expression
 mov x8, #15
         ^
signals.S:57:2: error: invalid instruction mnemonic 'svc'
 svc #0
 ^~~
signals.S:64:2: error: invalid instruction mnemonic 'b'
 b .
 ^
signals.S:17:2: error: unknown use of instruction mnemonic without a size suffix
 mov x29, sp
 ^
signals.S:24:2: error: unknown use of instruction mnemonic without a size suffix
 add x0, x21, x22
 signals.S^:
19:2: error: unknown use of instruction mnemonic without a size suffix
 mov x20, x0
 ^
signals.S:25:14: error: unknown token in expression
signals.S add x0, x0, #15:
20  :  2 :  error:  unknown use of instruction mnemonic without a size suffix 
   mov x21, x1 
   ^^

signals.S:26:14: error: unknown token in expression
 bic x0, x0, #15signals.S
 : 21  : 2 :  error:  unknown use of instruction mnemonic without a size suffix  
   mov x22, x2 
^ 
^
signals.S:24:2: error: signals.Sunknown use of instruction mnemonic without a size suffix:
27: add x0, x21, x222
: error: unknown use of instruction mnemonic without a size suffix
 sub sp, sp, x0
 ^
signals.S:28:2: error: unknown use of instruction mnemonic without a size suffix
 add x23, sp, x22
 ^
 ^signals.S
:30:10: error: unknown token in expression
 ldr x0, =call_fmt
    signals.S : 25 :14: error: unknown token in expression
 add x0, x0, #15
             ^
signals.S:26:14: error: unknown token in expression
 bic x0, x0, #15
             ^
  ^
signals.S:27:2: error: unknown use of instruction mnemonic without a size suffix
 sub sp, sp, x0
 ^
signals.S:28:2: error: unknown use of instruction mnemonic without a size suffixsignals.S
: add x23, sp, x22
31 :^2
: error: unknown use of instruction mnemonic without a size suffix
signals.S: mov x1, x2130
: 10^: 
error: unknown token in expression
 ldr x0, =call_fmt
     signals.S : 32 :2 : ^error: 
unknown use of instruction mnemonic without a size suffix
 mov x2, x23
 ^
signals.S:33:2: error: invalid instruction mnemonic 'bl'
 bl printf
 ^~
signals.S:31:2signals.S: :error: 36unknown use of instruction mnemonic without a size suffix:
2:  mov x1, x21error: unknown use of instruction mnemonic without a size suffix

  mov x0, x23^

 ^
signals.S:37:2: error: unknown use of instruction mnemonic without a size suffix
 mov x1, x20
signals.S :^
32:2: error: unknown use of instruction mnemonic without a size suffix
 mov x2, x23
 signals.S^:
38:2: error: unknown use of instruction mnemonic without a size suffix
 mov x2, x21
 ^
signals.S:33:2: error: invalid instruction mnemonic 'bl'
 bl printf
 ^~
signals.S:36:2: error: unknown use of instruction mnemonic without a size suffix
 mov x0, x23
 ^
signals.S:37:2: error: unknown use of instruction mnemonic without a size suffix
 mov x1, x20
 ^
signals.S:38:2: error: unknown use of instruction mnemonic without a size suffix
 mov x2, x21
 ^
signals.S:39:2: error: invalid instruction mnemonic 'bl'
 bl memcpy
 ^~
signals.S:51:2: error: invalid instruction mnemonic 'ldr'
 ldr x0, current
 ^~~
signals.S:52:2: error: unknown use of instruction mnemonic without a size suffix
 str x23, [x0]
 ^
signals.S:54:2: error: unknown use of instruction mnemonic without a size suffixsignals.S
: mov sp, x2339
: 2^: 
error: invalid instruction mnemonic 'bl'
 bl memcpy
 signals.S^:~
56:10: error: unknown token in expression
 mov x8, #15
       signals.S : 51^:2
: error: invalid instruction mnemonic 'ldr'
 ldr x0, current
 ^~signals.S~:
57:2: error: invalid instruction mnemonic 'svc'
 svc #0
 ^~~
signals.S:52:2: error: unknown use of instruction mnemonic without a size suffix
 str x23, [x0]signals.S
: 64^:
2: error: invalid instruction mnemonic 'b'
 b .
 ^
signals.S:54:2: error: unknown use of instruction mnemonic without a size suffix
 mov sp, x23
 ^
signals.S:56:10: error: unknown token in expression
 mov x8, #15
         ^
signals.S:57:2: error: invalid instruction mnemonic 'svc'
 svc #0
 ^~~
signals.S:64:2: error: invalid instruction mnemonic 'b'
 b .
 ^
sve_helpers.c:13:18: error: use of undeclared identifier 'SVE_VQ_MAX'
   13 | unsigned int vls[sve_helpers.cSsve_helpers.c:V:E_VQ13_:13M18:A:X18 ]error: :;use of undeclared identifier 'SVE_VQ_MAX' 

error:       use of undeclared identifier 'SVE_VQ_MAX'| 
                 ^~~~~~~~~~
      1313 |  | uunnssiiggnneedd  iinntt  vvllss[[SSVVEE__VVQQ__MMAAXX]];;

            | |                  ^~~~~~~~~~                 ^~~~~~~~~~

sve_helpers.c:13:18: error: use of undeclared identifier 'SVE_VQ_MAX'
   13 | unsigned int vls[SVE_VQ_MAX];
      |                  ^~~~~~~~~~
sve_helpers.csve_helpers.c:25::2512::12 :error:  use of undeclared identifier 'SVE_VQ_MAX'error: 
use of undeclared identifier 'SVE_VQ_MAX'
      2525 |  |                 ffoorr  ((vvqq  ==  SSVVEE__VVQQ__MMAAXX;;  vvqq  >>  00;;  ----vvqq))  {{

            | |                   ^~~~~~~~~~                  ^~~~~~~~~~

sve_helpers.c:25:12: error: use of undeclared identifier 'SVE_VQ_MAX'
   25 |         for (vq = SVE_VQ_MAX; vq > 0; --vq) {
      |                   ^~~~~~~~~~
sve_helpers.c:25:12: error: use of undeclared identifier 'SVE_VQ_MAX'
   25 |         for (vq = SVE_VQ_MAX; vq > 0; --vq) {
      |                   ^~~~~~~~~~
sve_helpers.c:41:12: error: call to undeclared function 'sve_vq_from_vl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   41 |                 if (vq < sve_vq_from_vl(vl))
      |                          ^
sve_helpers.c:41:12: error: call to undeclared function 'sve_vq_from_vl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   41 |                 if (vq < sve_vq_from_vl(vl))
      |                          ^
sve_helpers.c:13:18: error: use of undeclared identifier 'SVE_VQ_MAX'
   13 | unsigned int vls[SVE_VQ_MAX];
      |                  ^~~~~~~~~~
sve_helpers.c:41:12: error: call to undeclared function 'sve_vq_from_vl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   41 |                 if (vq < sve_vsve_helpers.cq_:from_v13l:(18v:l )error: )use of undeclared identifier 'SVE_VQ_MAX'

      |                          ^
   13 | unsigned int vls[SVE_VQ_MAX];
      |                  ^~~~~~~~~~
3 errors generated.
3 errors generated.
sve_helpers.c:13:18sve_helpers.c:: error: 13:use of undeclared identifier 'SVE_VQ_MAX'18:
 error: use of undeclared identifier 'SVE_VQ_MAX'
      1313 |  | uunnssiiggnneedd  iinntt  vvllss[[SSVVEE__VVQQ__MMAAXX]];;

            | |                  ^~~~~~~~~~                 ^~~~~~~~~~

sve_helpers.c:41:12: error: call to undeclared function 'sve_vq_from_vl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   41 |                 if (vq < sve_vq_from_vl(vl))
      |                          ^
3 errors generated.
sve_helpers.c:25:12: error: use of undeclared identifier 'SVE_VQ_MAX'
   25 |         for (vq = SVE_VQ_MAX; vq > 0; --vq) {
      |                   ^~~~~~~~~~
sve_helpers.c:25:12: error: use of undeclared identifier 'SVE_VQ_MAX'
   25 |         for (vq = SVE_VQ_MAX; vq > 0; --vq) {
      |                   ^~~~~~~~~~
3 errors generated.
sve_helpers.c:sve_helpers.c25::2512::12 :error:  use of undeclared identifier 'SVE_VQ_MAX'error: 
use of undeclared identifier 'SVE_VQ_MAX'
      2525 |  |                 ffoorr  ((vvqq  ==  SSVVEE__VVQQ__MMAAXX;;  vvqq  >>  00;;  ----vvqq))  {{

            | |                   ^~~~~~~~~~                  ^~~~~~~~~~

sve_helpers.c:41:12: error: call to undeclared function 'sve_vq_from_vl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   41 |                 if (vq < sve_vq_from_vl(vl))
      |                          ^
sve_helpers.c:41:12: error: call to undeclared function 'sve_vq_from_vl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   41 |                 if (vq < sve_vq_from_vl(vl))
      |                          ^
3 errors generated.
3 errors generated.
sve_helpers.c:41:12: error: call to undeclared function 'sve_vq_from_vl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   41 |                 if (vq < sve_vq_from_vl(vl))sve_helpers.c:41:12: error: call to undeclared function 'sve_vq_from_vl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   41 |                 if (vq < sve_vq_from_vl(vl))
      |                          ^

      |                          ^
33 errors generated.
 errors generated.

=====================================================


# Builds where the incident occurred:

## defconfig+arm64-chromebook+kselftest on (arm64):
- compiler: clang-21
- config: None
- dashboard: https://d.kernelci.org/build/maestro:69d51ce9dcae953c056f95b8


#kernelci issue maestro:8c89db6682c0d5b29725a23216a9f033a9cc5a5e

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
