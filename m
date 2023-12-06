Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834DA563B0
	for <regressions@lists.linux.dev>; Wed,  6 Dec 2023 22:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ii3OkDKt"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6cea1522303so31865b3a.1
        for <regressions@lists.linux.dev>; Wed, 06 Dec 2023 14:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701902322; x=1702507122; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v+4oPNNVBI0NPUQNcE82sxUMnJJvgGad4QF6v1JsIK8=;
        b=Ii3OkDKtTuE4maZsbliX0iD4R8CGzmH4+fifjTnID6+1ps2iRaHLydZZO7F2v2yrz4
         1gG/beQFG/M7SBikWi+xr0FQt+6QPN8N6a+g8z3ch0VD2uF7eEnOA5DPkt84BPOxOycW
         VD2KbZDWd8wIsfmCrEZzKeDsQoHOllLDyKLdo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701902322; x=1702507122;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v+4oPNNVBI0NPUQNcE82sxUMnJJvgGad4QF6v1JsIK8=;
        b=GL6cfkAYTe/4BEaEL4eoWfvarH/Ap6HU/NhQG646ydCetd2Ca1Is/6jBfu+xYqAani
         s2M1UpWkrZxiGIrFcCHsjFddbEzEh+X5pAXOWeirbSEeb94I9BqyZHgBAwP67FW1/Glg
         3dtFPxXBq2dfzg7WnFzTwDlNqhx2jv1eiwmFEwVvB9vfnl2xfUDhfWaIaSMd5wkwus75
         vkitow89haJI9zbsG2KlBQhvu7pHIk/jVguZfbrdl5EK3GCAN9XZ/zqcLIDTWg0EIyxX
         p1OzpEYNe7V6Z2Td/1mrxEKjamfdEoaK5U/8MPo6wNAWVHy+r2qd6OgOVrVVI18HxnHP
         vx0g==
X-Gm-Message-State: AOJu0Ywrp0A+XlOPOvA/8fZcE/BTsgFHC/eI/B4cg8sM2NaPhlRb4yfx
	R0Xhcva8x/vfWdGYsQJKDRvqvMHPBwP+IkxIRAg=
X-Google-Smtp-Source: AGHT+IHTO6Bm1YpVvYyKzmSzmx2nP0B5WjacD55ZsWjTp5zZqxQfRGUNO6A8B1rAllGZoH4U9W4bXA==
X-Received: by 2002:a05:6a00:1ca5:b0:6cd:fd5c:3c01 with SMTP id y37-20020a056a001ca500b006cdfd5c3c01mr1524853pfw.15.1701902321833;
        Wed, 06 Dec 2023 14:38:41 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id p22-20020aa78616000000b006cb60b188bdsm19755pfn.196.2023.12.06.14.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 14:38:41 -0800 (PST)
Date: Wed, 6 Dec 2023 14:38:40 -0800
From: Kees Cook <keescook@chromium.org>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-mm <linux-mm@kvack.org>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	lkft-triage@lists.linaro.org, regressions@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Eric Biederman <ebiederm@xmission.com>
Subject: Re: WARNING: CPU: 6 PID: 474 at include/linux/maple_tree.h:712
 mmap_region (include/linux/maple_tree.h:556 include/linux/maple_tree.h:731
Message-ID: <202312061435.E57F367C16@keescook>
References: <CA+G9fYs-j2FYZSFSVZj48mgoM9gQd4-7M2mu2Ez3D1DqDdW2bQ@mail.gmail.com>
 <ZUzmlhvRv66I3J6P@finisterre.sirena.org.uk>
 <B4299DC4-57CF-4CB2-ACB1-A215F429BF6A@kernel.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <B4299DC4-57CF-4CB2-ACB1-A215F429BF6A@kernel.org>

On Thu, Nov 09, 2023 at 09:45:26PM -0800, Kees Cook wrote:
> 
> 
> On November 9, 2023 6:03:02 AM PST, Mark Brown <broonie@kernel.org> wrote:
> >On Thu, Nov 09, 2023 at 06:57:08PM +0530, Naresh Kamboju wrote:
> >> Following kernel panic noticed while running  selftests: exec: load_address
> >> on Fastmodels (FVP) running Linux next-20231109.
> >> 
> >
> >Copying in Kees and Eric who maintain the exec API.
> 
> I'm traveling tomorrow so I won't be able to investigate this for a couple days. A quick look makes it seem like this is only happening in -next? (This warning was recently added to __mas_set_range?)
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/include/linux/maple_tree.h?id=02eccbc51164b43c5dadc3e5b40922c757075e08
> 
> Adding Liam...

Did this get addressed? I still see the warning checks in
__mas_set_range()...

-Kees

-- 
Kees Cook
