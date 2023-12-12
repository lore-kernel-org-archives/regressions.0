Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1601A278
	for <regressions@lists.linux.dev>; Tue, 12 Dec 2023 14:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XNr31D1v"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-1feeea75fbfso3836654fac.3
        for <regressions@lists.linux.dev>; Tue, 12 Dec 2023 06:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702392932; x=1702997732; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FC/Vpfr7MIARIwnwGGWmXjjUlNgWi23Htq/xmbvsJCk=;
        b=XNr31D1vpSvGPiAcbPswZfe8AhzFBtHX0o53GvwnwRYskFCM4c4Avpd81NfBN5Jfga
         fRULuU8F3xjLw20jN7nFBEZAYeo+1k6dd6Jks7wBOLVTAsCi90cIx+4YzQSzRwYhUpAD
         0/NLpU+LqSjJ1FOVMbJ1uKlk7Avo3HrBytz4LlQrffUCEHlsmxl5rht4xk9PavEeF7x4
         Zx5S11hnxo4rZfI7uiwguS749vHa7ERVCdvlOk19OGyUzz/UrLT2rQitErp1Ijaaq7Df
         A8xIMeX0GyMUH8l1rTulwc7s+/7ODmmIKzstT2phHlahUc3Lis72dGl01lcfJ4ZgWaE9
         B5yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702392932; x=1702997732;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FC/Vpfr7MIARIwnwGGWmXjjUlNgWi23Htq/xmbvsJCk=;
        b=sCgXi+w3zrX13FJSL4OP7BR9Bj8VgszJkG8QwhNjEHyWec7SFRawrXesnSu65f9Ngg
         DgSO7u27rwE4eLO1iYLMlYzC9ih3EciF3C8orpvWPrrs3ixHKkK3n4qdLGASt115nsih
         OkV7mqdyRwz2O1bFWcIcG0BXyDwFAOEl08P6dsbjrygcUYsN+eScDSgW9fxtyt5MNkHo
         ZMT1X+m+wfmCw+ulEjkxaBbcyfjdwaM/rFLG6pou13aG1BcSoObiJ2CHYo5RjJUPPtrn
         BhtOo3OMNFP/kyeevGzAg4eCah0KtAQv66wmoMvehcgsFfI7pj0N4cz1LtuixlHcSR1+
         28dg==
X-Gm-Message-State: AOJu0YzhDz7ynxneenKu5fctz+Njwp/C/lJ8ezlEttTAa+oA19XYeoRA
	74mP8zFpldMySXKc1JIY+4TCXWMThT/on1xp434=
X-Google-Smtp-Source: AGHT+IHq+QzxCX8gQUM6S0hC7Fo7q1dTCZTgvw/J1vuRyfhGGu2MpPtuJGqJYnc/6KWnfR91d4qZpois0AOaWLPWIjw=
X-Received: by 2002:a05:6870:f155:b0:1fb:75a:c417 with SMTP id
 l21-20020a056870f15500b001fb075ac417mr5948435oac.64.1702392932689; Tue, 12
 Dec 2023 06:55:32 -0800 (PST)
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
 <95fe9b5b-05ce-4462-9973-9aca306bc44f@gmail.com> <CADnq5_MYEWx=e1LBLeVs0UbR5_xEScjDyw_-75mLe8RAMnqh6g@mail.gmail.com>
 <CADnq5_OC=JFpGcN0oGbTF5xYEt4X3r0=jEY6hJ12W8CzYq1+cA@mail.gmail.com>
 <9595b8bf-e64d-4926-9263-97e18bcd7d05@gmail.com> <CADnq5_N6DF-huOzgaVygvS5N_j_oNUEC1aa4zRsZTzx8GOD_aw@mail.gmail.com>
 <CADnq5_PgMxoW=4iabtgeHydwye-6DvwvCyETdfBToEpuYWocmA@mail.gmail.com>
 <CADnq5_P0S7Jem0e4K6mG2+bboG8P56nELaGC1p4Pfx-8eV-BjQ@mail.gmail.com>
 <CADnq5_Oy6RMyJ52TbsxVjZ=0p=wYJHduE4X8B3DiYnqHYJUAvw@mail.gmail.com>
 <87edg3koka.fsf@vps.thesusis.net> <CADnq5_PtSV1C6Up78XX8ejExqaiM-wzHVFhCRtxboS1Y4cF-Ow@mail.gmail.com>
 <87y1e05me4.fsf@vps.thesusis.net> <87r0jsw9g3.fsf@vps.thesusis.net>
In-Reply-To: <87r0jsw9g3.fsf@vps.thesusis.net>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 12 Dec 2023 09:55:21 -0500
Message-ID: <CADnq5_MYSCd32p2doPMN1_vcrUZvHMDPn83LU-0oVBS6fuRVuA@mail.gmail.com>
Subject: Re: Radeon regression in 6.6 kernel
To: Phillip Susi <phill@thesusis.net>
Cc: Luben Tuikov <ltuikov89@gmail.com>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
	linux-kernel@vger.kernel.org, 
	"amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, dri-devel@lists.freedesktop.org, 
	Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Danilo Krummrich <dakr@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 11, 2023 at 7:28=E2=80=AFPM Phillip Susi <phill@thesusis.net> w=
rote:
>
> Phillip Susi <phill@thesusis.net> writes:
>
> > And it works, but 6.7-rc5 does not, even though it includes that patch.
> > Here's the syslog from the attempt.  I'll start bisecting again.
>
> I checked out the patch that got merged upstream and it also fails.  I
> looked at the two commits, and I see what happened.  Your original patch
> MOVED the call to amdgpu_ttm_set_buffer_funcs_status().  The one that
> got merged into Linus' tree instead DUPLICATES the call.  Oops?
>

Yeah, I messed up the patch somehow when I applied it.  Fix up already
queued up to add the missing chunk.

Alex
