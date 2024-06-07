Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE9C19306B
	for <regressions@lists.linux.dev>; Fri,  7 Jun 2024 13:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717767589; cv=none; b=Cnube9kK3/e6SWe4EgEdynppZTz+axSrElcSi7NYh6Upag3xGMF0ux2qHABaAL/13KuXUs5r8KFyoEoAu3WH3PqAh5WfI+nBt1dKIDOsE77+gQ3liWoZ6dGBo2qGkOPOX14OGApfSje8DGLb9SlG/OsWTXW75v436DQBUb4nKb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717767589; c=relaxed/simple;
	bh=zRUjkuu13UY0xr7996+cq6aTZrIiH+S+h1lee8kxEdQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gZ2Q15Q+He/KPDmZmSbKdgxvUnCtLNu/9CDE22sopxX+tvA2D/wHf5NIREY6XRGQNuNLcP1uXhWL9q3RYBtN2ceFVyCPxPp5rIrB3yErJZAPh0HgjEoG/gVAtclwe/mejA33emceY5gwADJcLjM6EEkJlB8vxv5JFIulwMyVm+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YcG4zjwR; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YcG4zjwR"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1f44b594deeso16345225ad.2
        for <regressions@lists.linux.dev>; Fri, 07 Jun 2024 06:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717767587; x=1718372387; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lGjvaDk+KW6xnTzTcwYndsM82Fj+VUn371ofht0gpOk=;
        b=YcG4zjwRm1kdFUIkiyBAL7b4MV2DszqAJOpEu+3mZOn/a+N5HTuJlAkoPCsTKSXHv9
         LnnNDGUgjzdcE2NbS5Xxz7U60gm2DQSK353F1BrFfvomp3dR2AqV7AXTSYBXNN54u/S9
         P6+m0CzHsB3/9idy436PVAmKtZnqZ4hdD/LIPu4t47hyCqc9ScC1/ZTAV9e631UzNJj+
         hGn8oTqfxUqaueHW5njlPTcYuLF0nEiQfb4f471uP+BnoF+KJHI1Ejh+1kWvuRKPisBb
         PhQXsaza6G7MnnmQEfNGXzzahhcWLCUYWudFD+La5vyLY8iLZTT6qTsgE4qk+eLRyPdo
         tZ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717767587; x=1718372387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lGjvaDk+KW6xnTzTcwYndsM82Fj+VUn371ofht0gpOk=;
        b=V0YUpXZ0FBE966yrkcchqSQ3ZoL2H17sxA8l1XKq5LLhzrwfsDpa6jNU4q0nBL7VyB
         F8Bc5V1xbp/z3CAEN6D+r3mLNfPts9A/nQZy9qx7k3YGvLWh59DnLmGK0LxLDnL30pSw
         R3A4OstVWsCKwd1fSa50w1fRlM/UbSQZRi9u2uM3DLfWPiJf/xZh3ylOuOuSgdcERtv5
         F3OF8czU03VfD/ZiHExVjidey13Mc4nL1mDQntdph9gK1gIeSTBku9EyQV2jyIlirK+k
         hmTePbPccmHpy1+C+0szOlIYeZkmGAs4LgGinS9P2gJiCdk67A7ovbXjWN7zoNrprRJQ
         bOXw==
X-Forwarded-Encrypted: i=1; AJvYcCXk95MKfsJ01PR2/TKU4TezHrOsBpq4+83zXMZxC8PXfMzUXtif7e35ipMY7vhkKPU4AttapW0mJlJSXFXmLxxV59XJanN4sXcAg24=
X-Gm-Message-State: AOJu0YzBLUsCJ/+pOUpNaU+R3UsBoL0G7Z1zDvidOKq+BOsu7MCyv/bB
	KhPcz6W1DH9Xc1rouufwots9yg4lGeda1tM4GEwhObmtOl/1dX8+7ALyPThhYG+8b6XzZbQtdLM
	24Kd3oygrpFYubpdvxpgAdActAMI=
