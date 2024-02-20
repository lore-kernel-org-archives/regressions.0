Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3757C762C6
	for <regressions@lists.linux.dev>; Tue, 20 Feb 2024 15:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708443974; cv=none; b=d1BfNlyC73sNtrjxx6HifM86PBJhKGA1UFQFSw0AuiSqz+SdTSQTREaj/GD1y468JjSuTq6uQcIbWqTFfoILhqjDimnb+Big96cqzGNusFrkv8PV5Rvl2nKIJcZo20C/DzkEJHN578kcTQSYQ3C8eRe/J1tPc5djYLA62kXbQ2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708443974; c=relaxed/simple;
	bh=gnlbNeiAOusI6ME6rR0hY9n6d3kFNmOaCbo6JGD8cus=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bK69tGK7tk3zbsX0ipoBFKtgBDmvMGz/62KONDzs6Q46vAsP7DMxc9cu0VACOBTRFvlCHUeLrqCB2f/KgvOquropq8QDvRL0Gsw3DaduP/6RbuQMF1Y2x+2565kPDOgzCdDFaa273ilNzBRPDSn4pYBPai12nOK6t9ZXiQtIQqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wf/rahDG; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wf/rahDG"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-5d3907ff128so4916652a12.3
        for <regressions@lists.linux.dev>; Tue, 20 Feb 2024 07:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708443972; x=1709048772; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hFlO25fJaBnvhr3ct5wS1sC2xblmPvQV+yUKSBKVbxQ=;
        b=Wf/rahDGMNamiN7p77cFtDwhmNomUlcihsuFtWnQG0OrJ0Ec7eeRiQ3UFgUNmxrrKY
         Jjb2HDYi5OnW/j+8GMtnkd4xbodCJJcFhfHGNsT9JqhfNtdsfs+5T/091ZSIPBwWPyLz
         OCySznGx2TGeZQavJSL31sHGXaehRzASIKMwn34ANcA3Ky7zRW9f2EzYN/jbIDFigmCu
         9I874qlKdqRc+NT9ycxrEXGcY5fl8qJhWEG7zkkRyfcJoHWrpn4d3auGkbyT74eEiRO3
         B4JAqSsZKKR1+3/wGv0eSDUHApO4atJASFCNia5PBs85WgwxMtGST1fIuWy8hRXUBSGG
         CnbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708443972; x=1709048772;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hFlO25fJaBnvhr3ct5wS1sC2xblmPvQV+yUKSBKVbxQ=;
        b=YoXQFFUk23x8fM3TkYErWIzh860mfKm1yg46vJYc3wn35MqwPpbxefM/+LaFE3yBn1
         Tlv+N7KvHPSQ5AgUnnmaG0wY3B00WVDwwVCMBaCrjTDJGbzkA/Q14UZDsqawWkss5Y5V
         WEWDdnAqRa3BIEQbQHf8VpMzDv9rF8AuV+c6tN9qZPACvKl2YYsEvo1KecRYB15MhEEm
         WgDyDtDYK3D4dPXYo4232lkO1ruV7iPXcl7+TJP/rHcBA3I9NOOj+ZHPrx/w+1ED7gSh
         TnHNuvDsRdBHbKCX+NtR/5re4RCtiMZF0IrF9VHcIt45ME9TmV/N0TWidJ3NqMcoxTKM
         wt4w==
X-Gm-Message-State: AOJu0Yy7U85wq9lUHeKF6GVwT1UfY5fh2WfQEwZ+oT/+YmDHEiQkDSTn
	8/s3B9ZbG2ItGI+V0I2cLyiPwW9xVl/9KzVK/gIY7B4L7JdH5cfkAdyyZ4g4Cq3WXAqJiH163D7
	0sxvXZUz1FriT/Bz/5aD8S39tc4q/4rxT
X-Google-Smtp-Source: AGHT+IGVyazWxyv68bCNmy5uTWHkR45NDvaNyxsIZ91D0rgLx9S2V+vK9H5jUgCG038EeQi1/I2EJlA91qq5+2BW8tw=
X-Received: by 2002:a17:90a:f2d0:b0:299:d90:1635 with SMTP id
 gt16-20020a17090af2d000b002990d901635mr13266889pjb.5.1708443972117; Tue, 20
 Feb 2024 07:46:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ae64f04d-6e94-4da4-a740-78ea94e0552c@riadoklan.sk.eu.org>
 <2024021732-framing-tactful-833d@gregkh> <d369b45f-e1af-4117-83a5-3e429e3bfb23@leemhuis.info>
 <CADnq5_OgPBtYpxBQ+aBmA2t7ob7EFPFWrF9OYXNgm00eEayMNA@mail.gmail.com>
 <62bf771e-640a-45ab-a2de-3df459a9ed30@leemhuis.info> <CADnq5_M4Zwv0_B1DoU_a8aNpyPVJj_PpjDG_oi3JkrGC5-hNgg@mail.gmail.com>
 <4bc8747a-d87f-423b-b0ce-8891e78ae094@redhat.com> <a6243c3b-d773-4693-88e9-033995616f12@leemhuis.info>
