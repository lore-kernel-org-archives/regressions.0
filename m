Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337E83CEB9D
	for <regressions@lists.linux.dev>; Mon, 27 Apr 2026 14:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777298515; cv=none; b=LxZLmkMlyW8vmrN/mArE/GFwU8hzfUISGl+uP5i3I3rXPx+oLyxj8xeb+ws8/OlY/kaycatqonbfMgcsLnzqZ6/qqWU7ffFv3JENeZByyYO5cMfSrQ9sjTCd22zQr+TSaVq4CNzswp9BccoRSc3XHKS+y/xy8RLgvaPXYMohi5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777298515; c=relaxed/simple;
	bh=DWToCEIaXUKWmzZCo1GynuIdV0WlRzUNUcIX47DR9ME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j7T1dAPcSN2Rg5Oo36DnF5vyO3N48DAauBE933zWbbHetjnhGmgM1rm85rdjfUxPMrXUspovnQ1gCJtjbYFenEVqmVi/RjSJRMAi6EHS6/vdTvY0HZ1Yzt3vN1pDMwCtNoPavnUV2wtdj6TAO7kc+SGfbdPpVOwIs65JrkBQc70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PtR3TsxM; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PtR3TsxM"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so95015835e9.0
        for <regressions@lists.linux.dev>; Mon, 27 Apr 2026 07:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777298512; x=1777903312; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DWToCEIaXUKWmzZCo1GynuIdV0WlRzUNUcIX47DR9ME=;
        b=PtR3TsxMIu3zenVQpR1u/p5DipIZktD6ZvVFkV/1eXk5e8Y6jrPrNZJvHLR9454DRH
         a4T9ytla+46y88ZEjKvomXgY70XBvX4zB4qNImuzp3RzQPwH1UgMXvBHG4MtTbONXJmw
         0eGXd6gB129KfoKoRSHGiFXpnOut2kv4qtTJOnbEUzGizGkA5F4CAkajonjgJ2Vi7LHc
         TW4wixctsLU15JBigaIeMwS6x1Do3xSz1HWLf2cIuxgjhwH8/O2uNVeEMa8KVjjVNeri
         48ev55g+IUAV9Iu2npZ7g7fZJo/q9LxD4+F4ta/kmsdOdJYY3simpexZx9UpFE9zzYX9
         qp9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777298512; x=1777903312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DWToCEIaXUKWmzZCo1GynuIdV0WlRzUNUcIX47DR9ME=;
        b=C2S9T7ghyL/28HjLwv/6yO7XQL4vEWVHESOnh4DES7rZIzi/Es57GR26VWQQHN6sF/
         71JXebCncWS68wMnbBXVCen21+0IhxAF1ksrbZLrzJ/4Jeub8me2J8L1nIEZ0g8HdY96
         S3hPX1tdT4fwUfWpRx95CG/wIvRpYm5Bo3kx8nVoMcHodr5aiI8M9blpEGHxWVs203wD
         oX0T2pxr4opCBZKEPnHY4gM5oKkJh03KczfioVOUvGKQZSvK4o3ySLMxt0gOCSXYiPKD
         gsFrMJ5ScoRY0Ik7rwaS5Eyaqx9sbS48wa/rg8r/TLEIx7NonBQCS+EL7f1XjWh0HajE
         rphw==
X-Gm-Message-State: AOJu0Yy7jrq4jJxatplaNF1PJ/7/02H5abLj6+SIJ1AvGk30C+eJPrk4
	e5aYkQJE2P38PKKso5/2lHXn8g2VK9NbLFXNL9ZWREywsFdh+semarfE
X-Gm-Gg: AeBDietSrp3drYK7EbqYPsSfdjRhEVRnt07pBJw/wfX/qzaRhFQluLXfZ0qfjZ8ql4z
	GA72V/JMqftR5pHs3wCZTlbZCiLMssuGUri5cqm9Ycvd2s2pdhA+lDIw507YgRQaCQ92cW0SSKk
	88ZRPNHWLCdFKJ1/ea6pEmgiO5I3i3+JIY6ii0sC2WzbsRKwzXX2qcOXKWG77xiR7y5GxqGMIRF
	BvQqOYdeWq7hRNaIO8W2qk33pIzrTiqJGENtE8MN7O5wt108wCxHw0caCHAnNvQks+EhIdkUneR
	w3MprBXE9IT723UHNGopTqDFkFYl8G3L7uSNtqWAI61ModvM/5kEEmvb3R/EPXhznOXT+xZJjSU
	yoF0uDcZGJbDpJ1n6TQD9QyqpyKb7FsUh59brzVUfsHeko05/hTxSZPy0gkpeBjK86iPxF2KprE
	Fl/rC5yPruqGj0xpCBmsI7iGTTrLxuEbEym8TYcYoCmpRIvMduwHu5/5WuxU42udR+ro0ow/Z8g
	B2Fu73vdw==