X-Google-Smtp-Source: AGHT+IHFeYv7N9rqcrTihxXkCB6iPbA0K4xnxCMnAQk6mBUZGTI1GpzTXBWWItwFP1ZhHdtfaoxyrtoLT7oPMuSTUgc=
X-Received: by 2002:a17:902:d4c1:b0:1f6:7212:760a with SMTP id
 d9443c01a7336-1f6d021805amr29662965ad.0.1717767587019; Fri, 07 Jun 2024
 06:39:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABXGCsNptxsQO=5=qi-JYiFX=rX8Ok5inK80Gn0qrUFWbtBGng@mail.gmail.com>
In-Reply-To: <CABXGCsNptxsQO=5=qi-JYiFX=rX8Ok5inK80Gn0qrUFWbtBGng@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 7 Jun 2024 09:39:35 -0400
Message-ID: <CADnq5_PDxJ8O1JUQ9RBYRFB9G1WZJos05ZAM4jUKuPBwPxjNkA@mail.gmail.com>
Subject: Re: 6.10/bisected/regression - commits bc87d666c05 and 6d4279cb99ac
 cause appearing green flashing bar on top of screen on Radeon 6900XT and 120Hz
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Cc: Hamza Mahfooz <hamza.mahfooz@amd.com>, Rodrigo.Siqueira@amd.com, 
	"Deucher, Alexander" <alexander.deucher@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>, 
	dri-devel <dri-devel@lists.freedesktop.org>, 
	Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 26, 2024 at 10:12=E2=80=AFAM Mikhail Gavrilov
<mikhail.v.gavrilov@gmail.com> wrote:
>
> Hi,
> Day before yesterday I replaced 7900XTX to 6900XT for got clear in
> which kernel first time appeared warning message "DMA-API: amdgpu
> 0000:0f:00.0: cacheline tracking EEXIST, overlapping mappings aren't
> supported".
> The kernel 6.3 and older won't boot on a computer with Radeon 7900XTX.
> When I booted the system with 6900XT I saw a green flashing bar on top
> of the screen when I typed commands in the gnome terminal which was
> maximized on full screen.
> Demonstration: https://youtu.be/tTvwQ_5pRkk
> For reproduction you need Radeon 6900XT GPU connected to 120Hz OLED TV by=
 HDMI.
>
> I bisected the issue and the first commit which I found was 6d4279cb99ac.
> commit 6d4279cb99ac4f51d10409501d29969f687ac8dc (HEAD)
> Author: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Date:   Tue Mar 26 10:42:05 2024 -0600
>
>     drm/amd/display: Drop legacy code
>
>     This commit removes code that are not used by display anymore.
>
>     Acked-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
>     Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
>     Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>
>  drivers/gpu/drm/amd/display/dc/inc/hw/stream_encoder.h         |  4 ----
>  drivers/gpu/drm/amd/display/dc/inc/resource.h                  |  7 ----=
---
>  drivers/gpu/drm/amd/display/dc/optc/dcn20/dcn20_optc.c         | 10 ----=
------
>  drivers/gpu/drm/amd/display/dc/resource/dcn21/dcn21_resource.c | 33
> +--------------------------------
>  4 files changed, 1 insertion(+), 53 deletions(-)
>
> Every time after bisecting I usually make sure that I found the right
> commit and build the kernel with revert of the bad commit.
> But this time I again observed an issue after running a kernel builded
> without commit 6d4279cb99ac.
> And I decided to find a second bad commit.
> The second bad commit has been bc87d666c05.
> commit bc87d666c05a13e6d4ae1ddce41fc43d2567b9a2 (HEAD)
> Author: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Date:   Tue Mar 26 11:55:19 2024 -0600
>
>     drm/amd/display: Add fallback configuration for set DRR in DCN10
>
>     Set OTG/OPTC parameters to 0 if something goes wrong on DCN10.
>
>     Acked-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
>     Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
>     Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>
>  drivers/gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.c | 15 ++++++++++++=
---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>
> After reverting both these commits on top of 54f71b0369c9 the issue is go=
ne.
>
> I also attach the build config.
>
> My hardware specs: https://linux-hardware.org/?probe=3Df25a873c5e
>
> Rodrigo or anyone else from the AMD team can you look please.

