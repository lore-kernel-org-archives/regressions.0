Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872472DFA59
	for <regressions@lists.linux.dev>; Tue, 22 Jul 2025 10:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753180164; cv=none; b=Fw/Vdq8chp3bjwSE0psdAmHhtM/nfkm5OHpKF/2bY9TExbjMBNrcbNejs7rDnkuW6Zv8oOnCEOgr0+eOvh8FhrHzWKDYrjsCOoBG+fErOuNoUgiI3zBSwlt0Q/SjdAn3tFcsy3Fe5LtjHuXU3CJuEljmjexgXZUTVMS10HeZLA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753180164; c=relaxed/simple;
	bh=rVhTQfn+06SZjykkCx//yMRYe1F42mvD3bufyn8Eoec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MsdvET4Sv3aU0+rSaKtyG2eWEALwAqN+4YLaLxEF68ekxeqjqGUgVL6uuFRbP985Hly7QymZmJROXXqkzXuDJXAJ2Sok9aXaNM0qfHLAi3SrJaKTEqjfA9+M82APHHE0SGoHoSfUSx2tmBdgmSIeeto5EfJwLMoE7HJQl51ARMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XP2/Ru8f; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XP2/Ru8f"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a6d77b43c9so4028356f8f.3
        for <regressions@lists.linux.dev>; Tue, 22 Jul 2025 03:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753180161; x=1753784961; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fxZUVGACW46ROFRrurwhfL/bIVT9DSzn+Z7eP3oj7pY=;
        b=XP2/Ru8fsx8G6oe2BQEZlC5HYcqDgdkpFSHnI5aDntC3JfiUCMo7cWrxK6P/aTO29W
         QA3Fo6y+mMeTNYVi3yTFACGHqG6xouSQbUjfEt1Xkb5kqsUdifXL7+ssMQ8YeHH6mVcY
         E7cXOaYfNm1acKsVgdxY5wAHky1/UbHFgio9oii48kcJ551kATXlJL/4/4fs2ClhtgTM
         jMWAQqW9sYp2Hic2CzrlfRyLGx1jGm7Nd7W7e9VgoJmr3CaQM3z/vbr6bDn51rOl5Oyu
         GcCE9wKEGNLuIwWz3Nmnj7jOfFSzJ01IR6sLVcWolGFyl1tp3CfKRrvEBPXgIOtjMIjV
         UaTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753180161; x=1753784961;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fxZUVGACW46ROFRrurwhfL/bIVT9DSzn+Z7eP3oj7pY=;
        b=OLkn95hnR15gzFoHI8Kx+G7eh8KQWR3gbOYHt/ierGjpYf/NlbiCdzIK4gxPgnLtNa
         Jr8iti+SjZ9o6vqzjBYWU2bZbINIcLZiaHzubHFtNWzZ0lOAIdLmCKUYZMrKNXpzcBzF
         GpLMEzKHcEIXVLQLnBAEZGYq0X4eqBnHuYWFyJQ4AW4BfqHL97CUtqUyMXG9HnUAsGfm
         N0Y9vtNz00SiXNYYVRceQiYyMPr4ItZTa139gbpD4aEBo4oozn+RezvN62jwQE8U5LDB
         LE7l2fKfxvAVU9aT4fz0qaKhBLLfuLoGyb/CvckedcU+hS7E50i7HKoRMjdAIXZjnaNH
         gTzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFKV25PRL/JWLe2Ld23saO4jAl9sDU2T30ttMx4d86lOZ4K/ylRXIdsL2WzhnZL0HzikzkcEtIJG+KWw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxD/QAfU1eR42RsB2uvhOu2w60vg141Y/olj6ZkJPPTo73c7eef
	0qwcaLNsQPtYtIt4r2rX5s3Oxez/95PdGCvTYMHGZ3nqX0qNzuIm7OnR
X-Gm-Gg: ASbGncvqu5IheFBpYHTPpwjpglnmnS+gh/P9ePd5uT6717gju/mV8Yzk1pNLBmNPE3w
	ONmFS3sijnR1KdphACG7kGApr1F4vKCwRw8n6i6JjSEDzZSdFolVYthifVAEtR49TOar4Lcc3G0
	CyEusZmgO/6+Egx7O32KnOANLh9b53hc+axz53nK+9H8LE4gNDVaEZjQhZXU07PjLjwV6sV45w7
	BwXjTZm3M4k76M3oBZsNxUWhkp7Xeuj2EqMejR4WJH+AQC1r5Y5+qPDNfQZbBCXCuuz0/Cr3EfA
	CnT/x2hM7Pznd4IbOYAv14zLbzcrC4rEGIs+8xu5SUGsvE1PN0nzB7k6/+n1MvJy3jw9TnKY3rE
	7mD9Hh7pHjqVPrfI0q99VJaotZT2KoxA=
