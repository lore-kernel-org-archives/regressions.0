Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DAB026B095
	for <regressions@lists.linux.dev>; Tue,  8 Jul 2025 11:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751975948; cv=none; b=fPohsqGgh6db23B1DtJWvP3ofyXmNeeQeQLLOztUE3sSSamXxwFZTaXiTLmqFfCzAx2vS9BWsD0ADN9r/NwNFVmtdavOvMu/j8Zzg3l2vEEUUjbE4TDc4ZFTpk7YDzl4BBFTx5rdMi5niIDs4biks4rBTaQBLo3OoXY4fM9zxrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751975948; c=relaxed/simple;
	bh=L2kk/Y50TQGvVvlwNBwHcYOeOmCnkOn1jHt2wqQjjiU=;
	h=MIME-Version:from:Date:Message-ID:Subject:To:Cc:Content-Type; b=UdwUyDYdUJoKSzA10YhyWy2mjixQBQLRWeEFBLEKao0MszfsWpWGM1hbRABQy/ULfAKFqBNLUsj0UNZvgr0/oX/yq9FSUKTCEcwd7kzw2TwZMtv+v5Mn0a26mRgRnzC1TeaKjH2aPb/rsfiQmibYshj2SMRqCA8Iyg7Bex64/gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=EFbyIOgU; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="EFbyIOgU"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-710f39f5cb9so36752507b3.3
        for <regressions@lists.linux.dev>; Tue, 08 Jul 2025 04:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1751975946; x=1752580746; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=itTve5oaCyFz6zqdqEqDpECcZdI9RhkR/BeCO9Yg03M=;
        b=EFbyIOgUR6o0UkxjlxgG5hxszohIXvZvTo0Wb6WO8SPwdWwRD3GMSVP8kLkRGtgFCV
         2K9oHvz4WTPK8EJXeJnlBoNu5kWgD6JHRabjV9dPodr5MjKFbrhm+SS5nAY10F1VNvj6
         j8nD6Hf/CVdpyEq1w4Qi0x6HHhaT9NmckbANmDD3eISUGHVVFDq/bK0HxHBlNPsb5BAe
         /W4Cyg2bjmXG8xYBvbr3qmWA91sxFRE4Y9iWswwonEGBbjaShzTQ2M/YD8RwA1xrYrEC
         rdUbOmAwdJf45OA80ixwQLzJ35RuPNoGUzNqKn5K50FtFdnk2v7Is68fI0JUxfujIE7p
         QZSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751975946; x=1752580746;
        h=content-transfer-encoding:cc:to:subject:message-id:date:reply-to
         :from:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=itTve5oaCyFz6zqdqEqDpECcZdI9RhkR/BeCO9Yg03M=;
        b=L2LPV9mI1nYEUCtz473JQey4DXyfLZUo5rp2o4c4U2Gy+dcfNTsHYlzj5W07+3+UJK
         ZJ4/8NtZhl/lIE3FvGpVQaxbD8xCcGrHc8eZKJnFnBEu8bcYnwM7ij+XG+YkubrNDbBB
         Ct4LtLyEsvQIBhYfmSgHSJkttroqkmzpo7ML4qLBsFdeekVEGOozCI8s9cEuFeTZzDJC
         IkXbvE0uAnsHBgD/rMp5pryDoNUE4/O+RS4i+JHFh4lj9XZ84fWQYX+n/AMGcfWsDpTX
         Twu/aTWdS2fkVe3KLNXtBsPxcm61f16rEC0wgxxqvQ5hiGkRVfD0iz+uo32HAIhLctCX
         2L1A==
X-Gm-Message-State: AOJu0YwY+oEKXr5WSWPnqPhWbFWJokSVI79DSwOtJBGIpI8fFeg+bWSc
	b3gujJoqZmhBigC6Gq2HwXdXPi3IyWc5NNrn0cNT4GsnZT11Dtcg2lxrIr2e6AxF3h+Nq01DLzc
	kEtT+5gGOVd0AbELm1ajSMTtbD7knOeQJNFVQ3OBGng==
