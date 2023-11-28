Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CAF244390
	for <regressions@lists.linux.dev>; Tue, 28 Nov 2023 22:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NrscATeC"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6d7e56f6845so3669756a34.0
        for <regressions@lists.linux.dev>; Tue, 28 Nov 2023 14:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701209594; x=1701814394; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bzkua+PtowZpetcv1vSwzhlAqYyVuNpPQqTrqldHUFg=;
        b=NrscATeCj86tcYq6IPYFj0UrplL4zIm+dsUiFG+ItOrhD/Pb1efGXA+Z0abc/xloqB
         8cpEEKu8swNjiwAGlhC0dtkOTtimWrs5VdyG7C3dN7CdeJ0E9dIrvBWnUEM4XO0EBPcs
         gfI4ouA9wDT7IKGfVciCe+GpjBVOMCvxeJDHG4sBqOkBhTQsjQxRrkAeTDUMw5vNss46
         BFX5FKiC8t6+9uNvLcWuz5NMA7bwGetPxakcb8qdMnv4Wr2yLaJ+uveAY4YgEAhTSuKT
         Hn56HEtbyKm+tFKBl5eEHCjCKsaDm+BOZqC4wcTyOZd2RASMknNn/vlVg0IOZlVgwZwJ
         S68Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701209594; x=1701814394;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bzkua+PtowZpetcv1vSwzhlAqYyVuNpPQqTrqldHUFg=;
        b=AAFDZOWMJpirEIOq21qoua6rsPq0dtr/T9mtyZqiOygAViKz+smVRH+wiyO2AJzYnJ
         JKmNStJUWmEDgvKZYzJzMC4oDU+Boe4Bod9M8y5emrlFRREla33SdRRjqpJ+vCoFp05v
         m4T2aeXZVDvohLnGrNPbwhjUsfCWlKSYjStwo6H0QGssEJIMV79rmRhUJ/cGK0VamY3r
         9jLcd++1Q67nIvNgfj3uciOQy1Sp6WiVztdjRdpOYBabUpkUUeScm11RwKEnB1VzCq+S
         O28e3Mp0h3RB9lqxwI7kyYp/OaqRZAIAFQFL4pY7nWkmj+sCdf9Aa9DDW3s9Ng3pD70H
         3agQ==
X-Gm-Message-State: AOJu0YwjMQmSE4p/UtLrmH5ajqF+KFkGHRfuMcbVT/wAo4Jhws79M8ud
	oh4d1mK2bnoauo6/roYgguQ5M3rTZC3OUR0wuSw=
X-Google-Smtp-Source: AGHT+IFbrCgwO30ksnJPK0vfsHqHO0Uot3qklNhA8h4Ae+35H6kZ7mEYmIQO0afjWRq/2USC0OYc3UiMQOZSlgVxD34=
X-Received: by 2002:a05:6870:ebca:b0:1e9:9989:33a5 with SMTP id
 cr10-20020a056870ebca00b001e9998933a5mr23314739oab.5.1701209594307; Tue, 28
 Nov 2023 14:13:14 -0800 (PST)
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
 <87jzq2ixtm.fsf@vps.thesusis.net>
In-Reply-To: <87jzq2ixtm.fsf@vps.thesusis.net>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 28 Nov 2023 17:13:03 -0500
Message-ID: <CADnq5_Ou-MVVm0rdWDmDnJNLkWUayXzO26uCEtz3ucNa4Ghy2w@mail.gmail.com>
Subject: Re: Radeon regression in 6.6 kernel
To: Phillip Susi <phill@thesusis.net>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
	Dave Airlie <airlied@gmail.com>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, linux-kernel@vger.kernel.org, 
	"amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, Luben Tuikov <luben.tuikov@amd.com>, 
	dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 27, 2023 at 6:24=E2=80=AFPM Phillip Susi <phill@thesusis.net> w=
rote:
>
> Alex Deucher <alexdeucher@gmail.com> writes:
>
> >> In that case those are the already known problems with the scheduler
> >> changes, aren't they?
> >
> > Yes.  Those changes went into 6.7 though, not 6.6 AFAIK.  Maybe I'm
> > misunderstanding what the original report was actually testing.  If it
> > was 6.7, then try reverting:
> > 56e449603f0ac580700621a356d35d5716a62ce5
> > b70438004a14f4d0f9890b3297cd66248728546c
>
> At some point it was suggested that I file a gitlab issue, but I took
> this to mean it was already known and being worked on.  -rc3 came out
> today and still has the problem.  Is there a known issue I could track?
>

At this point, unless there are any objections, I think we should just
revert the two patches.

Alex
