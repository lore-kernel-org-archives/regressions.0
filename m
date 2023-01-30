Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD6636E
	for <regressions@lists.linux.dev>; Mon, 30 Jan 2023 05:40:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC8B5C433EF;
	Mon, 30 Jan 2023 05:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1675057202;
	bh=Gj3CoWpxMRs986P27Jmp/+SlgrHYUEsIRBz84LyFW4Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VmmaklQUms+MCNtp/BKJUneaEQIq4p80mYC1xSXL6c32OECg5fpVIeYF9WUwDYI3u
	 VNNmpS5V/JYwhSwEcjI43JzcPuXRVQTApRrPqLwd+6YuZb8PWUYYOhpfTHai7LrPZc
	 2KN9dQ8V40G3O5fFzgOn9iUh6UsdykZ1LoiBjv/Q=
Date: Mon, 30 Jan 2023 06:39:59 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Sasha Levin <sashal@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>
Subject: Re: Heads-up: one change merged for -rc6 that might be good to have
 in the next 6.1.y release
Message-ID: <Y9dYL2/Ynahsc+Qu@kroah.com>
References: <73f7aba7-1533-ed16-fc76-97a758aaaf1d@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <73f7aba7-1533-ed16-fc76-97a758aaaf1d@leemhuis.info>

On Sun, Jan 29, 2023 at 10:13:25PM +0100, Linux kernel regression tracking (Thorsten Leemhuis) wrote:
> Hi Greg. Just a heads up that likely isn't needed, as the change
> mentioned below has a proper Cc: <stable@...> tag, so you scripts will
> likely do the right thing automatically. But just to be sure:
> 
> I'm pretty sure Vlastimil would be extremely happy if you include
> 95e7a450b819 ("Revert "mm/compaction: fix set skip in
> fast_find_migrateblock"") [was merged ~2 hours ago] in the next 6.1.y
> release, as he in [1] wrote:

Thanks, yeah, it would have automatically gotten added, but I picked it
up now just to be sure it's not lost in the deluge :)

thanks,

greg k-h
