Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CCD78F26
	for <regressions@lists.linux.dev>; Fri, 24 Apr 2026 16:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777049229; cv=pass; b=IDA5YpvkfT01clXv26Yv+Zhd8rclv9HFKKw3yg3f4dCMn64N2NkukxsEBMjwADA1wlTewSSonDHb0cGtWX5DXqEP+J5/eHCBNiZ3+VSsWu49El6X75Er2B2WQtbfk+jU6+7JZyIrP/OwL5ntInnBKWyH65MrWjHh2h8dYIDJXio=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777049229; c=relaxed/simple;
	bh=JNFjPKSJhw56GT3TqbPtcLJuu9ovjntdwwGH9RvD6RI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y/ke7gxqWgxBKXlKfMrk5nm+HaHPbiGvBBzmFVbD4yKTFFoyYZD9yh654TTQA4g6XWkyhhXjYA7v7Ks1uQA7YGDT1awUyvMQDILnUxGWz47CEMTmTh5vPKsvGN4RDPCCq+kNMxzmZEXm5GEzm171iIIPlgQIrZD4ZoucRGXQW1w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hDDggWQm; arc=pass smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hDDggWQm"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-12c7288cfb9so175258c88.2
        for <regressions@lists.linux.dev>; Fri, 24 Apr 2026 09:47:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777049227; cv=none;
        d=google.com; s=arc-20240605;
        b=em2HOdRx+KIxoG0AFKzxXMaUQ4Kq4oaaSagEIrZk4EwZN/pl6rz/baRahwAT9j5o3R
         LJId+CxReVRA6ZLaXrs6EG9wZZ+TvytILkqUgXIYPsoa6ZRYJirSXHE6bdaJOASt4q1Q
         Cw9mPgGm0Oa2XrxNFeJOwwZDQEg04hR1qyMTqz1vloXj8DIKHN0Q/gpT3q+ZV2zYwZpY
         DDux++mrxsnBMl2wT8/7y02WWVXSz0p6jivR5p7PG6BZbpS+kk5hATq61oKkDqpmG86Q
         8qGcs23F/roA5LN9S4EH5Lf1PSD6FnLXGAEZPdP8R6eJa0U2typ4sdP27JmygSBsi+EX
         gqzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eZvZViiM+KTU4U/lHwXHb/VYi6/H9RrxQbIfS0n37TE=;
        fh=HcjAYqpKxm8t8fb5aM5cJIl0Ww+qNVbWu3A7VhZqEDA=;
        b=iQiik1YFtkw7O5GAZ2pnDT2fum/pGZ2foAl8wSG9nz3aiWMtYYNG4fdRozExJ/22xE
         u43DpItJ8lttygviAzPXaux1zbeJYWdjXmn1Z2nCL/RpAekylHfplag3w3zWEhiQz+jO
         RIFiDj9cOWhyfQevZ0huum76T1jUAurjUWd6Ks/KMoDJWBgnxvCpD31Opuekzau3H+iz
         rlUpqf17hwSqX9//blH7CnX+yyPnxC4t2jC3IfcDQNdreBcsUIVAC8oDM1BaWk/w+AgY
         TsJ+dzJbaRHNK4le6Jhly1UegiEAIRZxqbDVm30hc1SVEqynZE5aBbJs2D0vrCzwDVuQ
         BJDQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777049227; x=1777654027; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eZvZViiM+KTU4U/lHwXHb/VYi6/H9RrxQbIfS0n37TE=;
        b=hDDggWQm57mGKbH3I++UeyMCvrxDuJzPD224MnBnCK15vG++yu+ciLyqg2c013S4Ez
         tZXhEBQzRc0iS59wp56/ILWixjC3EhdKoo3uuJHYMau6uyww2XI6Tck98c0hPbvsFNrM
         xX2iPWd8F7d4Xfm3CkTkLAGC+YJIuzm20Ujoa/12yTwITcDmigjNJc5UTM5oHk7qdEbu
         o4bp2dd0HGKqciEPQ5ZV7O1ikqJJDvarkbXr/RHLMqhHo9FYUi2HuNzMNeAVDBlKPzij
         l+LHlX5o/d0QmKeLPdwEu1Hi5LQ0ZDfY2zLIeKr8IxJmPYqtQD2bWnMzGRce/tVlNeJg
         YTcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777049227; x=1777654027;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eZvZViiM+KTU4U/lHwXHb/VYi6/H9RrxQbIfS0n37TE=;
        b=mvp6+Yf9RfGcea1ECP1qBWT5YYa2z8MgSzRCEqFsetl7I3m2GJ5iRjIv9YOfcaAZ4X
         xFjoDwulZB22zwlQqmRlKVS2x1ljL2VtMPIL5MH2p9V7lWqdwt9B6S6mf+JbC9+qQVyX
         mDle9kY+vVkr9XCH0Hs1xY3DlHkvsNFI1eI77RQubZ+sbm684jVPBInd8pyks2BJ4oJq
         +qSvOLAuHzhSQJToPGaWbU1A2636QAa9UyWazc6w4FF/mWFO0e7iz+6ec/aShdoFQsWD
         Cr2m4KbMfIODmWthoz4lg01wJB25txUNIlB2oPPtbGPdf/jfq2VVyJDwKIUaI3nP16yE
         z1Vg==
