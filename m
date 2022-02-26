Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD193B21
	for <regressions@lists.linux.dev>; Sat, 26 Feb 2022 11:52:29 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id em10-20020a17090b014a00b001bc3071f921so10673074pjb.5
        for <regressions@lists.linux.dev>; Sat, 26 Feb 2022 03:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Ea3QXOZbjOPzaxGsgfBM/mqvgonT3tPPaz+lhJkrk24=;
        b=dDjYm27p2iHctpRQWBncoiN/lzoby+WoFLXLLz+T89Azj+MrhaJOEVvy++LKcdoCcF
         9lx1OHwjGH4NPU5N8+aOKyoDf0nZXkmfkP84HVkgFkdtUg+Atyb9qjeizEPRutokbicS
         ohi0uKx9whk6V3ICv1k/rP8NZq8rPBeLtcv30=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ea3QXOZbjOPzaxGsgfBM/mqvgonT3tPPaz+lhJkrk24=;
        b=XKSUqkYDRwYLRLQbWugi7miIhXimsCFx6ZHXjKii+l8Pcn5BxFy5UtHIUwaVkAYJ+B
         5l5iL5im0di6YoxqR/160xZf6ENCCQRdCQVeZ5M2eotYBR/xpalN3Qe8ShN1oPOKc2Jk
         8BGZGPhPv1UDEeHkIm58vaVZwtIETCtH2QQF6qW+I4edyTscDhx3/uRnEh4ntoMGudQT
         iImaEXiFcsWbyJ1M0Z1HhUwte8QIDCQWMWoLw0aY5mZY6UTLBbhmD802vkOq0yiGg2PH
         f/U6Qn+XGmQBI12G12yF/Q4cwEM1UPl6s4ETMvBqk1D3Obb2cRx2NXIUwpZSIdtrY9cJ
         xsvw==
X-Gm-Message-State: AOAM531W2byZ7muijNIgUAIvNNL5b7xeyiVIawvha94AdhgAuKrS2nit
	fO2f8dohydX22U86GAilo1IKSw==
X-Google-Smtp-Source: ABdhPJw2XLKnFy89w02qNG9y5DyM0OT5B3soxq7XFIM2db/DXxS2nhBst3JBTbw2/wKSZniCT3SIdA==
X-Received: by 2002:a17:902:6942:b0:14c:b20e:2b1a with SMTP id k2-20020a170902694200b0014cb20e2b1amr11954656plt.112.1645876349209;
        Sat, 26 Feb 2022 03:52:29 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id z7-20020a056a00240700b004e1cde37bc1sm6757095pfh.84.2022.02.26.03.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Feb 2022 03:52:28 -0800 (PST)
Date: Sat, 26 Feb 2022 03:52:27 -0800
From: Kees Cook <keescook@chromium.org>
To: matoro <matoro_mailinglist_kernel@matoro.tk>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Thorsten Leemhuis <regressions@leemhuis.info>,
	Anthony Yznaga <anthony.yznaga@oracle.com>,
	matoro_bugzilla_kernel@matoro.tk,
	Andrew Morton <akpm@linux-foundation.org>,
	regressions@lists.linux.dev, linux-ia64@vger.kernel.org,
	Linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>
Subject: Re: regression: Bug 215601 - gcc segv at startup on ia64
Message-ID: <202202260344.63C15C3356@keescook>
References: <a3edd529-c42d-3b09-135c-7e98a15b150f@leemhuis.info>
 <823f70be-7661-0195-7c97-65673dc7c12a@leemhuis.info>
 <03497313-A472-4152-BD28-41C35E4E824E@chromium.org>
 <94c3be49-0262-c613-e5f5-49b536985dde@physik.fu-berlin.de>
 <9A1F30F8-3DE2-4075-B103-81D891773246@chromium.org>
 <4e42e754-d87e-5f6b-90db-39b4700ee0f1@physik.fu-berlin.de>
 <202202232030.B408F0E895@keescook>
 <7e3a93e7-1300-8460-30fb-789180a745eb@physik.fu-berlin.de>
 <65ed8ab4fad779fadf572fb737dfb789@matoro.tk>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <65ed8ab4fad779fadf572fb737dfb789@matoro.tk>

On Thu, Feb 24, 2022 at 09:22:04AM -0500, matoro wrote:
> Hi Kees, I can provide live ssh access to my system exhibiting the issue.
> My system is a lot more stable due to using openrc rather than systemd, for
> me GCC seems to be the only binary affected.  Would that be helpful?

Thanks for this access! I think I see the problem. Non-PIE (i.e. normal
ET_EXEC) ia64 binaries appear to have two very non-contiguous virtual
memory PT_LOAD segments that are file-offset adjacent. As seen in
readelf -lW:

  LOAD           0x000000 0x4000000000000000 0x4000000000000000 0x00b5a0 0x00b5a0 R E 0x10000
  LOAD           0x00b5a0 0x600000000000b5a0 0x600000000000b5a0 0x0005ac 0x000710 RW  0x10000
                 ^^^^^^^^ ^^^^^^^^^^^^^^^^^^

When the kernel tries to map these with a combined allocation, it asks
for a giant mmap of the file, but the file is, of course, not at all
that large, and the mapping is rejected.

So... I'm trying to think about how best to deal with this. If I or
anyone else can't think of an elegant solution, I'll send a revert for
the offending patch next week.

In the meantime now I've got another dimension to regression test. ;)

-- 
Kees Cook
