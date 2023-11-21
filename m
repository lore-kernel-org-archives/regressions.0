Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF21451C50
	for <regressions@lists.linux.dev>; Tue, 21 Nov 2023 14:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bILNtLup"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-1ea82246069so3123576fac.3
        for <regressions@lists.linux.dev>; Tue, 21 Nov 2023 06:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700575550; x=1701180350; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JicfpEa3uNWDUz2NDkVsyh217wG6PJj7MozXv7sFA4w=;
        b=bILNtLupsf4CsYF0YnZ3uilJMuTIY/Ww4DSydkP/Y3/c0ArO4FgHz8niAIfEPLpqlR
         +RTHeXoQ0IIJG+ezheLByI6mAOjXYev9jX9YexYjsnZsNFW1g02pmh8QyvJvIr9X1y7+
         3kUTNNAm2gVI5nO5PXP4xJ8GT5SH+emqkujvi1xGZ55EXSRhWDBxqHkccPfpWBKxQa1u
         jIg9sILCXPj5pjgc7tZSWfhpqEmRLMGcP8Jn7Ivm8txqBvx7SA4OtGltmxqhzRHFML/I
         jwv2Wgc0LkekAP4KtHuYzOmCn2kPdZNYfmGgKxHM2jKjab4e5kJwCj/Fp6/7U3itPd5i
         OqVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700575550; x=1701180350;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JicfpEa3uNWDUz2NDkVsyh217wG6PJj7MozXv7sFA4w=;
        b=VH+YrjdyDlfGicDqUYxJyabWOwx2o4bTd/HIr0abKIYI7+8vCKnzHymgIzNi6vtPLI
         CozXoZa1euPjASBvOP/GoNZ3rr6ocFwViRUFrkw8SfF31bGhN8BCroxNF8gzpYYEtMo6
         oT/kFQdEBGkMMLD3ayDKOPKypZk+2SpYkIxqYxJRtCPIx7IC3KIaLIv3hCBEPRIYy8xc
         JPAkmzKw0FElQLCMzF7sIfmfxKRIIuLqY0ZUQ9FLrBGJ9/x/gNbO/jxidhOfBmlng+h6
         K+fJjiEGMLt9x+Epg+KiEebovEVVH4RfPa+ar2K6S5KeI2O8QVMoEotKCYaiywGYTm2K
         VHYA==
X-Gm-Message-State: AOJu0Yy3jd9btdKAqh90KVIjgMkxTj1toTURlUMrEk+tq9IJ7E3abXEx
	/OHsizApacH98YLmg8Y2DKE1x3vRSfeaPSfNiAM=
X-Google-Smtp-Source: AGHT+IHKHQMKS3b1gLqqox30Lk4uUwKC52JYW8VCEcKNOaYp9uPK894sLiFLuA30J+s9SqYcbYaSE9jt5JVjnAUgiXE=
X-Received: by 2002:a05:6871:7398:b0:1f5:994:9853 with SMTP id
 na24-20020a056871739800b001f509949853mr13022151oac.22.1700575550741; Tue, 21
 Nov 2023 06:05:50 -0800 (PST)
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
 <87bkbodp51.fsf@vps.thesusis.net>
In-Reply-To: <87bkbodp51.fsf@vps.thesusis.net>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 21 Nov 2023 09:05:39 -0500
Message-ID: <CADnq5_Nh4wCFY10Ha9dTGWvehPCdY2zxfERtFuoeF5_xA+P=QA@mail.gmail.com>
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

On Mon, Nov 20, 2023 at 5:40=E2=80=AFPM Phillip Susi <phill@thesusis.net> w=
rote:
>
> Alex Deucher <alexdeucher@gmail.com> writes:
>
> > Yes.  Those changes went into 6.7 though, not 6.6 AFAIK.  Maybe I'm
> > misunderstanding what the original report was actually testing.  If it
> > was 6.7, then try reverting:
> > 56e449603f0ac580700621a356d35d5716a62ce5
> > b70438004a14f4d0f9890b3297cd66248728546c
>
> I had been running v6.6-rc5 before pulling.  It looks like that got me
> somewhere between v6.6 and v6.7-rc1.  Reverting those two commits fixes
> it.

Does reverting 56e449603f0ac580700621a356d35d5716a62ce5 alone fix it?
Can you also attach your full dmesg log for the failed suspend?

Alex
