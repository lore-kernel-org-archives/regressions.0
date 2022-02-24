Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940371373
	for <regressions@lists.linux.dev>; Thu, 24 Feb 2022 05:16:07 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id 139so835585pge.1
        for <regressions@lists.linux.dev>; Wed, 23 Feb 2022 21:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=srYPL04OWay1dcY8e70dNGhHS9ZwVWkaxq0mw17kle0=;
        b=E+AaIZP0v7bVUhbtnlfQdm0GewhlDSLyFsa4Gc9ttCYc4Wugq3ehabUEmagg6S/HG5
         ZIBO/6RSxYufDXorILKqvIXx/WRBvOtOllmU7CIO+HDmGlm+E2pJTWQQR9ntIuP4IqTi
         SE2nH8yGt6EOujARktNsaPIbSukKsuSizLpvc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=srYPL04OWay1dcY8e70dNGhHS9ZwVWkaxq0mw17kle0=;
        b=jB9je7T8GU878dMSj6zJ9qdbPPgZ/Cc6IqvKqSFVmmZv3ND/xKHFPKq8zx1j+rLv0w
         lLLwJHxtH5xY9cW7Ptjfga/B4wdZbKXaQ4WHxzqQM5zcfWaQe40hgWgqvqkH14zWB1Nx
         cS+cPNdfpAeKD8ggWVeX9JBlKQUJ1XsoepyGCblblrAMnC17/IbYB21rG2/aVwp3YOdJ
         25S7V9uIuk8JrOROeOPR28XDuwDUr9Sw6Ds0bx1QFlPg0eFkSUzPMcKv8qQ5Wv58itZq
         S13Y+E5rgbECPE/VNuEz3fQ6OihE/LRI1HXLKZyMHnoBXxQLfn5sHI6iGCmVtsBTUCUv
         Mf2A==
X-Gm-Message-State: AOAM532Tx2VdSVkWKOmNCuktI039D0+V76pnTAJT/AKiCKaLIi/rW91l
	48WlGcq3uN9Desuep3pd/5OIpQ==
X-Google-Smtp-Source: ABdhPJyY08KTJaKQ5zKGQ1yFLiRI1Pv8/UxZIiAHPJqb0gnMTYA9nhd/ZhDBm4UZolLnsVTN1dDpkA==
X-Received: by 2002:a05:6a00:23c6:b0:4cf:1e1e:ff4f with SMTP id g6-20020a056a0023c600b004cf1e1eff4fmr1200901pfc.80.1645679767050;
        Wed, 23 Feb 2022 21:16:07 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id m11-20020a17090a3f8b00b001bc299e0aefsm4595800pjc.56.2022.02.23.21.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 21:16:06 -0800 (PST)
Date: Wed, 23 Feb 2022 21:16:05 -0800
From: Kees Cook <keescook@chromium.org>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>,
	Anthony Yznaga <anthony.yznaga@oracle.com>,
	matoro_bugzilla_kernel@matoro.tk,
	Andrew Morton <akpm@linux-foundation.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	linux-ia64@vger.kernel.org,
	Linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>
Subject: Re: regression: Bug 215601 - gcc segv at startup on ia64
Message-ID: <202202232030.B408F0E895@keescook>
References: <a3edd529-c42d-3b09-135c-7e98a15b150f@leemhuis.info>
 <823f70be-7661-0195-7c97-65673dc7c12a@leemhuis.info>
 <03497313-A472-4152-BD28-41C35E4E824E@chromium.org>
 <94c3be49-0262-c613-e5f5-49b536985dde@physik.fu-berlin.de>
 <9A1F30F8-3DE2-4075-B103-81D891773246@chromium.org>
 <4e42e754-d87e-5f6b-90db-39b4700ee0f1@physik.fu-berlin.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e42e754-d87e-5f6b-90db-39b4700ee0f1@physik.fu-berlin.de>

On Mon, Feb 21, 2022 at 10:57:01PM +0100, John Paul Adrian Glaubitz wrote:
> Hi Kees!
> 
> On 2/21/22 21:58, Kees Cook wrote:
> >> I have applied this patch on top of 038101e6b2cd5c55f888f85db42ea2ad3aecb4b6 and it doesn't
> >> fix the problem for me. Reverting 5f501d555653f8968011a1e65ebb121c8b43c144, however, fixes
> >> the problem.
> >>
> >> FWIW, this problem doesn't just affect GCC but systemd keeps segfaulting with this change as well.
> > 
> > Very weird! Can you attached either of those binaries to bugzilla (or a URL I can fetch it from)? I can try to figure out where it is going weird...
> 
> Here's the initrd of that particular machine:
> 
> > https://people.debian.org/~glaubitz/initrd.img-5.17.0-rc5+
> 
> You should be able to extract the binaries from this initrd image and the "mount" command,
> for example, should be one of the affected binaries.

In dmesg, do you see any of these reports?

                pr_info("%d (%s): Uhuuh, elf segment at %px requested but the memory is mapped already\n",
                        task_pid_nr(current), current->comm, (void *)addr);

I don't see anything out of order in the "mount" binary from the above
initrd. What does "readelf -lW" show for the GCC you're seeing failures
on?

-- 
Kees Cook