X-Received: by 2002:a05:600c:4593:b0:488:c120:480a with SMTP id 5b1f17b1804b1-488fb78bf05mr614809525e9.31.1777298512250;
        Mon, 27 Apr 2026 07:01:52 -0700 (PDT)
Received: from timur-hyperion.localnet (5401DFC2.dsl.pool.telekom.hu. [84.1.223.194])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891c08faffsm1050495965e9.1.2026.04.27.07.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 07:01:51 -0700 (PDT)
From: Timur =?UTF-8?B?S3Jpc3TDs2Y=?= <timur.kristof@gmail.com>
To: Brandon Taylor <br.ta.2818@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Linux kernel regressions list <regressions@lists.linux.dev>,
 Alex Deucher <alexander.deucher@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [REGRESSION] amdgpu error -22 first encountered in kernel 6.19,
 not fixed in 7.0
Date: Mon, 27 Apr 2026 16:01:50 +0200
Message-ID: <2730559.vYhyI6sBWr@timur-hyperion>
In-Reply-To: <ed3171ef-eda8-4907-a35b-2e2b8185e574@leemhuis.info>
References:
 <CAMYTvdA+yCqU4_9mzMUkX_3S=myExKMBCyB88dYWCMwA1edsrw@mail.gmail.com>
 <6c48aff5-b6ee-40af-98f0-c26ded3095bc@leemhuis.info>
 <ed3171ef-eda8-4907-a35b-2e2b8185e574@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi,

Thank you Thorsten for forwarding this to me, indeed I am working on improv=
ing=20
the driver for these GPUs. See my replies below.

On Monday, April 27, 2026 11:37:53=E2=80=AFAM Central European Summer Time =
Thorsten=20
Leemhuis wrote:
> [note: please remove Timo Lindfors when replying to this mail and
> include Timur Krist=C3=B3f =E2=80=93 sorry everyone and especially Timo, =
my mailers
> address book tricked me]
>=20
> On 4/27/26 11:35, Linux regression tracking (Thorsten Leemhuis) wrote:
> > On 4/26/26 01:22, Brandon Taylor wrote:
> >> I have an AMD Radeon R9 270X GPU (yes, I know it's old) which used to
> >> default to the `radeon` firmware
> >=20
> > FYI, as using the wrong terms can lead to confusion while dealing with
> > bugs: that's not a firmware, that's the driver (sometimes also called
> > kernel module)

=2D "radeon" is the old kernel driver for these GPUs that didn't support Vu=
lkan=20
and therefore was mostly useless for gaming.
=2D "amdgpu" is the new driver, which supports Vulkan and offers better per=
f,=20
this is the default since Linux 6.19.

I don't think this is a firmware issue.

> >=20
> >> on kernel versions up to and
> >> including 6.18. I could manually change this behavior to use the new
> >> `amdgpu` firmware by setting `radeon.si_support=3D0 amdgpu.si_support=
=3D1`
> >> as kernel parameters in the GRUB bootloader. Everything worked fine,
> >> and I was able to play my Windows games without any problems.
> >>=20
> >> That was, until kernel version 6.19 came out.>
> >> 6.19, from what I was able to Google, was supposed to have AMD GPUs to
> >> default to the new `amdgpu` firmware. Unfortunately, when I updated
> >> the kernel and rebooted, I got a black screen.
> >>=20
> >> Further Google searches led me to reboot, set `nomodeset` in the
> >> kernel parameters, switch to a TTY, login, and investigate the output
> >> of a `dmesg` command =E2=80=94 and what I saw ... Well, let's just say=
 it's
> >> the kind of thing that would make Linus go Chernobyl:
> >>=20
> >> `amdgpu: probe with driver amdgpu failed with error -22`
> >=20

I am sorry this happened and understand the frustration.

Please open an issue here:
https://gitlab.freedesktop.org/drm/amd/-/work_items/new
and upload your full dmesg log. Please ping me personally @Venemo on that=20
issue after you opened it so we can start investigating what is wrong there.

I got curious so I plugged in my R9 270X right now. I am typing this email =
on=20
a computer with a Radeon R9 270X using Linux 6.19.12 on Fedora 43 and it wo=
rks=20
fine. We are going to need to need more details in order to diagnose what t=
he=20
problem really is. We might ask you to test some proposed fixes, considerin=
g=20
that the issue doesn't happen on my R9 270X, I don't have a way to verify i=
t.

> >> Now, I hope to God that this email finds whoever is responsible for
> >> breaking this `amdgpu` firmware before the same thing happens to Linus
> >> via Fedora 44, and he goes berserk. I realize that's not a heck of a
> >> lot of time, but God only knows HOW many Linux users with AMD GPUs are
> >> pissed off by this kind of issue =E2=80=94 and I for one can only imag=
ine how
> >> Linus' reaction will compare when it happens to HIM!

I'm happy to help, there is no need for personal insults.

(Note that the issue clearly doesn't affect all AMD GPUs and it clearly doe=
sn't=20
even affect all R9 270X GPUs.)

Thanks & best regards,
Timur



