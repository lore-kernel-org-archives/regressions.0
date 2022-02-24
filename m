Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E257A
	for <regressions@lists.linux.dev>; Thu, 24 Feb 2022 16:22:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8E3DC340EC;
	Thu, 24 Feb 2022 16:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645719758;
	bh=6AQaEZoBxwC8P5SMcS4qxA+oPXeSFFhe6lK0QQyH+5s=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=jww66/64Qu0L+xMCF6MZCXI8XrWI/fo59hOLHVDpgYQKIBhm2uBNf/bjxkHe3xLAz
	 nA8Cg9z6DylS8z24BojPywd2j88zQeje6hxpBQjFVYSFcUz0ooR4d2aM5vPcvUX/1g
	 K093QGZVPUuJLovwTEZe/e6qdB9bw1F6SC+xlBEGS/1dV2mSQSQea78SL/VewebDz3
	 uz2dyyxvuM0fuiW+dlspweQfCOMr6K59kCRYc073s5x1bRdPB3bMfZYkR9w1CUMg7M
	 YUFIw4ugWuXaVpFHqB+sOptLOsAXvKINvQQksN5jtyUCOquDBKu355w43HRM4Mmp37
	 JXtG27frgSBlw==
From: Kalle Valo <kvalo@kernel.org>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Nuno Oliveira <nuno@eq.uc.pt>,  Sebastian Bachmann <hello@reox.at>,  wgong@codeaurora.org,  ath10k@lists.infradead.org,  "regressions\@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: Compex WLE200NX: regdomain sanitized regression
References: <1c160dfb-6ccc-b4d6-76f6-4364e0adb6dd@reox.at>
	<YaIix40KaVlxT+XG@eq.uc.pt>
	<96b3682d-71b3-ada0-6fc7-686e51609968@leemhuis.info>
	<87v8zja7em.fsf@codeaurora.org> <YcDMGdpvINCX9VlX@eq.uc.pt>
	<625a51ed-8185-6fdb-bd7d-cfb0a913c7a4@leemhuis.info>
Date: Thu, 24 Feb 2022 18:22:29 +0200
In-Reply-To: <625a51ed-8185-6fdb-bd7d-cfb0a913c7a4@leemhuis.info> (Thorsten
	Leemhuis's message of "Fri, 18 Feb 2022 12:47:27 +0100")
Message-ID: <87v8x4tet6.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Thorsten Leemhuis <regressions@leemhuis.info> writes:

> Hi, this is your Linux kernel regression tracker speaking. Top-posting
> for once, to make this easy accessible to everyone.
>
> Kalle, thx for looking into this, I'm well aware this is kinda tricky.
> This is a gently reminder about the issue to ensure it doesn't fall
> through the cracks. At the same time I know that it's not urgent, that
> why I'm not putting it on backburner in regzbot now:
>
> #regzbot backburner: tricky situation and around for a while, hence not
> that urgent
> #regzbot poke
>
> I'll likely sent another gentle reminder after the next merge-window.

I now queued the revert to my pending branch:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=dfc438d224e4ad756b276d79e5771c45b523156d

Thorsten, can you please check that the Link tag is correct so that
regzbot can automatically detect the fix?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
