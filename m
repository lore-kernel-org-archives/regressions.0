Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C641110
	for <regressions@lists.linux.dev>; Tue,  1 Aug 2023 08:27:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18D49C433C8;
	Tue,  1 Aug 2023 08:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690878458;
	bh=KzvQJSYl9zliORTATgBPPvvWaET21XrF4cyjVIv9/XI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FZv0LIEbh+eOtxTtda3mi1G/HakIbe4Ec/6Cnmn9LUdCI9FrOiksmCTzlNNxzlBT4
	 MIXgNCSE3fyG7gBR5M5LOaV2UqtKnz2wytJDF/fHQqQV/hNxSLBaWToD6oTaw1NMRd
	 +SIbBEMPRFEKmu2jycm5AbpsPeS4ZHVtztmmGOXbgoPPsZ80Dgj7wWuwDRLsUK0Z4l
	 lFcVJoEbOn89u6D2oojaW5lWSBCHM+w3WZkqKSPCPB7Dl4f5cJ6OqhZ+35nM4vJ78G
	 vP5U4ShZUHWBxh+G6+anK9+8wSAY23SydlfQLmHlgbScPb2Uawy59U4JhVgpda0KI/
	 7+X51JArLXGog==
Date: Tue, 1 Aug 2023 09:27:31 +0100
From: Will Deacon <will@kernel.org>
To: Lorenzo Stoakes <lstoakes@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>, Uladzislau Rezki <urezki@gmail.com>,
	linux-fsdevel@vger.kernel.org, Jiri Olsa <olsajiri@gmail.com>,
	Mike Galbraith <efault@gmx.de>, Mark Rutland <mark.rutland@arm.com>,
	wangkefeng.wang@huawei.com, catalin.marinas@arm.com,
	ardb@kernel.org, David Hildenbrand <david@redhat.com>,
	Linux regression tracking <regressions@leemhuis.info>,
	regressions@lists.linux.dev, Matthew Wilcox <willy@infradead.org>,
	Liu Shixin <liushixin2@huawei.com>, Jens Axboe <axboe@kernel.dk>,
	Alexander Viro <viro@zeniv.linux.org.uk>, stable@vger.kernel.org
Subject: Re: [PATCH] fs/proc/kcore: reinstate bounce buffer for KCORE_TEXT
 regions
Message-ID: <20230801082729.GA26036@willie-the-truck>
References: <20230731215021.70911-1-lstoakes@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230731215021.70911-1-lstoakes@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Mon, Jul 31, 2023 at 10:50:21PM +0100, Lorenzo Stoakes wrote:
> Some architectures do not populate the entire range categorised by
> KCORE_TEXT, so we must ensure that the kernel address we read from is
> valid.
> 
> Unfortunately there is no solution currently available to do so with a
> purely iterator solution so reinstate the bounce buffer in this instance so
> we can use copy_from_kernel_nofault() in order to avoid page faults when
> regions are unmapped.
> 
> This change partly reverts commit 2e1c0170771e ("fs/proc/kcore: avoid
> bounce buffer for ktext data"), reinstating the bounce buffer, but adapts
> the code to continue to use an iterator.
> 
> Fixes: 2e1c0170771e ("fs/proc/kcore: avoid bounce buffer for ktext data")
> Reported-by: Jiri Olsa <olsajiri@gmail.com>
> Closes: https://lore.kernel.org/all/ZHc2fm+9daF6cgCE@krava
> Cc: stable@vger.kernel.org
> Signed-off-by: Lorenzo Stoakes <lstoakes@gmail.com>
> ---
>  fs/proc/kcore.c | 26 +++++++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)

Tested-by: Will Deacon <will@kernel.org>

I can confirm this fixes the arm64 issue reported by Mike over at [1].

Cheers,

Will

[1] https://lore.kernel.org/r/b39c62d29a431b023e98959578ba87e96af0e030.camel@gmx.de
