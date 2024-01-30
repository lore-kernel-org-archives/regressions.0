Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796B552F6D
	for <regressions@lists.linux.dev>; Tue, 30 Jan 2024 07:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706598193; cv=none; b=Bndd8Da7lH4B8coxjW2htOueG+ymPpxkdxfDpQL0n9/Z6Z1mO2MJ+UW+z+nwVSfxiFVNs2vtqtARU08lygV2cJHQa7lKeRcij8RwdxH7n95HWKfBodIuHUszdcAuA06ImtqJCB7WqNh3KZnHmhP3VM5l+8Z98koiymnYO1A39s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706598193; c=relaxed/simple;
	bh=Td4wMLwtaAM1BcTb9dHxlFHMFlK9bEegT/g6so9iTTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SvWVpjkBfNnOHz872VZwQ4b1MyWAN7KsdvFOdMexptCYGbsb8bEV1ItWeGpeQ1S+347OeWNmOJNUcAnrf/Y5tU76f76+2IXOCSl7n9FoNIT2dh7UNEgSwOxo+ngRZ7TOq0BxJ1qflZ9190MQi+zYNmh9c3s+ZolMRAVTGVZVCSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kl30iuCJ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kl30iuCJ"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40e80046246so19227955e9.1
        for <regressions@lists.linux.dev>; Mon, 29 Jan 2024 23:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706598190; x=1707202990; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pTUETpTJenxWl+VtgzWBaNr9s4KsWn5wef5pbRbJgpM=;
        b=kl30iuCJ9+jht1pwZKCGFymISB/ab9Xd/dpV4IYRmQ+PcUQ9N98VkTX9yd/MqbgtlU
         rp6m0oCa2qlwPAcNI/6lW06vbrfCeHmT9hpBkJBUhjMNtehA+FmwozTWkQAeFcoZ/b/P
         M+C/KaVoPEIz2bDEN4FEDBPox1bXHZxCYGi1Fvx/o6ow8Cqzw5GD0BHFcs+1tJ1FdNuy
         8kaoanzY9Kk/dvcfMZwlrtNUsOw0tsApadw0wiK7b5KZnm/R+VWtaTzbIGyxOjq1wRQW
         wE7wkRFurpPFje+ceSVjEFxPxCdNrWHFOiSdRqrZpR6zzQY6CZTKEq1SjqqFt3FIUNZu
         9+wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706598190; x=1707202990;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pTUETpTJenxWl+VtgzWBaNr9s4KsWn5wef5pbRbJgpM=;
        b=UAk5F7DObrqxvnVKrtFGjdq5mmMTYX1xf91UIH6sPi7WEdwc4daAMh3MbTNevqZD2C
         v+Aqo/TBK5JhMs9nydCZjZgvlyYupjvyd7tEdUkxPZwGJPV3i52wddKzX7Rg5wvqsixX
         VjZt8FEWwdIIlbTJoDg7eVz1k3Ll4uibrGMWc0eZgFK1pey1FTthxHAvCVOvV0+Qx2rv
         mBg80NgZtkU5my5tuggJj8VqEvcag6WzRrdbA0590I1Ect5nurxQK2Xp7SxBaJFmTwtx
         zkQQQCOzrWxxSqnZGR2SS4iQH1UPlBjxu9Xngu7nnDLXcASqk4GFn4vfDvQUgqdDHJWO
         4BhQ==
X-Gm-Message-State: AOJu0YytY2ai73VkJq1weuwLWqwxCM1HeIxQVAFCVufGuB7nLmtrGvSv
	d1aYqyFQkoV2mudVQZ352YsXXJoNTcW+AQKMOrvUFboMmo4DsVy6
X-Google-Smtp-Source: AGHT+IHbCCX5DQ9Y2Dy7lH1GSPWxYoUn+4UQGO+6fgTIAYSzXOlfPa6yFbgtqHrSBqsTJXSwy4N8oQ==
X-Received: by 2002:a05:600c:4fd0:b0:40e:f972:9901 with SMTP id o16-20020a05600c4fd000b0040ef9729901mr643965wmq.4.1706598189546;
        Mon, 29 Jan 2024 23:03:09 -0800 (PST)
Received: from eldamar.lan (c-82-192-242-114.customer.ggaweb.ch. [82.192.242.114])
        by smtp.gmail.com with ESMTPSA id n20-20020a05600c3b9400b0040eee852a3dsm8839236wms.10.2024.01.29.23.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 23:03:08 -0800 (PST)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id 09541BE2DE0; Tue, 30 Jan 2024 08:03:08 +0100 (CET)
Date: Tue, 30 Jan 2024 08:03:07 +0100
From: Salvatore Bonaccorso <carnil@debian.org>
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Patrice Duroux <patrice.duroux@gmail.com>,
	Lewis Huang <lewis.huang@amd.com>,
	Daniel Wheeler <daniel.wheeler@amd.com>,
	Phil Hsieh <phil.hsieh@amd.com>,
	Rodrigo Siqueira <rodrigo.siqueira@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: Bug#1061449: linux-image-6.7-amd64: a boot message from amdgpu
Message-ID: <ZbifK8M99hTDIsD4@eldamar.lan>
References: <170612149675.7169.757906919183146487.reportbug@kos-moceratops.home>
 <ZbUB0YWxEET3Y0xA@eldamar.lan>
 <acf203a8-b612-437c-a464-228f45e1c694@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acf203a8-b612-437c-a464-228f45e1c694@leemhuis.info>

Hi,

[for this reply dropping the Debian bugreport to avoid later followups
sending the ack to the mailinglist and adding noise]

On Sun, Jan 28, 2024 at 11:44:59AM +0100, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 27.01.24 14:14, Salvatore Bonaccorso wrote:
> >
> > In Debian (https://bugs.debian.org/1061449) we got the following
> > quotred report:
> > 
> > On Wed, Jan 24, 2024 at 07:38:16PM +0100, Patrice Duroux wrote:
> >>
> >> Giving a try to 6.7, here is a message extracted from dmesg:
> >> [    4.177226] ------------[ cut here ]------------
> >> [    4.177227] WARNING: CPU: 6 PID: 248 at
> >> drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_factory.c:387
> >> construct_phy+0xb26/0xd60 [amdgpu]
> > [...]
> 
> Not my area of expertise, but looks a lot like a duplicate of
> https://gitlab.freedesktop.org/drm/amd/-/issues/3122#note_2252835
> 
> Mario (now CCed) already prepared a patch for that issue that seems to work.

#regzbot link: https://gitlab.freedesktop.org/drm/amd/-/issues/3122

Thanks. Indeed the reporter confirmed in
https://bugs.debian.org/1061449#55 that the patch fixes the issue.

So a duplicate of the above.

Regards,
Salvatore
