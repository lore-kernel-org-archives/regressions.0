Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37FDB1E51EE
	for <regressions@lists.linux.dev>; Thu,  9 Oct 2025 16:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760028924; cv=none; b=WZR+RsdDcEKt2UukEEPoljQrTOpEwDCWXkvL5Rv6req7uCo36NDNPmsgKv18jMaMpUEiGAr92v4gFc9Lg041FPU+33m0qtEGEkYyJLMjJoBAoqJGTgHhsIh+lLh2h4lHPsimBnNgAslTmquLuJxf3KNrIWbUjkPSNRHLHpPzJi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760028924; c=relaxed/simple;
	bh=lg05B+AK9WUzBtS8QfsDIG1heA3C1fd0M3qBhVawjWA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hl5teLE1P6t5OvVHrFkOTlUfm1LNkcOau3iBt8zXS+vu6A9TIl1SqaNHc5bxHlsrsEVEhiIIOPJhEfuH/MaTj8oeK6wphLYdbIhYimvDifpWQec4pKqOEMTw8SnD3U2B93bbI5g2LIO98H5BVSvBvQqWl5aTGY+qfTpQofoWifg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UkqowpBl; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UkqowpBl"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7bcfafec537so993009a34.0
        for <regressions@lists.linux.dev>; Thu, 09 Oct 2025 09:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760028922; x=1760633722; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KkuMFF+ARdLGeqHd3hp/V7bl9dj0E28Y1GVyNgYJxMw=;
        b=UkqowpBlG573VrhVZlgZ5dpn74Ij2phE2rq5eg/oo1RyLe5wILu+71whWPILm/PpBh
         k5K6WmoDvvxhRS7ZSlCRVzCVmZABjb1B0T86aNb5+uHwNqrD4isFibBL+EYriULopZJ6
         9/mINvt3l3jO5pdeHJIbDq3s1wT6rRaCHYnmEif3i8y/Hs4XaWd4b4NayuJuXTRItnoG
         qO2b10/69jMAjNbUbPILTdyQ7sYgBUZQJq8S3MfLEcG9wNC/juzoNSThilWmg6MGZIZC
         hrzIfcCFZmGjG7xIpaBkGH1Iov1dEvqt63HXluQULdb1SLzHaFVBGoufprCJQTTyp9Ck
         4XSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760028922; x=1760633722;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KkuMFF+ARdLGeqHd3hp/V7bl9dj0E28Y1GVyNgYJxMw=;
        b=qsBqhYp22PgJ/pefkpc9nbXN2Bk43Z/+OeLKT2gHXE/uVS8Vs+j86bUHpgtPdXXOpf
         zRte255abV5hJu6uHgHOuJlohgkxdynZIEv9HJUmUEiWT+TBWXtbsWGbDh3BnKB+hjYY
         KSZ4WTWINXqlLNpsdlL2MwEAt+TS4HlofN4cyMM77ykAqrItr3zmvi+NiHMKP70mYGTH
         Gt55QsR9VU6YFructWtJ4wqRw7hVBtbuZCNxqOmGNiJd95LxE+hnd50pLKnc4WPcPrwn
         ooMB70L3UFTzOHM50Eg31Z2R7I44ckxKFiwK3+G6BBvDUgq8AxxcmfL8w2ofP+CBrpqC
         4PUA==
X-Forwarded-Encrypted: i=1; AJvYcCUyujR1+tfT6vF8XsHRTCGxPg7UljPcRD8u05zPsUUyJV27F/PjaN/HaASgXrQe202B5OrGT39C5gQSgQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4GBhAwSd2Onds858nZqGzAbnus7kKE41pUlCxNz75VGPbPqqf
	h2qJv0YiB+7gCh9e/biAt7usQKJ9O6Cp+A19MX0CXSlCyqrIp3hrkmJu+5gaTG4LNndK4+Ld5g3
	vV6FZahLmR7zUlbtrGBHyaDf+XlglMr4=
X-Gm-Gg: ASbGncu7EZii0Ob6WvSMv5AZQI1RM1ps1QabLqOv6+Ax06+ORwocxJSAo/sm0KrLjcX
	BqoOBuR1n639+YGmcgMVH2xDS8CC13vREwoKSrBGocBsyGDyAHa2L/2pDApQdpWhTnzEw11hOvh
	xIGq8PGaqWopcAz27txMzQjUmleHvwRbHA/SWyezVDPdHfKvxXty1jE1n85jrAdlJ7h24IQifLN
	DYLzHk8SzP/zOkgi5LhLwaxu0dRDo8=
