Received: from mail3.out.flockmail.com (mail3.out.flockmail.com [18.215.190.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B563EE1E9
	for <regressions@lists.linux.dev>; Wed,  8 Jul 2026 21:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.215.190.59
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783544672; cv=none; b=oHp8rXruw7uV8BqUkOltKk9B0llfwyS+f2GQQHNebjd79v/OjeeQLQn8RMwH7c7y5WgeaY76amcf1fwuyklr0qSP19ic/LyU6pCMHNJcbUEB6S/Nolx5QAPmHvElGuI6QLkOFGT5ZrPauA94nKEcxuYEtjGBAQksLpu+4LKEbb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783544672; c=relaxed/simple;
	bh=hB9tHs7LrO5CdpO4H99+r0fJywWQ3r1sTBAV3mPce7s=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=qCpOj2ZXCZA9gfkp0iZKVqseAjtSO2an2rcgfeucJCDeSIVFbIv9/3KLgqplYSv9iwfAX08/TFfNBrHR9HP75CbIa6p2d01pf2t/m0NoGsfw1Iclvhul0QwhxxbbnxOjfagrbDuwnWMjzq4y5Uyau4IJ2PuQk7515CDAdbpJCSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chaudharilaw.com; spf=pass smtp.mailfrom=chaudharilaw.com; dkim=pass (1024-bit key) header.d=chaudharilaw.com header.i=@chaudharilaw.com header.b=JqMNwXGe; arc=none smtp.client-ip=18.215.190.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chaudharilaw.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaudharilaw.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaudharilaw.com header.i=@chaudharilaw.com header.b="JqMNwXGe"
Received: from localhost (localhost [127.0.0.1])
	by smtp-out.flockmail.com (Postfix) with ESMTP id 4gwVmx0Vg2z1xqj
	for <regressions@lists.linux.dev>; Wed,  8 Jul 2026 20:58:25 +0000 (UTC)
X-Titan-User-Uid: eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..9jRX5NB8EqzyKN9b.qttznb_HBi8jQSSpQhotnMzCy0khdlFo0LYRXwO2_0OIDxjIWSlx9Uf6TwHbrgloN0v9YOflzfYwYSFP5OhhQIWmIsg76XQquoObDeQT4O863HE.G8R5GpEUPXEK1o3y2GsRqw
DKIM-Signature: a=rsa-sha256; bh=hB9tHs7LrO5CdpO4H99+r0fJywWQ3r1sTBAV3mPce7s=;
	c=relaxed/relaxed; d=chaudharilaw.com;
	h=mime-version:from:date:subject:message-id:to:from:to:subject:date:message-id:cc:in-reply-to:reply-to:references;
	q=dns/txt; s=titan1; t=1783544304; v=1;
	b=JqMNwXGe5chqGWd2nN/ZtOGG8TGZFQaOV10tSTUzmyVVPsJbJXI/bP17TLt82EJUSYTQvSro
	eAGGHtxi5DBJEe6u8Y707l6twuV/AiqRWZDKC3eZ1QAKeWBc6lf+P7hGmjnDEsa17im3DFud2zd
	LgypM09ZtHMtv5CFmkULUGbs=
X-AuthUser: papool@chaudharilaw.com
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	by smtp-out.flockmail.com (Postfix) with ESMTPA id 4gwVmw64dkz1xrX
	for <regressions@lists.linux.dev>; Wed,  8 Jul 2026 20:58:24 +0000 (UTC)
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-664e3ed58bcso354365d50.1
        for <regressions@lists.linux.dev>; Wed, 08 Jul 2026 13:58:24 -0700 (PDT)
X-Gm-Message-State: AOJu0Yz5zqvn682QuNgv+QxkHy3T4H+6kpyw7UgnJq9wSDdwtfKefqAV
	sbnAZ7J7+01M8iYWpM4qPqVgdGn4jpnG0S5mrqRXkqyEEaz/tsGKqvQeI9Mt+hoE0mG/cVFi5nd
	M7l0U1vpcGm63Kg8M2JvjGfg/0/Xdr2U=
X-Received: by 2002:a05:690e:2402:b0:666:4cf:65b3 with SMTP id
 956f58d0204a3-66788dd1bd9mr4682758d50.15.1783544304434; Wed, 08 Jul 2026
 13:58:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Feedback-ID: :Papool@chaudharilaw.com:chaudharilaw.com:flockmailId
From: Papool Chaudhari <Papool@chaudharilaw.com>
Date: Wed, 8 Jul 2026 14:58:10 -0600
X-Gmail-Original-Message-ID: <CALcz8n5nB=H8CZza-Pw==GfQWRViJwWK8N5PgafE-4pdUJL-LA@mail.gmail.com>
X-Gm-Features: AUfX_mxv3l0ZXP0i-v9OmQUYfyZTNplJ8xV13EIdgm_vADDdjIAgfS5h34LdRfE
Message-ID: <CALcz8n5nB=H8CZza-Pw==GfQWRViJwWK8N5PgafE-4pdUJL-LA@mail.gmail.com>
Subject: =?UTF-8?Q?=5BREGRESSION=5D_2017_Pixelbook_backlight_control_doesn?=
	=?UTF-8?Q?=E2=80=99t_work_with_7=2E1_kernel?=
To: regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-F-Verdict: SPFVALID
X-Titan-Src-Out: 1783544304869136541.32333.4072343636285317868@prod-use1-smtp-out1003.
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.4 cv=etDvCIpX c=1 sm=1 tr=0 ts=6a4eb9f0
	a=YFm/cWH0HiqiDP3rY6DHxA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
	a=CEWIc4RMnpUA:10 a=5KLPUuaC_9wA:10 a=9wnB493i9RuopMTSf4QA:9
	a=QEXdDO2ut3YA:10

Device: 2017 Google Pixelbook i5 (Google's own chromebook from 2017)
Backlight: intel_backlight
OS: Arch using KDE Plasma 6.7.2 (Wayland via Kwin)
Firmware Type: RW_LEGACY firmware from MrChromeBox, updated to most
recent version
Internal storage type: SSD

Summary of the Issue
The Pixelbook has pretty much full functionality with linux, except
for two needed tweaks. Once is a chromebook audio script to run, and
the other is backlight.

Adjusting the backlight (using the slider in KDE) does not work
without editing your GRUB file and putting in this line:
GRUB_CMDLINE_LINUX=3D=E2=80=9Ci915.enable_dpcd_backlight=3D1=E2=80=9D

This =E2=80=9Cfix=E2=80=9D has worked with any flavor of linux. I have pers=
onally
tested in Kubuntu, MX Linux, CachyOS, and now Arch.

The problem now is, something changed with the Linux 7.1 kernel where
this doesn=E2=80=99t work anymore. Still works perfectly on 7.0.x kernel an=
d
below, but any 7.1 (or 7.2rc kernel) does not work and I=E2=80=99ve tried a
million fixes, and nothing works. The million fixes include removing
that line, changing the value to 0, 2, or 3.

Tried this, didn=E2=80=99t work:
GRUB_CMDLINE_LINUX=3D=E2=80=9Ci915.enable_dpcd_backlight=3D1 i915.enable_ps=
r=3D0
i915.enable_fbc=3D0=E2=80=9D Also tried
GRUB_CMDLINE_LINUX=3D=E2=80=9Cacpi_backlight=3Dnative=E2=80=9D

I have tried the software brightnessctl, making changes with it has no
effect. Also tried the software gammastep, doesn=E2=80=99t work. And other
ones like =E2=80=9Ccolord=E2=80=9D (I think that=E2=80=99s what it is calle=
d).

I've read the backlight section in arch wiki, nothing there that works
to fix this.

NOTHING changes the brightness if using 7.1 or newer kernel.

Steps to Reproduce
1.) Install RW_LEGACY MrChromebox firmware on Pixelbook and any flavor
of Linux with kernel 7.1 or higher.

2.) Edit GRUB_CMDLINE_LINUX=3D=E2=80=9Ci915.enable_dpcd_backlight=3D1=E2=80=
=9D and update
grub. This is the fix for backlight controls that works for kernel
7.0.x and lower.

3.) With 7.1 kernel or higher, this fix does not work, neither do any
other known fixes for controlling backlight.

Expected Behavior
I should be able to use the slider in KDE for backlight/brightness and
adjust the brightness, just as I can do with any kernel 7.0.x or
lower. I have reached the conclusion that something changed in the 7.1
kernel, but have no idea on how to get this fixed. Or if it is even
possible. Perhaps I am stuck just using 7.0.x and below on this device
until EOL.