X-Google-Smtp-Source: AGHT+IEHBlNbQ1YPEWSxQJSYPHljQ9UoaZeqhCRzRGrQ0XzA5BTAIrm5I1v2Kds708E89K2m5lCgjg==
X-Received: by 2002:a05:6000:4b17:b0:3a4:e1e1:7779 with SMTP id ffacd0b85a97d-3b60e50ff22mr18202349f8f.32.1753180160588;
        Tue, 22 Jul 2025 03:29:20 -0700 (PDT)
Received: from debian.local ([81.78.104.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4563b75de26sm125434925e9.33.2025.07.22.03.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 03:29:20 -0700 (PDT)
Date: Tue, 22 Jul 2025 11:29:17 +0100
From: Chris Bainbridge <chris.bainbridge@gmail.com>
To: Satadru Pramanik <satadru@gmail.com>
Cc: Arnd Bergmann <arnd@kernel.org>, airlied@gmail.com, airlied@redhat.com,
	arnd@arndb.de, bskeggs@nvidia.com, bskeggs@redhat.com,
	"open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
	open list <linux-kernel@vger.kernel.org>,
	Lyude Paul <lyude@redhat.com>, nouveau@lists.freedesktop.org,
	simona@ffwll.ch, ttabi@nvidia.com,
	Thomas Zimmermann <tzimmermann@suse.de>,
	regressions@lists.linux.dev
Subject: Re: [PATCH] drm/nouveau: check ioctl command codes better
Message-ID: <aH9n_QGMFx2ZbKlw@debian.local>
References: <CAFrh3J85tsZRpOHQtKgNHUVnn=EG=QKBnZTRtWS8eWSc1K1xkA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFrh3J85tsZRpOHQtKgNHUVnn=EG=QKBnZTRtWS8eWSc1K1xkA@mail.gmail.com>

On Mon, Jul 21, 2025 at 08:22:48AM -0400, Satadru Pramanik wrote:
> Hello all,
> 
> I suspect this commit in 6.16-rc7 has broken acceleration with Mesa's
> nouveau drivers on my machine.
> 
> glxinfo -B reports that I'm using llvmpipe.
> 
> Reverting this in 6.16-rc7 restores nouveau acceleration, and glxinfo
> then reports: "OpenGL renderer string: NVE7"
> 
> inxi -G
> Graphics:
>   Device-1: NVIDIA GK107M [GeForce GT 750M Mac Edition] driver: nouveau
>     v: kernel
>   Display: wayland server: X.Org v: 24.1.8 with: Xwayland v: 24.1.8
>     compositor: gnome-shell v: 48.0 driver: X: loaded: modesetting
>     unloaded: fbdev,vesa dri: nouveau gpu: nouveau resolution: 2880x1800~60Hz
>   API: EGL v: 1.5 drivers: nouveau,swrast
>     platforms: gbm,wayland,x11,surfaceless,device
>   API: OpenGL v: 4.5 compat-v: 4.3 vendor: mesa
>     v: 25.2.0~rc1+git2507191056.03f67b52319~p~mesarc0 renderer: NVE7
>   API: Vulkan v: 1.4.304 drivers: N/A surfaces: xcb,xlib,wayland
>   Info: Tools: api: eglinfo, glxinfo, vulkaninfo x11: xdriinfo, xdpyinfo,
>     xprop, xrandr
> 
> Best,
> Satadru Pramanik

I also bisected an issue to this commit. On my laptop, this commit
results in an intermittent desktop crash (Xorg segfault) when changing
display scale, which can be more reliably reproduced with:

for x in {1..100}; do
  xrandr --output eDP-1 --mode 2560x1600 --scale 0.5 --filter nearest
  xrandr --output eDP-1 --mode 2560x1600 --scale 1 --filter nearest
done

I also see the same glxinfo llvmpipe change that Satadru reported.
Reverting the commit fixes my scale test case, and also the glxinfo
renderer.

#regzbot introduced: e5478166dffb51fa64e76cdbb5c24421f22f2d43 ^
#regzbot title: nouveau hardware acceleration broken
