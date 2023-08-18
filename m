Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFAAD4693
	for <regressions@lists.linux.dev>; Fri, 18 Aug 2023 17:37:38 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-55b0e7efb1cso907275a12.1
        for <regressions@lists.linux.dev>; Fri, 18 Aug 2023 10:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692380258; x=1692985058;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3LKfiXOUv4Y78GYwccbn9eLRl2BI7RjZ4/fZETpGexM=;
        b=AwtNaCfH+hxlFLkfnuSI87gwp+VrGSgjnV1+zyCVrSwmJJC4EGOeaIRRhY9RTx6MYP
         FgApMLQbcYGXFIUxmq7WRH1DlieMuCOArB0NAHYwn8eFVczWDLMlggXkB/l7FmumT4gH
         p8dBl4LTXYAJn2srL2qSVGJh9kAj2+MdjgNnQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692380258; x=1692985058;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3LKfiXOUv4Y78GYwccbn9eLRl2BI7RjZ4/fZETpGexM=;
        b=B1B7jja4dvigyk1KZxpEUacuEhpBSCluWuUG7K5HPEhL3bXTWtBVR03dq5soop4A30
         Fs0AjY4f+oiKsmR12OSrihRhx33r/OSp+rXDHbY50PHpKwFePq6jFaxy2StTUbhT/bzd
         M8VrZ+bxj4sp1Ly48UJE3wDQebwmRAk0FshqMXP+HIvcir1fxcbqQ1PL1iKQIbmcYhwh
         GSRjPu9kSdxICKXILjEUvyCs7UWGPxbbLJ9y2wnhfxmJxN1PYZ6vvstsdrtRfGRvS2iE
         IL+LVRK3KXhPS2H59wrlfduHyZ9ZnA4MnDY5wm1JSU/k5RqwmsOp741h3QExicmLkK9U
         DVgA==
X-Gm-Message-State: AOJu0YwRCGti0ZJyjMOkQ6QWm3DHvh9IL5xWwybXNfo9OsfXvF0QxuAv
	EYwr74Y+d1XIm3eoRZsctz0IZQ==
X-Google-Smtp-Source: AGHT+IGJ++HaMEe6fHz/+u8LhwdAhyc4KdGymaYjDc60SFpqfaa9p36TY5f9p3+CAiEcdKVw+eWCoA==
X-Received: by 2002:a17:90b:438d:b0:26d:4346:6eb2 with SMTP id in13-20020a17090b438d00b0026d43466eb2mr2675522pjb.46.1692380258263;
        Fri, 18 Aug 2023 10:37:38 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id ci13-20020a17090afc8d00b002684b837d88sm1828910pjb.14.2023.08.18.10.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Aug 2023 10:37:37 -0700 (PDT)
Date: Fri, 18 Aug 2023 10:37:36 -0700
From: Kees Cook <keescook@chromium.org>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Fiona Ebner <f.ebner@proxmox.com>, linux-kernel@vger.kernel.org,
	siva.kallam@broadcom.com, prashant@broadcom.com, mchan@broadcom.com,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, richardcochran@gmail.com, jdelvare@suse.com,
	Guenter Roeck <linux@roeck-us.net>, netdev@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	Linux Regressions <regressions@lists.linux.dev>
Subject: Re: "Use slab_build_skb() instead" deprecation warning triggered by
 tg3
Message-ID: <202308181036.8F79E77@keescook>
References: <1bd4cb9c-4eb8-3bdb-3e05-8689817242d1@proxmox.com>
 <ZN9SId_KNgI3dfVI@debian.me>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZN9SId_KNgI3dfVI@debian.me>

On Fri, Aug 18, 2023 at 06:12:33PM +0700, Bagas Sanjaya wrote:
> On Fri, Aug 18, 2023 at 10:05:11AM +0200, Fiona Ebner wrote:
> > Hi,
> > we've got a user report about the WARN_ONCE introduced by ce098da1497c
> > ("skbuff: Introduce slab_build_skb()") [0]. The stack trace indicates
> > that the call comes from the tg3 module. While this is still kernel 6.2
> > and I can't verify that the issue is still there with newer kernels, I
> > don't see related changes in drivers/net/ethernet/broadcom/tg3.* after
> > ce098da1497c, so I thought I should let you know.
> > 
> 
> Thanks for the regression report. I'm adding it to regzbot:
> 
> #regzbot ^introduced: ce098da1497c6d
> #regzbot link: https://forum.proxmox.com/threads/132338/
> 
> PS: The proxmox forum link (except full dmesg log pasted there) is in
> German, so someone fluent in the language can be helpful here.

Since this doesn't cause a behavioral regression, should it be tracked
by regzbot? The WARN is serving as a reminder to the maintainer to
adjust the allocation method.

-- 
Kees Cook
