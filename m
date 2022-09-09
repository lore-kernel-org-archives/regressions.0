Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98DB4C62
	for <regressions@lists.linux.dev>; Fri,  9 Sep 2022 17:36:09 +0000 (UTC)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-127d10b4f19so5677566fac.9
        for <regressions@lists.linux.dev>; Fri, 09 Sep 2022 10:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=jtXdra4m0dzn0sY7Po7o0MxlYg6uPUCynslJBEbJdfg=;
        b=DULSIiHM3CLlTGF6HhaKwStBJuVL8vvh6nqTqrcDJKHWALG3S/D8Ns+QYQFxtOmE2M
         JisRaxkqtrCC317P0zoua9EhblwDkFo7Ry1ggb08d0dCjWuev7HmniZ6JmxJunZGzDAp
         SMuirov8OvNxUjIFVALdGj6A2PmWc/d9q8ov6wrFW8WEoaWCoH6fp02fpmANSsQcaDMO
         Jnd3aLCWRcVy03UWj1QyRqx6gLkQBLZ4RZ9qPhnGLvesV326HnH0YeGIy78FTRn6LPZb
         NpNMAPR/tPw0ABkv4rh37m7ql1oaWKrVdf44mrnOwS0zVjfqHPBokuIp6BdhEjOVPmzU
         qcRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=jtXdra4m0dzn0sY7Po7o0MxlYg6uPUCynslJBEbJdfg=;
        b=XYWURqcYOstJX5V0pTySBZCu3zabqGeAa4VxJIWpCm2nGzRSJpls/XGZrbroFVsV4g
         3T7btjMCUtC7kL+BJKxgY22UiO/Y49H2o6BLdDA7MTHKPX0czfLz6/Vy3UAlBuYAvUxG
         baUF+lnr2znSB/ljmjbnGAWGYRl6xlZB5D5odV3ix5vuBfKi3dyV/YfVDfivnLtLrcXZ
         R2MPj2Eh9wgQnM9Jw42C/XZDQu0RUnrhb5XVar+lPl3o3IQO6+o+SZDs6dwNaR39g9ZA
         FM87OfLAsUtgVvYuqTIy8Cw+br+uOASKUuUuVfc4eKBO/xH4NxmyJhkZayK17oLpgfvY
         gT7g==
X-Gm-Message-State: ACgBeo1BuSiHApEsUAoyFS6VLqQ9jCHc8YXZddHqaYTG0xPc4D4syXIO
	TRhCen60kgPkNLzOdfOa+ufJkXud5ObGCOypzgQ=
X-Google-Smtp-Source: AA6agR5Bb8iV7WnVwt7O6l5mra4DssjIvnX9xf+nJ7xVrR0GjGw/+M9hTc8ERqqRYtPnVqSYaAVJNBPHYO4CMmKL28g=
X-Received: by 2002:a05:6870:1783:b0:12a:f442:504d with SMTP id
 r3-20020a056870178300b0012af442504dmr4265778oae.46.1662744968958; Fri, 09 Sep
 2022 10:36:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220909164758.5632-1-alexander.deucher@amd.com>
 <20220909164758.5632-2-alexander.deucher@amd.com> <4f9441e7-6ca3-25a6-6dd3-644b211d3fcc@amd.com>
In-Reply-To: <4f9441e7-6ca3-25a6-6dd3-644b211d3fcc@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 9 Sep 2022 13:35:57 -0400
Message-ID: <CADnq5_OKQwXDP-730jCXFCe60AbvzLrDvyr=dVr91awEwLNWjw@mail.gmail.com>
Subject: Re: [PATCH 1/7] drm/amdgpu: move nbio remap_hdp_registers() to gmc9 code
To: "Lazar, Lijo" <lijo.lazar@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org, 
	helgaas@kernel.org, regressions@lists.linux.dev, airlied@linux.ie, 
	linux-pci@vger.kernel.org, m.seyfarth@gmail.com, tseewald@gmail.com, 
	kai.heng.feng@canonical.com, daniel@ffwll.ch, sr@denx.de
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 9, 2022 at 1:17 PM Lazar, Lijo <lijo.lazar@amd.com> wrote:
>
>
>
> On 9/9/2022 10:17 PM, Alex Deucher wrote:
> > This is where it is used, so move it into gmc init so
>
> It's only the *side effect* of GMC IP init process, but that doesn't
> mean these IPs are interlinked. Any IP init process which requires HDP
> flush also would need this. It is not a good idea to couple HDP remap
> with GMC especially when there exists a HDP data path way without
> setting up GMC (MM INDEX/DATA).

We have no need for HDP flush at all without vram, and we only have
access to vram once GMC is initialized so it is sort of a dependency
in that regard.  We also call a bunch of the HDP callbacks in the GMC
code and I think those are sort of the boat.  Also, the whole reason
we are in this situation is because we need to init GMC before all
other HW because all other hardware has a dependency on being able to
access GPU memory.

>
>  From a generic software perspective, I think programming pre-requisite
> for HDP flush need to be standalone and the order needs to be guaranteed
> before any client IPs that make use of it.

In that case patches 5, 6, 7 could be an alternative.

Alex

>
> Thanks,
> Lijo
>
> > that it will always be initialized in the right order.
> > We already do this for other nbio and hdp callbacks so
> > it's consistent with what we do on other IPs.
> >
> > This fixes the Unsupported Request error reported through
> > AER during driver load. The error happens as a write happens
> > to the remap offset before real remapping is done.
> >
> > Link: https://bugzilla.kernel.org/show_bug.cgi?id=216373
> >
> > The error was unnoticed before and got visible because of the commit
> > referenced below. This doesn't fix anything in the commit below, rather
> > fixes the issue in amdgpu exposed by the commit. The reference is only
> > to associate this commit with below one so that both go together.
> >
> > Fixes: 8795e182b02d ("PCI/portdrv: Don't disable AER reporting in get_port_device_capability()")
> >
> > Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c | 7 +++++++
> >   drivers/gpu/drm/amd/amdgpu/soc15.c    | 7 -------
> >   2 files changed, 7 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> > index 4603653916f5..3a4b0a475672 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> > @@ -1819,6 +1819,13 @@ static int gmc_v9_0_hw_init(void *handle)
> >       bool value;
> >       int i, r;
> >
> > +     /* remap HDP registers to a hole in mmio space,
> > +      * for the purpose of expose those registers
> > +      * to process space
> > +      */
> > +     if (adev->nbio.funcs->remap_hdp_registers && !amdgpu_sriov_vf(adev))
> > +             adev->nbio.funcs->remap_hdp_registers(adev);
> > +
> >       /* The sequence of these two function calls matters.*/
> >       gmc_v9_0_init_golden_registers(adev);
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/soc15.c b/drivers/gpu/drm/amd/amdgpu/soc15.c
> > index 5188da87428d..39c3c6d65aef 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/soc15.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/soc15.c
> > @@ -1240,13 +1240,6 @@ static int soc15_common_hw_init(void *handle)
> >       soc15_program_aspm(adev);
> >       /* setup nbio registers */
> >       adev->nbio.funcs->init_registers(adev);
> > -     /* remap HDP registers to a hole in mmio space,
> > -      * for the purpose of expose those registers
> > -      * to process space
> > -      */
> > -     if (adev->nbio.funcs->remap_hdp_registers && !amdgpu_sriov_vf(adev))
> > -             adev->nbio.funcs->remap_hdp_registers(adev);
> > -
> >       /* enable the doorbell aperture */
> >       soc15_enable_doorbell_aperture(adev, true);
> >       /* HW doorbell routing policy: doorbell writing not
> >
