Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1433F296177
	for <regressions@lists.linux.dev>; Thu, 26 Jun 2025 09:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750931848; cv=none; b=s0z7wC8En58sXUtVrT0F8EjjMP14JdS9/mQHxUVa74OESKodQaVoAsypmFVuuxyjjjSzo0YQIorNZDXOLuHfYBk9jD4BE4HyzRUe2o62FG3dYFqh/HBArBsRvMQo2NNd6udZsgD/jpeeffKdKUpDtNY9et7qcKpl3S2Zz6ZJdVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750931848; c=relaxed/simple;
	bh=tlVnFMj6w1qVUMI88zn2YTU7Dws9bsPQUK5VTrxNJYA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZgfKMeyzoa8j+OQsI1ZU/lrvFIm8awD6tq02pySUgqXxajo+2bi6nzjyC29SaJKweiFj0856rPDr0eLSInT24JuLveu6Es9yyQncvTctN+gsqSAQHYyO5LgxGdTpjLVEaD8ndwU0zZwkVoxQ6hjnR02DVoK3TuCSU9VHIZOWYZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TpEjRYOi; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TpEjRYOi"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ae0dffaa8b2so27504266b.0
        for <regressions@lists.linux.dev>; Thu, 26 Jun 2025 02:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750931845; x=1751536645; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/7jBCr5MZqaLmLDdD69Fv01V6uu7m4dupO4xr56uExw=;
        b=TpEjRYOilHISJbgZxevnIWvclmO/jhI1EtYnnwzdjMNLZcoDdtBFfp0hA9OtvgONcb
         d9yo0e+A5wmJ4uUACSVZ9NfnflcCfm02tp6fY4fVYHFN08MWxi1/N5ZKnitCGoUFGpvR
         ZkvyZ0KiKY1aVDxPzw6uCc8+QBCkTQ1HIRkGqL0djH73TE3GZHycjTsToAryQ9j4DyGd
         G6Rjsx70fE2Fs8BUcZURqXtkyYVnVLIdpg//BHA3Al5a4lXG4tBkuy51Di5EhYpwbY13
         TEfIu1VcO/pH0XrDMAZuOvhHpzibRS2PSe1DM49NDfyW2W2EZ8g43Izg4+2MVWc8SuNP
         v11g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750931845; x=1751536645;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/7jBCr5MZqaLmLDdD69Fv01V6uu7m4dupO4xr56uExw=;
        b=rIXiYDGEzNm9sI8LgZbKwvrbwaxlW+rSlsL9cH0XH8p2+W65+mnN+YmUpimKi9xAQn
         yTt8PqwXrNqgYOAJ8cnQ3Y+JIMVbnd4BA5FFx+hHLkVWEbw47x/VE4GAl6tTnTKdrVwz
         qpSHvfovZElYY4JXzFOfDhBvOryZdZhFNcqPdCMFInWac1rhSuVK42theLzuKklmP72E
         WJJdrIYlVRCF4ntdccNT7eX5rBRKemfMC+iTymmKRCn/rvngd8OO2zPTj9zIVoYw+Dc3
         nSbMj1wSCv4f21vCJRH894j1P2euc/Z9Bg2OXCgwt/G0fMdxCHW3V4tb/xuRUdw12tIh
         mNKg==
X-Forwarded-Encrypted: i=1; AJvYcCUXbbHjxAQf975hoMXEpy7n3lV8zSwLt4cSeoppPxd0cZi1oJKEmywlCcAqcCC/3Uh8uAY7pG6fOaq8mQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz13Q17adbt4JbPC9yIPsoMCJk+jcqK32t08dHPHW7IRLXNGetV
	oPU+jvIWirM8ABEFMNnUt2kysWRdmz/R1tNW7u62GCGFgDkwvgbZVUJB4GDYqP+ShoeYWxpismN
	Rhi1eg39s6DpeI/dBt8utsfYLA0dz51c=
