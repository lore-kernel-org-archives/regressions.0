Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82BA201116
	for <regressions@lists.linux.dev>; Tue,  4 Mar 2025 12:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741090722; cv=none; b=iV7D0bBvPsdewKHwXI0es4UeUoYekGg6F0WQbuCJ8PzQhbXf8B0zslXGgkTGvRd29uY+x+lpX+oqn01IxH1FflONckPMJuAwbXp/UM/9rGExZq9qZK/3XRtFqxCNdqDKrwJY0tQfK0XEnsIrmmsKCP+4PMF/gD0PvTzdZzvgUB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741090722; c=relaxed/simple;
	bh=0+DpDBYvMc8sap6iXy8ndJ9VsXtXuusqkkunNPu6lUI=;
	h=MIME-Version:from:Date:Message-ID:Subject:To:Cc:Content-Type; b=hJbZxuIvugKPOcV0O7YLu7GlZlc9ErqAu74gwqJB2/+nEOwMFEx9Jc7JzdmT14OrwB1+0ftiP9IB2FD1uOjxbdSpqfJpng9qeO6L0DCrNEoXjke1qcI9H9Zt1yD7hDdTJc5SPZIgDCR6jyxtWWQCrOaWOXD6W1RTVOUuSC7/9m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=eU+8b/Do; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="eU+8b/Do"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e5dcc411189so4697590276.0
        for <regressions@lists.linux.dev>; Tue, 04 Mar 2025 04:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1741090718; x=1741695518; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eqbfwsT3WaVIwYhQ+yYYV0nO7X+bKVCdrl3j5eACzxY=;
        b=eU+8b/DoxsKhvhRql6KmK8nDUxVzkTcd7v6E1bPL+arofJoULrFE3f+7NbtN6eTizr
         W2hmEpVRu5hM1PyFHxTdy6QO920xNTG7kdcXo8kImTnRuFjLf9TsYXA8ig98ZNxAXe80
         W7ZpAYonHUBqHPaTSV3xLED7OQL5K0Omur/3N5rinCkGaXX8M1EXKVHUDdULYTj+ANll
         7+ZgP0j3ssyCw++ITAz7nXRT9f74dHugBsc9r/hw7+RS4Op1qAbjAwZLsGqjpR8Vr8ZS
         0g6FO2tx0y9zQrMXDw0qfpX8ySNEgdmiU7pLhR41Yxs5pbjgm3dT3/PibWkLgPkiWoEh
         wJGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741090718; x=1741695518;
        h=content-transfer-encoding:cc:to:subject:message-id:date:reply-to
         :from:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eqbfwsT3WaVIwYhQ+yYYV0nO7X+bKVCdrl3j5eACzxY=;
        b=r0YyrQdHu5S0lErU28sUyZGRxiIcyeR1dmteQ9NJCvA8dHQ3b55GSWyo4SqwOGDbV7
         GuBFlWsym2QDgYJCy41N12dO6kh9JOohlSFFOFPuRX4TfaAAWoQowldTLWzp9fpaxz7o
         YKmbW8PIEVIiOOntRh2GOwWvbQ7EmSKJja+RddCtyi8gDZC8oYF0YAH4QCpibP78EIU7
         0/iwKRHDaQt9gpUYOudMMlajk8CK+1AkJRheev63/biMQ71rxY1nvLKolMVqfEGCOpXD
         dDXQ2JqlpPspC4mZiMFeOyecCjfGqjc+vBmnA6i0IRACGnTBV8/6I94w3LLscNy6BTYY
         F45A==
X-Gm-Message-State: AOJu0YxUksjBu+eTFrQZxIIe/ZH9sJRAio8PWQJCWGEP1+qCCB0UVLom
	jk1Pjtcv95HeMcnBuNOgHYzo6F4SmeiqSX9f6CNkH9Q5kNYUFeYKUa3K2Fz86tWsAxWWqqTHNUj
	u1LuW09umhaxRnICNrVqCXf9Rb5TfPRVVxOnAzL7F6KrOv7Zgwd0=
X-Gm-Gg: ASbGncsTa4T2+FASLkaKjkKwssHOleZrIQK3CQ3tiJaObB3syutDMVscijgNV2PYtxD
	Z1R/5KUwNOjfKLz/DaAmUO/ZX+xtqWh5XCjiXDkSsdEwWdvtEYS/cTJwXak9F6U/OLbTcwpKUSA
	U3ZtvdgmyCX28wdjB2rQhmXKMt3NpR7GulEwNMrmOVWHw276BbCViPV5Jr8wc=