X-Forwarded-Encrypted: i=1; AFNElJ9hVRbKyFUGh9Cv/LTpRvTItDyNsGvqAhjNmtHXXXL+7VjeJfspdpqCNkmoTzvo8g3lOAt34fucGoBZ2w==@lists.linux.dev
X-Gm-Message-State: AOJu0YxTHogCGQtQJBytZXqJIO44fHrrE/XI/hDLtIJsq+Kur06U0ieL
	HZIjyWInHAhMPc3gkAkAU5HFXBtVjEGdQ3tCaTXkMhKOH5ct7wkX6+g6v0DzCosXjR35sxE4vf2
	6p8zkxOhRZX8zX1yI6kQlnWbvytX/XYY=
X-Gm-Gg: AeBDietJf8YI1dLn31w6nt+7RQ+1mBmUC8ipbjtLJXcuwuf1xSPjWOwp6CTgu5y9tZ4
	PxVvJ4OHjwPDUXe0o2OaFvubJieJ8W+1K5cjqj7spPzEqOLl/2JOvwLKD7VjTKvKxAv0rSmyzFV
	g7BgY2tfA2sfSnrcUXrIHadWdtuPoET4t2RY3ULYGxPEzI86YwnirG/rBVaXceJxcVLW07mMJxZ
	YD149ZMrtg9VTeUCMQxxKuVoEmZR/yJ2qk07SGTPJ8NLsH1BQpy3YcuwovuGHSLsDjuXhCaWMAq
	rDnrbhLLKNXUHAOZp4zWipan2mXp4L6UIdC5q6DnKMo3SDrvBIAEqu5Rm8aCFP6N1ENw6VtnlZg
	BpfM6
X-Received: by 2002:a05:7022:5f01:b0:12d:b654:8180 with SMTP id
 a92af1059eb24-12db65484bfmr1873101c88.2.1777049226880; Fri, 24 Apr 2026
 09:47:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260306031932.136179-1-alex.hung@amd.com> <20260306031932.136179-20-alex.hung@amd.com>
 <7370736.9J7NaK4W3v@timur-max> <df82dbc6-623f-4be7-acbc-49157e59764c@leemhuis.info>
In-Reply-To: <df82dbc6-623f-4be7-acbc-49157e59764c@leemhuis.info>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 24 Apr 2026 12:46:55 -0400
X-Gm-Features: AQROBzBraznBYsAZpxHnqUE8Q_8czz02MUBY3I2yXLrWz3uNfcj8hqf_okcVyc4
Message-ID: <CADnq5_MFgdSH6sXPg+bpHYda0SGkK+sLevgwXNo+iDJmYMOdzg@mail.gmail.com>
Subject: Re: DC analog support regressed by "drm/amd/display: Sync dcn42 with
 DC 3.2.373"
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>, 
	amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, 
	Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Aurabindo Pillai <aurabindo.pillai@amd.com>, Roman Li <roman.li@amd.com>, 
	Wayne Lin <wayne.lin@amd.com>, Tom Chung <chiahsuan.chung@amd.com>, 
	Fangzhi Zuo <jerry.zuo@amd.com>, Dan Wheeler <daniel.wheeler@amd.com>, Ray Wu <Ray.Wu@amd.com>, 
	Ivan Lipski <ivan.lipski@amd.com>, Alex Hung <alex.hung@amd.com>, 
	David Airlie <airlied@gmail.com>, Christian <christian.koenig@amd.com>, 
	Linux kernel regressions list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 24, 2026 at 12:34=E2=80=AFPM Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> On 4/13/26 15:09, Timur Krist=C3=B3f wrote:
