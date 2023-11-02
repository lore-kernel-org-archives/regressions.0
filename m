Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25356D3F
	for <regressions@lists.linux.dev>; Thu,  2 Nov 2023 16:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FZJ0fCIN"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-1f03fdfcfacso609065fac.0
        for <regressions@lists.linux.dev>; Thu, 02 Nov 2023 09:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698943961; x=1699548761; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ui4RfJzpp8oZSTAGwUEFNZzYkRDHy/N87GoVOtgxAXQ=;
        b=FZJ0fCINBNP5BP31nA4KlXj8xxugmnlwUGog7caFh8x5yEC58AkFyBkt/3uOSOQZbE
         zwwuwms1+A8TlMu4dYfpe9PjQMidQ5TgBKAVQil4+5ZDO9Vtl5RB5oUmGmf3KCbWTrgy
         g5T55Xgapm8W9QmgX/n8KuXdNpBBK2Yuj+VoD4Lybg6f6F6q1Hf4cDwOccPv65GJiGd3
         s60tcSjR9zy2yZdeYrrMT1eldvxw+MsQzengHUM7SOJLMv0TCBOEmORyZgNr+KSdrHdu
         Bxc1ptMioPs6/j7hVkJKIlsy0GWXfsSnxzONpYsBYRUDmYM4nsG0sisgTJ5Mf3+NYYlR
         92uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698943961; x=1699548761;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ui4RfJzpp8oZSTAGwUEFNZzYkRDHy/N87GoVOtgxAXQ=;
        b=Ck/TAoSjYT6wzFVeeMp8o6nT857xzWvX5olCxNwWtmjIDyQd5Uejru9DbLJoVjuy8p
         WI8gd9mt7eI+SG+y8/5wHRcwRO31RnBDeX6pS2eJIq4RDxe3ke7NwoLM6udDpdCy1RAv
         sTvXXDlrTCOApF0M4QtE1yBjiBIIMBBtm6n+4wjQ2/u6KWkf5XFTt6CDcTvr9CxKGnxJ
         /7aOYEHcDlR7FaXpU4mnWK1FAdwYcsMf/aLESh2AKrkg+MYTXKqsXdC6LB1YVxGR4TO1
         Hg8Wy3+DChuRJGaLEoT7/tnq6S1Op6TTDco3Kl0RwpMQvu5sfEzrONoRFkXNGu84+ACx
         GSMg==
X-Gm-Message-State: AOJu0YwLLjdn+4Stxe7ZQYGI7cUsOo+Ob/WVcH01k52Rs9+6wrFmCzl6
	j48rXo9bbXEveBqWdzWtahDpRHpLcrajX60baHI=
X-Google-Smtp-Source: AGHT+IEsdW4B2/8cahRRswQBtqGr+aRM+u2mFgCDk0qJ+y9EqqQ0+4bkkNKQxCWr5LP+k+NDi9OYk6xVSSk0kFnmAhI=
X-Received: by 2002:a05:6870:1281:b0:1f0:36ab:2886 with SMTP id
 1-20020a056870128100b001f036ab2886mr4655407oal.41.1698943961740; Thu, 02 Nov
 2023 09:52:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZUNsmJGbYwgPaUpY@debian>
In-Reply-To: <ZUNsmJGbYwgPaUpY@debian>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 2 Nov 2023 12:52:30 -0400
Message-ID: <CADnq5_Minarw2D_TeRdkm6nJOP_4qHM+MxiMeLWMXqHxjq22Xw@mail.gmail.com>
Subject: Re: mainline build failure due to 7966f319c66d ("drm/amd/display:
 Introduce DML2")
To: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Roman Li <roman.li@amd.com>, 
	Qingqing Zhuo <Qingqing.Zhuo@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	regressions@lists.linux.dev, Leo Li <sunpeng.li@amd.com>, 
	"Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org, 
	"linux-kernel@vger.kernel.orgLinus Torvalds" <torvalds@linux-foundation.org>, dri-devel@lists.freedesktop.org, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 2, 2023 at 5:32=E2=80=AFAM Sudip Mukherjee (Codethink)
<sudipm.mukherjee@gmail.com> wrote:
>
> Hi All,
>
> The latest mainline kernel branch fails to build x86_64 allmodconfig
> with the error:
>
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c: In fun=
ction 'dml_prefetch_check':
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c:6707:1:=
 error: the frame size of 2056 bytes is larger than 2048 bytes [-Werror=3Df=
rame-larger-than=3D]
>  6707 | }
>       | ^
>
> git bisect pointed to 7966f319c66d ("drm/amd/display: Introduce DML2")
>
> I will be happy to test any patch or provide any extra log if needed.

This was reported earlier and fixed by:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3D089dbf6a06f1dcaeed4f8b86d619e8d28b235207
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3Db141fa036c901303ca5659cc22e9c08f8b097892
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3D5b2c54e0d0ea09f7a3b500510731878326e1117e
but I guess maybe different compiler versions are still hitting this.

Alex

>
> #regzbot introduced: 7966f319c66d9468623c6a6a017ecbc0dd79be75
>
> --
> Regards
> Sudip
