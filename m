Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A30954F9F
	for <regressions@lists.linux.dev>; Tue, 21 Nov 2023 14:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tB1j8Rrb"
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-dae0ab8ac3eso5152861276.0
        for <regressions@lists.linux.dev>; Tue, 21 Nov 2023 06:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700576739; x=1701181539; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dCTl+by/8OgzPkqiTTy1mu7iUQvkaM00OdF6QByqCRc=;
        b=tB1j8Rrbf5vJpFC9GTrmhBbrM7ubfqEQzVGQF8ZXTa+6lU8hkZBnLvNBPNNB9DTkJz
         GO0fYcBevaD9EUKrNXXlWygWl/aZZJBB59JTGWqPDFUCDgMIx4J6dnaMj3bi8sYb+Ziq
         SkFCxin5NPBg2pyVBSrZnqFEhFgagY+alI8ParMq03PQQvjkWsWOXaSQ+4Arf3En70vJ
         xjc6YBTwaJ97jMXIpsYIHRNmdd/T2+vKV38ATah2zU/sj0MtKCgkMfwg6/auq4TrFDOa
         qHtVCENU7mXC0igT8CcRLCHqKpXL/1iLI3/ZuZCNyi3TS6RvI9wQRdZ1z4qGp5YD7kgu
         kX0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700576739; x=1701181539;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dCTl+by/8OgzPkqiTTy1mu7iUQvkaM00OdF6QByqCRc=;
        b=jjsIw2LvA3AlDsHUcOutk7FhD+Vd52tOMNnm68EKvtgYUgMXJjaJzsETncjWRIYybz
         hJd7XoRshdPN/R2XKZgI6RD5kJem37f+PEgQQcmCgznapYZs3q9VA8/ZN8ea0DPoqJur
         WkwTfEVrsKIUHKWKHwtMZDB2VbJHIK5sEhcOuq4kIkCX2Qmizus9Ui/QNZJh18SuDPng
         kPEkPpDZCaQNEbFQLarpyfQuCBBhwSxefqMwkbbYU+GBCoB6tv1Oy8O0VdVeYkX5Ke1S
         mvWZyXj2nDXEjGixwVjwPE98wmFDyfh+VtKJENEdu7g/hIiifKvUV5n7l74Lbvk15WER
         lRCw==
X-Gm-Message-State: AOJu0Yxn+yEKNBohI/D5wgidB04wOdvf7tTgjX8B0ya/id6obo7z1f6m
	V2sg7JOnaArPFoU7jF2zbDNczJfwSNEg0Rv5OP5xDA==
X-Google-Smtp-Source: AGHT+IFzC/P9VBpC/SW7HcjRqPIjGI6/u3317qHHutxgt4On71zUFgu360yHalbn7IBXSLbaUggzuHxl91TG21rj54k=
X-Received: by 2002:a81:6588:0:b0:59a:d42c:5d50 with SMTP id
 z130-20020a816588000000b0059ad42c5d50mr9563819ywb.52.1700576739223; Tue, 21
 Nov 2023 06:25:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 21 Nov 2023 19:55:27 +0530
Message-ID: <CA+G9fYvcaozQvas-h55FPjXk+uomF2CyeYbWGCsXM8yGo4SZgA@mail.gmail.com>
Subject: SuperH: fs/namespace.c: In function '__se_sys_listmount':
 syscalls.h:258:9: internal compiler error: in change_address_1, at emit-rtl.c:2275
To: linux-fsdevel@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, 
	regressions@lists.linux.dev, lkft-triage@lists.linaro.org, 
	Linux-sh list <linux-sh@vger.kernel.org>
Cc: Miklos Szeredi <mszeredi@redhat.com>, Ian Kent <raven@themaw.net>, 
	Christian Brauner <brauner@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, dalias@libc.org, 
	Yoshinori Sato <ysato@users.sourceforge.jp>
Content-Type: text/plain; charset="UTF-8"

The SuperH tinyconfig and allnoconfig builds started failing from 20231120 tag
Please find the following builds warnings / errors.

