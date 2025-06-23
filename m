Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788BD1A00E7
	for <regressions@lists.linux.dev>; Mon, 23 Jun 2025 07:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750665548; cv=none; b=sTf5s3frpUx9MR3tQS+moUYRCSgAzuJHHoUFDHThFbJefUkt9lktzC45TgObsSavxVgYZA5J7mVx8JPuZec/TsBMgV0BLoeqoA9saoOEod7AP8r7/pQyZWZMms4oMlweF7v+CSX1ppj1tddXuysQcnLf3EfYwmEx5fEla3wgo8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750665548; c=relaxed/simple;
	bh=nI96Ff2Be3Evf1WXzSM8oKbNxUf1r8hXG8Ism039jAo=;
	h=MIME-Version:from:Date:Message-ID:Subject:To:Cc:Content-Type; b=qM5SXNe+rFwHGrDB1RrcIDPYU6NsYZhIyC2VIAhJAMZGCrFebR8kJ+50MYh1hNEDtPCitsAn72ViKY0hCTeL5A7f+VrF1MZkxXgwWkobNAZBx1DGtGa0SSvPx2xbxqLT0gWTDViBF6a1wnrU33Sn2H6vf3rYL4KMIF4uVmk0u9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=tbFJ+zIM; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="tbFJ+zIM"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e740a09eb00so2911237276.0
        for <regressions@lists.linux.dev>; Mon, 23 Jun 2025 00:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1750665545; x=1751270345; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pile0HiM5eznUIiQNtWK1hqgr3gEVWhoaFfiYXdyxD4=;
        b=tbFJ+zIM/KySwHhp69zoiAwORY8tffGBBBNrK7ZIrLyIf4ou2WG3gLYt955tLYRhzP
         nlB/y9I7BZFeRinu1K5pCRQJVLT+hYNmB6rWurGd6OxNLigx00ou5osPVh2tHy8Oi7FA
         2/5KEoposf82icvmqVLLbHxwpPMMgag6krgjC3niYR5w7fYJKX0WhLKOCuAyOQgkG+4b
         THHTbxGLS3NEOVniVIpq0wevIyO/zvxJip3nqq3lySvCK/demCP/gHX50piwxs7L6wIE
         1ljDq5zEa8Xp2711LbCKA99T7TJTzf8bTmIeS1V23QLTS4O6x7F7In7PhdUmUwYWU4r7
         12Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750665545; x=1751270345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:reply-to
         :from:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pile0HiM5eznUIiQNtWK1hqgr3gEVWhoaFfiYXdyxD4=;
        b=ooB0PeMWwTCiyPDF2AV/bMHV3h87KFCouZp+EMgv0p9Jp5JZRRRcOnTeEPIgc9wdCk
         qCfg+fjfZKTFdnOXnPppZ5szQpCz65vj+ys/itL/+GDPTBFmOeIBsEr7YvGb3UnMs9Bm
         6eXoPD3a2vykr1p5q0Wc+a862DtZa9pEOGZW2YN3x4631XtOzpxYziZkUriuqMgzzr36
         JyVPJdNrqNmFSRtrABGXh8vvnX8oJ/y8J4E+8W/ctNak/gf+VkfrQ6szvuVncLCHF5dT
         ibLjsXdw7jD1xvRUx7lskdJc8YBFqTRJeBR47lnznq4RuZXhC2hsN3Tsc443/wonC8AL
         qPGw==
X-Gm-Message-State: AOJu0Yznly3qFOa3bmTT/NHsrC8BVogvgU0nZ7rnZQzpTjsG0mTWfTIJ
	brwbHfzL7V1evpoH7CCbc4vvEoBAsaB7BLvq0/vkUty5zBWk+rzfy3zXRmYxwc0klWLBpq+aaZM
	2JTM7+7LPwupvpbSL7cykwWVCfmzzRVcbyBpUDOENCA==
X-Gm-Gg: ASbGncvgjLLWCsE5VlfaWL5MAR4xqw/8A/n5vTKpIvbsD8Z+XSlCW5i3GAZr4geyyQd
	37mZJn4nFNlUPGsRtKc9OAq/+rxSGRVauGogf72V9XuF3xfyy63wGxzpqeGx5JVI6gWvoffXqrT
	rU3hD5W5hQFmxjcT3bPXm5gLAYZWtgGszSOpI3bDQ0bQ==
X-Google-Smtp-Source: AGHT+IHORCN8YHKwJByuZt+PuD3p3rvz0uvxsynt0rp2tKrG57zyH5zi7e7x6T5N9ZtTk+yKhwAeunQDSsFivaomhAw=
X-Received: by 2002:a05:6902:278a:b0:e82:61:6536 with SMTP id
 3f1490d57ef6-e842bc6236amr15025478276.7.1750665545369; Mon, 23 Jun 2025
 00:59:05 -0700 (PDT)
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 23 Jun 2025 03:59:02 -0400
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
from: KernelCI bot <bot@kernelci.org>
Reply-To: kernelci@lists.linux.dev
Date: Mon, 23 Jun 2025 03:59:02 -0400
X-Gm-Features: AX0GCFu9Zpq19V02N-ovo9nnjGPAJxLs2RO1qtchIPA-C4sQdqgsGDXHMpX-Gjs
Message-ID: <CACo-S-3ophYFr4ZC+XRVsOfzREDZA9Y5Au6Ma3S_bNwZsLq0pQ@mail.gmail.com>
Subject: =?UTF-8?B?W1JFR1JFU1NJT05dIG5leHQvbWFzdGVyOiAoYnVpbGQpIOKAmHJhaWQ2X2VtcHR5X3plcg==?=
	=?UTF-8?B?b19wYWdl4oCZIHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKTsgZC4uLg==?=
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

New build issue found on next/master:

---
 =E2=80=98raid6_empty_zero_page=E2=80=99 undeclared (first use in this func=
tion); did
you mean =E2=80=98raid6_get_zero_page=E2=80=99? in lib/raid6/recov_rvv.o
(lib/raid6/recov_rvv.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:79e6a6d6def77410fe6b7f454eb54=
6fc8d5f9df5
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it
- commit HEAD:  f817b6dd2b62d921a6cdc0a3ac599cd1851f343c


Log excerpt:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
lib/raid6/recov_rvv.c:168:31: error: =E2=80=98raid6_empty_zero_page=E2=80=
=99
undeclared (first use in this function); did you mean
=E2=80=98raid6_get_zero_page=E2=80=99?
  168 |         ptrs[faila] =3D (void *)raid6_empty_zero_page;
      |                               ^~~~~~~~~~~~~~~~~~~~~
      |                               raid6_get_zero_page
lib/raid6/recov_rvv.c:168:31: note: each undeclared identifier is
reported only once for each function it appears in
lib/raid6/recov_rvv.c: In function =E2=80=98raid6_datap_recov_rvv=E2=80=99:
lib/raid6/recov_rvv.c:206:31: error: =E2=80=98raid6_empty_zero_page=E2=80=
=99
undeclared (first use in this function); did you mean
=E2=80=98raid6_get_zero_page=E2=80=99?
  206 |         ptrs[faila] =3D (void *)raid6_empty_zero_page;
      |                               ^~~~~~~~~~~~~~~~~~~~~
      |                               raid6_get_zero_page

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D


# Builds where the incident occurred:

## defconfig on (riscv):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:6858fb375c2cf25042d04b7b


#kernelci issue maestro:79e6a6d6def77410fe6b7f454eb546fc8d5f9df5

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
