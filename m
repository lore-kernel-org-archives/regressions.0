Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD14E14A93
	for <regressions@lists.linux.dev>; Thu, 31 Aug 2023 19:04:01 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-31dcf18f9e2so1013499f8f.0
        for <regressions@lists.linux.dev>; Thu, 31 Aug 2023 12:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1693508639; x=1694113439; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MxGEoM6NvMI83xhY8G/ImCWZyFVY8xF2ffN+doaTRi0=;
        b=avawRgOFfbOylvMQkyXyJc0e6jhpDvckVC1IaphD1xauKpI75F5PtQYOc/A55eOhAR
         GRFRvClrZ11rEm/dFxc8kUGXlCeEWTmV550VGtuUsd08cXF47Uf0gPk7vzNY/piqlz8x
         srCbytAvl4QH5q++ViseyWtWnCPjkBWmD6ZAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693508639; x=1694113439;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MxGEoM6NvMI83xhY8G/ImCWZyFVY8xF2ffN+doaTRi0=;
        b=a0CLAFWUA00ZG2K4G2r0D/P+dzNd+MkMrl96dXKdalq4/HSlFv5tt6flp/AvwZJjF2
         eBnk4qf++A6YI+F6tqMCHFtyqsc93qvtmPZpaN/YU1yJSz+Q9MPphhyL5w0jIayG0KQC
         BUNVEEmahMLy9Yp3bULTqjf0V+e2a+vBYJPLFrp17HnSrx3eGVIWzRyl7ql3L9T9kuiI
         fp5GxqZY8noWXGvZyK1E1L/SAj0wwWEYA/AgrFEs9otzKgIC0RoSoLK4R1XKl1JAJ7NO
         6HfEvopoxdJadAo60q5pLWejS2RIuD3CjjMJkOZ2qpMFDcFY+OlJ/WIzw5QKPGcphopD
         QQGQ==
X-Gm-Message-State: AOJu0YySwTZZaVbfBlcqHyAPiJm0Gs4vhattZIq9HjXRx3odPYPfpnOK
	Hu8cT9d4vPq0AW7oppjCtMHaHFlI2neRRCBax2CZ1We+
X-Google-Smtp-Source: AGHT+IGe/fekjhplacclnWf5i1va8+h39yeWiSVajTyQX/F6eTc0m3EmhUGZGYjDQySUd16CG2+rbQ==
X-Received: by 2002:a5d:4e42:0:b0:317:7062:32d2 with SMTP id r2-20020a5d4e42000000b00317706232d2mr259488wrt.54.1693508639491;
        Thu, 31 Aug 2023 12:03:59 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id d4-20020a50ea84000000b00521d2f7459fsm1114561edo.49.2023.08.31.12.03.58
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Aug 2023 12:03:58 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-31dcf18f9e2so1013477f8f.0
        for <regressions@lists.linux.dev>; Thu, 31 Aug 2023 12:03:58 -0700 (PDT)
X-Received: by 2002:a5d:5242:0:b0:315:8a13:ef17 with SMTP id
 k2-20020a5d5242000000b003158a13ef17mr269497wrc.65.1693508638437; Thu, 31 Aug
 2023 12:03:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZPDgdGBbxrTl+m2s@debian>
In-Reply-To: <ZPDgdGBbxrTl+m2s@debian>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 31 Aug 2023 12:03:41 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg4vpuourbbUPn19yFx2cNj93O6t0PhiARLLL6z22yV4Q@mail.gmail.com>
Message-ID: <CAHk-=wg4vpuourbbUPn19yFx2cNj93O6t0PhiARLLL6z22yV4Q@mail.gmail.com>
Subject: Re: mainline build failure due to 501126083855 ("fbdev/g364fb: Use
 fbdev I/O helpers")
To: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 31 Aug 2023 at 11:48, Sudip Mukherjee (Codethink)
<sudipm.mukherjee@gmail.com> wrote:
> The latest mainline kernel branch fails to build mips jazz_defconfig with
> the error:
>
> drivers/video/fbdev/g364fb.c:115:9: error: 'FB_DEFAULT_IOMEM_HELPERS' undeclared here (not in a function); did you mean 'FB_DEFAULT_IOMEM_OPS'?
>   115 |         FB_DEFAULT_IOMEM_HELPERS,
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~
>       |         FB_DEFAULT_IOMEM_OPS
>
>
> git bisect pointed to 501126083855 ("fbdev/g364fb: Use fbdev I/O helpers").
>
> Reverting the commit has fixed the build failure.
>
> I will be happy to test any patch or provide any extra log if needed.

Would you mind testing the exact thing that the compiler suggested?

So instead of the revert, just replace FB_DEFAULT_IOMEM_HELPERS with
FB_DEFAULT_IOMEM_OPS.

I think it's just a typo / confusion with the config variable (which
is called FB_IOMEM_HELPERS).

               Linus