In-Reply-To: <a6243c3b-d773-4693-88e9-033995616f12@leemhuis.info>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 20 Feb 2024 10:46:00 -0500
Message-ID: <CADnq5_MHmz=HdGA22U-bk2b+4un70bmLzpbDyc3+tjzoRAnCeA@mail.gmail.com>
Subject: Re: Kernel 6.7+ broke under-powering of my RX 6700XT. (Archlinux, mesa/amdgpu)
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Hans de Goede <hdegoede@redhat.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	"Pan, Xinhui" <Xinhui.Pan@amd.com>, Ma Jun <Jun.Ma2@amd.com>, 
	"amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, Dave Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Greg KH <gregkh@linuxfoundation.org>, 
	Roman Benes <benes@riadoklan.sk.eu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 20, 2024 at 10:42=E2=80=AFAM Linux regression tracking (Thorste=
n
Leemhuis) <regressions@leemhuis.info> wrote:
>
>
>
> On 20.02.24 16:27, Hans de Goede wrote:
> > Hi,
> >
> > On 2/20/24 16:15, Alex Deucher wrote:
> >> On Tue, Feb 20, 2024 at 10:03=E2=80=AFAM Linux regression tracking (Th=
orsten
> >> Leemhuis) <regressions@leemhuis.info> wrote:
> >>>
> >>> On 20.02.24 15:45, Alex Deucher wrote:
> >>>> On Mon, Feb 19, 2024 at 9:47=E2=80=AFAM Linux regression tracking (T=
horsten
> >>>> Leemhuis) <regressions@leemhuis.info> wrote:
> >>>>>
> >>>>> On 17.02.24 14:30, Greg KH wrote:
> >>>>>> On Sat, Feb 17, 2024 at 02:01:54PM +0100, Roman Benes wrote:
> >>>>>>> Minimum power limit on latest(6.7+) kernels is 190W for my GPU (R=
X 6700XT,
> >>>>>>> mesa, archlinux) and I cannot get power cap as low as before(to 1=
15W),
> >>>>>>> neither with Corectrl, LACT or TuxClocker and /sys have a variabl=
e read-only
> >>>>>>> even for root. This is not of above apps issue but of the kernel,=
 I read
> >>>>>>> similar issues from other bug reports of above apps. I downgraded=
 to v6.6.10
