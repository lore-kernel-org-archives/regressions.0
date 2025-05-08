Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7095D22128B
	for <regressions@lists.linux.dev>; Thu,  8 May 2025 13:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746710341; cv=none; b=sgYZ46GMECwF2C9FEbTT5Cz0rulu6xoxohb4e0AwmjdfLjEtFHPdecabhPNcQG2YdR5FIQgVGutd0dSrOj/gooVld/RQPuu7Qh7wkjBHNiO/wZdSYeaPveoC3VoaFG/LZA3IM0jzCqFg/ZOMi2iaDK7Bsm63FGkPYVcgCxpY5Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746710341; c=relaxed/simple;
	bh=NC6aZCnk2yQCUTn2o/QPYLbt6yzD49eOOrZg5imo7KE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RkNFkZZkmw/67gXU7IrCuWduZjLY8+cPcG8uRbLyBa9cuGv6038bLFlLlXy3SsedkYCx4fwXbk8tJTLN4Ie/NoBae/bcEh/+a8tqPqiOY3RUpE7eC1Ova90FPWKluGrccc8asfGx2237bd4IKW0XLOvDJREQRxQCKuQYxgxk2V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RU8Lu0lo; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RU8Lu0lo"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-301a8b7398cso155118a91.1
        for <regressions@lists.linux.dev>; Thu, 08 May 2025 06:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746710336; x=1747315136; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W1roDko1XbrOHKIMUjuHPe417xq/761zF6ZWegodHkQ=;
        b=RU8Lu0loj7pykWsX79URHn1SyFZVa8+tfm0+IxQUZzzPzYj2SAjHFlFPr4UjIdrivD
         uhA47JrFMgXOCyk+Jwh6eT/QyayI5VKHw+IaM9oVbX2uspQaJrOgYEfyZ7SgGjI2RrMz
         6kZ5Z9Wz/uFGNle+0B6N+sFCjD3G8qeyALbkYBVpfVAOrEWAVQ/arqns7KyhEIIW1Wcq
         hD2Mq/woMOEJSIVUnH5TuHyL76XtJSsYxU85pnt6ww7Ly+c/GJ609oRCdlYW3r4LSEuu
         Q5CLKbuC6OMnfTYUGgXDiGNwmErdfC3MDn/soLVnWY71tHEaYm9LKGs+6MA0pA5P/2no
         HSzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746710336; x=1747315136;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W1roDko1XbrOHKIMUjuHPe417xq/761zF6ZWegodHkQ=;
        b=fWI7sfWms07LNlFvxet6CM1WNZpyha2GCfn9//n73vcmXvI0Oif1TOsjPYbTcdoEh7
         LD8q6/heDkaAv+yfkAYtkRQ39IIU7OaAj9n55pk8SwHHKTM23ya7Bl75b8WMZqXIq/vt
         BTpLhf4l5Xyu9OBQsLphJgjdTePrgGd91su+Wyb3rTdrRJv49EvA2/06wEEyQAihfynq
         Wdk4B+Top5JEyuvWiqnGqO/2kzGak5MhXDOlpZCe/gVmYlEmH0SKNTjOHKQzSC0+WN58
         i5mdEkvkekIjHQtj7Twmn7tvFldFe6wXxGeZlnO7NNuickft80m0OoFeoq0msUDDZ7ZP
         JSBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSXKDMD5ulCWiQThDQru72PRKccIHZkA33Aa57MSBh5rQhfzyTP81I+3EtNW/HAepD/bI2AeGC7byI1A==@lists.linux.dev
X-Gm-Message-State: AOJu0YwXFMdgufB6dl+gOh16+nyUfCvwQGQLTWy31LRlfIZCnTnqOnM+
	1oNcMSgNPbKX2mw80Z7cWDlrV8dVJxZgyARauo/xy62RH9Zin1PbYN6YomdNhY2ojxkwddDx+UF
	n2RNQt6OZXRjh5DcW1BIAJ23vsL4=
X-Gm-Gg: ASbGncva+hZwwaQ9H/aB4wEXJrvqbhBXyjUukeBcQvqmy+3t/4XKD645WsYHyxB0XlH
	+rpLoFK+1bJNov4GAtfO7ZFQiis+qHG7jFlw5nV5PU0Z1+Y86/IendTlAYrL4SJkp+J9In3OOKu
	Bltdc4m/Xqj+iFvhF5lLqpTw==
X-Google-Smtp-Source: AGHT+IFq0Lg3VZtCXUNslSbOl91jQC1KDok+Cuyoct+R62Hp6QOZMTlt5q0sgQH4VvcvrHtyIRM3g+TIjX0s0JSf60A=
X-Received: by 2002:a17:90b:4a0d:b0:2fe:91d0:f781 with SMTP id
 98e67ed59e1d1-30aac168c32mr3996692a91.2.1746710335552; Thu, 08 May 2025
 06:18:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <c415d9e0b08bcba068b01700225bf560@disroot.org>
In-Reply-To: <c415d9e0b08bcba068b01700225bf560@disroot.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 8 May 2025 09:18:43 -0400
X-Gm-Features: ATxdqUGPLOFgD59MDg0LhtzD4qji_j1FkqfSHl_wTRX4mI-vM5Sp5qVFzLgtUw8
Message-ID: <CADnq5_PX1dYF2Jd3q7ghaBjpPhNLq9EmFJtN1w6YOSfVo++7sA@mail.gmail.com>
Subject: Re: Unplayable framerates in game but specific kernel versions work,
 maybe amdgpu problem
To: machion@disroot.org
Cc: stable@vger.kernel.org, regressions@lists.linux.dev, 
	amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com, 
	christian.koenig@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 8, 2025 at 9:13=E2=80=AFAM <machion@disroot.org> wrote:
>
> Hello kernel/driver developers,
>
> I hope, with my information it's possible to find a bug/problem in the
> kernel. Otherwise I am sorry, that I disturbed you.
> I only use LTS kernels, but I can narrow it down to a hand full of them,
> where it works.
>
> The PC: Manjaro Stable/Cinnamon/X11/AMD Ryzen 5 2600/Radeon HD 7790/8GB
> RAM
> I already asked the Manjaro community, but with no luck.
>
> The game: Hellpoint (GOG Linux latest version, Unity3D-Engine v2021),
> uses vulkan
>
> ---
>
> I came a long road of kernels. I had many versions of 5.4, 5.10, 5.15,
> 6.1 and 6.6 and and the game was always unplayable, because the frames
> where around 1fps (performance of PC is not the problem).
> I asked the mesa and cinnamon team for help in the past, but also with
> no luck.
> It never worked, till on 2025-03-29 when I installed 6.12.19 for the
> first time and it worked!
>
> But it only worked with 6.12.19, 6.12.20 and 6.12.21
> When I updated to 6.12.25, it was back to unplayable.

Can you bisect to see what fixed it in 6.12.19 or what broke it in
6.12.25?  For example if it was working in 6.12.21 and not working in
6.12.25, you can bisect between 6.12.21 and .25.

Alex

>
> For testing I installed 6.14.4 with the same result. It doesn't work.
>
> I also compared file /proc/config.gz of both kernels (6.12.21 <>
> 6.14.4), but can't seem to see drastic changes to the graphical part.
>
> I presume it has something to do with amdgpu.
>
> If you need more information, I would be happy to help.
>
> Kind regards,
> Marion
