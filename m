Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B687B7B
	for <regressions@lists.linux.dev>; Mon, 22 Aug 2022 13:26:10 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id o15-20020a9d718f000000b00638c1348012so7693439otj.2
        for <regressions@lists.linux.dev>; Mon, 22 Aug 2022 06:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=Ym2QzmSxSPQA0jLV20ijGnKp3r/sDU7UD8wRIA7GeIA=;
        b=RtPv6N22xaI/d9dzhRIhNw3YeXorMNe5GzyfPOhEGzaaF2dAYTkjHpFltNhFp0RSqd
         q9rYzexLxugyIsO2x53ODz38+TOp/3tDqnaP0H5hxOu/Asg5ZLK50kWJmB24mVEtllJm
         2CfYV9ZH/3lUVJLRBUsoAutxWJLorv0kKEe2I0O3Rkjui34Bv6aiZCxBseO6UpygB2Ve
         nCpWOjJF/SQVPMC4Y7UbQFn6RuScxKpPzR4oKYCPfnEhDNtCLWqfpmeeKftCJMyLNiC0
         krY63V0p5OuHCZyrdsBEcS2VZnovOpZzyXPmrDMPhmK/Sr+YfHVDrPlPTNHdEkXQu3JU
         ooow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=Ym2QzmSxSPQA0jLV20ijGnKp3r/sDU7UD8wRIA7GeIA=;
        b=04GwAEriTdlX+DtY0s/8tYPoSLoY9K1fcXjStRezo8oquINSi3yvLs+88LMphnA1iW
         AG+lOv0TikX5h0wfW5hz6sjwapuo5LR+7iYIZtDEsG8d1Bqv/se+3h6HXJfJliiBVaDm
         Gzf34LR87z4ohS7V+QINCQD6BkKTpATPEcXsozzO6ostddcEnuPhxFUsaPq5B5y1zYsg
         IQS2lWoXnTB59XQI7KViz6fbzTpji4wwKVFUsY/GN2kBc7M0rwpvN028ZB5yS07vui4R
         MP0E3IL6dYWUSblnwcohMfe/q10FnfiZR22oj1IZMlF+MLk+Rsj66Kmx+wVxuXl318z8
         yH4A==
X-Gm-Message-State: ACgBeo265hhrqens6BdC0nGXIg+z0NVCBA3NNwMTxxwGcn1nhistMKxV
	4yLV2tpjsFDbWsEN9choLaM9s5na7Rtwrbw/i7k=
X-Google-Smtp-Source: AA6agR6fIwYQLQA0UEzaoTlFtW4K1uUElNhZBbe2qtBiw6a7KmwOhl3QnGK9LpKBChlrOkGgXiwhGgymIDuXQNEzjso=
X-Received: by 2002:a9d:c64:0:b0:636:df4c:e766 with SMTP id
 91-20020a9d0c64000000b00636df4ce766mr7865469otr.12.1661174769791; Mon, 22 Aug
 2022 06:26:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAA6RncSwQL5A1Ox3a088Kpp4=-bHPzAGcJa_fEFkiE801tAJjw@mail.gmail.com>
In-Reply-To: <CAA6RncSwQL5A1Ox3a088Kpp4=-bHPzAGcJa_fEFkiE801tAJjw@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 22 Aug 2022 09:25:58 -0400
Message-ID: <CADnq5_OtoCCCEEgdVnJEZYHYsJUHi=9yCUTdHr5EA13aDsk3mA@mail.gmail.com>
Subject: Re: No Audio from AMDGPU HDMI on 5.19.2
To: =?UTF-8?B?6I+c5Y+2?= <ye.jingchen@gmail.com>, 
	Martin Leung <Martin.Leung@amd.com>, "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev, 
	amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

+ Martin, Rodrigo

On Mon, Aug 22, 2022 at 3:18 AM =E8=8F=9C=E5=8F=B6 <ye.jingchen@gmail.com> =
wrote:
>
> Hello,
>
> I experienced this issue on Arch Linux 5.19.2-arch1-1 kernel on an HP
> laptop with AMD Ryzen 6850HS CPU (detailed spec below), that the audio
> is completely silent on the HDMI connected monitor. KDE audio settings
> says everything works normally, HDMI audio shows up and can be
> selected as the default output, just no sound from it.
>
> It worked fine on Arch kernel v5.19.1-arch2. Laptop speakers always
> work, and the monitor works when connected to another Windows laptop
> over HDMI, so the monitor isn't the culprit I assume.
>
> Kernel log from the journal didn't seem to contain something relevant,
> but it may be me not knowing what to look for.
>
> This is discovered on Arch Linux kernel 5.19.2-arch1-1, but also
> reproducible on vanilla v5.19.2 tag.
>
> Bisecting between tag v5.19.1 and v5.19.2 in the stable tree gives:
> 308d0d5d98c294b1185d6d7da60b268e0fe30193 is the first bad commit
> commit 308d0d5d98c294b1185d6d7da60b268e0fe30193
> Author: Leung, Martin <Martin.Leung@amd.com>
> Date:   Fri May 13 17:40:42 2022 -0400
>
>    drm/amdgpu/display: Prepare for new interfaces
>
>    [ Upstream commit a820190204aef0739aa3a067d00273d117f9367c ]
>
> Anything else I can do to investigate?
>
> My hardware spec:
> Laptop: HP EliteBook 845 14 inch G9 Notebook PC
> CPU: AMD Ryzen 7 PRO 6850HS with Radeon Graphics
> GPU: VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI]
> Rembrandt [Radeon 680M]
>
> % lspci | grep -i audio
> 63:00.1 Audio device: Advanced Micro Devices, Inc. [AMD/ATI] Rembrandt
> Radeon High Definition Audio Controller
> 63:00.5 Multimedia controller: Advanced Micro Devices, Inc. [AMD]
> ACP/ACP3X/ACP6x Audio Coprocessor (rev 60)
> 63:00.6 Audio device: Advanced Micro Devices, Inc. [AMD] Family
> 17h/19h HD Audio Controller
>
> Software:
> plasma-desktop 5.25.4-1
> plasma-pa 5.25.4-1
> pipewire 1:0.3.56-1
> pipewire-pulse 1:0.3.56-1
> wireplumber 0.4.11-4
> alsa-card-profiles 1:0.3.56-1
> linux-firmware 20220708.be7798e-1
> sof-firmware 2.2-1
