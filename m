Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4FA2F5A
	for <regressions@lists.linux.dev>; Tue, 23 Aug 2022 17:04:16 +0000 (UTC)
Received: by mail-oo1-f49.google.com with SMTP id z23-20020a4ad1b7000000b0044931ffdcafso2536611oor.4
        for <regressions@lists.linux.dev>; Tue, 23 Aug 2022 10:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=TUg/MW+5uwqkPY+MLc70krjM60VBeEeGCfnySwldiwg=;
        b=Yy1D2HftO+eOzV0Ic0suR8nmcNMTHLyik3FZY7MaTj4OFyv37SMhw+ej0wDA23ngLK
         CwPEql8zfjyGvUi1VFcpICjJgqQarDgcFZR9hRz3/yVobuA7vkCOixudjUYpUjO9hnyc
         VKoQIrnb47IwnDpZQRCOJ1H9GsWAFI62J/s+A9N+K7W4VLtyIV/px6P4JE1a83SnvVcY
         /MmLgVj3fmUHPZnUiV3DQgvCSIAWGOWJ7gSZJ4CidRmYHVPEjauK54QtR5J0fE18VFKt
         MBigCSfySQ4qcEKE9R4EMOLNaN2pbepP4uwpqVN+hsX+v6ihxoD3KNc5HX3dgdLm+Ko9
         XKXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=TUg/MW+5uwqkPY+MLc70krjM60VBeEeGCfnySwldiwg=;
        b=CeLBLBKu+ORHqn4CCx13t8u3rUYlGyA2KiNVXV1GiT8tqX/Goed+GtX3vxalGZYBbe
         1uYHHBPURWwYofzPfqJkJ8o6RZU4aMiO6LXj33LcxODK/k6urHV5XndK1bR/uVcuD98q
         xTZH1RkmDSbCVgsCIQtmZe3vNtpZ6kmV0jlencI0j7n+62iE91j1DALMuSLG/oKoHxf6
         A7z0gHzcDIglJAskCsXsJrWuNfgR55QvK+ucsJUiMENgoE5+VcPcJXZh9VcuH6vW60D0
         ah6TN2EDaEXfYmK8P0ek4OKJf25YZFxxNvJBs+/IIAl4baHmjyIKbVsnxnbl8Jj6t1WA
         JunA==
X-Gm-Message-State: ACgBeo0U5+XdbZsbL4MT7qEgBysiwcM+C/M2Hfc20v6V7SQUSAiY72tY
	3IhnijgaxOI1W50wkvoN7DYWy5/PjGynesUUloo=
X-Google-Smtp-Source: AA6agR6XgQsau2DY6uzmKYWsDA7bVUlGQKf7jxT6ApzcWlbpOaCrokpE4iUclQ4NqT06TmpMl49uQQYc0O0JgDYZNgg=
X-Received: by 2002:a4a:b607:0:b0:44a:f4e7:4808 with SMTP id
 z7-20020a4ab607000000b0044af4e74808mr8239529oon.37.1661274255415; Tue, 23 Aug
 2022 10:04:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220819190725.GA2499154@bhelgaas> <6aad506b-5324-649e-9700-7ceaaf7ef94b@amd.com>
In-Reply-To: <6aad506b-5324-649e-9700-7ceaaf7ef94b@amd.com>
From: Tom Seewald <tseewald@gmail.com>
Date: Tue, 23 Aug 2022 12:04:04 -0500
Message-ID: <CAARYdbhVwD1m1rAzbR=K60O=_A3wFsb1ya=zRV_bmF8s3Kb02A@mail.gmail.com>
Subject: Re: [Bug 216373] New: Uncorrected errors reported for AMD GPU
To: "Lazar, Lijo" <lijo.lazar@amd.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, regressions@lists.linux.dev, 
	David Airlie <airlied@linux.ie>, linux-pci@vger.kernel.org, 
	Xinhui Pan <Xinhui.Pan@amd.com>, amd-gfx@lists.freedesktop.org, 
	Kai-Heng Feng <kai.heng.feng@canonical.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Alex Deucher <alexander.deucher@amd.com>, Stefan Roese <sr@denx.de>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, Aug 20, 2022 at 2:53 AM Lazar, Lijo <lijo.lazar@amd.com> wrote:
>
> Missed the remap part, the offset is here -
>
> https://elixir.bootlin.com/linux/v6.0-rc1/source/drivers/gpu/drm/amd/amdgpu/nv.c#L680
>
>
> The trace is coming from *_flush_hdp.
>
> You may also check if *_remap_hdp_registers() is getting called. It is
> done in nbio_vx_y files, most likely this one for your device -
> https://elixir.bootlin.com/linux/v6.0-rc1/source/drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c#L68
>
> Thanks,
> Lijo

Hi Lijo,

I would be happy to test any patches that you think would shed some
light on this.
