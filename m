Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F242DF70E
	for <regressions@lists.linux.dev>; Thu,  9 Oct 2025 14:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760021861; cv=none; b=Sz86+NQX6yTnIvdHI8D1lxp878UPfmriWRi/NhTpuKQNwfBKMZWJhrd1c9D9m7uPHed/jKBRHS39CR3qX5YEfpUVTcY9RBbYZ2pNL4C1329JhOJsvI5kx//lYSV0l8ZjkGVWAtdDF3s/evTywG7Smrclr1a2pPIzY+EUVrE+kWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760021861; c=relaxed/simple;
	bh=eYCZccLznnn/IyOVzFPzUuPMjYtFcRA6hZtrGO03olU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E6BIDHCKU1xEVZ9k+7wDZ2AqJGVmepT8mVjPS5j8m39qHu4Gdl16FN3v7amwkkTVaCCoWuKMDV6sjsSAkugF3qcYhSYQHTnGXUJgv58//ixwGCWhwY0ti7JjOoW3h8mTeG7CKo1hEl3VbZAeM8kUgdrJx2HppdWkdtpuzyCUrD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XhpltK2s; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XhpltK2s"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-33450918e4fso218625a91.1
        for <regressions@lists.linux.dev>; Thu, 09 Oct 2025 07:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760021858; x=1760626658; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R6XdlmW98KtilytItO4ixKc8ZfXZSoJOArSFuikw+5k=;
        b=XhpltK2svfrRlnOtGY/LNwSfSWokYrBTTWsXqjn1NX6dtYnp4YV+d6BZ29YtAHRuKo
         LrP/V6QJbsnGLzMWNEvPA0ID/TA4FPKWpZXSz+hOrmyzXPlO1CGGZVr+1KGRLqF97pvN
         LbRdnJJNl08R0/VHqT4ycVspuRSDMGAJEUukl6oV4F4jdSiH7Gvyce2Hy707rh5pXSTn
         E8+tgec8wpOiKjSzzoTCA8iRgAIc2mGPq4CYrzmAzQukpbQWMmSyHgiXITcZhAdP0vV7
         WH4XfAZMPhpYvrgmwzEDyRSSpBEJ2MP6tIUtZczxuGSmdL3PNYGVmSh1gWJgnyK/sCee
         1MJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760021858; x=1760626658;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R6XdlmW98KtilytItO4ixKc8ZfXZSoJOArSFuikw+5k=;
        b=ly2DvrW7RE0SbFzkTKW0GYsyq5TNbciALGHMvupxRYMg5Hi1vl8XVgOWsd+gxNxNR6
         S6gtz6OH+6wtHqEoupn1W0R0mj0xK2Ax+GjWwh1C4g+iwe8QXVWv6R00jkeLcqr0J7sb
         OVfIII3/Nqn0DzSoR21nu3CZzqI5nuDxQuLuTFrjVahKkClRZLZkpEb+ZOVqeLS82/cs
         5a24fKsMEF7Pi4frKP5sVTKBtqBQgMIjXazemE791mpXiMNHj6j/ArJTW7HAoanzMPuP
         FEAcxdwTQeQt5MvkZjun6f0vi4VQJVSVjTsqMbxALWWmLVPVTm8yJflpJ6ZV3gK6DJLH
         74NA==
X-Forwarded-Encrypted: i=1; AJvYcCXZmO9UzTFaqur6kaA1W25zZcO/Wc6c4GS7lNI537VPhs/Y3lnVU+m+W1/rn8gKTtuW+exmIY1Qcm1Eqw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1Pep8q7G9Bu47hn7Q6leRRFqbR9/OaOJI2V40lnTbD7rZlupS
	NcaELu1cGZtK1fdk6uTRf6xMQSBrQGzZH9XUze2TDpiGj1iJ720RPILaefjBkKfTw9aI4ka97P7
	y43p/YLmiMX7Z5sveP20hlev2qy01SPM=
X-Gm-Gg: ASbGncvn+pn4a4wbQ+JXWdl6k8h79UaVuQEvDQdG7I6I+2vpBi/c8eFQ9kYwfj3Sb1C
	q8JZavhXhL+bI1Qe4OtWqB72YOXAfd1lwq56FqrtOZC6FLy9QpKYk/ztgTWqU7KhY4DhQStLkDV
	StExh6UegJZMeaWX6jO86zUzt3Qd6lnWNAcg6Cc0c1gb/Kmn7AR0SYWZzvH8y2aDyoA2AUQINnx
	fJENsVGsFcamv5z64oITWEmjXGV8CrywUfb1o/saA==
X-Google-Smtp-Source: AGHT+IF5nY+/zS7XE+U3ljAWwxUkr3ItMRcUh2ZrRrJhs5g+6GaXHyt+rQpZjkZPESw2KD1IdoLsSC3inYtQoPTKMPA=
X-Received: by 2002:a17:902:f54b:b0:274:506d:7fe5 with SMTP id
 d9443c01a7336-290273e1e23mr53282705ad.4.1760021858358; Thu, 09 Oct 2025
 07:57:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251009121900.12777-1-matthew.schwartz@linux.dev>