X-Gm-Gg: ASbGncsj4mkU/9ttgfauYuGeekB6XtmZEP568GkfdcugqN0ZatNlUKxXNAQanoQUY0W
	viV/hr12d4n6kz6aXFtEqRwuSKE/j4K4B4fMAcdtwj8CVRqr1MEqRGORmDdAQx5hs2RdTYoDR1V
	g5GVqlRuiMmS42dgEyvWyEqjFEclJK+CKNDz3CqbGg1+bI2qZmzAPb3w==
X-Google-Smtp-Source: AGHT+IHqVNAzo/SYvg+5aWaqbDFWj5obVs7H8dkhv8IDg3aaiUl9SM61Zk9afMLbdhzCa/5DF2NxXVMpCufIfEI54K8=
X-Received: by 2002:a17:906:a44b:b0:ad5:55db:e413 with SMTP id
 a640c23a62f3a-ae0be894206mr510831666b.26.1750931844899; Thu, 26 Jun 2025
 02:57:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYtJO4DbiabJwpSamTPHjPzyrD3O6ZCwm2+CDEUA7f+ZYw@mail.gmail.com>
In-Reply-To: <CA+G9fYtJO4DbiabJwpSamTPHjPzyrD3O6ZCwm2+CDEUA7f+ZYw@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 26 Jun 2025 11:57:12 +0200
X-Gm-Features: Ac12FXy8P5m6Uq6DYd39S5vG5de_lMDYUsNQB3uoNHk8hKKBSM8JOIak9cK9zIM
Message-ID: <CAOQ4uxi9KjOx0JSakPYbsNaZj63nLiLzQE-_Hdq1H_MGrC8=6A@mail.gmail.com>
Subject: Re: stable-rc: 5.4 and 5.10: fanotify01.c:339: TFAIL:
 fanotify_mark(fd_notify, 0x00000001, 0x00000008, -100, ".") expected EXDEV:
 ENODEV (19)
To: Naresh Kamboju <naresh.kamboju@linaro.org>, Petr Vorel <pvorel@suse.cz>
Cc: LTP List <ltp@lists.linux.it>, open list <linux-kernel@vger.kernel.org>, 
	linux-stable <stable@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, chrubis <chrubis@suse.cz>, 
	Al Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 26, 2025 at 9:03=E2=80=AFAM Naresh Kamboju
<naresh.kamboju@linaro.org> wrote:
>
> Regression in the LTP syscalls/fanotify01 test on the Linux stable-rc 5.4
> and 5.10 kernel after upgrading to LTP version 20250530.
>
>  - The test passed with LTP version 20250130
>  - The test fails with LTP version 20250530
>
> Regressions found on stable-rc 5.4 and 5.10 LTP syscalls fanotify01.c
> fanotify_mark expected EXDEV: ENODEV (19)
>
> Regression Analysis:
>  - New regression? Yes
>  - Reproducibility? Yes
>
> Test regression: stable-rc 5.4 and 5.10
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> fanotify01.c:339: TFAIL: fanotify_mark(fd_notify, 0x00000001,
> 0x00000008, -100, ".") expected EXDEV: ENODEV (19)
>
> The test expected fanotify_mark() to fail with EXDEV, but received
> ENODEV instead. This indicates a potential mismatch between updated
> LTP test expectations and the behavior of the 5.4 kernel=E2=80=99s fanoti=
fy
> implementation.
>

Yap, that's true.

The change to fanotify01:
* db197b7b5 - fanotify01: fix test failure when running with nfs TMPDIR

Depends on this kernel change from v6.8:
* 30ad1938326b - fanotify: allow "weak" fsid when watching a single filesys=
tem

Which fs type is your LTP TMPDIR?

Can you please test this fix:

--- a/testcases/kernel/syscalls/fanotify/fanotify01.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify01.c
@@ -374,7 +374,21 @@ static void setup(void)
        }

        if (fanotify_flags_supported_on_fs(FAN_REPORT_FID,
FAN_MARK_MOUNT, FAN_OPEN, ".")) {
-               inode_mark_fid_xdev =3D (errno =3D=3D ENODEV) ? EXDEV : err=
no;
+               inode_mark_fid_xdev =3D errno;
+               if (inode_mark_fid_xdev =3D=3D ENODEV) {
+                       /*
+                        * The fs on TMPDIR has zero fsid.
+                        * On kernels <  v6.8 an inode mark fails with ENOD=
EV.
+                        * On kernels >=3D v6.8 an inode mark is allowed bu=
t multi
+                        * fs inode marks will fail with EXDEV.
+                        * See kernel commit 30ad1938326b
+                        * ("fanotify: allow "weak" fsid when watching
a single filesystem").
+                        */
+                       if
(fanotify_flags_supported_on_fs(FAN_REPORT_FID, FAN_MARK_INODE,
FAN_OPEN, "."))
+                               inode_mark_fid_xdev =3D errno;
+                       else
+                               inode_mark_fid_xdev =3D EXDEV;
+               }
                tst_res(TINFO | TERRNO, "TMPDIR does not support
reporting events with fid from multi fs");
        }
 }


Thanks,
Amir.

> Test log,
> --
>
> fanotify01.c:94: TINFO: Test #3: inode mark events (FAN_REPORT_FID)
> fanotify01.c:301: TPASS: got event: mask=3D31 pid=3D2364 fd=3D-1
> ...
> fanotify01.c:301: TPASS: got event: mask=3D8 pid=3D2364 fd=3D-1
> fanotify01.c:339: TFAIL: fanotify_mark(fd_notify, 0x00000001,
> 0x00000008, -100, ".") expected EXDEV: ENODEV (19)
> fanotify01.c:94: TINFO: Test #4: mount mark events (FAN_REPORT_FID)
> fanotify01.c:301: TPASS: got event: mask=3D31 pid=3D2364 fd=3D-1
> ...
> fanotify01.c:301: TPASS: got event: mask=3D8 pid=3D2364 fd=3D-1
> fanotify01.c:339: TFAIL: fanotify_mark(fd_notify, 0x00000001,
> 0x00000008, -100, ".") expected EXDEV: ENODEV (19)
> fanotify01.c:94: TINFO: Test #5: filesystem mark events (FAN_REPORT_FID)
> fanotify01.c:301: TPASS: got event: mask=3D31 pid=3D2364 fd=3D-1
> ...
> fanotify01.c:301: TPASS: got event: mask=3D8 pid=3D2364 fd=3D-1
> fanotify01.c:339: TFAIL: fanotify_mark(fd_notify, 0x00000001,
> 0x00000008, -100, ".") expected EXDEV: ENODEV (19)
>
>
> ## Test logs
> * Build details:
> https://regressions.linaro.org/lkft/linux-stable-rc-linux-5.4.y/v5.4.294-=
223-g7ff2d32362e4/ltp-syscalls/fanotify01/
> * Build detail 2:
> https://regressions.linaro.org/lkft/linux-stable-rc-linux-5.10.y/v5.10.23=
8-353-g9dc843c66f6f/ltp-syscalls/fanotify01/
> * Test log: https://qa-reports.linaro.org/api/testruns/28859312/log_file/
> * Issue: https://regressions.linaro.org/-/known-issues/6609/
> * Test LAVA job 1:
> https://lkft.validation.linaro.org/scheduler/job/8329278#L28572
> * Test LAVA job 2:
> https://lkft.validation.linaro.org/scheduler/job/8326518#L28491
> * Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2yxH=
GvVkVpcbKqPahSKRnlITnVS/
> * Build config:
> https://storage.tuxsuite.com/public/linaro/lkft/builds/2yxHGvVkVpcbKqPahS=
KRnlITnVS/bzImage
>
>
> --
> Linaro LKFT
> https://lkft.linaro.org
