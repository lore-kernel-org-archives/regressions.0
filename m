Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1D9274FDC
	for <regressions@lists.linux.dev>; Mon,  6 Apr 2026 21:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775512750; cv=none; b=WoI1has96f/EyZNiR1jCiAMyh/8E5e07iIpAoG1AHwJxNOHp4bPIFn6D4HAOf1G27uWajc3W0E6tXvSJ1e6ktHGEKdyMQ/wgy403KoAn3tVBpmXiRU1yY6YhKaHboaF8353ur13pJecCZEmwLqGsgHla6YGSm/oLByEdiUk1zes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775512750; c=relaxed/simple;
	bh=DvDwwyJoeEabhVtWAPveLDjeBkkoPCkf8NhGgWkFdOw=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=qsLwjxiEKsqOYkxUnodygU+r0UFuwvg+NilOqOPnofnUWz9h2cnnjSm5x0cbEb2FpHsRjuhzb11oVFxPbOK5UPDsDfDehNLxzHdTQKzPGFZrISTsfZImfgFnBUKBNzB1CBYCegjIfywZbtx0dIyE6/NPX9rMSVu73RQeUSez4/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20251104.gappssmtp.com header.i=@kernelci-org.20251104.gappssmtp.com header.b=hZqi8hBu; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20251104.gappssmtp.com header.i=@kernelci-org.20251104.gappssmtp.com header.b="hZqi8hBu"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2c56aa62931so9366512eec.0
        for <regressions@lists.linux.dev>; Mon, 06 Apr 2026 14:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20251104.gappssmtp.com; s=20251104; t=1775512745; x=1776117545; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0+VRRpzCKb+3H5cc/vpU3H8WxK3wrABzuH3XSkEv/sg=;
        b=hZqi8hBu83vbkmIMkhzGCtje88ZRGd9jI7rWJ0TbIFlYp6tDy+eb+/cKFwA45/f49u
         LeHVs4kuMLolAHQb3G+/xQ677W4GmMlkuAb8cJclucw/r1Nws4hLrc/VfAM6JMOeJhwF
         6gtNe6vkugIE/ym6W4aZ3bL9tDxkakEiNOH1j78zgOSartDye2FzPwCsto/n0IH/hw2X
         pVD2bc2kpXrMEtcKjfV+3b15cKVJ3LcVZwgJ7ynB2zak+SZMcqGodGEfCG79RJhAlive
         FFS92qc6GmDD7GsO7Dw9jWuf09U+GXR7PK4EnQh+i2KRJ8o+P2ryaE82s9qPhwi+bPlg
         UsbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775512745; x=1776117545;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0+VRRpzCKb+3H5cc/vpU3H8WxK3wrABzuH3XSkEv/sg=;
        b=LvnPkm8dtlTcbyi2k75pHMi4UoHzPr2OmbPA1AXxS3uTyAHeSgUjy0M3ivQgllT16O
         J9KFnkb+H2SQGjOx/OZktmQwllmMh9hgLEf7WhBgJyWZ/F0lvr5iuWBBeLGoCBrLFWG4
         rdgaaWINxF5dZMaPEQrD//l7sfwfZHVKIHfV5C3gFc/T0nVOzzJPtH6Pu1zxUssjE7Qe
         7y5cURx09F3E5zXqTRW729zd1OZMIAW6X4xNRb1+zjhgVNs/NBZCd9MLWUoH+tzR5uKP
         fQrt5WxQlg7ZiUMJG2d6d0Ou+A/yqdtBOLBqagLpufsWgpaIRIKqdvyYSE704yADm18u
         GCNw==
X-Gm-Message-State: AOJu0YxC6HGyzcnkWTTNaZ3pNzOCqNsMHgqpZwJzwevsqrHHWQbtDJDv
	66unIs87Fa5U4iAfZoW55YnW3ShkUUCi1V/U5tZacla82yt1qqrVleYbjYSpM1pu9B4=
X-Gm-Gg: AeBDiesO+a9YbxYOAKEbGLqY8in9jn20ZHT5w6xcvBUKvN1BUbWhUo1Hw9o1FoQC0hw
	lObM6ceCzMkBNyZaGCmXumGvldYVn3PqxbhQ2+pgMujyvUl/TlfGu2cMxMhAvrpLqMBbvQKN5xp
	kkiMA1h/i7B47hxk9+t+vGJtw1KKYB0/fXEWNpl9vI2LFlxlMPbJznzfQkiuO/I4Lo9Qdpt61yX
	X4hzPSBHpd5ylfUZFd5doh5v500hmzjlJBOwrUzZ2M2VMQ89tjnxBHkGN6TD5bA9DRa/bHg3PUm
	S+lYWScqNNTFgtlSW24SlgX8zwStiCs3EP+9viLveN7U4341JVa6fsJX9JWAPTSV99/dqn566/d
	0agAg8f88i+z257PySI6FGldctlthc8ZIhLJimspWzUGVgavudD69Lw+jtP+tyi8Ptw+VO0X2aE
	HzUlHJUYY0WCfaVK3G
X-Received: by 2002:a05:7300:f589:b0:2d1:a3ea:d8cb with SMTP id 5a478bee46e88-2d1a3eaeb30mr33260eec.4.1775512744625;
        Mon, 06 Apr 2026 14:59:04 -0700 (PDT)
Received: from 8692ffc4d55e ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7c20c0c2sm14495131eec.17.2026.04.06.14.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 14:59:03 -0700 (PDT)
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
Date: Mon, 06 Apr 2026 21:59:03 -0000
Message-ID: <177551274342.2091.11408021395894546995@8692ffc4d55e>





Hello,

New build issue found on next/master:

---
 ./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found in testcases/fake_sigreturn_misaligned_sp (testcases/fake_sigreturn_misaligned_sp.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:914cbb905f3bdc6704f58e8fddef408bafdb622e
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  816f193dd0d95246f208590924dd962b192def78
- tags: next-20260406

Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================
In file included from testcases/fake_sigreturn_misaligned_sp.c:13:
In file included from ./test_signals_utils.h:14:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
   15 | #include <asm/hwcap.h>
      |          ^~~~~~~~~~~~~
In file included from testcases/fake_sigreturn_bad_size.c:13:
In file included from ./test_signals_utils.h:14:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
   15 | #include <asm/hwcap.h>
      |          ^~~~~~~~~~~~~
1 error generated.
In file included from testcases/fake_sigreturn_missing_fpsimd.c:14:
In file included from ./test_signals_utils.h:14:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
   15 | #include <asm/hwcap.h>
      |          ^~~~~~~~~~~~~
1 error generated.
1 error generated.
1 error generated.
1 error generated.
In file included from testcases/fake_sigreturn_sve_change_vl.c:14:
In file included from ./test_signals_utils.h:14:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
   15 | #include <asm/hwcap.h>
      |          ^~~~~~~~~~~~~
1 error generated.
In file included from testcases/fake_sigreturn_bad_magic.c:13:
In file included from ./test_signals_utils.h:14:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
   15 | #include <asm/hwcap.h>
      |          ^~~~~~~~~~~~~
In file included from test_signals.c:16:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
   15 | #include <asm/hwcap.h>
      |          ^~~~~~~~~~~~~
1 error generated.
1 error generated.
In file included from test_signals.c:16:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
   15 | #include <asm/hwcap.h>
      |          ^~~~~~~~~~~~~
In file included from testcases/fake_sigreturn_sme_change_vl.c:14:
In file included from ./test_signals_utils.h:14:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
   15 | #include <asm/hwcap.h>
      |          ^~~~~~~~~~~~~
1 error generated.
1 error generated.
In file included from test_signals.c:16:
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
11 error generated.
 error generated.
In file included from test_signals.c:16:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
   15 | #include <asm/hwcap.h>
      |          ^~~~~~~~~~~~~
1 error generated.
In file included from test_signals_utils.c:18:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
   15 | #include <asm/hwcap.h>
      |          ^~~~~~~~~~~~~
In file included from test_signals.c:16:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
   15 | #include <asm/hwcap.h>
      |          ^~~~~~~~~~~~~
1 error generated.
In file included from test_signals_utils.c:18:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
   15 | #include <asm/hwcap.h>
      |          ^~~~~~~~~~~~~
1 error generated.
In file included from test_signals.c:16:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
   15 | #include <asm/hwcap.h>
      |          ^~~~~~~~~~~~~
1 error generated.
In file included from test_signals_utils.c:18:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
   15 | #include <asm/hwcap.h>
      |          ^~~~~~~~~~~~~
In file included from test_signals_utils.c:18:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
   15 | #include <asm/hwcap.1 error generated.
h>
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
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:40:8: error: redefinition of '_fpx_sw_bytes'
   40 | struct _fpx_sw_bytes {
      |        ^
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:31:8: note: previous definition is here
   31 | struct _fpx_sw_bytes
      |        ^
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:85:8: error: redefinition of '_fpreg'
   85 | struct _fpreg {
      |        ^
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:40:8: note: previous definition is here
   40 | struct _fpreg
      |        ^
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:91:8: error: redefinition of '_fpxreg'
   91 | struct _fpxreg {
      |        ^
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:46:8: note: previous definition is here
   46 | struct _fpxreg
      |        ^
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:98:8: error: redefinition of '_xmmreg'
   98 | struct _xmmreg {
      |        ^
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:53:8: note: previous definition is here
   53 | struct _xmmreg
      |        ^
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:180:8: error: redefinition of '_ymmh_state'
  180 | struct _ymmh_state {
      |        ^
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:184:8: note: previous definition is here
  184 | struct _ymmh_state
      |        ^
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:192:8: error: redefinition of '_xstate'
  192 | struct _xstate {
      |        ^
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:189:8: note: previous definition is here
  189 | struct _xstate
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
testcases/testcases.h:101:25: error: invalid application of 'sizeof' to an incomplete type 'struct _aarch64_ctx'
  101 |         if (!head || resv_sz < HDR_SZ)
      |                                ^~~~~~
testcases/testcases.h:28:2: note: expanded from macro 'HDR_SZ'
   28 |         sizeof(struct _aarch64_ctx)
      |         ^     ~~~~~~~~~~~~~~~~~~~~~
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_ctx'
   95 | static inline struct _aarch64_ctx *get_header(struct _aarch64_ctx *head, uint32_t magic,
      |                      ^
testcases/testcases.h:104:27: error: invalid application of 'sizeof' to an incomplete type 'struct _aarch64_ctx'
  104 |         while (offs <= resv_sz - HDR_SZ &&
      |                                  ^~~~~~
testcases/testcases.h:28:2: note: expanded from macro 'HDR_SZ'
   28 |         sizeof(struct _aarch64_ctx)
      |         ^     ~~~~~~~~~~~~~~~~~~~~~
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_ctx'
In file included from    testcases/testcases.c95: | sta7t:
iIn file included from ctestcases/testcases.h :i15n:
li/usr/include/x86_64-linux-gnu/asm/sigcontext.hn:e40 :s8t:r uerror: ctredefinition of '_fpx_sw_bytes' 
_aarch64_ctx *get_header(struct _   a40a | rscthr6u4c_tc t_xf p*xh_esawd_,b yutienst 3{2
_      t|         ^m
agic,
      |                      ^
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:31testcases/testcases.h::8105:: 13note: :previous definition is here 
error: incomplete definition of type 'struct _aarch64_ctx'
   31 | st  r105u | c        t   _     head->magic != magic && headf-p>xm_asgwi_cb)y t{e
s      
|                      ~~~~^| 
       ^
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_ctx'
   95 | static inline struct _aarch64_ctx *get_header(struct _aarch64_ctx *heIn file included from atestcases/testcases.cd:,7 :
uIn file included from itestcases/testcases.hn:t153:
2/usr/include/x86_64-linux-gnu/asm/sigcontext.h_:t85 :m8a:g ierror: credefinition of '_fpreg',

      |                      ^
   85 | struct _fpreg {testcases/testcases.h
:      105| :       ^37
: error: incomplete definition of type 'struct _aarch64_ctx'
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:40:8: note: previous definition is here
     10540 |  |         s t r u c t   _hfeparde-g>
m      a| g       ^i
c != magic && head->magic) {
      |                                        ~~~~^
In file included from testcases/testcases.htestcases/testcases.c::957::
22In file included from :testcases/testcases.h :note: 15forward declaration of 'struct _aarch64_ctx':

/usr/include/x86_64-linux-gnu/asm/sigcontext.h:91:8: error: redefinition of '_fpxreg'
      9195 |  | ssttrautcitc  _ifnplxirneeg  s{t
r      u| c       ^t
 _aa/usr/include/x86_64-linux-gnu/bits/sigcontext.hr:c46h:684:_ cnote: tprevious definition is herex
 *ge   t46_ | hsetarduecrt( s_tfrpuxcrte g_
a      a| r       ^c
h64_ctx *head, uint32_t magic,
      |                      ^
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:98:8: error: redefinition of '_xmmreg'
testcases/testcases.h   :98106 | :s15t:r uerror: cincomplete definition of type 'struct _aarch64_ctx't
 _xmmre  g106  | {        
              o| f       ^f
s +=/usr/include/x86_64-linux-gnu/bits/sigcontext.h :h53e:a8d:- >note: sprevious definition is herei
ze;
         | 53                        ~~~~^ | 
structestcases/testcases.ht: 95_:x22m:m rnote: eforward declaration of 'struct _aarch64_ctx'g

      |        ^
   95 | static inline struct _aarch64_ctx *get_header(struct _aarch64_ctx *head, uint32_t magic,
      |                      ^
testcases/testcases.h:107:10: error: incomplete definition of type 'struct _aarch64_ctx'
  107 |                 head = GET_RESV_NEXT_HEAD(head);
      |                        ^~~~~~~~~~~~~~~~~~~~~~~~
testcases/testcases.h:85:43: note: expanded from macro 'GET_RESV_NEXT_HEAD'
   85 |         (struct _aarch64_ctx *)((char *)(h) + (h)->size)
      |                                               ~~~^
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_ctx'
   95 | static inline struct _aarch64_ctxIn file included from  *testcases/testcases.cg:e7t:
_In file included from htestcases/testcases.he:a15d:
e/usr/include/x86_64-linux-gnu/asm/sigcontext.hr:(180s:t8r:u cerror: tredefinition of '_ymmh_state' 
_aarch64_  ct180x |  s*threuacdt,  u_iynmtm3h2__stt amtaeg i{c
,      
|              ^| 
                     ^
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:184:8: note: previous definition is here
  184 | struct _ymmh_state
      |        ^
testcases/testcases.h:109:10: error: incomplete definition of type 'struct _aarch64_ctx'
In file included from testcases/testcases.c:7:
  In file included from 109testcases/testcases.h | :        15i:
f/usr/include/x86_64-linux-gnu/asm/sigcontext.h :(192h:e8a:d -error: >redefinition of '_xstate'm
agic   =192= |  smtarguicct)  _{x
s      t| a            ~~~~^t
e {
      | testcases/testcases.h       ^:
95:22:/usr/include/x86_64-linux-gnu/bits/sigcontext.h :note: 189forward declaration of 'struct _aarch64_ctx':
8: note: previous definition is here
  189 |    s95t | rsutcatt i_cx sitnaltien
e       | s       ^t
ruct _aarch64_ctx *get_header(struct _aarch64_ctx *head, uint32_t magic,
      |                      ^
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:317:8: error: redefinition of 'sigcontext'
  317 | strtestcases/testcases.huc:t129 :s7i:g cerror: oincomplete definition of type 'struct _aarch64_ctx'n
text {
      |        ^
  129 |         /usr/include/x86_64-linux-gnu/bits/sigcontext.h        :t139a:i8l:- >note: mprevious definition is herea
gic =   0139; | 
s      t| r                ~~~~^u
ct sigtestcases/testcases.hc:o95n:t22e:x tnote: 
forward declaration of 'struct _aarch64_ctx'      
|        ^
   95 | static inline struct _aarch64_ctx *get_header(struct _aaIn file included from testcases/testcases.c:7:
testcases/testcases.h:101:25: error: invalid application of 'sizeof' to an incomplete type 'struct _aarch64_ctx'
  101 |         if (!head || resv_sz < HDR_SZ)
      |                                ^~~~~~
testcases/testcases.h:28:2: note: expanded from macro 'HDR_SZ'
   28 |         sizeof(struct _aarch64_ctx)
      |         ^     ~~~~~~~~~~~~~~~~~~~~~
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_ctx'
   95 | static inline struct _aarch64_ctx *get_header(struct _aarch64_ctx *head, uint32_t magic,
      |                      ^
testcases/testcases.h:104:27: error: invalid application of 'sizeof' to an incomplete type 'struct _aarch64_ctx'
  104 |         while (offs <= resv_sz - HDR_SZ &&
      |                                  ^~~~~~
testcases/testcases.h:28:2: note: expanded from macro 'HDR_SZ'
   28 |         sizeof(struct _aarch64_ctx)
      |         ^     ~~~~~~~~~~~~~~~~~~~~~
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_ctx'
   95 | static inline struct _aarch64_ctx *get_header(struct _aarch64_ctx *head, uint32_t magic,
      |                      ^
testcases/testcases.h:105:13: error: incomplete definition of type 'struct _aarch64_ctx'
  105 |                head->magic != magic && head->magic) {
      |                ~~~~^
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_ctx'
   95 | static inline struct _aarch64_ctx *get_header(struct _aarch64_ctx *head, uint32_t magic,
      |                      ^
testcases/testcases.h:105:37: error: incomplete definition of type 'struct _aarch64_ctx'
  105 |                head->magic != magic && head->magic) {
      |                                        ~~~~^
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_ctx'
   95 | static inline struct _aarch64_ctx *get_header(struct _aarch64_ctx *head, uint32_t magic,
      |                      ^
testcases/testcases.h:106:15: error: incomplete definition of type 'struct _aarch64_ctx'
  106 |                 offs += head->size;
      |                         ~~~~^
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_ctx'
   95 | static inline struct _aarch64_ctx *get_header(struct _aarch64_ctx *head, uint32_t magic,
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
rch64_ctx *head, uint32_t magic,
      |                      ^
testcases/testcases.h:130:7: error: incomplete definition of type 'struct _aarch64_ctx'
  130 |                 tail->size = 0;
      |                 ~~~~^
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_ctx'
   95 | static inline struct _aarch64_ctx *get_header(struct _aarch64_ctx *head, uint32_t magic,
      |                      ^
In file included from test_signals_utils.c:18:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
   15 | #include <asm/hwcap.h>
      |          ^~~~~~~~~~~~~
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:40:8: error: redefinition of '_fpx_sw_bytes'
   40 | struct _fpx_sw_bytes {
      |        ^
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:31:8: note: previous definition is here
   31 | struct _fpx_sw_bytes
      |        ^
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:85:8: error: redefinition of '_fpreg'
   85 | struct _fpreg {
      |        ^
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:40:8: note: previous definition is here
   40 | struct _fpreg
      |        ^
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:91:8: error: redefinition of '_fpxreg'
   91 | struct _fpxreg {
      |        ^
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:46:8: note: previous definition is here
   46 | struct _fpxreg
      |        ^
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:98:8: error: redefinition of '_xmmreg'
   98 | struct _xmmreg {
      |        ^
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:53:8: note: previous definition is here
   53 | struct _xmmreg
      |        ^
In file included from test_signals_utils.c:18:
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found
   15 | #include <asm/hwcap.h>
      |          ^~~~~~~~~~~~~
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:180:8: error: redefinition of '_ymmh_state'
  180 | struct _ymmh_state {
      |        ^
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:184:8: note: previous definition is here
  184 | struct _ymmh_state
      |        ^
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:192:8: error: redefinition of '_xstate'
  192 | struct _xstate {
      |        ^
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:189:8: note: previous definition is here
  189 | struct _xstate
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
testcases/testcases.h:101:25: error: invalid application of 'sizeof' to an incomplete type 'struct _aarch64_ctx'
  101 |         if (!head || resv_sz < HDR_SZ)
      |                                ^~~~~~
testcases/testcases.h:28:2: note: expanded from macro 'HDR_SZ'
   28 |         sizeof(struct _aarch64_ctx)
      |         ^     ~~~~~~~~~~~~~~~~~~~~~
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_ctx'
   95 | static inline struct _aarch64_ctx *get_header(struct _aarch64_ctx *head, uint32_t magic,
      |                      ^
testcases/testcases.h:104:27: error: invalid application of 'sizeof' to an incomplete type 'struct _aarch64_ctx'
  104 |         while (offs <= resv_sz - HDR_SZ &&
      |                                  ^~~~~~
testcases/testcases.h:28:2: note: expanded from macro 'HDR_SZ'
   28 |         sizeof(struct _aarch64_ctx)
      |         ^     ~~~~~~~~~~~~~~~~~~~~~
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_ctx'
   95 | static inline struct _aarch64_ctx *get_header(struct _aarch64_ctx *head, uint32_t magic,
      |                      ^
testcases/testcases.h:105:13: error: incomplete definition of type 'struct _aarch64_ctx'
  105 |                head->magic != magic && head->magic) {
      |                ~~~~^
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_ctx'
   95 | static inline struct _aarch64_ctx *get_header(struct _aarch64_ctx *head, uint32_t magic,
      |                      ^
testcases/testcases.h:105:37: error: incomplete definition of type 'struct _aarch64_ctx'
  105 |                head->magic != magic && head->magic) {
      |                                        ~~~~^
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_ctx'
   95 | static inline struct _aarch64_ctx *get_header(struct _aarch64_ctx *head, uint32_t magic,
      |                      ^
testcases/testcases.h:106:15: error: incomplete definition of type 'struct _aarch64_ctx'
  106 |                 offs += head->size;
      |                         ~~~~^
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_ctx'
   95 | static inline struct _aarch64_ctx *get_header(struct _aarch64_ctx *head, uint32_t magic,
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
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:40:8: error: redefinition of '_fpx_sw_bytes'
   40 | struct _fpx_sw_bytes {
      |        ^
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:31:8: note: previous definition is here
   31 | struct _fpx_sw_bytes
      |        ^
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:85:8: error: redefinition of '_fpreg'
   85 | struct _fpreg {
      |        ^
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:40:8: note: previous definition is here
   40 | struct _fpreg
      |        ^
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:91:8: error: redefinition of '_fpxreg'
   91 | struct _fpxreg {
      |        ^
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:46:8: note: previous definition is here
   46 | struct _fpxreg
      |        ^
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:98:8: error: redefinition of '_xmmreg'
   98 | struct _xmmreg {
      |        ^
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:53:8: note: previous definition is here
   53 | struct _xmmreg
      |        ^
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:180:8: error: redefinition of '_ymmh_state'
  180 | struct _ymmh_state {
      |        ^
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:184:8: note: previous definition is here
  184 | struct _ymmh_state
      |        ^
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:192:8: error: redefinition of '_xstate'
  192 | struct _xstate {
      |        ^
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:189:8: note: previous definition is here
  189 | struct _xstate
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
testcases/testcases.h:101:25: error: invalid application of 'sizeof' to an incomplete type 'struct _aarch64_ctx'
  101 |         if (!head || resv_sz < HDR_SZ)
      |                                ^~~~~~
testcases/testcases.h:28:2: note: expanded from macro 'HDR_SZ'
   28 |         sizeof(struct _aarch64_ctx)
      |         ^     ~~~~~~~~~~~~~~~~~~~~~
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_ctx'
   95 | static inline struct _aarch64_ctx *get_header(struct _aarch64_ctx *head, uint32_t magic,
      |                      ^
testcases/testcases.h:104:27: error: invalid application of 'sizeof' to an incomplete type 'struct _aarch64_ctx'
  104 |         while (offs <= resv_sz - HDR_SZ &&
      |                                  ^~~~~~
testcases/testcases.h:28:2: note: expanded from macro 'HDR_SZ'
   28 |         sizeof(struct _aarch64_ctx)
      |         ^     ~~~~~~~~~~~~~~~~~~~~~
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_ctx'
   95 | static inline struct _aarch64_ctx *get_header(struct _aarch64_ctx *head, uint32_t magic,
      |                      ^
testcases/testcases.h:105:13: error: incomplete definition of type 'struct _aarch64_ctx'
  105 |                head->magic != magic && head->magic) {
      |                ~~~~^
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_ctx'
   95 | static inline struct _aarch64_ctx *get_header(struct _aarch64_ctx *head, uint32_t magic,
      |                      ^
testcases/testcases.h:105:37: error: incomplete definition of type 'struct _aarch64_ctx'
  105 |                head->magic != magic && head->magic) {
      |                                        ~~~~^
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_ctx'
   95 | static inline struct _aarch64_ctx *get_header(struct _aarch64_ctx *head, uint32_t magic,
      |                      ^
testcases/testcases.h:106:15: error: incomplete definition of type 'struct _aarch64_ctx'
  106 |                 offs += head->size;
      |                         ~~~~^
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_ctx'
   95 | static inline struct _aarch64_ctx *get_header(struct _aarch64_ctx *head, uint32_t magic,
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
   95 | static inline struct _aarch64_ctx *get_header(struct _aarch64_ctx *head, uiIn file included from nttestcases/testcases.c32:_1t error7  generated:
mIn file included from a.
testcases/testcases.hg:i15c:
,
/usr/include/x86_64-linux-gnu/asm/sigcontext.h      :| 40                     ^:
8: error: redefinition of '_fpx_sw_bytes'
   40 | struct _fpx_sw_bytes {
      |        ^
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:31:8: note: previous definition is here
   31 | struct _fpx_sw_bytes
      |        ^
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:85:8: error: redefinition of '_fpreg'
   85 | struct _fpreg {
      |        ^
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:40:8: note: previous definition is here
   40 | struct _fpreg
      |        ^
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:91:8: error: redefinition of '_fpxreg'
testcases/testcases.h   91: | 129s:t7r:u cerror: tincomplete definition of type 'struct _aarch64_ctx' 
_fpxreg {
      |          ^129
 |                 t/usr/include/x86_64-linux-gnu/bits/sigcontext.ha:i46l:-8>:m anote: gprevious definition is herei
c =    046; | 
s      t|                 ~~~~^r
uct _fptestcases/testcases.hx:r95e:g22
:       | note:        ^forward declaration of 'struct _aarch64_ctx'

   95 | static inline struct _aarcIn file included from htestcases/testcases.c6:47_:
cIn file included from ttestcases/testcases.hx: 15*:
g/usr/include/x86_64-linux-gnu/asm/sigcontext.he:98t:_8h:e aerror: dredefinition of '_xmmreg'e
r(stru   c98t |  s_taraurccht6 4__cxtxm m*rheega d{,
       u| i       ^n
t32_/usr/include/x86_64-linux-gnu/bits/sigcontext.ht: 53m:a8g:i cnote: ,previous definition is here

      |                      ^
   53 | struct _xmmreg
      |        ^testcases/testcases.h
:130:7: error: incomplete definition of type 'struct _aarch64_ctx'
  130 |                 tail->size = 0;
      |                 ~~~~^
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_ctx'
   95 | static inline struct _aarch64_ctx *get_header(struct _aarch64_ctx *head, uint32_t magic,
      |                      ^
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:180:8: error: redefinition of '_ymmh_state'
  180 | struct _ymmh_state {
      |        ^
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:184:8: note: previous definition is here
  184 | struct _ymmh_state
      |        ^
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:192:8: error: redefinition of '_xstate'
  192 | struct _xstate {
      |        ^
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:189:8: note: previous definition is here
  189 | struct _xstate
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
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:40:8: error: redefinition of '_fpx_sw_bytes'
   40 | struct _fpx_sw_bytes {
      |        ^
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:31:8: note: previous definition is here
   31 | struct _fpx_sw_bytes
      |        ^
In file included from testcases/testcases.c:7:
testcases/testcases.h:101:25: error: invalid application of 'sizeof' to an incomplete type 'struct _aarch64_ctx'
  101 |         if (!heIn file included from atestcases/testcases.cd:7 :
|In file included from |testcases/testcases.h: 15r:
e/usr/include/x86_64-linux-gnu/asm/sigcontext.hs:v85_:s8z:  <error:  redefinition of '_fpreg'H
DR_S   Z85) | 
s      t| r                               ^~~~~~u
ct _fpreg testcases/testcases.h{:
28:2: note: expanded from macro 'HDR_SZ'
         28|  |        ^        
size/usr/include/x86_64-linux-gnu/bits/sigcontext.ho:f40(:s8:t rnote: uprevious definition is herec
t _aa   r40 | csht6r4uc_tc _tfxp)r
e      g| 
        ^     ~~~~~~~~~~~~~~~~~~~~~      
|        ^
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_ctx'
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:91:8   :95  | error: redefinition of '_fpxreg's
tat   i91 | cs tirnulcitn e_ fsptxrruecgt  {_
      a| a       ^r
ch/usr/include/x86_64-linux-gnu/bits/sigcontext.h6:446_:8c: tnote: xprevious definition is here
 *   g46 | estt_rhuecatd e_rf(psxtrreugc
      t|        ^ 
_aarch64_ctx *head, uinIn file included from ttestcases/testcases.c:372:
_In file included from ttestcases/testcases.h :m15a:
/usr/include/x86_64-linux-gnu/asm/sigcontext.hg:98i:8c: ,error: 
redefinition of '_xmmreg'      
|                      ^
   98 | struct _xmmreg {
      |        ^
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:53:8: note: previous definition is here
   53 | struct _xmmreg
      |        ^
testcases/testcases.h:104:27: error: invalid application of 'sizeof' to an incomplete type 'struct _aarch64_ctx'
  104 |         while (offs <= resv_sz - HDR_SZ &&
      |                                  ^~~~~~
testcases/testcases.h:28:2: note: expanded from macro 'HDR_SZ'
   28 |         sizeof(struct _aarch64_ctx)
      |         ^     ~~~~~~~~~~~~~~~~~~~~~
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_ctx'
   95 | static inline struct _aarch64_ctx *get_header(struct _aarch6In file included from 4testcases/testcases.c_:c7t:
xIn file included from  testcases/testcases.h*:h15e:
a/usr/include/x86_64-linux-gnu/asm/sigcontext.hd:,180 :8u: ierror: redefinition of '_ymmh_state'n
t32  _180t |  smtarguicct ,_
y      m| m                     ^h
_state {
      |        ^
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:184:8: note: previous definition is here
  184 | stestcases/testcases.ht:ru105c:t13 :_ yerror: mincomplete definition of type 'struct _aarch64_ctx'm
h_state
      |        ^
  105 |               In file included from testcases/testcases.c :7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:192:8: error: redefinition of '_xstate'
  192 | struct _xstathe e{a
d      -| >       ^m
agi/usr/include/x86_64-linux-gnu/bits/sigcontext.hc:189 :8!:=  note: previous definition is herem
agi  c189  | s&tr&uc t h_xesatda-te>
      m|        ^a
gic) {
      |                ~~~~^
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_ctx'
   95 | static inline struct _aarch64_ctx *get_header(struct _aarch64_ctx *head, uint32_t magic,
      |                      ^
testcases/testcases.h:105:37: error: incomplete definition of type 'struct _aarch64_ctx'
  105 |                head->magic != magic && head->magic) {
      In file included from | testcases/testcases.c                                       ~~~~^:
7:
In file included from testcases/testcases.h:15:
testcases/testcases.h/usr/include/x86_64-linux-gnu/asm/sigcontext.h::95317::228::  note: error: forward declaration of 'struct _aarch64_ctx'redefinition of 'sigcontext'

  317 | struct    s95i | gsctoanttiecx ti n{l
      i| n       ^e
 st/usr/include/x86_64-linux-gnu/bits/sigcontext.hr:u139c:t8 :_ anote: aprevious definition is herer
ch64  _139c | tsxt r*ugcett _shiegacdoenrt(esxttr
u      c| t       ^ 
_aarch64_ctx *head, uint32_t magic,
      |                      ^
testcases/testcases.h:106:15: error: incomplete definition of type 'struct _aarch64_ctx'
  106 |                 offs += head->size;
      |                         ~~~~^
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_ctx'
   95 | static inline struct _aarch64_ctx *get_header(struct _aarch64_ctx *head, uint32_t magic,
      |                      ^
testcases/testcases.h:107:10: error: incomplete definition of type 'struct _aarch64_ctx'
  107 |                 head = GET_RESV_NEXT_HEAD(head);
      |                        ^~~~~~~~~~~~~~~~~~~~~~~~
testcases/testcases.h:85:43: note: expanded from macro 'GET_RESV_NEXT_HEAD'
   85 |         (struct _aarch64_ctx *)((char *)(h) + (h)->size)
      |                                               ~~~^
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_ctx'
   95 | static inline struct _aarch64_ctx *get_header(strIn file included from utestcases/testcases.c:c7t:
 testcases/testcases.h_:a101a:r25:c herror: 6invalid application of 'sizeof' to an incomplete type 'struct _aarch64_ctx'4
_ctx *head,   u101i | n        ti3f2 _(t! hmeaagdi c|,|
       r| e                     ^s
v_sz < HDR_SZ)
      |                                ^~~~~~
testcases/testcases.h:28:2: note: expanded from macro 'HDR_SZ'
   28 |         sizeof(struct _aarch64_ctx)
      |         ^     ~~~~~~~~~~~~~~~~~~~~~
testcases/testcases.htestcases/testcases.h::95:10922::10 :note:  forward declaration of 'struct _aarch64_ctx'
error: incomplete definition of type 'struct _aarch64_ctx'
   95 |   s109t | a        tiifc  (ihnelaidn-e> msatgriucc t= =_ amaargcihc6)4_ctx *get _h{e
a      d| e            ~~~~^r
(struct _testcases/testcases.ha:a95r:c22h:6 4note: _forward declaration of 'struct _aarch64_ctx'c
tx *head, uint32_t    95m | asgtiact,i
c       | i                     ^n
line struct _aarch64_ctx *get_header(struct _aarch64_ctx *head, uinttestcases/testcases.h3:2104_:t27 :m aerror: ginvalid application of 'sizeof' to an incomplete type 'struct _aarch64_ctx'i
c,
      |                      ^
  104 |         while (offs <= resv_sz - HDR_SZ &&
      |                                  ^~~~~~
testcases/testcases.h:28:2: note: expanded from macro 'HDR_SZ'
   28 |         sizeof(struct _aarch64_ctx)
      |         ^     ~~~~~~~~~~~~~~~~~~~~~
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_ctx'
   95 | static inline struct _aarch64_ctx *get_header(struct _aarch64_ctx *head, uint32_t magic,
      |                      ^
testcases/testcases.h:105:13: error: incomplete definition of type 'struct _aarch64_ctx'
  105 |                head->magic != magic && head->magic) {
      |                ~~~~^
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_ctx'
   95 | static inline struct _aarch64_ctx *get_header(struct _aarch64_ctx *head, uint32_t magic,
      |                      ^
testcases/testcases.h:129:7: error: incomplete definition of type 'struct _aarch64_ctx'
testcases/testcases.h:105:37: error: incomplete definition of type 'struct _aarch64_ctx'  
129 |                 tail->mag  i105c |          =   0 ; 
        |  h                ~~~~^e
ad->magic testcases/testcases.h!:=95 :m22a:g inote: cforward declaration of 'struct _aarch64_ctx' 
&& head->magic) {
      |                                        ~~~~^
   95 | testcases/testcases.hs:t95a:t22i:c  note: iforward declaration of 'struct _aarch64_ctx'n
line struc   t95 |  s_taaatric1ch error 6i generated4n_lc.
itnxe  s*tgreutc_th e_aadaercrh(6s4t_rcutcxt  *_gaeatr_cheha6d4e_rc(tsxt r*uhceta d_,a auricnht6342__ctt xm a*ghieca,d
,       | u                     ^i
nt32_t magic,
      |                      ^
testcases/testcases.h:130:7: error: incomplete definition of type 'struct _aarch64_ctx'
testcases/testcases.h:106:15: error:   incomplete definition of type 'struct _aarch64_ctx'130
 |                 tail-  >106s | i        z        eo f=f s0 ;+
=       | h                ~~~~^e
ad->sitestcases/testcases.hz:e95;:
22      :|                          ~~~~^note: 
forward declaration of 'struct _aarch64_ctx'
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_ctx'
   95 |    s95t | asttiact iicn liinnlei nset rsutcrtu c_ta a_racahr6c4h_6c4t_xc t*xge t*_gheeta_dheera(dsetrr(uscttr u_cata r_caha6r4c_hc6t4x_ c*thxe a*dh,e audi,n tu3i2n_tt3 2m_agti cm,a
g      i| c                     ^,

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
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:40:8: error: redefinition of '_fpx_sw_bytes'
   40 | struct _fpx_sw_bytes {
      |        ^
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:31:8: note: previous definition is here
   31 | struct _fpx_sw_bytes
      |        ^
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:85:8: error: redefinition of '_fpreg'
   85 | struct _fpreg {
      |        ^
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:40:8: note: previous definition is here
   40 | struct _fpreg
      |        ^
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:91:8: error: redefinition of '_fpxreg'
   91 | struct _fpxreg {
      |        ^
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:46:8: note: previous definition is here
   46 | struct _fpxreg
      |        ^
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:98:8: error: redefinition of '_xmmreg'
   98 | struct _xmmreg {
      |        ^
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:53:8: note: previous definition is here
   53 | struct _xmmreg
      |        ^
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:180:8: error: redefinition of '_ymmh_state'
  180 | struct _ymmh_state {
      |        ^
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:184:8: note: previous definition is here
  184 | struct _ymmh_state
      |        ^
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:192:8: error: redefinition of '_xstate'
  192 | struct _xstate {
      |        ^
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:189:8: note: previous definition is here
  189 | struct _xstate
      |        ^
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:40:8: error: redefinition of '_fpx_sw_bytes'
   40 | struct _fpx_sw_In file included from btestcases/testcases.cy:t7e:
sIn file included from  testcases/testcases.h{:
15      :
| /usr/include/x86_64-linux-gnu/asm/sigcontext.h       ^:
317:8: error: redefinition of 'sigcontext'
  317 | struct sigcontext {
      | /usr/include/x86_64-linux-gnu/bits/sigcontext.h       ^:
31:/usr/include/x86_64-linux-gnu/bits/sigcontext.h8::139 :note: 8previous definition is here:
 note: previous definition is here
   31   | 139s | tsrturcutc t_ fspixg_csonwt_ebxytt
e      s| 
       ^      
|        ^
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:85:8: error: redefinition of '_fpreg'
   85 | struct _fpreg {
      |        ^
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:40:8: note: previous definition is here
   40 | struct _fpreg
      |        ^
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:91:8: error: redefinition of '_fpxreg'
   91 | struct _fpxreg {
      |        ^
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:46:8: note: previous definition is here
   46 | struct _fpxreg
      |        ^
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:98:8: error: redefinition of '_xmmreg'
   98 | struct _xmmreg {
      |        ^
/usr/include/x86_64-linux-gnu/bits/sigcontext.h:53:8: note: previous definition is here
   53 | struct _xmmreg
      |        ^
In file included from testcases/testcases.c:7:
testcases/testcases.h:101:25: error: invalid application of 'sizeof' to an incomplete type 'struct _aarch64_ctx'
  101 |         if (!head || resv_sz < HDR_SZ)
      |                                ^~~~~~
testcases/testcases.h:28:2: note: expanded from macro 'HDR_SZ'
   28 |         sizeof(struct _aarch64_ctx)
      |         ^     ~~~~~~~~~~~~~~~~~~~~~
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_ctx'
   95 | static inline struct _aarch64_ctx *get_header(struct _aarch64_ctx *head, uint32_t magic,
      |                      ^
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:180:8:testcases/testcases.h :104error: :27redefinition of '_ymmh_state':
 error: invalid application of 'sizeof' to an incomplete type 'struct _aarch64_ctx'
  180 |   s104t | r        uwchti l_ey m(mohf_fsst a<t=e  r{e
s      v| _       ^s
z /usr/include/x86_64-linux-gnu/bits/sigcontext.h-: 184H:D8R:_ Snote: Zprevious definition is here 
&&
      |                                  ^~~~~~
  184testcases/testcases.h | :s28t:r2u:c tnote:  expanded from macro 'HDR_SZ'_
ymmh_st   a28t | e        
s      i| z       ^e
of(struct _aarch64_ctx)
      |         ^     ~~~~~~~~~~~~~~~~~~~~~
testcases/testcases.h:95:22:In file included from  testcases/testcases.cnote: :forward declaration of 'struct _aarch64_ctx'
7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:192:8:    error: 95redefinition of '_xstate' | 
static i  n192l | isnter sutcrtu c_tx s_taaartceh6 4{_
c      t| x       ^ 
*get_/usr/include/x86_64-linux-gnu/bits/sigcontext.hh:e189a:d8e:r (note: sprevious definition is heret
ruct _  a189a | rscthr6u4c_tc t_xx s*thaetaed
,       | u       ^i
nt32_t magic,
      |                      ^
testcases/testcases.h:105:13: error: incomplete definition of type 'struct _aarch64_ctx'
  105 |                head->magic != magic && head->magic) {
      |                ~~~~^
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_ctx'
   95 | static inline struct _aarch64_ctx *get_header(struct _aarch64_ctx *head, uint32_t magic,
      |                      ^
testcases/testcases.h:105:37: error: incomplete definition of type 'struct _aarch64_ctx'
  105 |                head->magic != magic && head->magic) {
      |                                        ~~~~^
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_ctx'
   95 | static inline struct _aarch64_ctx *get_header(struct _aarch64_ctx *head, uint32_t magic,
      |                      ^
testcases/testcases.h:106:15: error: incomplete definition of type 'struct _aarch64_ctx'
  106 |                 offs += head->size;
      |                         ~~~~^
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_ctx'
   95 | static inline struct _aarch64_ctx *get_header(struct _aarch64_ctx *head, uint32_t magic,
      |                      ^
In file included from testcases/testcases.c:7:
In file included from testcases/testcases.h:15:
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:317:8: error: redefinition of 'sigcontext'
  317 | struct sigcontext {
      | testcases/testcases.h       ^:
107:10: error: /usr/include/x86_64-linux-gnu/bits/sigcontext.hincomplete definition of type 'struct _aarch64_ctx':
139:8: note: previous definition is here  
107 |                 hea  d139  | =s tGrEuTc_tR EsSiVg_cNoEnXtTe_xHtE
A      D| (       ^h
ead);
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
In file included from testcases/testcases.c:7:
testcases/testcases.h:101:25: error: invalid application of 'sizeof' to an incomplete type 'struct _aarch64_ctx'
  101 |         if (!head || resv_sz < HDR_SZ)
      |                                ^~~~~~
testcases/testcases.h:28:2: note: expanded from macro 'HDR_SZ'
   28 |         sizeof(struct _aarch64_ctx)
      |         ^     ~~~~~~~~~~~~~~~~~~~~~
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_ctx'
   95 | static inline struct _aarch64_ctx *get_header(struct _aarch64_ctx *head, uint32_t magic,
      |                      ^
testcases/testcases.h:104:27: error: invalid application of 'sizeof' to an incomplete type 'struct _aarch64_ctx'
  104 |         while (offs <= resv_sz - HDR_SZ &&
      |                                  ^~~~~~
testcases/testcases.h:28:2: note: expanded from macro 'HDR_SZ'
   28 |         sizeof(struct _aarch64_ctx)
      |         ^     ~~~~~~~~~~~~~~~~~~~~~
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_ctx'
   95 | static inline struct _aarch64_ctx *get_header(struct _aarch64_ctx *head, uint32_t magic,
      |                      ^
testcases/testcases.h:105:13: error: incomplete definition of type 'struct _aarch64_ctx'
  105 |                head->magic != magic && head->magic) {
      |                ~~~~^
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_ctx'
   95 | static inline struct _aarch64_ctx *get_header(struct _aarch64_ctx *head, uint32_t magic,
      |                      ^
testcases/testcases.h:105:37: error: incomplete definition of type 'struct _aarch64_ctx'
  105 |                head->magic != magic && head->magic) {
      |                                        ~~~~^
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_ctx'
   95 | static inline struct _aarch64_ctx *get_header(struct _aarch64_ctx *head, uint32_t magic,
      |                      ^
testcases/testcases.h:106:15: error: incomplete definition of type 'struct _aarch64_ctx'
  106 |                 offs += head->size;
      |                         ~~~~^
testcases/testcases.h:95:22: note: forward declaration of 'struct _aarch64_ctx'
   95 | static inline struct _aarch64_ctx *get_header(struct _aarch64_ctx *head, uint32_t magic,
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
testcases/testcases.c:9:36: warning: declaration of 'struct extra_context' will not be visible outside of this function [-Wvisibility]
    9 | bool validate_extra    _9c | obnotoelxtestcases/testcases.c :tv(9as:l36testcases/testcases.cti::r9u:c36t:  dtestcases/testcases.c testcases/testcases.cewarning: a:t9ewarning: :xdeclaration of 'struct extra_context' will not be visible outside of this function [-Wvisibility]:_36e:x tdeclaration of 'struct extra_context' will not be visible outside of this function [-Wvisibility]9t
warning: r
declaration of 'struct extra_context' will not be visible outside of this function [-Wvisibility]:r36a:
a_ c_ocnowarning: t    declaration of 'struct extra_context' will not be visible outside of this function [-Wvisibility]n    e99
 | tx | bbetx(    o9o | lo ts t*reuxct    bovoatr9lol ae,x tcrh |  ivdaalla _acrbtivo e*_*odoantteexee_xetx traallrtr,
      |                                    ^
*_ irecvoadax_tnltactornat,eieex_ exdtc(xstahtatt(rsutcrtu cer_ret  *eexxttarxa*r_tcroa_earn_tceor_,cxntt(ecx
o      n| tseoxt                                   ^(
ttr nsu*ttecetr uxxtecxt ttrraa_,c*o  enecxxtterxahtt,a rr c ha**e*ae_rxrrctorn,t a*
e,* ecrh      x| r                                   ^,

a      t| r                                   ^  
***eexrtrr,a
,       | c                                   ^h
ar **err,
      |                                    ^
testcases/testcases.c:18:34: error: incomplete definition of type 'struct extra_context'
   18 |         term = GET_RESV_NEXT_HEAD(&extra->head);
      |                                    ~~~~~^
testcases/testcases.c:9testcases/testcases.c::testcases/testcases.c3618::: testcases/testcases.cnote: 18forward declaration of 'struct extra_context'34:::
3418:  error: error: :incomplete definition of type 'struct extra_context'incomplete definition of type 'struct extra_context'

34testcases/testcases.c::     189error: : | incomplete definition of type 'struct extra_context'34b
:o o   error: l18incomplete definition of type 'struct extra_context'   
  | v        atlei18dr    | amt18e | _        e   x         t=t18t | re ea        rGmEr_mc ot T=_=n teertestcases/testcases.cm  RGxE:G=EtT(_E18 SsRtErSuVc_tN EeXxTt_T:GVrH_34E_aN_EcERA:DT(XoTn_tHeExAtE _&D S*Ve_error: Reincomplete definition of type 'struct extra_context'(
xNEEx&terSXtTxaVr_t,r a   -_aH-c18> | hNEEAXDT>hhee        (t&_eaaaedHxrt r*dr)Ea*-)>m;A
D      | e;r
h (=                                   ~~~~~^r      ,| e& e
x
t                                         ~~~~~^aGrE| T
_dR)a;-
>      testcases/testcases.c| :                                   ~~~~~^                                   ^testcases/testcases.cE:h9e:a36d

S9V:_)N:E36 ;Xtestcases/testcases.cT::note: 
forward declaration of 'struct extra_context'      
_9 :note: | H36E:forward declaration of 'struct extra_context'                                   ~~~~~^A 
note: 
    Dforward declaration of 'struct extra_context'(
testcases/testcases.c9& | :b18eoxtestcases/testcases.ct:    99     | :9or:b3634 | lao-o:l:b oerror:  incomplete definition of type 'struct extra_context'v> h ovl
 avlaildiadnote: eaa   d18t | a        tteeforward declaration of 'struct extra_context'l
)e;_
r      i| d_eexxttrrma t=e                                   ~~~~~^    
aa _Gc_oenx9_Etttestcases/testcases.c | :b9o:o36l: cvTaelxir ao_tR(EsStdranote: _nVtuecxtt tforward declaration of 'struct extra_context'c_(esxe
_oeNxttrrutcrnEat_ ceoantX    T9x_ttreexx_tH | cab_tc(Eoon(osAotsnttrDlet eu(cxttrvx&ae xe xutcrta _tc o*nelxttrr*ae,etiadx tcrhxe-aaa,rtxr>t  ta _*heceh_*c*oexaaerxentd trtrear_a),*r*,exrtr ,c; 
*      
e      o| 
                                   ^      
c| xn| h                                   ~~~~~^                                   ^tatr

re a*,*xetestcases/testcases.c :c9testcases/testcases.c:trh:3618:(rsa: ,tr34 :note: 
forward declaration of 'struct extra_context'r*testcases/testcases.c*       error: | 
u:eincomplete definition of type 'struct extra_context'                                   ^c18r:
34
tr ,    :9e | 
b      o|     error: xo                                   ^l18  | vincomplete definition of type 'struct extra_context'a
t
r        al_itestcases/testcases.cdcatt   e:_oeexrtm1818n:r34  | =t a:_        cGoEnTt_ee xerror: tincomplete definition of type 'struct extra_context'e
rtestcases/testcases.cRxtt (ms :=   E18S*Vt18 : | _        NerGuEcT34tEermxt_t rea, char :*X RxEtS Verror: _*=Tr_aH_incomplete definition of type 'struct extra_context'N
EeX TG_EHAcEorEDrAnDt(e&   T18(,xe_xRt | &        etxetr
t      E| S                                   ^rrm  *=e xVt
aaG-E>_hNrE-XTT_eRaEaS>V__d,h HcN)eEaAdDh(E;X
T)_a&testcases/testcases.c      H;re :| E18A
x*                                   ~~~~~^:D      t| r                                   ~~~~~^a*-
e34(
:> hre&atestcases/testcases.cd:)error: ;rincomplete definition of type 'struct extra_context',
etestcases/testcases.cx9t

::936::36r a      -| >                                   ~~~~~^      :   note: 18h
e|                                     ^forward declaration of 'struct extra_context' | a        dnote: 
forward declaration of 'struct extra_context'
testcases/testcases.ct)
:;e9r
m:           369    =|  | :b 9                                    ~~~~~^onote:  | forward declaration of 'struct extra_context'G
ob
oEoll testcases/testcases.cv:a9l:iT 36_dRaEvSa:V     tlenote: _9testcases/testcases.c | i_forward declaration of 'struct extra_context'e
N:E19bdxXa:Tot19r:at_e    _o Herror: c_o9lE Aincomplete definition of type 'struct _aarch64_ctx'De(n& | vba
xteexxoltirdaa_tcet_te(o   lorxsttr19a _vnar | -        catu>chiefo l(i!etxta netdetrdx)eax(ms t;r
ttt(|sa      e| r                                   ~~~~~^u
c|t tt_r_ eecutestcases/testcases.ce:xrocxt9tmr-n>tt :eaxmer36_taax:t  crga_note: cforward declaration of 'struct extra_context'*
eoinc_ coxnttreax,t  t|o|     c*heaern9t | etbeorxx xoml-t>rt*t sai(z* v*a,l siedeaecxht)r urctta{rte rr
, _ea      ,
 *exx| t      rc*hta                     ~~~~^r|                                     ^ae_rrr
,
*c*ae
o      _| testcases/testcases.hc:rn                                   ^to95n:r
et22e,x
:      x| t t                                   ^(
snote: t rforward declaration of 'struct _aarch64_ctx'u
c*testcases/testcases.ce:tx 19t:r19ea:x,t     rerror: 95c | haaincomplete definition of type 'struct _aarch64_ctx's_rc 
toan*t*testcases/testcases.cte   x19te:rirctestcases/testcases.c |          *ie19x, :f:t
i      n19 19r:|                                     ^l
:(a!,error: i19t incomplete definition of type 'struct _aarch64_ctx'n:eecrhma
r  error:   *incomplete definition of type 'struct _aarch64_ctx's*|e
t   |19r | r        ,i
r      u f   | 19                                   ^ct e( | 
        ti testcases/testcases.cr:!19f: 19(_!mt-e>rmmat:a agrie r|m|c cerror:  incomplete definition of type 'struct _aarch64_ctx' 
h|6t4e||_ crt|x     t19m | t        e*rgtestcases/testcases.ce:r-imfe19t:m19-:>>-m>a g(_ msiicz !hterror: ae|e|e rtmegriincomplete definition of type 'struct _aarch64_ctx')
a m|c d-| e{>   s19  | t        |i|r
i      efr (tze|  m(s!ter                     ~~~~^m
-->>str)testcases/testcases.hm:i95z:eu cat){gic ||erm || ter22m->m a 
 :_ ag{      tnote: aforward declaration of 'struct _aarch64_ctx'i
| errc
c                           ~~~~^ 
|mh| 6|-                     ~~~~^>testcases/testcases.h
:4 s   i95z:_22t:95testcases/testcases.he:)95ce  | note: sforward declaration of 'struct _aarch64_ctx't
 :{22
:t ra      note: xt m| -                     ~~~~^forward declaration of 'struct _aarch64_ctx'i*   h95>

ce | s iazdsitestcases/testcases.he:,95tn) :a   l95i | usi n22t:ntta{i
 e3tci       inote:  forward declaration of 'struct _aarch64_ctx'2c|  ns
t_                     ~~~~^tilr
 inulcmnita gei   ctestcases/testcases.hn_ea  95s,t:as | 
r95rts      t| a                     ^t
iu:crcu cc22h:i ntt6note: l i_nfatal error:  too many errors emitted, stopping now [-ferror-limit=]4forward declaration of 'struct _aarch64_ctx'a
ae_ 
_rccthx6 4*asa_g   trrcett95c | husxt_6c4 _*cgtextahte a*dge_t ireh_ec(taa ds_ahientrecra(dsltrrheiuncut6 rec4t__c(t  asaxr s_tarcuhc6t4 *ta__cgreurcatatr_ctxc hhh *6h4e_ae6a_cada4r_dcet,crt(x hxs6t 4u_ c*thre*ahienatxudd3,2 _c t*,g eutiuntt  _ih3em_na2a_raadgetr3t2c hm6a4gi(__ticsct rmca,g
t      u,cix| 
t       | c                     ^, 
                     ^_
*      
ah| eaa                     ^r
dc,h 6ufatal error: 4i_ntoo many errors emitted, stopping now [-ferror-limit=]tfatal error: c3
2fatal error: too many errors emitted, stopping now [-ferror-limit=]too many errors emitted, stopping now [-ferror-limit=]

t_xt  *mhaegaidc,, 
u      i| n                     ^t
32_t magic,
      |                      ^
fatal error: too many errors emitted, stopping now [-ferror-limit=]
fatal error: too many errors emitted, stopping now [-ferror-limit=]
1 warning and 20 errors generated.
1 warning and 20 errors generated.
1 warning and 20 errors generated.
1 warning and 20 errors generated.
1 warning and 20 errors generated.
1 warning and 20 errors generated.
testcases/testcases.ctestcases/testcases.c::99::3636::  warning: warning: declaration of 'struct extra_context' will not be visible outside of this function [-Wvisibility]declaration of 'struct extra_context' will not be visible outside of this function [-Wvisibility]

        99 |  | bbooooll  vvaalliiddaattee__eexxttrraa__ccoonntteexxtt((ssttrurcutc te xetxrtar_ac_ocnotnetxte x*te x*treax,t crhaa,r c h*a*re r**re,r
r      ,| 
                                         ^| 
                                   ^
testcases/testcases.c:18:34: error: incomplete definition of type 'struct extra_context'
testcases/testcases.c:18:34:    error: 18 | incomplete definition of type 'struct extra_context'        
term = GET_RESV_NEXT_H   E18A | D        (t&eerxmt r=a -G>EhTe_aRdE)S;V
_      N| E                                   ~~~~~^X
T_HEAD(&exttestcases/testcases.cr:a9-:>36h:e anote: dforward declaration of 'struct extra_context')
;
      |                                    ~~~~~^
    9 | bootestcases/testcases.cl: 9v:a36l:i dnote: aforward declaration of 'struct extra_context't
e_extra_conte    x9t | (bsotorlu cvta leixdtartae__ceoxnttreax_tc o*netxetxrta(,s tcrhuacrt  *e*xetrrra,_
c      o| n                                   ^t
ext *extra, char **err,
      |                                    ^
testcases/testcases.c:18:34: error: incomplete definition of type 'struct extra_context'
   18 |         term = GET_testcases/testcases.cR:E18S:V34_:N Eerror: XTincomplete definition of type 'struct extra_context'_
HEAD(&extra   -18> | h        etaedr);m
 =       | G                                   ~~~~~^E
T_REStestcases/testcases.cV:_9N:E36X:T _note: Hforward declaration of 'struct extra_context'E
AD(&extra->    h9e | abdo)o;l
       v| a                                   ~~~~~^l
idate_exttestcases/testcases.cr:a9_:c36o:n tnote: eforward declaration of 'struct extra_context'x
t(struct extr    a9_ | cboonotelx tv a*leixdtartae,_ ecxhtarra _**ceorrn,t
ex      t| (                                   ^s
truct extra_context *extra, char **err,
      |                                    ^
testcases/testcases.c:19:19: error: incomplete definition of type 'struct _aarch64_ctx'
   19 |         if (!term || term->magic || term->sizetestcases/testcases.c): 19{:
19      :|                       ~~~~^error: 
incomplete definition of type 'struct _aarch64_ctx'
testcases/testcases.h:95:22: note:    forward declaration of 'struct _aarch64_ctx'19
 |         if (!term |   |95  | tsetramt-i>cm aignilci n|e|  stterrumc-t> s_iazaer)c h{6
4      _| c                     ~~~~^t
x *getestcases/testcases.ht:_95h:e22a:d enote: rforward declaration of 'struct _aarch64_ctx'(
struct _aarch64   _95c | tsxt a*thieca di,n luiinnet 3s2t_rtu mcagti c_,a
a      r| c                     ^h
64_ctx *get_fatal error: htoo many errors emitted, stopping now [-ferror-limit=]e
ader(struct _aarch64_ctx *head, uint32_t magic,
      |                      ^
fatal error: too many errors emitted, stopping now [-ferror-limit=]
1 warning and 20 errors generated.
1 warning and 20 errors generated.
signals.Ssignals.Ssignals.Ssignals.S:::1616::161919: :: 19error: : expected ']' in brackets expressionerror: 
error: expected ']' in brackets expressionexpected ']' in brackets expression

 stp x29, x30, [sp, #-16]!
 stp x29, x30, [sp, #-16]! 
  signals.S  :signals.S:  16 stp x29, x30, [sp, #-16]!:
 16  19 :           : 19 :       error:  error:   expected ']' in brackets expression 
 expected ']' in brackets expression       
   stp x29, x30, [sp, #-16]!      
 ^   ^ 
 
  stp x29, x30, [sp, #-16]!^ 
 
                            ^ 
   ^
signals.S:16:19: error: expected ']' in brackets expression
 stp x29, x30, [sp, #-16]!
                  ^
:16:19: error: expected ']' in brackets expression
 stp x29, x30, [sp, #-16]!
                  ^
signals.S:16:19: error: expected ']' in brackets expression
 stp x29, x30, [sp, #-16]!
                  ^
signals.S:17:2: error: unknown use of instruction mnemonic without a size suffix
 mov x29, sp
 signals.S^signals.S
::1717::22: : error: error: unknown use of instruction mnemonic without a size suffixunknown use of instruction mnemonic without a size suffix

 mov x29, sp mov x29, sp

  ^^

signals.Ssignals.S:17::172:signals.S: :2error: 17: :error: unknown use of instruction mnemonic without a size suffix2unknown use of instruction mnemonic without a size suffix
: 
error:  mov x29, spunknown use of instruction mnemonic without a size suffix mov x29, sp

signals.S  mov x29, sp

signals.S:signals.S17^: 2 :^:
^: 17error: :
19
:signals.Ssignals.Sunknown use of instruction mnemonic without a size suffix2
2::: :  mov x29, sp1919error: error: 
::unknown use of instruction mnemonic without a size suffixunknown use of instruction mnemonic without a size suffix
 22 mov x29, sp: 
error:  unknown use of instruction mnemonic without a size suffix^


^signals.S
::  mov x20, x0 mov x20, x0

19 :error: signals.Ssignals.S: ^^
2unknown use of instruction mnemonic without a size suffix: 
error: :unknown use of instruction mnemonic without a size suffix19
:192
 mov x20, x0 mov x20, x0:: 
signals.S
2error: signals.Sunknown use of instruction mnemonic without a size suffixsignals.S
signals.S : : ::19 mov x20, x0:^2020::^2
error: 19::22

2: : unknown use of instruction mnemonic without a size suffixerror: 
:  mov x20, x0:  error: ^unknown use of instruction mnemonic without a size suffix

unknown use of instruction mnemonic without a size suffixsignals.S
error: 
unknown use of instruction mnemonic without a size suffix error: ^signals.S
: mov x21, x120
:signals.S20:: mov x21, x1
unknown use of instruction mnemonic without a size suffix: 202
:  error: ^unknown use of instruction mnemonic without a size suffix
 mov x20, x0
2 mov x20, x0^:signals.S

: 

2:: signals.Serror: :unknown use of instruction mnemonic without a size suffix21 mov x21, x1:
2 error: ^ 20signals.S:
2  mov x21, x1^: unknown use of instruction mnemonic without a size suffix
^:: 

error: 

 mov x21, x121error:  unknown use of instruction mnemonic without a size suffix
:unknown use of instruction mnemonic without a size suffix2
^
 signals.S: :signals.S20 mov x21, x1

signals.S :^21
: mov x22, x2^error: ::202:
2
unknown use of instruction mnemonic without a size suffix2:  : signals.Serror: :signals.S21: :
error:  mov x22, x2unknown use of instruction mnemonic without a size suffix

^ mov x22, x2

unknown use of instruction mnemonic without a size suffix :error: 212:signals.S 
^^unknown use of instruction mnemonic without a size suffix
: 2error: : unknown use of instruction mnemonic without a size suffixerror: : mov x21, x121
: 2^: 
error: 


unknown use of instruction mnemonic without a size suffixsignals.Sunknown use of instruction mnemonic without a size suffix: mov x21, x1 mov x22, x2

 mov x22, x2 24signals.S
: mov x22, x2

signals.S^:212:
   :
: 2signals.S: ^error: 
^^

24error: :unknown use of instruction mnemonic without a size suffix24::22unknown use of instruction mnemonic without a size suffix
: : signals.Serror: :unknown use of instruction mnemonic without a size suffix mov x22, x2
signals.Serror: :unknown use of instruction mnemonic without a size suffix2421::
2signals.Ssignals.S
 add x0, x21, x22

2  add x0, x21, x22: 
error:  unknown use of instruction mnemonic without a size suffix::24  add x0, x21, x22^

 : ^error: ^^


24 mov x22, x2::
2unknown use of instruction mnemonic without a size suffix: 
2 add x0, x21, x22
signals.Ssignals.S:error: : unknown use of instruction mnemonic without a size suffix

  :2525signals.Serror: signals.Sunknown use of instruction mnemonic without a size suffix:
24^ add x0, x21, x22 add x0, x21, x22^:
:::
2

  ^14
14signals.S: 25: :error: ^unknown use of instruction mnemonic without a size suffixsignals.S: error: error: :unknown token in expression2514

: add x0, x21, x2225
: 14unknown token in expressionsignals.S
::: 14error: : unknown token in expressionerror: 
unknown token in expression^: 
error: signals.S
 add x0, x0, #15 add x0, x0, #1524 add x0, x0, #15:
2 
 unknown token in expression 
:
signals.S
:  add x0, x0, #15error: 
unknown use of instruction mnemonic without a size suffix  add x0, x0, #1525 ::       
 
  1425:     add x0, x21, x22 
    :error: 14unknown token in expression          : 
  ^   error:  add x0, x0, #15   
   unknown token in expression 
  signals.S    
       :    ^ add x0, x0, #15  25 :^14
:     
 
^ signals.S :  error: ^ 
 26 : ^signals.S
:unknown token in expression26signals.S::1426: :
 14 :  
error: 14 add x0, x0, #15: 
signals.S error:      unknown token in expression 
^signals.S
:error:  : 26unknown token in expression 
  bic x0, x0, #1526
unknown token in expression 
 : bic x0, x0, #15 signals.S::  bic x0, x0, #15 
14
:  error:  1426:           unknown token in expression^:
error:          signals.S   
14unknown token in expression ^:
    bic x0, x0, #15: 
 26  
error:  bic x0, x0, #15unknown token in expression

:   signals.S :     bic x0, x0, #1514^: 
error:  unknown token in expression26
  bic x0, x0, #15   
 :  
     14 :   signals.S     ^ error: ^ :     
unknown token in expression
27    
:     bic x0, x0, #152 :  error:         ^ 
 unknown use of instruction mnemonic without a size suffix 
 signals.S
         signals.S sub sp, sp, x0 
:^27  : 27 :^

: 2^ 
 signals.S^:
2 : 27:  error:  unknown use of instruction mnemonic without a size suffix : signals.Serror: :
2 unknown use of instruction mnemonic without a size suffix28 sub sp, sp, x0: 
 
signals.S sub sp, sp, x0:error: 2 signals.Ssignals.S^:
unknown use of instruction mnemonic without a size suffix: ^:
:
2727::2 : ^error: 
error: 272
unknown use of instruction mnemonic without a size suffix sub sp, sp, x0unknown use of instruction mnemonic without a size suffix
signals.S :: 

error:  sub sp, sp, x0:^2
signals.S add x23, sp, x22unknown use of instruction mnemonic without a size suffix

 
signals.S 28^: 
error: : sub sp, sp, x027^:
::unknown use of instruction mnemonic without a size suffix2

: 228signals.S sub sp, sp, x0 error: signals.S: :signals.S2:: 28error: :unknown use of instruction mnemonic without a size suffix2
:
 add x23, sp, x22^unknown use of instruction mnemonic without a size suffix
:error: : unknown use of instruction mnemonic without a size suffix28 
^

30error: 
: 2^: 
signals.S add x23, sp, x22:unknown use of instruction mnemonic without a size suffix10 sub sp, sp, x0: 
error: :

signals.S add x23, sp, x22error:  unknown use of instruction mnemonic without a size suffix28
: add x23, sp, x222signals.S ::
30 unknown token in expression^
:  ^^
28:^

error: 
:10
 ldr x0, =call_fmtunknown use of instruction mnemonic without a size suffixsignals.Ssignals.S2:: 

  add x23, sp, x22:
30 :^10
: signals.S: 30error: error: unknown use of instruction mnemonic without a size suffixunknown token in expression signals.S :error: 28unknown token in expression:::30signals.S

  ldr x0, =call_fmt
210: : error: error: :: add x23, sp, x2230 
   ldr x0, =call_fmtunknown use of instruction mnemonic without a size suffixunknown token in expression10

:  

:  ldr x0, =call_fmt 
^10    ^ 
 add x23, sp, x22error:  
 :   
unknown token in expression 
error:  unknown token in expression 
  ldr x0, =call_fmt 
  signals.S :^30
: 10 :  signals.S signals.S  ldr x0, =call_fmt         error: :unknown token in expression: 
^ ^31

30 ldr x0, =call_fmt:
^  
 
 :102:     : error: error: signals.Ssignals.S::    unknown token in expression unknown use of instruction mnemonic without a size suffix^
31 mov x1, x21:312signals.S::2  


:  error: ^31: :error:  unknown use of instruction mnemonic without a size suffix 
 ldr x0, =call_fmt mov x1, x21
signals.S :unknown use of instruction mnemonic without a size suffix

2 mov x1, x21  
  31^:
: 
error:      2 signals.S :^unknown use of instruction mnemonic without a size suffix

^ mov x1, x21

^:  32signals.S :^
error:  :2
signals.S : unknown use of instruction mnemonic without a size suffix32: signals.S:32^
:error: 2unknown use of instruction mnemonic without a size suffix: signals.S:
2 mov x1, x2131signals.S:
error: :unknown use of instruction mnemonic without a size suffix: 
:2signals.S:  mov x2, x23error: 31
: mov x2, x232error: : unknown use of instruction mnemonic without a size suffix 32:
31 unknown use of instruction mnemonic without a size suffix

error: 
^ mov x2, x23

::22^  mov x1, x21^unknown use of instruction mnemonic without a size suffix 
signals.S^:: 32: 
error: 

 mov x1, x21

error:  :unknown use of instruction mnemonic without a size suffix unknown use of instruction mnemonic without a size suffix^2

^

signals.S: :error: 33unknown use of instruction mnemonic without a size suffix mov x1, x21 mov x2, x23
signals.S signals.Ssignals.S::
32 mov x2, x23:
2signals.S:^:
2
 : ^:3333: :error: 2 error: ^unknown use of instruction mnemonic without a size suffix
32:signals.Sinvalid instruction mnemonic 'bl': 
error: 
:2:
invalid instruction mnemonic 'bl' mov x2, x232
:  32signals.S bl printf
: error: error: ^invalid instruction mnemonic 'bl'

:signals.S::
 bl printf 
^ ~unknown use of instruction mnemonic without a size suffix bl printf
signals.S23333^
~
 mov x2, x23 :: 33::

^ ~error: 
unknown use of instruction mnemonic without a size suffix:22: : error: signals.Sinvalid instruction mnemonic 'bl':
^

 mov x2, x232error: : invalid instruction mnemonic 'bl'error: 
invalid instruction mnemonic 'bl'signals.S36: bl printf36
: 2^signals.S
: bl printf36
::signals.S: :~ 
^  bl printf22error: : unknown use of instruction mnemonic without a size suffixerror: 
33
:
^
~: unknown use of instruction mnemonic without a size suffix mov x0, x232
  
signals.Serror: 
:  mov x0, x23error: ^^~:unknown use of instruction mnemonic without a size suffixsignals.S
invalid instruction mnemonic 'bl'signals.S
:
36
::33:2: error: invalid instruction mnemonic 'bl'
signals.S:37:2: signals.S:36:2:  error: 
unknown use of instruction mnemonic without a size suffix36
: mov x0, x232
 mov x0, x23 2error: ^unknown use of instruction mnemonic without a size suffix
 mov x1, x20
  bl printf^ bl printf

:  
^ ~^: 
error: 
signals.S
:error: ^unknown use of instruction mnemonic without a size suffix

unknown use of instruction mnemonic without a size suffix 38

 mov x0, x23^
~ 
^:
2signals.S mov x0, x23:signals.S37:: signals.S
::37237: :error: signals.Sunknown use of instruction mnemonic without a size suffixsignals.S
: mov x1, x20error:  :signals.S2:: 36error: 
unknown use of instruction mnemonic without a size suffix^2:3637::unknown use of instruction mnemonic without a size suffix 

: :22
^ mov x1, x20 mov x2, x21
error: 2unknown use of instruction mnemonic without a size suffix: 
error:  mov x1, x20: : 

 signals.S^unknown use of instruction mnemonic without a size suffix

error: error:  :^
signals.S :unknown use of instruction mnemonic without a size suffixunknown use of instruction mnemonic without a size suffix

 mov x0, x2337
: mov x1, x20^

 38signals.S mov x0, x23
2^::2
:  : 
error: signals.S38signals.S: 2error: : ^error: 
unknown use of instruction mnemonic without a size suffixunknown use of instruction mnemonic without a size suffix:
: mov x1, x20^unknown use of instruction mnemonic without a size suffix
signals.S
: mov x2, x2138
39 38^:
2signals.S

  mov x2, x21signals.S
:::2: :^ 372:: 2: error: error: unknown use of instruction mnemonic without a size suffixunknown use of instruction mnemonic without a size suffix37
:signals.S
:^39
:error: : 
 mov x2, x21 mov x2, x21

2 2invalid instruction mnemonic 'bl': 
error:  unknown use of instruction mnemonic without a size suffixsignals.S: ^error: 
unknown use of instruction mnemonic without a size suffixerror:  bl memcpysignals.S
^
: mov x1, x2038
:
2 mov x1, x20: 
invalid instruction mnemonic 'bl':signals.S39 
 error:  
^ bl memcpy::^2~^unknown use of instruction mnemonic without a size suffix


39: 
error: 
invalid instruction mnemonic 'bl' mov x2, x21signals.S :

 bl memcpy:239: :error: signals.S^signals.S~ 
signals.S :2invalid instruction mnemonic 'bl':
: bl memcpy38
^^51: :error: 2invalid instruction mnemonic 'bl'38

 bl memcpy:signals.S
~: : 2
: 2:: 
error: ^ ~error: 
unknown use of instruction mnemonic without a size suffix51error: :unknown use of instruction mnemonic without a size suffix2invalid instruction mnemonic 'ldr': 
error: ^invalid instruction mnemonic 'ldr'~

signals.S

 mov x2, x21signals.S ldr x0, current:signals.S51 ldr x0, current::239: :error: 2 mov x2, x21

 :
51 signals.Sinvalid instruction mnemonic 'ldr':: 
 ^:
^
~51 ldr x0, current:error: 2invalid instruction mnemonic 'bl': 
error:  bl memcpyinvalid instruction mnemonic 'ldr'

   ldr x0, current^

 ^2~
^signals.S^:~~: 
 ~^39~~error: 
invalid instruction mnemonic 'ldr'signals.S~::


~392signals.S ldr x0, current
::: signals.S
:signals.S :^522:52error: :invalid instruction mnemonic 'bl'2
:  bl memcpyerror: 
signals.S51~: ~error: 2signals.S: :unknown use of instruction mnemonic without a size suffix52 :^2~::
invalid instruction mnemonic 'bl'error: 
unknown use of instruction mnemonic without a size suffix
: 
522
:  bl memcpy str x23, [x0]error: :signals.S2 str x23, [x0]: error: error: invalid instruction mnemonic 'ldr'

unknown use of instruction mnemonic without a size suffix :
signals.Sunknown use of instruction mnemonic without a size suffix 

 str x23, [x0] 
^52 str x23, [x0]:^ ldr x0, current
^
~:
251

 
 : signals.S:: ^^
^error: 2unknown use of instruction mnemonic without a size suffix: 54~
signals.Ssignals.S:
54signals.S::254: error: error: invalid instruction mnemonic 'ldr'unknown use of instruction mnemonic without a size suffix

:~2:: 51error: :unknown use of instruction mnemonic without a size suffix2 str x23, [x0]: 
:signals.S ldr x0, current mov sp, x23


error:  2:: 54error: :
 invalid instruction mnemonic 'ldr'^

 mov sp, x23 ldr x0, current

  ^^^unknown use of instruction mnemonic without a size suffix

2 : signals.Ssignals.S:
~ mov sp, x23^error: :unknown use of instruction mnemonic without a size suffixsignals.S52:~56
:~10
: signals.Serror: :unknown token in expression56
: mov sp, x23:
2 : ~ 54
signals.S10:^error: 
unknown use of instruction mnemonic without a size suffix^:
 mov x8, #15: 
error:  unknown token in expression 
signals.S52

2  mov x8, #15 
::56signals.S str x23, [x0]: 
error:  signals.S :2:: 10::  unknown use of instruction mnemonic without a size suffix  56error: :unknown use of instruction mnemonic without a size suffix1052error: 
^ mov sp, x23 
 
  str x23, [x0]: :error: unknown token in expression

  mov x8, #15   
 2unknown token in expression: 
error: ^^ 
 
 unknown use of instruction mnemonic without a size suffix signals.S
^signals.S
:  mov x8, #15 

:5654:  ^ 
   str x23, [x0]:
2signals.S10signals.S:54 signals.S : 57^:2: error: invalid instruction mnemonic 'svc'
 svc #0
 ^~~
:: :  
 : 57error: error: signals.Sunknown use of instruction mnemonic without a size suffix:
2 mov sp, x23  signals.S :unknown token in expression264: :error: 
^:
 
 : 2error: unknown use of instruction mnemonic without a size suffix 54 mov x8, #15 
^: 
invalid instruction mnemonic 'svc'error: 

 svc #0^:
 invalid instruction mnemonic 'b' mov sp, x23

  2^: ~error: signals.Sunknown use of instruction mnemonic without a size suffix:
57 
^signals.S~signals.S
: mov sp, x2357
: 2 :   b .
:: 2^: error: error: invalid instruction mnemonic 'svc' 
56
:signals.S10:signals.Sinvalid instruction mnemonic 'svc':
64 svc #0:
   svc #0^: 56error: :unknown token in expression10
:  mov x8, #15signals.S
:
2 :  error:  invalid instruction mnemonic 'b'

 
error:  unknown token in expression 
  mov x8, #15 
56^^~
^ b .~  : ~

 ~^

 10  :   error:   signals.Sunknown token in expression^

 mov x8, #15 signals.S :
: 64  64:  :2 ^2
:  : signals.Serror: error: invalid instruction mnemonic 'b'invalid instruction mnemonic 'b'

 : b .  b . 57
: 
 2signals.S^ ^^: 
:

error: 57invalid instruction mnemonic 'svc':
2 svc #0: 
signals.Serror:  :invalid instruction mnemonic 'svc'57^:
~2~ svc #0signals.S: 

: 57error: ^invalid instruction mnemonic 'svc':~
~2
:  svc #0error: 
invalid instruction mnemonic 'svc' signals.S
^: svc #0~64~
:
signals.S 2:: ^64error: ~:invalid instruction mnemonic 'b'2
: ~ b .error: signals.Sinvalid instruction mnemonic 'b'

: 64^

: b .2
:  error: ^invalid instruction mnemonic 'b'
signals.S
: b .64
: 2^: 
error: invalid instruction mnemonic 'b'
 b .
 ^
sve_helpers.csve_helpers.c:13:18: error: use of undeclared identifier 'SVE_VQ_MAX'
   13 | unsigned int vls[SVE_VQ_MAX];
      |                  ^~~~~~~~~~
:13:18: error: use of undeclared identifier 'SVE_VQ_MAX'
   13 | unsigned int vls[SVE_VQ_MAX];
      |                  ^~~~~~~~~~
sve_helpers.c:25:12: error: use of undeclared identifier 'SVE_VQ_MAX'
   25 |         for (vq = SVE_VQ_MAX; vq > 0; --vq) {
      |                   ^~~~~~~~~~
sve_helpers.c:13:18: error: use of undeclared identifier 'SVE_VQ_MAX'
   13 | unsigned int vls[SVE_VQ_MAX];
      |                  ^~~~~~~~~~
sve_helpers.c:25:12: error: use of undeclared identifier 'SVE_VQ_MAX'
sve_helpers.c:13:18:    error: 25 | use of undeclared identifier 'SVE_VQ_MAX'        
fsve_helpers.cor: (13v:q18 :=  error: Suse of undeclared identifier 'SVE_VQ_MAX'V
E_VQ_MAX; vq > 0; --vq) {
         | 13                  ^~~~~~~~~~ |    u13
 | nusnisgingende di nitn tv lvsl[sS[VSEV_EV_QV_QM_AMXA]X;]
;      
|                        ^~~~~~~~~~| 
                 ^~~~~~~~~~
sve_helpers.csve_helpers.c::1313:18::18 :error:  error: use of undeclared identifier 'SVE_VQ_MAX'
use of undeclared identifier 'SVE_VQ_MAX'
sve_helpers.c:13:18: error: use of undeclared identifier 'SVE_VQ_MAX'
      1313 |  | uunnssiiggnneedd  iinntt  vvllss[[SSVVEE__VVQQ__M   AM13AX | X]];u
;      n| 
s                       ^~~~~~~~~~i
| g                 ^~~~~~~~~~n
ed int vls[SVE_VQ_MAX];
      |                  ^~~~~~~~~~
sve_helpers.c:25:12: error: use of undeclared identifier 'SVE_VQ_MAX'
   25 |         for (vq = SVE_VQ_MAX; vq > 0; --vq) {
      |                   ^~~~~~~~~~
sve_helpers.c:25:12: error: use of undeclared identifier 'SVE_VQ_MAX'
sve_helpers.c:25:12: error: use of undeclared identifier 'SVE_VQ_MAX'
   25 |         for    (25v | q         =f oSrV E(_vVqQ _=M ASXV;E _vVqQ _>M A0X;;  -v-qv q>)  0{
      |                   ^~~~~~~~~~
; --vq) {
      |                   ^~~~~~~~~~
sve_helpers.c:41:12: error: call to undeclared function 'sve_vq_from_vl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   41 |                 if (vq < svesve_helpers.c_sve_helpers.cv:q:_25f25::12r:12o: merror:  _use of undeclared identifier 'SVE_VQ_MAX'error: 
vuse of undeclared identifier 'SVE_VQ_MAX'sve_helpers.cl
:(25v:l12):) 
error:       | use of undeclared identifier 'SVE_VQ_MAX'                         ^

      2525 |  |                 ffoorr  ((vvqq  ==  SSVV   EE25__VV | QQ        __fMMoAArXX ;;  v(vqqv  >q>   0=;0 ; S- V--Ev-_vqV)qQ) _{ M{
A      
X|                         ^~~~~~~~~~| 
;                  ^~~~~~~~~~ 
vq > 0; --vq) {
      |                   ^~~~~~~~~~
sve_helpers.c:41:12: error: call to undeclared function 'sve_vq_from_vl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   41 |                 if (vq < sve_vq_from_vl(vl))
      |                          ^
3 errors generated.
3 errors generated.
sve_helpers.c:41:12: error: call to undeclared function 'sve_vq_from_vl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   41 |                 if (vq < sve_vq_from_vl(vl))
      |                          ^
sve_helpers.c:41:12: error: call to undeclared function 'sve_vq_from_vl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   41 |         sve_helpers.c        i:f41 :(12v:q  error: <call to undeclared function 'sve_vq_from_vl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration] 
sve_vq_from_v   l41( | v        l        )i)f
       (| v                         ^q
 < sve_vq_from_vl(vl))
      |                          ^
sve_helpers.c:41:12: 3error:  errorcall to undeclared function 'sve_vq_from_vl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]s
 generated.
   41 |                 if (vq < sve_vq_from_vl(vl))
      |                          ^
sve_helpers.c:41:12: error: call to undeclared function 'sve_vq_from_vl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
sve_helpers.c:41:12:    41error:  | call to undeclared function 'sve_vq_from_vl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]        
        if (vq < s   v41e | _        v        qi_ff r(ovmq_ v<l (svvle)_)v
q      _| f                         ^r
om_vl(vl))
      |                          ^
3 errors generated.
3 errors generated.
3 errors generated.
3 errors generated.
3 errors generated.

=====================================================


# Builds where the incident occurred:

## defconfig+arm64-chromebook+kselftest on (arm64):
- compiler: clang-21
- config: None
- dashboard: https://d.kernelci.org/build/maestro:69d3d6fedcae953c056c1a9f


#kernelci issue maestro:914cbb905f3bdc6704f58e8fddef408bafdb622e

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
