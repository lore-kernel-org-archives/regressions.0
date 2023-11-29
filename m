Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C97C1C6B4
	for <regressions@lists.linux.dev>; Wed, 29 Nov 2023 13:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cJS/Pn0Y"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-1fa618c0e61so1672689fac.1
        for <regressions@lists.linux.dev>; Wed, 29 Nov 2023 05:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701265868; x=1701870668; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KD1muJiPB8+lXdz9QAzcQerA6N3IurpNa/FCWjvcTTA=;
        b=cJS/Pn0YiNIz0KffgyhxqKTK2tqKVhqnnEwN/QH3wFsfDw52gbnB9XLtbHTbK6ZLb6
         t/zVrbNuPqA88LI4JfAT2DYTePiU/TAV568+NoOnG4g0MVTexXzi2hP1jQfeWt8hUe5s
         vqeqyvvPv+I8Rdz+2j7MSEJsWeQ0v7QcnRwnfV7VHWGGUQVZ4LoCX7J1xE2DGkYqWa0C
         8d3IvYZEzb7Q9E/Q6gOGUp5Pf1OXBMOsMnPn1SWLvFkjdmgEveJBTl0MeDgVJq0fDqEf
         kWSGsbRp94WAKyzspK4bb93uSQNPCgmMgmopKhYVlNssE/WVijSpybEGdB9CWu8zEQvn
         KD2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701265868; x=1701870668;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KD1muJiPB8+lXdz9QAzcQerA6N3IurpNa/FCWjvcTTA=;
        b=H/DxE00o0UVWZ+z6Sho/h2jWjnVrbKq5tFD6hPDNLJQAOtuAm6EGegnh2kuyws8Ta0
         ig4FQZdpmHkpvuNIl7vgTo40L4q2LFYLMbwgXB3/JOyvJx5xHOOnowCs36xOO/5bwMAf
         ZLkQOmDGn2CyY0RIWjmdmwiHfPX0QU57zVRo5mfwGCtVsOzy321ApE4ZZfi9MQ9p4MZu
         sbLuWYZ9t0bIBQZWfI1wXWpRP+qSmmjsyYGnK71NznRUf3s7HFMEBAztrKC3GPNw21EO
         aIdOMI7v7FWFuLDhsb3NcrCu/R9VgubYNVGmXZXt+3oIMjlaMmJa1kVTJ8IffNbsTf7S
         jUTg==
X-Gm-Message-State: AOJu0YzT/a7qSqY3nbaEJBV0i3E056kYj7kx3S5qb7i2HZml7ROaQCcn
	0StsQuEblIjD18NIk95h8Nv+qTSYqZHpPqpeDh4=
X-Google-Smtp-Source: AGHT+IF/P408lEGrdFVoOU8I1AP/p9OaFI9E1g6cnVNM5pbGGA7QD9y6ObERwISbTugNJXoU+G8fLgVOFsGaG1BgagU=
X-Received: by 2002:a05:6870:e99a:b0:1fa:126:2b27 with SMTP id
 r26-20020a056870e99a00b001fa01262b27mr20000238oao.50.1701265868318; Wed, 29
 Nov 2023 05:51:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <87edgv4x3i.fsf@vps.thesusis.net> <559d0fa5-953a-4a97-b03b-5eb1287c83d8@leemhuis.info>
 <CAPM=9tw-8pQWFso0zuLqpsqd5BSHWtc4As9ttdjY-DDr70EMqQ@mail.gmail.com>
 <bdb238b6-60c7-4f26-81d0-9e62cd5dd326@gmail.com> <CADnq5_NVGS1XykxGxpcu_bpPbzboCUJQkcCF3r+0N9a23KUgiQ@mail.gmail.com>
 <96e2e13c-f01c-4baf-a9a3-cbaa48fb10c7@amd.com> <CADnq5_NBfeAXEyQw0gnSd67=tR-bUKg8w=10+4z9pGGuRnP9uw@mail.gmail.com>
 <87jzq2ixtm.fsf@vps.thesusis.net> <CADnq5_Ou-MVVm0rdWDmDnJNLkWUayXzO26uCEtz3ucNa4Ghy2w@mail.gmail.com>
 <95fe9b5b-05ce-4462-9973-9aca306bc44f@gmail.com>
In-Reply-To: <95fe9b5b-05ce-4462-9973-9aca306bc44f@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 29 Nov 2023 08:50:56 -0500
Message-ID: <CADnq5_MYEWx=e1LBLeVs0UbR5_xEScjDyw_-75mLe8RAMnqh6g@mail.gmail.com>
Subject: Re: Radeon regression in 6.6 kernel
To: Luben Tuikov <ltuikov89@gmail.com>
Cc: Phillip Susi <phill@thesusis.net>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
	linux-kernel@vger.kernel.org, 
	"amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, dri-devel@lists.freedesktop.org, 
	Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 28, 2023 at 11:45=E2=80=AFPM Luben Tuikov <ltuikov89@gmail.com>=
 wrote:
>
> On 2023-11-28 17:13, Alex Deucher wrote:
> > On Mon, Nov 27, 2023 at 6:24=E2=80=AFPM Phillip Susi <phill@thesusis.ne=
t> wrote:
> >>
> >> Alex Deucher <alexdeucher@gmail.com> writes:
> >>
> >>>> In that case those are the already known problems with the scheduler
> >>>> changes, aren't they?
> >>>
> >>> Yes.  Those changes went into 6.7 though, not 6.6 AFAIK.  Maybe I'm
> >>> misunderstanding what the original report was actually testing.  If i=
t
> >>> was 6.7, then try reverting:
> >>> 56e449603f0ac580700621a356d35d5716a62ce5
> >>> b70438004a14f4d0f9890b3297cd66248728546c
> >>
> >> At some point it was suggested that I file a gitlab issue, but I took
> >> this to mean it was already known and being worked on.  -rc3 came out
> >> today and still has the problem.  Is there a known issue I could track=
?
> >>
> >
> > At this point, unless there are any objections, I think we should just
> > revert the two patches
> Uhm, no.
>
> Why "the two" patches?
>
> This email, part of this thread,
>
> https://lore.kernel.org/all/87r0kircdo.fsf@vps.thesusis.net/
>
> clearly states that reverting *only* this commit,
> 56e449603f0ac5 drm/sched: Convert the GPU scheduler to variable number of=
 run-queues
> *does not* mitigate the failed suspend. (Furthermore, this commit doesn't=
 really change
> anything operational, other than using an allocated array, instead of a s=
tatic one, in DRM,
> while the 2nd patch is solely contained within the amdgpu driver code.)
>
> Leaving us with only this change,
> b70438004a14f4 drm/amdgpu: move buffer funcs setting up a level
> to be at fault, as the kernel log attached in the linked email above show=
s.
>
> The conclusion is that only b70438004a14f4 needs reverting.

b70438004a14f4 was a fix for 56e449603f0ac5.  Without b70438004a14f4,
56e449603f0ac5 breaks amdgpu.

Alex
