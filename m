Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62AE67B
	for <regressions@lists.linux.dev>; Thu, 24 Feb 2022 16:33:45 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id j10-20020a17090a94ca00b001bc2a9596f6so2461793pjw.5
        for <regressions@lists.linux.dev>; Thu, 24 Feb 2022 08:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hicd0tEo/b5LFaXhDInEJPUGfqEVOu+qbFlSudecvJ0=;
        b=fS9MOKL7PnyGYGUrEHm1W+CpwJy2baJ8/5LJyKMcAWjsJZogmHWVaUfDGQuZCkd8vP
         VK4ExEycU276xQ5S+kmUK8IVGZL9LtAPjVeyyI9yS6uqvs2uoRZiC/eOJqe8Vq9b+uvP
         xc4ZlO8+so2JceflzyF2iPU8/gIQZX3lFz5Ts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hicd0tEo/b5LFaXhDInEJPUGfqEVOu+qbFlSudecvJ0=;
        b=M77M97q24mOZl3M+Yk0CC3yELpVqZn3o7Xeh8b6xPJBT10ymxKWVs3vbuoNkOXj/rr
         L/w0buzaHvk7zADv1PUil6/z3g7trDlzNDyauLtM9PFf+Pcm5rSgEAIRXYQ+2pEulE92
         GvgrdNLBa5Bq9VrEt0/E7GXR1fouy9o6SNgXDa+RjOQp0itKgwcgJVfvmcU+sqwUdfXc
         qBUv1jRU39HrjdQBBzcJiCHBPWS5Os/gngr9dMaJZnwiSOJpWedKTvjWm4fS29YBF2vs
         UYGtGLZKz9qXWpGGQIDh6omyCOcciygge3YAHlVc1f/rfHtB3pctt183DDHaUOHvzMYC
         VvVw==
X-Gm-Message-State: AOAM530Xd/zw2L5LlxcjGvgwMmGLXCr/ksfnXUVqXgdYcQ8GyXbbr2B4
	2YXKtO/03wsKang5sfl1a/WMNw==
X-Google-Smtp-Source: ABdhPJyWX2X03NpVP7OG9tb3/bOJYzu9SCAwlXij7cTFtfwKtKMcQhac3eTOvjUxx32AVPETPTB7Vw==
X-Received: by 2002:a17:902:e80c:b0:14f:f95c:41ee with SMTP id u12-20020a170902e80c00b0014ff95c41eemr3140315plg.31.1645720424809;
        Thu, 24 Feb 2022 08:33:44 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 19sm3998951pfz.153.2022.02.24.08.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 08:33:44 -0800 (PST)
Date: Thu, 24 Feb 2022 08:33:43 -0800
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
Message-ID: <202202240832.F40AEB20@keescook>
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

Yeah, that might be helpful. I have access to a Debian ia64 porter box,
but it's not running the broken kernel, so I can only examine "normal"
behavior.

I'll switch to off-list email...

-Kees

-- 
Kees Cook
