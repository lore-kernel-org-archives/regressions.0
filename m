Received: from mail-dl2-f43.google.com (mail-dl2-f43.google.com [74.125.229.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E993515DA
	for <regressions@lists.linux.dev>; Sun, 27 Sep 2026 19:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790537619; cv=pass; b=VJhpTL8/4LEtqgvQL0RlP/gy/Ogyh5cG1HZaYLvoawsSiwcGBDUFWQMI8MT9BMkJjCiCaRL3s/mlccmamHwhkxmmk5jX3OpIJFT09RSVP/K7JXURz2rtpygvinbHZkP+1Tkh3KWxz7eZmlJdHQLUWs0B7VG2HvB34/wXK4W0OEo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790537619; c=relaxed/simple;
	bh=FHEBbsQA+vMlNw0zF/tL69nNgyy3WcUCt4OeHB/v6gI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P/BVKnJox/oQb+MjqytOW0R8DoppdFKiC5rh7xnyfS6A/EyFvHMf7TLbWRPqMIoQCaWNBm8PtZZ7UXruu7ac/ISqSO9QIryN75jV0Nr1KmXayRLngc48gbGobrlQE81I1xhuX+tvhTrF0VgScNzHjoKIUyRTNecI69wFvV+WYGk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DK3ntk3h; arc=pass smtp.client-ip=74.125.229.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DK3ntk3h"
Received: by mail-dl2-f43.google.com with SMTP id a92af1059eb24-14521fc1d76so29545c88.1
        for <regressions@lists.linux.dev>; Sun, 27 Sep 2026 12:33:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790537617; cv=none;
        d=google.com; s=arc-20260327;
        b=cNvkGNicH0y6o6R2nJ2mhejdwtKFFWpeuauXy7yBBSTA/CAE6wMc/KpU3qPjuHewz5
         x3x2QhqHrSAZjQknmbsSZ7F/r8+8kQBfOgJWtoE2qHkO5p9jFnf3Dh5SJgXeIPXcHbKI
         WKia9X9jXfEOE6yeTjRQV9E7edxoqhsSFceuIcjC3Hpgnunc7ZcVUAUPcm76J4JUSWXr
         lOMvzpEyR3guHIlnteU4YTGZ2WJvLMcmowx4v0tnHoFZ1N+ej4otLLo8myvmUvjVHFsk
         b8r86jJW0Q22NsAICmuILQCdD6cbSuvuPiYe2EB5MBwz6hUiFiy1hPfTM7PSwJry9tBb
         liww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l5q866BvvSma/IMVrDV/6rai/IHNDTchFlxM/hoTak4=;
        fh=qNyC+23P6Ow86ozm7nasgGAwFcBwsmihf4wXsFI373Q=;
        b=TWq6NWR6+qymu4dfrSo8ZXIA4GaogJ4corgRcJwTftA0vjsIrI7nrjAOxDPq4mh1AI
         /qnmhIAx9RYg9SKwH9cb1y2MoMqBJ4XOsdXrkuU0gHxY7obZPB+gN7nH+wXpczD5Ytzk
         u5zIqMfEfninb7hEdyXI+C1fdsZuILHz1/c9tJqZo5bFqSmPzZ4UVxFKVo5Jry8jpw92
         XaMFCt7DDcptDmAr6LPjC7nDcVuG6rVg05CE5jLAES3iJk9JPWSNTQeSHs/Gn/sLXWNc
         Ookhmk4jnzrj5FyeRgRkY9aHFVjDX6KoPVfZwuv2vUM/PvGyXaNXOwvnKjOugKV+unC3
         fQNQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790537617; x=1791142417; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l5q866BvvSma/IMVrDV/6rai/IHNDTchFlxM/hoTak4=;
        b=DK3ntk3hEXw45zW+oqtf+nUmkFVqz7+otQ+OqfEE0bCofHp7ygGfGRdzQC9mhmJE3G
         VwTlAxGJUfCggkzbwAs4fjsBZNGsGq6DZvu3LMlfLKcXS+fIY0xKBYjZ9wsewUzemg6T
         w6mocdzb+jGFZm3jxWnGSyxMoSlW4bE50WoxChOywnjc9aNz+zBiv6Yb/KkvClvt5DQ5
         V62ZJrQcwdeEbykBaGXVKADOmknEzzt/e+YgD0eMZmMmjvxvYzyiKALCq1Y9xrzi0aKU
         U+DnxZczMV3ZhCzMEfVuukBpUXDATzfc6VnC71cOluf6EIF2C3XeYdYJtu43Nkwjm2QE
         wVZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790537617; x=1791142417;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l5q866BvvSma/IMVrDV/6rai/IHNDTchFlxM/hoTak4=;
        b=M02hgvXEpKn2p+myQZJt3R9PjesZk3i3jHUXZEWfXu8OI09Gi0KZaNeu9n68ZCRAEr
         vDdi9mX3QKmO2PEIh7j8inVPSaidyQTlCMevftC6HgPpuTQhXcwOQZg7lrYzQ2kMGZ3D
         RtbBqZbll7u3GUf75ZiTmNV+RhqFaW90+v+BtQh9BLlt95/kKYgHblfkKi7ERiWTV6uf
         HVQjZPKTk/TujS13BP3fEbSgmkL1Jk86C7yUQNgyljQL9IDH6LQ3OsCP/fdsbuyY60Vb
         +MIodCBHk7IGC7R+DSCEhGiB8kC+11Hbfkq5K9Du1a2C4sFn7J/+iXsnysDRJKNRgfCS
         zhIA==
X-Forwarded-Encrypted: i=1; AKwUvByZ0D/QpwR7C649CwKDzkaVXcidzRRKSf7E51zYz0iuQa+SQxm/2zr/9tl/F6wCYm/BKFmC/ss395H3IQ==@lists.linux.dev
X-Gm-Message-State: AFuF++l8aMJd0LDgNNGg+/jJNrMKJfSQAcxYnsgGD41fBNRZdBh/qJji
	dZF6eBJvUyUUtIY2xFpse+MvySQ2piDPHegYGEG+PlgLnIGcqby3RKKsmZxJ+2OdNsThXua3dAx
	cNG6plm4l7QWaf0nuAHh7an9UYjoXeYI=
X-Gm-Gg: AYBFou1NlSPnstiJbcpgG1KhkZNpVbt7/LWbz7KaReIJP+W3CX8Q2IVRavXESN6CEbM
	0sv4lpTcjw2BwxAcHXFOX9BmZJykghvTozYcENw3EMY0T9CzEjn0PXjnVdhi4rdGdN5cxNNyO82
	7zHeh4zWVuUG63i9YuXjwM8jrixSNEU8VD3YaZdVuHrHbXt5SN4JF2yQscZ4EDGwxplSpiN60Fc
	E0hMbSyd0cprvW8v1VUYj7RS6l817zbHxNbMqReT/ud84Rum4pzJoicuoInOS16KUAR9em5ncrv
	wdM6njLnca2qZqa+9vJKI2H2btKHZ9VX+qPTwCYakT366RorxuyRRTe+RxdGfwD/q1qpoV6V0jl
	1Dh7mLi3JAaG1JTEmEgbOucHJHCgwzy9ANkMjouH8Nw==
X-Received: by 2002:a05:7022:ed0e:b0:149:c766:2965 with SMTP id
 a92af1059eb24-149c7662eb8mr808764c88.2.1790537617314; Sun, 27 Sep 2026
 12:33:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <179039514312.597384.1659548947123427650@kernelci.org>
 <8ad00f0f-d924-4b19-986c-8c17dcdade86@leemhuis.info> <CADnq5_O7R096UP9mF5RvGSzT+c2p2v2Dm8M243CLxXa=VZvRwQ@mail.gmail.com>
In-Reply-To: <CADnq5_O7R096UP9mF5RvGSzT+c2p2v2Dm8M243CLxXa=VZvRwQ@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Sun, 27 Sep 2026 15:33:24 -0400
X-Gm-Features: AclHuK8c840Og0RGxMLZ7uUkzrUME3CtmSIvH_BZYI1XGrw_XTLZ4m6Qt7dWeFs
Message-ID: <CADnq5_Mg-0CjN1hVm58N=jVhFO_abjNU6mAPY3MpfsajsGfUMw@mail.gmail.com>
Subject: Re: [REGRESSION] mainline/master: (build)stack frame size (3096)
 exceeds limit (3072) in 'dml_core_mode_prog...
To: Thorsten Leemhuis <regressions@leemhuis.info>, "Leo (Sunpeng) Li" <Sunpeng.Li@amd.com>, 
	Alex Hung <alex.hung@amd.com>
Cc: kernelci@lists.linux.dev, kernelci-results@groups.io, 
	regressions@lists.linux.dev, broonie@kernel.org, 
	Alex Deucher <alexander.deucher@amd.com>, DRI <dri-devel@lists.freedesktop.org>, 
	"amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 27, 2026 at 9:29=E2=80=AFAM Alex Deucher <alexdeucher@gmail.com=
> wrote:
>
> On Sat, Sep 26, 2026 at 6:37=E2=80=AFAM Thorsten Leemhuis
> <regressions@leemhuis.info> wrote:
> >
> > On 9/26/26 05:59, KernelCI bot wrote:
> > > New build issue found on mainline/master:
> > >
> > > ---
> > > stack frame size (3096) exceeds limit (3072) in 'dml_core_mode_progra=
mming' [-Werror,-Wframe-larger-than] in drivers/gpu/drm/amd/amdgpu/../displ=
ay/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn4_calcs.o (drivers/gpu/drm/am=
d/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn4_calcs.c) [=
logspec:kbuild,kbuild.compiler.error]
> > > ---
> > >
> > > Log excerpt:
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> > > /tmp/kci/linux/drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/=
src/dml2_core/dml2_core_dcn4_calcs.c:10513:13: error: stack frame size (309=
6) exceeds limit (3072) in 'dml_core_mode_programming' [-Werror,-Wframe-lar=
ger-than]
> > >  10513 | static bool dml_core_mode_programming(struct dml2_core_calcs=
_mode_programming_ex *in_out_params)
> > >        |             ^
> > > 1 error generated.
> >
> > Hmmm, there are known "stack frame size [...] exceeds limit" problems i=
n
> > -next that should soon be fixed there, see:
> > https://lore.kernel.org/all/CADnq5_MFMriR-b3eX0mTZShPDgUBgwoObgumEjJ9cJ=
qdmDM6xQ@mail.gmail.com/
> >
> > But this error is new -- and happens in mainline. Wondering if this is
> > caused by a fix for those problems.
>
> + Leo, Alex
>
> Looks like some combination of compiler and/or config options explodes
> the stack even further than the recent changes handled.

Should be fixed with this patch:
https://patchwork.freedesktop.org/patch/756590/?series=3D175063&rev=3D1

Alex

>
> Alex
>
> >
> > CCing Alex and Christian in case this is really something new they want
> > to know about.
> >
> > Ciao, Thorsten
> >
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> > >
> > > When fixing this issue, please attribute this report according to the
> > > patch submission rules:
> > >
> > > Reported-by: kernelci.org bot <bot@kernelci.org>
> > > Link: https://lore.kernel.org/all/179039514312.597384.165954894712342=
7650@kernelci.org/
> > >
> > > For complete logs and details about the environment used, see the iss=
ue
> > > on the KernelCI dashboard:
> > >
> > > - dashboard: https://d.kernelci.org/i/maestro:24dc0670f5eb77688896917=
0a199e08b7f23f99b
> > > - giturl: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/li=
nux.git
> > > - commit HEAD:  6812ce4e4379ffc99c52401ec28f0d7ffbc36206
> > >
> > > # Builds where the incident occurred:
> > >
> > > ## x86_64_defconfig+allmodconfig on (x86_64):
> > > - compiler: clang-21
> > > - config: None
> > > - dashboard: https://d.kernelci.org/build/maestro:6ab70c1f5ec73975aad=
e9d6e
> > >
> > > #regzbot introduced: f14572c203d57492e1d4e5d7851a3b143e083b82..6812ce=
4e4379ffc99c52401ec28f0d7ffbc36206
> > > #regzbot link: https://d.kernelci.org/i/maestro:24dc0670f5eb776888969=
170a199e08b7f23f99b
> > >
> > > #kernelci issue maestro:24dc0670f5eb776888969170a199e08b7f23f99b
> > >
> > > --
> > > This is an experimental report format. Please send feedback in!
> > > Talk to us at kernelci@lists.linux.dev
> > >
> > > Made with love by the KernelCI team - https://kernelci.org
> >
