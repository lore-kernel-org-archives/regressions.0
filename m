Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B2A7F
	for <regressions@lists.linux.dev>; Fri,  7 Jul 2023 00:42:03 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1b8b64850b0so52945ad.1
        for <regressions@lists.linux.dev>; Thu, 06 Jul 2023 17:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688690523; x=1691282523;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NCyACxMAwu61UikiAif4y4Wc/o7nUyK6gIA9C5b1z4E=;
        b=hwNq4kHUFQI6x1rTaOwo96kkZ2B16Y4NVMhPNfED99XptiI2gLElqTNZSetDJhYL7j
         se+vhpRsznvDKqPwEDTSBOev5w6P9KB+DoeSXRt5I3UeDaGQoTu3Tj7PuMSqi/AiMIyX
         g70+8ctk9ibLGmC3cR8W63408Hmnp2wMf3Xf7GDow/Qk8VQNqHBAn4qVtelUOvpDUpRn
         enwIm/67mROe6whUe+JdAtH0khSXiVNSE/xS8M9H25JvgLnoujm5Ryc/O1dYTvqn9vbe
         IWWdCaurX+Pct+xHyJKyWQydO5offhVXv6sKm/DmEdgVceWs/eh6E5YV+SsJ5XDj9AW/
         Eqfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688690523; x=1691282523;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NCyACxMAwu61UikiAif4y4Wc/o7nUyK6gIA9C5b1z4E=;
        b=Pz/PDaxg+z3giaD4R2v2VzCYScCRPgkCGTCpPHfBRwQs1YqPYhARoobfTv3DwjKX08
         Q7D8GW+lzmx3pFxxK88b3VO9TyWbC2dvcHQZXjPWx85jXQbtVCMTrAPHMqBFjMvm/hJj
         Cev+mp5fQ4PA5QidNUgiKCSUHyEtHvhfb7S60e7xsoe4mbsjnlTV9XazX+doymwjfmE9
         2jYfZH7ibcX4QVA3PfOOBbB0Yhr2MGaXTSWIVvYtZaC3korDl8B+Is4oMkMpNCXvjW3Q
         Ccf8hi7lQzcFJvsATs10SeGdtjJvTs3NLscn/adbtNDfwi92MlDfpvWX5yIAvSWGSdtO
         Lsxw==
X-Gm-Message-State: ABy/qLaQ0Fj0YRncqTiX2teU3RKOHX7eyocKJMYdONjR9Y68Z8p5L7zE
	EUP1+f+7OnJZ7gYPzqYDfvAhDA==
X-Google-Smtp-Source: APBJJlH5srUuDgu+mX6fEyDEJnUWImMyBSSXnJ0UNtJRcpgynXXRTgag+BoqCLRFTXTJiNOWECKXmg==
X-Received: by 2002:a17:902:db11:b0:1b8:ac40:35ed with SMTP id m17-20020a170902db1100b001b8ac4035edmr118524plx.24.1688690522629;
        Thu, 06 Jul 2023 17:42:02 -0700 (PDT)
Received: from google.com ([2620:15c:2d:3:634a:24d:a19f:a90f])
        by smtp.gmail.com with ESMTPSA id i6-20020a170902c94600b001b80760fd04sm1966581pla.112.2023.07.06.17.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 17:42:02 -0700 (PDT)
Date: Thu, 6 Jul 2023 17:41:57 -0700
From: Isaac Manjarres <isaacmanjarres@google.com>
To: Amit Pundir <amit.pundir@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>, Robin Murphy <robin.murphy@arm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Ard Biesheuvel <ardb@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Alasdair Kergon <agk@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
	Joerg Roedel <joro@8bytes.org>, Mark Brown <broonie@kernel.org>,
	Mike Snitzer <snitzer@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>, linux-mm@kvack.org,
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Re: [PATCH v7 00/17] mm, dma, arm64: Reduce ARCH_KMALLOC_MINALIGN to
 8
Message-ID: <ZKdfVSzbgOonR17A@google.com>
References: <20230612153201.554742-1-catalin.marinas@arm.com>
 <CAMi1Hd04mu6JojT3y6wyN2YeVkPR5R3qnkKJ8iR8if_YByCn4w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMi1Hd04mu6JojT3y6wyN2YeVkPR5R3qnkKJ8iR8if_YByCn4w@mail.gmail.com>

On Wed, Jul 05, 2023 at 07:10:02PM +0530, Amit Pundir wrote:
> Hi Catalin,
> 
> On Wed, 5 Jul 2023 at 18:17, Catalin Marinas <catalin.marinas@arm.com> wrote:
> >
> > Hi,
> >
> > That's v7 of the series reducing the kmalloc() minimum alignment on
> > arm64 to 8 (from 128). There's no new/different functionality, mostly
> > cosmetic changes and acks/tested-bys.
> >
> > Andrew, if there are no further comments or objections to this version,
> > are you ok to take the series through the mm tree? The arm64 changes are
> > fairly small. Alternatively, I can push it into linux-next now to give
> > it some wider exposure and decide whether to upstream it when the
> > merging window opens. Thanks.
> 
> This patch series broke Dragonboard 845c (SDM845) running AOSP.
> With this series I run into random oops at __kmem_cache_alloc_node().
> Here is one such boot log https://bugs.linaro.org/attachment.cgi?id=1146

Hey Amit,

From the log that you linked, this looks like there's corruption within
the kmalloc slab caches. Can you please try enabling slub debug? That
might give us more information about who is causing the corruption
you're seeing here.

To enable slub debug, you can add the following to your kernel config:

CONFIG_SLUB_DEBUG=y

and CONFIG_SLUB_DEBUG_ON=y or add slub_debug to the kernel command line.

--Isaac
