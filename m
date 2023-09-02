Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7CC17EF
	for <regressions@lists.linux.dev>; Sat,  2 Sep 2023 11:10:37 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5007abb15e9so4934595e87.0
        for <regressions@lists.linux.dev>; Sat, 02 Sep 2023 04:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693653035; x=1694257835; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sCWoWPe6h8Qmaq6PAfz3dXsnt+0ElN/TsBNKOj8iL1I=;
        b=VQ+MbsCjAxpGvVGHWfKcib2OUKy7fUTZYHSFroonbkGxZKbw08veBSI7Xs5Bwieamt
         9nCA0+4qXvEDsdMyMU+PlU4V6FJit0/dGqqB4P8BETRwH4KOFT7CMSn4PpeiMRW/GpKG
         +fkDSmODzUv3deyfeGXl8DlxUr18vQ3Gggov7Ad4Mc+GK6TwBocgnIATuMzD/nNIJIqM
         moUaLIn6mIcAflfOfO3evv1Zi0Aqs8SfUhbdfSlOfyqMi1NSEAHgZkhLxdkcvPlt3guQ
         wscwsrtA+jhHra5kGahXnpxUop79Ut1xWwIIjmERDw9RsYoxI8BAX9jd4uO6PAEQ0JDI
         Ag1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693653035; x=1694257835;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sCWoWPe6h8Qmaq6PAfz3dXsnt+0ElN/TsBNKOj8iL1I=;
        b=Vj48l2/fVjnCzqY1M5sXRPRGHaKg7I+TfyEdKEcmz1PFD4Uo+Ztd43w7btCzsaz+Ot
         VEBWazWZTCTQIYeZHLaqS6NUF7CvHzm4vhuGD3M38zl7Sm97P/9lL6LRHBPwccrGy9qy
         8rQCiBPQODR41ZDp2EmCD344VkkcC+UBM1IUgruzsD0GO2Z9OZFqYXVV1bgz1dmxuNsO
         BN6cYIrrtufgVCSXswxFz1mdSQP7YTKbR4ukVVC8brh0Xza3EFAw8I5qBH8prDuvexRD
         jDHm0m3u0Ri8WbzMSJIpJitP7m1uDc2SejYR26iB/vtdhF3ULIsc6Ttnrn+wHXKdWTz0
         eYAA==
X-Gm-Message-State: AOJu0YyxG5vvhzWE8HQwaFQ3KIUKuhK3xsICEumqRUIc1zZn8BrbAmA+
	DS0ny8cyRMD9O0mbu/96Pui8IN4M4euq1MRmU9Y=
X-Google-Smtp-Source: AGHT+IG/VqY3vkLqgYJkFoWyA3BAQzDL3TGfy+OM6GskqKn3cNhSQnpX1YM1Nnj35Q12kl0+w6BraWus5k49mAtQrh4=
X-Received: by 2002:a05:6512:742:b0:500:7f51:d129 with SMTP id
 c2-20020a056512074200b005007f51d129mr2639186lfs.34.1693653035278; Sat, 02 Sep
 2023 04:10:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZPDgdGBbxrTl+m2s@debian> <CAHk-=wg4vpuourbbUPn19yFx2cNj93O6t0PhiARLLL6z22yV4Q@mail.gmail.com>
In-Reply-To: <CAHk-=wg4vpuourbbUPn19yFx2cNj93O6t0PhiARLLL6z22yV4Q@mail.gmail.com>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Sat, 2 Sep 2023 12:09:59 +0100
Message-ID: <CADVatmMF1QS235CD4KbDPy_w9hAi0rN1EJqAXtJok2Xg0iE-UA@mail.gmail.com>
Subject: Re: mainline build failure due to 501126083855 ("fbdev/g364fb: Use
 fbdev I/O helpers")
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 31 Aug 2023 at 20:04, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Thu, 31 Aug 2023 at 11:48, Sudip Mukherjee (Codethink)
> <sudipm.mukherjee@gmail.com> wrote:
> > The latest mainline kernel branch fails to build mips jazz_defconfig with
> > the error:
> >
> > drivers/video/fbdev/g364fb.c:115:9: error: 'FB_DEFAULT_IOMEM_HELPERS' undeclared here (not in a function); did you mean 'FB_DEFAULT_IOMEM_OPS'?
> >   115 |         FB_DEFAULT_IOMEM_HELPERS,
> >       |         ^~~~~~~~~~~~~~~~~~~~~~~~
> >       |         FB_DEFAULT_IOMEM_OPS
> >
> >
> > git bisect pointed to 501126083855 ("fbdev/g364fb: Use fbdev I/O helpers").
> >
> > Reverting the commit has fixed the build failure.
> >
> > I will be happy to test any patch or provide any extra log if needed.
>
> Would you mind testing the exact thing that the compiler suggested?
>
> So instead of the revert, just replace FB_DEFAULT_IOMEM_HELPERS with
> FB_DEFAULT_IOMEM_OPS.
>
> I think it's just a typo / confusion with the config variable (which
> is called FB_IOMEM_HELPERS).

Yeah, you were right.
Patch sent - https://lore.kernel.org/lkml/20230902095102.5908-1-sudip.mukherjee@codethink.co.uk/


-- 
Regards
Sudip
