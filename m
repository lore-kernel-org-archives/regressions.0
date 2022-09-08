Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1249D33C6
	for <regressions@lists.linux.dev>; Thu,  8 Sep 2022 14:21:23 +0000 (UTC)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-1279948d93dso24913956fac.10
        for <regressions@lists.linux.dev>; Thu, 08 Sep 2022 07:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=Qudv4PRxQU2ec00vhzza+IJ/8DXkVM9NA8dDvO9+d8s=;
        b=Z6gWPbeubeUCBKbACAJxowa+zqM89pGQ4YV5++Upgcd0H5rkBGDOlUbDtb7SQceb+f
         KJjtIg57+pX/OHyjF1h5+zGiaE9ncp3OXUI4oTYb7TZruWuIHEtcBZ0W06n91jd4+S7M
         sxkqHad9uizYNTWVxaNRmHYOdUrfYGTwGjBrw7xtV9Mq6WScsU3ULbUeZqPeHm5nKLt2
         6GsFTH4mJX+/s0iSht+Pxc2w2nimCsstYnoYoe/HEe0nA0rw54Nq0kyERCyhSoTUrdMb
         8SqB+fJd7zd57X9O8M8CebU4wECl2+Zv5rkj0lwYZmAN20InyAvXyjLjKGnHH55CX/hF
         Gabw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=Qudv4PRxQU2ec00vhzza+IJ/8DXkVM9NA8dDvO9+d8s=;
        b=X3Iy1aqyZ6umV1KZRrsMvc6yBT6pnQQJJGp//+GmdIAp6igQ4fPjRIjJ22XShLEIB1
         KCNri1a2N6ilJgMq5gw5RK5qAoLOi6lRv0hSUy5eGcRn8BQqEspOd3zUVDqUmHCJlM+s
         81gitdNHabuDw5o1Gk1PlciCaEk8pxhTH5drWERw13eNORzhay02UnWJTxZzaxyCovGU
         DGIgTvVWu8BYEe9Gmo+eClTxZKpj6K7zqIgrvX2CUSX0XtPogAo6gQW5hZ60lekm40F9
         F4AB0mOipNP7kOy18xQuEjSQeLmi1B0lO3xaYayWNvZWJkhSql0txV1NT87iTAjj4lnl
         Qq+Q==
X-Gm-Message-State: ACgBeo1memGowudQjmBORsYKYlGGSR+h9caKK/XI5XjrBn5KkJJ3wb2r
	zDWm2mDVoZAP03t6ZJFbNKSl4YeSROR2zRRUn2c=
X-Google-Smtp-Source: AA6agR6mNyIvQyJTxriUckKrkO9BLzLVrO6FrPkAZTJMW5L+owjRZFNzihkcshhUwW2jBBoJwLMyu0Pwr0i8mdVXtsg=
X-Received: by 2002:a05:6808:2187:b0:344:eccd:3fc5 with SMTP id
 be7-20020a056808218700b00344eccd3fc5mr1708882oib.46.1662646882178; Thu, 08
 Sep 2022 07:21:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220908040821.5786-1-alexander.deucher@amd.com> <4148adb1-2181-efa4-672c-defb45abe0e8@amd.com>
In-Reply-To: <4148adb1-2181-efa4-672c-defb45abe0e8@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 8 Sep 2022 10:21:10 -0400
Message-ID: <CADnq5_Pc0MvqWHMOBd3=z72TF4HiwWwf3g6dHA6KrGbAUe4W9w@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/amdgpu: make sure to init common IP before gmc
To: "Lazar, Lijo" <lijo.lazar@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org, 
	helgaas@kernel.org, regressions@lists.linux.dev, airlied@linux.ie, 
	linux-pci@vger.kernel.org, tseewald@gmail.com, kai.heng.feng@canonical.com, 
	daniel@ffwll.ch, sr@denx.de
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 8, 2022 at 1:11 AM Lazar, Lijo <lijo.lazar@amd.com> wrote:
>
>
>
> On 9/8/2022 9:38 AM, Alex Deucher wrote:
> > Common is mainly golden register setting and HDP register
> > remapping, it shouldn't allocate any GPU memory.  Make sure
> > common happens before gmc so that the HDP registers are
> > remapped before gmc attempts to access them.
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
>
> Series is:
>         Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>


@tseewald@gmail.com it would be good if you could verify that this
patch fixes the issue for you as well.

Thanks,

Alex

>
> Thanks,
> Lijo
>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 14 +++++++++++---
> >   1 file changed, 11 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > index 899564ea8b4b..4da85ce9e3b1 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > @@ -2375,8 +2375,16 @@ static int amdgpu_device_ip_init(struct amdgpu_device *adev)
> >               }
> >               adev->ip_blocks[i].status.sw = true;
> >
> > -             /* need to do gmc hw init early so we can allocate gpu mem */
> > -             if (adev->ip_blocks[i].version->type == AMD_IP_BLOCK_TYPE_GMC) {
> > +             if (adev->ip_blocks[i].version->type == AMD_IP_BLOCK_TYPE_COMMON) {
> > +                     /* need to do common hw init early so everything is set up for gmc */
> > +                     r = adev->ip_blocks[i].version->funcs->hw_init((void *)adev);
> > +                     if (r) {
> > +                             DRM_ERROR("hw_init %d failed %d\n", i, r);
> > +                             goto init_failed;
> > +                     }
> > +                     adev->ip_blocks[i].status.hw = true;
> > +             } else if (adev->ip_blocks[i].version->type == AMD_IP_BLOCK_TYPE_GMC) {
> > +                     /* need to do gmc hw init early so we can allocate gpu mem */
> >                       /* Try to reserve bad pages early */
> >                       if (amdgpu_sriov_vf(adev))
> >                               amdgpu_virt_exchange_data(adev);
> > @@ -3062,8 +3070,8 @@ static int amdgpu_device_ip_reinit_early_sriov(struct amdgpu_device *adev)
> >       int i, r;
> >
> >       static enum amd_ip_block_type ip_order[] = {
> > -             AMD_IP_BLOCK_TYPE_GMC,
> >               AMD_IP_BLOCK_TYPE_COMMON,
> > +             AMD_IP_BLOCK_TYPE_GMC,
> >               AMD_IP_BLOCK_TYPE_PSP,
> >               AMD_IP_BLOCK_TYPE_IH,
> >       };
> >