X-Google-Smtp-Source: AGHT+IFMkZ+nCsqEt4qzo0y1lcmJ4WPina77QEmn6wBk+ND1hK1VeaxxVfFe967UJ12KUKWhWhzppgbxAf4MfdeefPU=
X-Received: by 2002:a05:6830:82eb:b0:7bd:235c:5437 with SMTP id
 46e09a7af769-7c0df785071mr4288989a34.17.1760028922160; Thu, 09 Oct 2025
 09:55:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABXGCsO8_GXZQ9tJYZJDbO7oGvsHyVS-32L1PZ7YNL0SrA1RFg@mail.gmail.com>
 <CABXGCsO2Yx1FvyryYU_R=kvS292eCDaLr9j0LHKPtNDkkz28PQ@mail.gmail.com> <CH0PR12MB5284060F40235BB4538B51DD8BE0A@CH0PR12MB5284.namprd12.prod.outlook.com>
In-Reply-To: <CH0PR12MB5284060F40235BB4538B51DD8BE0A@CH0PR12MB5284.namprd12.prod.outlook.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Thu, 9 Oct 2025 21:55:11 +0500
X-Gm-Features: AS18NWA7KS5rr3mBhnA2kzBEHmJmLYjxE7iPPHkG_0LysO5VC4a8kX0WUaMBIGA
Message-ID: <CABXGCsMMg59UXnv0EkmjsiZNUsZUBzBaUR8EnSv4FqOTmpOf7Q@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_6=2E18=2Fregression=2Fbisected_=E2=80=93_BUG=3A_sleeping_funct?=
	=?UTF-8?Q?ion_called_from_invalid_context_at_=2E=2Finclude=2Flinux=2Fsched=2Fmm=2E?=
	=?UTF-8?Q?h=3A321_after_6d31602a9f57?=
To: "Pillai, Aurabindo" <Aurabindo.Pillai@amd.com>
Cc: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>, "Wu, Ray" <Ray.Wu@amd.com>, 
	"Wheeler, Daniel" <Daniel.Wheeler@amd.com>, "Li, Roman" <Roman.Li@amd.com>, 
	"Chung, ChiaHsuan (Tom)" <ChiaHsuan.Chung@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>, 
	amd-gfx list <amd-gfx@lists.freedesktop.org>, 
	Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 7, 2025 at 10:55=E2=80=AFPM Pillai, Aurabindo
<Aurabindo.Pillai@amd.com> wrote:
>
> [AMD Official Use Only - AMD Internal Distribution Only]
>
> Hi Mikhail,
>
> schedule_dc_vmin_vmax() has an allocation which is incorrectly using GFP_=
KERNEL, which is likely the reason for the "sleeping function called from i=
nvalid context". We have a fix queued for this week's update (switching it =
to GFP_NOWAIT).
>

Hi,

Just a quick update regarding the second WARN I mentioned earlier,
triggered at drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:138 amdgpu_vm_set_pasid=
().

After some additional bisecting, I found that this warning first appears
in the merge commit:
342f141ba9f4c9e39de342d047a5245e8f4cda19
Merge: 0faeb8cf99c0 a490c8d77d50
Author: Dave Airlie <airlied@redhat.com>
Date:   Mon Sep 22 08:44:52 2025 +1000
    Merge tag 'amd-drm-next-6.18-2025-09-19' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next

Both merge parents (0faeb8cf from drm-next and a490c8d7 from amd-drm-next)
are clean on my setup =E2=80=94 no WARNs or other regressions.

It turns out that this WARN is triggered by an interaction between the
two sides of the merge.
The AMD branch introduced the new amdgpu_vm_assert_locked(vm) check inside
amdgpu_vm_set_pasid(), while the drm-next side still contained a code path
(for example, through amdgpu_driver_open_kms()) that calls
amdgpu_vm_set_pasid() without holding the expected reservation lock.

As a result, the merge commit combined these two changes and started hittin=
g
the dma_resv_assert_held() check in that function.
Both parents on their own are fine, so this is a merge-only side effect =E2=
=80=94
the stricter locking assertion from AMD=E2=80=99s branch met an older call =
path
from drm-next that doesn=E2=80=99t yet satisfy it.

I verified that removing just the amdgpu_vm_assert_locked(vm) call
from amdgpu_vm_set_pasid() eliminates the WARN completely,
while keeping all other recent VM locking changes intact.

--=20
Best Regards,
Mike Gavrilov.