sh:
  build:
    * gcc-11-tinyconfig

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build errors:
----------
make --silent --keep-going --jobs=8
O=/home/tuxbuild/.cache/tuxmake/builds/1/build ARCH=sh
CROSS_COMPILE=sh4-linux-gnu- 'CC=sccache sh4-linux-gnu-gcc'
'HOSTCC=sccache gcc'
  Generating include/generated/machtypes.h
<stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
during RTL pass: final
In file included from /builds/linux/fs/namespace.c:11:
/builds/linux/fs/namespace.c: In function '__se_sys_listmount':
/builds/linux/include/linux/syscalls.h:258:9: internal compiler error:
in change_address_1, at emit-rtl.c:2275
  258 |         }
         \
      |         ^
/builds/linux/include/linux/syscalls.h:233:9: note: in expansion of
macro '__SYSCALL_DEFINEx'
  233 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
      |         ^~~~~~~~~~~~~~~~~
/builds/linux/include/linux/syscalls.h:225:36: note: in expansion of
macro 'SYSCALL_DEFINEx'
  225 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name,
__VA_ARGS__)
      |                                    ^~~~~~~~~~~~~~~
/builds/linux/fs/namespace.c:5019:1: note: in expansion of macro
'SYSCALL_DEFINE4'
 5019 | SYSCALL_DEFINE4(listmount, const struct mnt_id_req __user *, req,
      | ^~~~~~~~~~~~~~~
0x129d9d7 internal_error(char const*, ...)
???:0
0x5dbc4d fancy_abort(char const*, int, char const*)
???:0
0x7ddd3e adjust_address_1(rtx_def*, machine_mode, poly_int<1u, long>,
int, int, int, poly_int<1u, long>)
???:0
0x81dd91 output_operand(rtx_def*, int)
???:0
0x81e5a4 output_asm_insn(char const*, rtx_def**)
???:0
0x8226a8 final_scan_insn(rtx_insn*, _IO_FILE*, int, int, int*)
???:0
Please submit a full bug report,
with preprocessed source if appropriate.
Please include the complete backtrace with any bug report.
See <file:///usr/share/doc/gcc-11/README.Bugs> for instructions.
{standard input}: Assembler messages:
{standard input}:11800: Warning: end of file not at end of a line;
newline inserted
{standard input}:11856: Error: missing operand
{standard input}:11856: Error: invalid operands for opcode
{standard input}:11837: Error: displacement to undefined symbol .L2699
overflows 8-bit field
{standard input}:11690: Error: pcrel too far
{standard input}:11705: Error: pcrel too far
{standard input}:11707: Error: pcrel too far
{standard input}:11712: Error: pcrel too far
{standard input}:11719: Error: pcrel too far
{standard input}:11732: Error: pcrel too far
{standard input}:11737: Error: pcrel too far
{standard input}:11760: Error: pcrel too far
{standard input}:11772: Error: pcrel too far
{standard input}:11777: Error: pcrel too far
{standard input}:11778: Error: pcrel too far
{standard input}:11788: Error: pcrel too far
{standard input}:11791: Error: pcrel too far
{standard input}:11807: Error: pcrel too far
{standard input}:11809: Error: pcrel too far
{standard input}:11844: Error: pcrel too far
make[4]: *** [/builds/linux/scripts/Makefile.build:243: fs/namespace.o] Error 1


kernel: 6.7.0-rc2
git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
git_ref: master
git_sha: 07b677953b9dca02928be323e2db853511305fa9
git_describe: next-20231121
Test details: https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20231121

Regressions (compared to build next-20231117)
------------------------------------------------------------------------

sh:
  build:
    * gcc-8-allnoconfig
    * gcc-11-tinyconfig
    * gcc-11-allnoconfig
    * gcc-8-tinyconfig

Links:
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20231121/testrun/21199202/suite/build/test/gcc-11-tinyconfig/history/
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20231121/testrun/21199202/suite/build/test/gcc-11-tinyconfig/log


--
Linaro LKFT
https://lkft.linaro.org