> > This patch breaks analog connector support in DCE, both for analog enco=
ders
> > and DP bridge encoders, because it deletes key functions such as
> > dce110_enable_analog_link_output, dce110_prepare_ddc,
> > dce110_external_encoder_control, and more.
> >
> > With this patch applied, when you connect an analog monitor you just ge=
t a
> > crash in DC from trying to call link->dc->hwss.enable_analog_link_outpu=
t()
> > which is now NULL.
> >
> > This is basically undoing all the work I did for supporting old GPUs wi=
th DC.
> > I think either this commit should be reverted or someone should add bac=
k the
> > analog support bits that were removed. I'm happy to help with that if n=
eeded.
> > What do you guys think?
>
> I noticed that a patch to fix this mistake is ready by now:
> drm/amd/display: Restore analog connector support --
> https://lore.kernel.org/all/20260418003539.1862136-1-Roman.Li@amd.com/
>
> And from that thread the fix was even "merged" somewhere. But I can't
> see this in -next or Alex' drm-fixes-7.1 pull, so I assume it will miss
> -rc1 (please corrent me if I'm wrong). Is that something to be concerned
> about?

It will be in -rc2.

Alex

>
> Ciao, Thorsten
>
> > As a side question, why was this commit merged without any review or ac=
k?
> >
> > Thanks & best regards,
> > Timur
> >
> > On 2026. m=C3=A1rcius 6., p=C3=A9ntek 4:13:45 k=C3=B6z=C3=A9p-eur=C3=B3=
pai ny=C3=A1ri id=C5=91 Alex Hung wrote:
> >> From: Roman Li <Roman.Li@amd.com>
> >>
> >> This patch provides a bulk merge to align driver
> >> support for DCN42 with Display Core version 3.2.373.
> >>
> >> It includes upgrade for:
> >> - clk_mgr
> >> - dml2/dml21
> >> - optc
> >> - hubp
> >> - mpc
> >> - optc
> >> - hwseq
> >>
> >> Signed-off-by: Roman Li <Roman.Li@amd.com>
> >> Signed-off-by: Alex Hung <alex.hung@amd.com>
> >> ---
> >>  .../gpu/drm/amd/display/dc/bios/bios_parser.c |  11 +-
> >>  .../display/dc/clk_mgr/dcn42/dcn42_clk_mgr.c  | 141 +++--
> >>  .../display/dc/clk_mgr/dcn42/dcn42_clk_mgr.h  |   2 +-
> >>  drivers/gpu/drm/amd/display/dc/core/dc.c      |  95 ++-
> >>  .../gpu/drm/amd/display/dc/core/dc_stream.c   |  41 +-
> >>  .../gpu/drm/amd/display/dc/core/dc_surface.c  |   9 +
> >>  drivers/gpu/drm/amd/display/dc/dc.h           |  59 +-
> >>  .../gpu/drm/amd/display/dc/dc_bios_types.h    |   3 +-
> >>  drivers/gpu/drm/amd/display/dc/dc_hw_types.h  |   2 +-
> >>  drivers/gpu/drm/amd/display/dc/dc_plane.h     |   1 +
> >>  drivers/gpu/drm/amd/display/dc/dc_types.h     |  24 +
> >>  .../amd/display/dc/dccg/dcn401/dcn401_dccg.c  |  20 +
> >>  .../drm/amd/display/dc/dce/dmub_hw_lock_mgr.c |  16 +
> >>  .../drm/amd/display/dc/dce/dmub_hw_lock_mgr.h |  13 +
> >>  .../dml2_0/dml21/dml21_translation_helper.c   |  30 +-
> >>  .../amd/display/dc/dml2_0/dml21/dml21_utils.c |   1 +
> >>  .../display/dc/dml2_0/dml21/dml21_wrapper.c   |  14 +-
> >>  .../dml21/inc/bounding_boxes/dcn42_soc_bb.h   | 308 ++++------
> >>  .../dml21/inc/dml_top_display_cfg_types.h     |  13 +
> >>  .../dc/dml2_0/dml21/inc/dml_top_types.h       |   2 +
> >>  .../dml21/src/dml2_core/dml2_core_dcn4.c      | 204 +++----
> >>  .../dml21/src/dml2_core/dml2_core_factory.c   |   1 +
> >>  .../dml21/src/dml2_core/dml2_core_utils.c     |  63 +-
> >>  .../dml21/src/dml2_core/dml2_core_utils.h     |   2 +
> >>  .../dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c      |   1 -
> >>  .../dml21/src/dml2_dpmm/dml2_dpmm_factory.c   |   1 +
> >>  .../dml2_0/dml21/src/dml2_mcg/dml2_mcg_dcn4.h |   2 +-
> >>  .../dml21/src/dml2_mcg/dml2_mcg_dcn42.h       |   5 +-
> >>  .../dml21/src/dml2_mcg/dml2_mcg_factory.c     |   1 +
> >>  .../dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c  |   6 +
> >>  .../dml21/src/dml2_pmo/dml2_pmo_factory.c     |   4 +-
> >>  .../dml21/src/dml2_pmo/dml2_pmo_factory.h     |   2 +-
> >>  .../dml21/src/dml2_top/dml2_top_interfaces.c  |   1 +
> >>  .../dml21/src/dml2_top/dml2_top_legacy.c      |   1 -
> >>  .../src/inc/dml2_internal_shared_types.h      |   3 +
> >>  .../drm/amd/display/dc/dml2_0/dml2_wrapper.c  |   3 +-
> >>  .../amd/display/dc/dpp/dcn30/dcn30_dpp_cm.c   |   2 +
> >>  .../display/dc/dpp/dcn401/dcn401_dpp_dscl.c   |  21 +
> >>  .../hpo/dcn31/dcn31_hpo_dp_stream_encoder.c   |   5 +
> >>  .../amd/display/dc/hubp/dcn401/dcn401_hubp.c  | 201 ++++---
> >>  .../amd/display/dc/hubp/dcn401/dcn401_hubp.h  |  23 +-
> >>  .../amd/display/dc/hubp/dcn42/dcn42_hubp.c    |  85 ++-
> >>  .../amd/display/dc/hubp/dcn42/dcn42_hubp.h    |  16 +-
> >>  .../amd/display/dc/hwss/dce110/dce110_hwseq.c | 136 +++--
> >>  .../amd/display/dc/hwss/dcn401/dcn401_hwseq.c | 412 +++++--------
> >>  .../amd/display/dc/hwss/dcn42/dcn42_hwseq.c   | 553 +++--------------=
-
> >>  .../amd/display/dc/hwss/dcn42/dcn42_hwseq.h   |  10 +-
> >>  .../amd/display/dc/hwss/dcn42/dcn42_init.c    |   8 +-
> >>  drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h  |  36 +-
> >>  .../gpu/drm/amd/display/dc/inc/hw/hw_shared.h |  18 +-
> >>  drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h   | 112 ++--
> >>  drivers/gpu/drm/amd/display/dc/inc/resource.h |   1 +
> >>  .../amd/display/dc/mpc/dcn401/dcn401_mpc.c    | 177 +++---
> >>  .../amd/display/dc/mpc/dcn401/dcn401_mpc.h    |  25 +-
> >>  .../drm/amd/display/dc/mpc/dcn42/dcn42_mpc.c  | 390 ++----------
> >>  .../drm/amd/display/dc/mpc/dcn42/dcn42_mpc.h  |  50 +-
> >>  .../amd/display/dc/optc/dcn10/dcn10_optc.h    |   2 +-
> >>  .../amd/display/dc/optc/dcn42/dcn42_optc.c    | 105 +++-
> >>  .../amd/display/dc/optc/dcn42/dcn42_optc.h    |  13 +-
> >>  .../dc/resource/dcn42/dcn42_resource.c        |  10 +-
> >>  .../dcn401/dcn401_soc_and_ip_translator.c     |   3 +
> >>  .../dcn42/dcn42_soc_and_ip_translator.c       |  12 +-
> >>  .../gpu/drm/amd/display/dmub/inc/dmub_cmd.h   |  38 +-
> >>  .../include/asic_reg/dcn/dcn_4_2_0_offset.h   |   2 +
> >>  .../include/asic_reg/dcn/dcn_4_2_0_sh_mask.h  |   9 +
> >>  65 files changed, 1596 insertions(+), 1984 deletions(-)
> >
> >
> >
> >
> >
>