In-Reply-To: <20251009121900.12777-1-matthew.schwartz@linux.dev>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 9 Oct 2025 10:57:27 -0400
X-Gm-Features: AS18NWCqAqPtByWTZAk7O2nj3raD72Gwfu7-I05PFv7BPT8i-MRFM-Zyva2YcIA
Message-ID: <CADnq5_NauQ3YSngQ4mtx=L1t5yuxWZYHLRn-Je8rL3yYhYOqMA@mail.gmail.com>
Subject: Re: [PATCH v2] Revert "drm/amd/display: Only restore backlight after
 amdgpu_dm_init or dm_resume"
To: Matthew Schwartz <matthew.schwartz@linux.dev>
Cc: harry.wentland@amd.com, christian.koenig@amd.com, sunpeng.li@amd.com, 
	airlied@gmail.com, simona@ffwll.ch, alexander.deucher@amd.com, 
	linux-kernel@vger.kernel.org, mario.limonciello@amd.com, 
	amd-gfx@lists.freedesktop.org, regressions@lists.linux.dev, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied.  Thanks.

Alex

On Thu, Oct 9, 2025 at 8:51=E2=80=AFAM Matthew Schwartz
<matthew.schwartz@linux.dev> wrote:
>
> This fix regressed the original issue that commit d83c747a1225
> ("drm/amd/display: Fix brightness level not retained over reboot") solved=
,
> so revert it until a different approach to solve the regression that
> it caused with AMD_PRIVATE_COLOR is found.
>
> Fixes: a490c8d77d50 ("drm/amd/display: Only restore backlight after amdgp=
u_dm_init or dm_resume")
> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4620
> Cc: stable@vger.kernel.org
> Signed-off-by: Matthew Schwartz <matthew.schwartz@linux.dev>
> ---
> v1 -> v2:
> - Fix missing stable tag
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 12 ++++--------
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  7 -------
>  2 files changed, 4 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/=
gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 8e1622bf7a42..21281e684b84 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -2081,8 +2081,6 @@ static int amdgpu_dm_init(struct amdgpu_device *ade=
v)
>
>         dc_hardware_init(adev->dm.dc);
>
> -       adev->dm.restore_backlight =3D true;
> -
>         adev->dm.hpd_rx_offload_wq =3D hpd_rx_irq_create_workqueue(adev);
>         if (!adev->dm.hpd_rx_offload_wq) {
>                 drm_err(adev_to_drm(adev), "failed to create hpd rx offlo=
ad workqueue.\n");
> @@ -3438,7 +3436,6 @@ static int dm_resume(struct amdgpu_ip_block *ip_blo=
ck)
>                 dc_set_power_state(dm->dc, DC_ACPI_CM_POWER_STATE_D0);
>
>                 dc_resume(dm->dc);
> -               adev->dm.restore_backlight =3D true;
>
>                 amdgpu_dm_irq_resume_early(adev);
>
> @@ -9965,6 +9962,7 @@ static void amdgpu_dm_commit_streams(struct drm_ato=
mic_state *state,
>         bool mode_set_reset_required =3D false;
>         u32 i;
>         struct dc_commit_streams_params params =3D {dc_state->streams, dc=
_state->stream_count};
> +       bool set_backlight_level =3D false;
>
>         /* Disable writeback */
>         for_each_old_connector_in_state(state, connector, old_con_state, =
i) {
> @@ -10084,6 +10082,7 @@ static void amdgpu_dm_commit_streams(struct drm_a=
tomic_state *state,
>                         acrtc->hw_mode =3D new_crtc_state->mode;
>                         crtc->hwmode =3D new_crtc_state->mode;
>                         mode_set_reset_required =3D true;
> +                       set_backlight_level =3D true;
>                 } else if (modereset_required(new_crtc_state)) {
>                         drm_dbg_atomic(dev,
>                                        "Atomic commit: RESET. crtc id %d:=
[%p]\n",
> @@ -10140,16 +10139,13 @@ static void amdgpu_dm_commit_streams(struct drm=
_atomic_state *state,
>          * to fix a flicker issue.
>          * It will cause the dm->actual_brightness is not the current pan=
el brightness
>          * level. (the dm->brightness is the correct panel level)
> -        * So we set the backlight level with dm->brightness value after =
initial
> -        * set mode. Use restore_backlight flag to avoid setting backligh=
t level
> -        * for every subsequent mode set.
> +        * So we set the backlight level with dm->brightness value after =
set mode
>          */
> -       if (dm->restore_backlight) {
> +       if (set_backlight_level) {
>                 for (i =3D 0; i < dm->num_of_edps; i++) {
>                         if (dm->backlight_dev[i])
>                                 amdgpu_dm_backlight_set_level(dm, i, dm->=
brightness[i]);
>                 }
> -               dm->restore_backlight =3D false;
>         }
>  }
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/=
gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> index 009f206226f0..db75e991ac7b 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> @@ -630,13 +630,6 @@ struct amdgpu_display_manager {
>          */
>         u32 actual_brightness[AMDGPU_DM_MAX_NUM_EDP];
>
> -       /**
> -        * @restore_backlight:
> -        *
> -        * Flag to indicate whether to restore backlight after modeset.
> -        */
> -       bool restore_backlight;
> -
>         /**
>          * @aux_hpd_discon_quirk:
>          *
> --
> 2.51.0
>
