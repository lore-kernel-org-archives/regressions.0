Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BD31841
	for <regressions@lists.linux.dev>; Fri, 30 Sep 2022 03:29:14 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id u69so3111200pgd.2
        for <regressions@lists.linux.dev>; Thu, 29 Sep 2022 20:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=0zaardMzdo84BBvC7uLDBzbOjA8ewhAN7uNbK6h7JYY=;
        b=hak1ujvX5jTWm1bp22t3vvMvyrJfC7KVeR+wnUfTiMT/TkDO2//7l09Hqsrq3dso+U
         r/+vNueM2Jfq6sqqvs6Q0UUY+2JHVC6SmHAX/Oiml7SwCWEVZq+BJ6sjJ1m+ev0VMIml
         +FkWG/9yBijRNE1zf8r/C6Uye4TU/KsXFoCnw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=0zaardMzdo84BBvC7uLDBzbOjA8ewhAN7uNbK6h7JYY=;
        b=k9cMdPFhlCN7E4PU7qPyiCzqocH3xy0yRqq0o4ko/Em4+1YNKU+rOgjcBr0wTqeV16
         vHtxytzt8mV0uL4OKzYFr7bBS13RWep+wcQVK2kgRrke9xbaygBaBqsX8KatmyKJ2ZPx
         7tajqnG61qWi0L4D77VN/W6oRLMpIu3ok4s6a7IfPvNcMhpm4NoQXfykuInXj/uSpbGh
         Vnxi4v26I82/2YwZLCLnMkzyYefmf9Oj70zgBLqMI6JvHb2Rgwc64tGj9KY29hsHXsGW
         Zg189V5gS+x7EkwYaE9LIwp4mSUArid2g7UCBi0E4VWktixfUoDAhDuPPo7pQ5B9kr7r
         NfSA==
X-Gm-Message-State: ACrzQf11384d1G+yiGQC2Ix7bQtFmY9C1WywE+S52tP3O56L7xoJPZ/a
	5TkycpoKzh6eWZLb2gUI0svgjQ==
X-Google-Smtp-Source: AMsMyM4JXfjw5J0pg8BvozxvbT4YFf0amxr8UZn56f9CUF33dNGBam37Az8ZM+1h5fm9QIVf1YKPhQ==
X-Received: by 2002:a05:6a00:22cf:b0:545:90f3:8b96 with SMTP id f15-20020a056a0022cf00b0054590f38b96mr7040659pfj.58.1664508554280;
        Thu, 29 Sep 2022 20:29:14 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id nn10-20020a17090b38ca00b0020669c8bd87sm224328pjb.36.2022.09.29.20.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 20:29:13 -0700 (PDT)
Date: Thu, 29 Sep 2022 20:29:12 -0700
From: Kees Cook <keescook@chromium.org>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Ard Biesheuvel <ardb@kernel.org>
Cc: linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, kernel-dev@igalia.com,
	kernel@gpiccoli.net, Anton Vorontsov <anton@enomsg.org>,
	Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>,
	Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: [REGRESSION][PATCH] Revert "pstore: migrate to crypto acomp
 interface"
Message-ID: <202209291951.134BE2409@keescook>
References: <20220929215515.276486-1-gpiccoli@igalia.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220929215515.276486-1-gpiccoli@igalia.com>

On Thu, Sep 29, 2022 at 06:55:15PM -0300, Guilherme G. Piccoli wrote:
> This reverts commit e4f0a7ec586b7644107839f5394fb685cf1aadcc.
> 
> When using this new interface, both efi_pstore and ramoops
> backends are unable to properly decompress dmesg if using
> zstd, lz4 and lzo algorithms (and maybe more). It does succeed
> with deflate though.

Hi!

Thanks for looking at this. I wasn't able to reproduce the problem,
initially. Booting with pstore.backend=ramoops pstore.compress=zstd and
writing to /dev/pmsg0, after a reboot I'm able to read it back.

> The message observed in the kernel log is:
> 
> [2.328828] pstore: crypto_acomp_decompress failed, ret = -22!

Hmm, that's EINVAL.

> The pstore infrastructure is able to collect the dmesg with
> both backends tested, but since decompression fails it's
> unreadable. With this revert everything is back to normal.
> 
> Fixes: e4f0a7ec586b ("pstore: migrate to crypto acomp interface")
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>

A reminder to myself, I keep getting surprised that systemd is
stealing the pstore filesystem contents and moving them into
/var/lib/systemd/pstore/

> Hi Ard, Thorsten and pstore maintainers. I've found this yday
> during pstore development - it was "hidden" since I was using
> deflate. Tried some fixes (I plan to submit a cast fix for a
> long-term issue later), but nothing I tried fixed this.

What's your setup for this? I'm using emulated NVDIMM through qemu for
a ramoops backend. But trying this with the EFI backend (booting
undef EFI with pstore.backend=efi), I _do_ see the problem. That's
weird... I suspect there's some back interaction with buffer size
differences between ramoops and EFI & deflate and zstd.

And I can confirm EFI+zstd with the acomp change reverted fixes it.

Ard, anything jump to mind for you?

> So, I thought in sending this revert - feel free to ignore it if
> anybody comes with a proper fix for the async compress interface
> proposed by Ard. The idea of the revert is because the 6.0-rc
> cycle is nearly over, and would be nice to avoid introducing
> this regression.
> 
> Also, I searched some mailing list discussions / submission of
> the patch ("pstore: migrate to crypto acomp interface"), but
> couldn't find it - can any of you point it to me in case it's
> in some archive?

Hm, it's possible this was just sent directly to me? If that's true, I
apologize for not re-posting it to lkml. I suspect I didn't notice at
the time that it wasn't CCed to a list.

> Thanks in advance, and sorry for reporting this so late in the
> cycle, I wish I'd found it before.

No worries! Whatever the case, there's always -stable updates. :)

-Kees

-- 
Kees Cook