> >>>>>>> kernel and my 115W(under power)cap work again as before.
> >>>>>>
> >>>>> For the record and everyone that lands here: the cause is known now
> >>>>> (it's 1958946858a62b ("drm/amd/pm: Support for getting power1_cap_m=
in
> >>>>> value") [v6.7-rc1]) and the issue afaics tracked here:
> >>>>>
> >>>>> https://gitlab.freedesktop.org/drm/amd/-/issues/3183
> >>>>>
> >>>>> Other mentions:
> >>>>> https://gitlab.freedesktop.org/drm/amd/-/issues/3137
> >>>>> https://gitlab.freedesktop.org/drm/amd/-/issues/2992
> >>>>>
> >>>>> Haven't seen any statement from the amdgpu developers (now CCed) ye=
t on
> >>>>> this there (but might have missed something!). From what I can see =
I
> >>>>> assume this will likely be somewhat tricky to handle, as a revert
> >>>>> overall might be a bad idea here. We'll see I guess.
> >>>>
> >>>> The change aligns the driver what has been validated on each board
> >>>> design.  Windows uses the same limits.  Using values lower than the
> >>>> validated range can lead to undefined behavior and could potentially
> >>>> damage your hardware.
> >>>
> >>> Thx for the reply! Yeah, I was expecting something along those lines.
> >>>
> >>> Nevertheless it afaics still is a regression in the eyes of many user=
s.
> >>> I'm not sure how Linus feels about this, but I wonder if we can find
> >>> some solution here so that users that really want to, can continue to=
 do
> >>> what was possible out-of-the box before. Is that possible to realize =
or
> >>> even supported already?
> >>>
> >>> And sure, those users would be running their hardware outside of its
> >>> specifications. But is that different from overclocking (which the
> >>> driver allows, doesn't it? If not by all means please correct me!)?
> >>
> >> Sure.  The driver has always had upper bound limits for overclocking,
> >> this change adds lower bounds checking for underclocking as well.
> >> When the silicon validation teams set the bounding box for a device,
> >> they set a range of values where it's reasonable to operate based on
> >> the characteristics of the design.
> >>
> >> If we did want to allow extended underclocking, we need a big warning
> >> in the logs at the very least.
> >
> > Requiring a module-option to be set to allow this, as well as a big
> > warning in the logs sounds like a good solution to me.
>
> Yeah, especially as it sounds from some of the reports as if some
> vendors did a really bad job when it came to setting the proper
> lower-bound limits are now adhered -- and thus higher then what we used
> out-of-the box before 1958946858a62b was applied.
>
> Side note: I assume those "lower bounds checking" is done round about
> the same way by the Windows driver? Does that one allow users to go
> lower somehow? Say after modifying the registry or something like that?
> Or through external tools?

Windows uses the same limit.  I'm not aware of any way to override the
limit on windows off hand.

Alex


>
> Ciao, Thorsten
>
> >>>>> Roman posted something that apparently was meant to go to the list,=
 so
> >>>>> let me put it here:
> >>>>>
> >>>>> """
> >>>>> UPDATE: User fililip already posted patch, but it need to be merged=
,
> >>>>> discussion is on gitlab link below.
> >>>>>
> >>>>> (PS: I hope I am replying correctly to "all" now? - using original =
addr.)
> >>>>>
> >>>>>
> >>>>>> it seems that commit was already found(see user's 'fililip' commen=
t):
> >>>>>>
> >>>>>> https://gitlab.freedesktop.org/drm/amd/-/issues/3183
> >>>>>> commit 1958946858a62b6b5392ed075aa219d199bcae39
> >>>>>> Author: Ma Jun <Jun.Ma2@amd.com>
> >>>>>> Date:   Thu Oct 12 09:33:45 2023 +0800
> >>>>>>
> >>>>>>     drm/amd/pm: Support for getting power1_cap_min value
> >>>>>>
> >>>>>>     Support for getting power1_cap_min value on smu13 and smu11.
> >>>>>>     For other Asics, we still use 0 as the default value.
> >>>>>>
> >>>>>>     Signed-off-by: Ma Jun <Jun.Ma2@amd.com>
> >>>>>>     Reviewed-by: Kenneth Feng <kenneth.feng@amd.com>
> >>>>>>     Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> >>>>>>
> >>>>>> However, this is not good as it remove under-powering range too fa=
r. I
> >>>>> was getting only about 7% less performance but 90W(!) less consumpt=
ion
> >>>>> when set to my 115W before. Also I wonder if we as a OS of options =
and
> >>>>> freedom have to stick to such very high reference for min values wi=
thout
> >>>>> ability to override them through some sys ctrls. Commit was done by=
 amd
> >>>>> guy and I wonder if because of maybe this post that I made few mont=
hs
> >>>>> ago(business strategy?):
> >>>>>>
> >>>>>>
> >>>>> https://www.reddit.com/r/Amd/comments/183gye7/rx_6700xt_from_230w_t=
o_capped_115w_at_only_10/
> >>>>>>
> >>>>>> This is not a dangerous OC upwards where I can understand desire t=
o
> >>>>> protect HW, it is downward, having min cap at 190W when card pull o=
n
> >>>>> 115W almost same speed is IMO crazy to deny. We don't talk about de=
fault
> >>>>> or reference values here either, just a move to lower the range of
> >>>>> options for whatever reason.
> >>>>>>
> >>>>>> I don't know how much power you guys have over them, but please
> >>>>> consider either reverting this change, or give us an option to set
> >>>>> min_cap through say /sys (right now param is readonly, even for roo=
t).
> >>>>>>
> >>>>>>
> >>>>>> Thank you in advance for looking into this, with regards:  Romano
> >>>>> """
> >>>>>
> >>>>> And while at it, let me add this issue to the tracking as well
> >>>>>
> >>>>> [TLDR: I'm adding this report to the list of tracked Linux kernel
> >>>>> regressions; the text you find below is based on a few templates
> >>>>> paragraphs you might have encountered already in similar form.
> >>>>> See link in footer if these mails annoy you.]
> >>>>>
> >>>>> Thanks for the report. To be sure the issue doesn't fall through th=
e
> >>>>> cracks unnoticed, I'm adding it to regzbot, the Linux kernel regres=
sion
> >>>>> tracking bot:
> >>>>>
> >>>>> #regzbot introduced 1958946858a62b /
> >>>>> #regzbot title drm: amdgpu: under-powering broke
> >>>>>
> >>>>> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker'=
 hat)
> >>>>> --
> >>>>> Everything you wanna know about Linux kernel regression tracking:
> >>>>> https://linux-regtracking.leemhuis.info/about/#tldr
> >>>>> That page also explains what to do if mails like this annoy you.
> >>>>
> >>>>
> >>
> >
> >
> >