X-Google-Smtp-Source: AGHT+IGLcDj5XZvq8JY7wAktboxKTVuwbkPkOrVzId0tOL1AdbfgyBj2iXTjMo9soRAGIO8yN53sjZ8mBBCXfNbk7FQ=
X-Received: by 2002:a05:6902:120c:b0:e5d:cb26:cdaf with SMTP id
 3f1490d57ef6-e60b2f2e4acmr19285976276.42.1741090718390; Tue, 04 Mar 2025
 04:18:38 -0800 (PST)
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 4 Mar 2025 04:18:37 -0800
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 4 Mar 2025 04:18:37 -0800
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
from: KernelCI bot <bot@kernelci.org>
Reply-To: kernelci@lists.linux.dev
Date: Tue, 4 Mar 2025 04:18:37 -0800
X-Gm-Features: AQ5f1Jo7QFtSwlthSgp64VZ0ii6hK0Ea-hB69r-zXLuqqosUTrHJmiIol0fRGC4
Message-ID: <CACo-S-0OAsx_z2jDkmOnv0MoY4T9sqPSafxxnaR6EZfH+sH9_A@mail.gmail.com>
Subject: =?UTF-8?B?W1JFR1JFU1NJT05dIG5leHQvbWFzdGVyOiAoYnVpbGQpIGltcGxpY2l0IGRlY2xhcmF0aQ==?=
	=?UTF-8?B?b24gb2YgZnVuY3Rpb24g4oCYaW5fbWVtX2hvdHBsdWfigJkgWy1XZXJyb3I9aW1wbGljaS4uLg==?=
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

New build issue found on next/master:

---
 implicit declaration of function =E2=80=98in_mem_hotplug=E2=80=99
[-Werror=3Dimplicit-function-declaration] in mm/page_alloc.o
(mm/page_alloc.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/issue/maestro:19379b1d6a35d0cd1771f622b=
9d997f0eb8e6864
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it
- commit HEAD:  20d5c66e1810e6e8805ec0d01373afb2dba9f51a


Log excerpt:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
mm/page_alloc.c:424:17: error: implicit declaration of function
=E2=80=98in_mem_hotplug=E2=80=99 [-Werror=3Dimplicit-function-declaration]
  424 |                 in_mem_hotplug() ||
      |                 ^~~~~~~~~~~~~~
./include/asm-generic/bug.h:111:32: note: in definition of macro =E2=80=98W=
ARN_ON_ONCE=E2=80=99
  111 |         int __ret_warn_on =3D !!(condition);                      \
      |                                ^~~~~~~~~
mm/page_alloc.c:423:9: note: in expansion of macro =E2=80=98lockdep_assert_=
once=E2=80=99
  423 |         lockdep_assert_once(system_state =3D=3D SYSTEM_BOOTING ||
      |         ^~~~~~~~~~~~~~~~~~~
  CC      io_uring/poll.o
  CC      io_uring/eventfd.o
  AR      fs/configfs/built-in.a
  CC      fs/ext4/balloc.o
  CC      block/blk-ioc.o
  CC      arch/x86/kernel/cpu/proc.o
  AR      kernel/rcu/built-in.a
  CC      kernel/dma/mapping.o
  CC      kernel/dma/direct.o
  CC      fs/netfs/direct_read.o
  CC      arch/x86/kernel/cpu/feat_ctl.o
  CC      block/blk-map.o
  CC      arch/x86/kernel/cpu/intel.o
  CC      io_uring/uring_cmd.o
  CC      kernel/dma/ops_helpers.o
  CC      fs/netfs/direct_write.o
  CC      fs/ext4/bitmap.o
  CC      arch/x86/kernel/cpu/tsx.o
  CC      block/blk-merge.o
cc1: all warnings being treated as errors

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D


# Builds where the incident occurred:

## defconfig+kcidebug+x86-board on (i386):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:67c6d625678f180aea2ba974


#kernelci issue maestro:19379b1d6a35d0cd1771f622b9d997f0eb8e6864

Reported-by: kernelci.org bot <bot@kernelci.org>


--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