@Siqueira, Rodrigo can you take a look?  The two patches change the
programming of OTG_V_TOTAL_CONTROL.  The first patch removes this
code:

diff --git a/drivers/gpu/drm/amd/display/dc/optc/dcn20/dcn20_optc.c
b/drivers/gpu/drm/amd/display/dc/optc/dcn20/dcn20_optc.c
index 58bdbd859bf9..d6f095b4555d 100644
--- a/drivers/gpu/drm/amd/display/dc/optc/dcn20/dcn20_optc.c
+++ b/drivers/gpu/drm/amd/display/dc/optc/dcn20/dcn20_optc.c
@@ -462,16 +462,6 @@ void optc2_setup_manual_trigger(struct
timing_generator *optc)
 {
        struct optc *optc1 =3D DCN10TG_FROM_TG(optc);

-       /* Set the min/max selectors unconditionally so that
-        * DMCUB fw may change OTG timings when necessary
-        * TODO: Remove the w/a after fixing the issue in DMCUB firmware
-        */
-       REG_UPDATE_4(OTG_V_TOTAL_CONTROL,
-                                OTG_V_TOTAL_MIN_SEL, 1,
-                                OTG_V_TOTAL_MAX_SEL, 1,
-                                OTG_FORCE_LOCK_ON_EVENT, 0,
-                                OTG_SET_V_TOTAL_MIN_MASK, (1 << 1));
/* TRIGA */
-
        REG_SET_8(OTG_TRIGA_CNTL, 0,
                        OTG_TRIGA_SOURCE_SELECT, 21,
                        OTG_TRIGA_SOURCE_PIPE_SELECT, optc->inst,

and the second patch adds this hunk:

diff --git a/drivers/gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.c
b/drivers/gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.c
index f109a101d84f..5574bc628053 100644
--- a/drivers/gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.c
+++ b/drivers/gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.c
@@ -945,10 +945,19 @@ void optc1_set_drr(
                                OTG_FORCE_LOCK_ON_EVENT, 0,
                                OTG_SET_V_TOTAL_MIN_MASK_EN, 0,
                                OTG_SET_V_TOTAL_MIN_MASK, 0);
-       }

-       // Setup manual flow control for EOF via TRIG_A
-       optc->funcs->setup_manual_trigger(optc);
+               // Setup manual flow control for EOF via TRIG_A
+               optc->funcs->setup_manual_trigger(optc);
+
+       } else {
+               REG_UPDATE_4(OTG_V_TOTAL_CONTROL,
+                               OTG_SET_V_TOTAL_MIN_MASK, 0,
+                               OTG_V_TOTAL_MIN_SEL, 0,
+                               OTG_V_TOTAL_MAX_SEL, 0,
+                               OTG_FORCE_LOCK_ON_EVENT, 0);
+
+               optc->funcs->set_vtotal_min_max(optc, 0, 0);
+       }
 }


Looks like both the if and the else side paths end up programming
OTG_V_TOTAL_CONTROL differently after the change.  Perhaps
OTG_SET_V_TOTAL_MIN_MASK needs to be set differently depending on the
DMCUB firmware version? @Mikhail Gavrilov does this patch fix it?

diff --git a/drivers/gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.c
b/drivers/gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.c
index 336488c0574e..933c7a342936 100644
--- a/drivers/gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.c
+++ b/drivers/gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.c
@@ -944,7 +944,7 @@ void optc1_set_drr(
                                OTG_V_TOTAL_MAX_SEL, 1,
                                OTG_FORCE_LOCK_ON_EVENT, 0,
                                OTG_SET_V_TOTAL_MIN_MASK_EN, 0,
-                               OTG_SET_V_TOTAL_MIN_MASK, 0);
+                               OTG_SET_V_TOTAL_MIN_MASK, (1 << 1)); /* TRI=
GA */

                // Setup manual flow control for EOF via TRIG_A
                optc->funcs->setup_manual_trigger(optc);


Thanks,

Alex

>
> --
> Best Regards,
> Mike Gavrilov.
