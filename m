Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F62411C9F
	for <regressions@lists.linux.dev>; Thu, 26 Oct 2023 13:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OM528WhC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68744C433C7;
	Thu, 26 Oct 2023 13:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698325773;
	bh=vLtTWv/ZXAwWN12pv3/dVO7bz32AKqwKVCQQHN3iznY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OM528WhCh6iPSwzmv1DJU3ufjYkaUJzYCRb9aWQjrn+DmaMHFj7K1GfmfzlI8zNZj
	 ole1GaSiM0jekzEzL+Ag+5Trxex4iAJrXP6bx/6fX7h/h4fNqqWk1w2xz5WR7gWMWC
	 fgNBwdvpFmkFGOmUmNL9tqqDplWqlvpNChqX4UBdMajFm0P5/dymayeq8jW/4PLSXg
	 QlTTZEApOljM6o4fkGMjBL+sCayRlcBTLkMBoFOFmThx/NGNltYMnTHh0aIJ72muwf
	 Mxiyl2n0MtfnETdD150bGd7Xy7zlSTrwL7/VpvQ9aJF3mYr3UiFeUVpZVfdoISE/HE
	 4wsQnaRizbYow==
Date: Thu, 26 Oct 2023 09:09:31 -0400
From: Sasha Levin <sashal@kernel.org>
To: Steve French <smfrench@gmail.com>
Cc: Stable <stable@vger.kernel.org>, Paulo Alcantara <pc@manguebit.com>,
	ronnie sahlberg <ronniesahlberg@gmail.com>,
	Linux Regressions <regressions@lists.linux.dev>,
	"Dr. Bernd Feige" <bernd.feige@uniklinik-freiburg.de>,
	CIFS <linux-cifs@vger.kernel.org>
Subject: Re: Some additional cifs patches for 6.5 stable to address issue
 brought up by kernel regression tracker
Message-ID: <ZTplC1_qJYL1wR2G@sashalap>
References: <CAH2r5mvHUnxfOU1URs2s6O3As8WLyMEkK+KNdUy6Ct9u+=d5YA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAH2r5mvHUnxfOU1URs2s6O3As8WLyMEkK+KNdUy6Ct9u+=d5YA@mail.gmail.com>

On Mon, Oct 23, 2023 at 11:32:21PM -0500, Steve French wrote:
>There were a set of issues brought up in 6.5 by the introduction of
>the "laundromat" (which cleans up directory leases).  After discussion
>and testing with Paulo, Bernd Feige and others, we request that the
>following set also be included to address these problems.  They are
>all in mainline (added in 6.6) and the patches (from mainline since
>they apply cleanly) are also attached.
>
>        238b351d0935 ("smb3: allow controlling length of time
>directory entries are cached with dir leases")
>        6a50d71d0fff ("smb3: allow controlling maximum number of
>cached directories")
>        2da338ff752a ("smb3: do not start laundromat thread when dir
>leases  disabled")
>        3b8bb3171571 ("smb: client: do not start laundromat thread on
>nohandlecache")
>        e95f3f744650 ("smb: client: make laundromat a delayed worker")
>        81ba10959970 ("smb: client: prevent new fids from being
>removed by laundromat")

Queued up, thanks!

-- 
Thanks,
Sasha