X-Gm-Gg: ASbGncvCUsj9dRVRsd2T/n9mqplmqLF/+0nhHtuKL0b4CPWjkDK0rtcEBFPig0sjfNR
	8FYTFIp79aphSLKw9VjYmJhCcFsUgS4wir53Z0kA9maSP3BfxvjflAOtQCSadOh7lKfhwJelz45
	0Ug49BUpEQHYiC0VF1fC4rlBk8f4VbRMk1KqdSql3JxQ==
X-Google-Smtp-Source: AGHT+IEcYuwWugFSk8BbEt3kvM/tcewci3Uxixw5z4wz2ahT+N1YSv8Y0nwJmVXjo8ArBo0Frjk47hX4gsbSRPOwnaQ=
X-Received: by 2002:a05:690c:9b0e:b0:716:4e16:4494 with SMTP id
 00721157ae682-717a0403abdmr34042437b3.20.1751975945855; Tue, 08 Jul 2025
 04:59:05 -0700 (PDT)
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Jul 2025 04:59:04 -0700
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Jul 2025 04:59:04 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
from: KernelCI bot <bot@kernelci.org>
Reply-To: kernelci@lists.linux.dev
Date: Tue, 8 Jul 2025 04:59:04 -0700
X-Gm-Features: Ac12FXzQf85I7ySs1jjo3fwnQ21tGgy5H21viXt0JfbJVMgIc-A5vSibed-yOM0
Message-ID: <CACo-S-29Degjym-azsJNSd1yofLOB2_Rf5xpa9b7L-14OPn7wQ@mail.gmail.com>
Subject: =?UTF-8?B?W1JFR1JFU1NJT05dIG5leHQvbWFzdGVyOiAoYnVpbGQpIGZvcm1hdCDigJglbGTigJkgZQ==?=
	=?UTF-8?B?eHBlY3RzIGFyZ3VtZW50IG9mIHR5cGUg4oCYbG9uZyBpbnTigJksIGJ1dCBhcmd1bWVudCAyIGguLi4=?=
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

New build issue found on next/master:

---
 format =E2=80=98%ld=E2=80=99 expects argument of type =E2=80=98long int=E2=
=80=99, but argument 2 has
type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [-Werror=
=3Dformat=3D] in
drivers/platform/x86/intel/pmt/discovery.o
(drivers/platform/x86/intel/pmt/discovery.c)
[logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:8fa7949e2280282be6a5756d890d8=
a9cc1472e21
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it
- commit HEAD:  58ba80c4740212c29a1cf9b48f588e60a7612209


Log excerpt:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
drivers/platform/x86/intel/pmt/discovery.c:427:35: error: format =E2=80=98%=
ld=E2=80=99
expects argument of type =E2=80=98long int=E2=80=99, but argument 2 has typ=
e =E2=80=98size_t=E2=80=99
{aka =E2=80=98unsigned int=E2=80=99} [-Werror=3Dformat=3D]
  427 |         if (WARN(size > res_size, "Bad table size %ld > %pa",
size, &res_size))
      |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~  ~~~~
      |                                                               |
      |
size_t {aka unsigned int}
./include/asm-generic/bug.h:112:31: note: in definition of macro =E2=80=98_=
_WARN_printf=E2=80=99
  112 |                 __warn_printk(arg);
         \
      |                               ^~~
drivers/platform/x86/intel/pmt/discovery.c:427:13: note: in expansion
of macro =E2=80=98WARN=E2=80=99
  427 |         if (WARN(size > res_size, "Bad table size %ld > %pa",
size, &res_size))
      |             ^~~~
drivers/platform/x86/intel/pmt/discovery.c:427:53: note: format string
is defined here
  427 |         if (WARN(size > res_size, "Bad table size %ld > %pa",
size, &res_size))
      |                                                   ~~^
      |                                                     |
      |                                                     long int
      |                                                   %d
  CC [M]  drivers/platform/chrome/wilco_ec/telemetry.o
cc1: all warnings being treated as errors

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D


# Builds where the incident occurred:

## defconfig+kcidebug+x86-board on (i386):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:686cf98934612746bbb465bb


#kernelci issue maestro:8fa7949e2280282be6a5756d890d8a9cc1472e21

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
