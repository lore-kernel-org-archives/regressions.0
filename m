Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DAAD7B
	for <regressions@lists.linux.dev>; Thu, 24 Feb 2022 16:47:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9109DC340EC;
	Thu, 24 Feb 2022 16:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645721231;
	bh=Ab1OqpFWZ22F+Co/hGidh+bqVRWoY4xR7TvjsBDMQ+8=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=raD1Vy218Z6fD2byNsIqkjWt4cJ3Agnqna1o8X20KScSmCGAN2Kh//QhSjdKEarhN
	 mFJmja3mABLVJCcwLukkGoN3jD8BhZqAeRSu+RP+4cEb0WFhd6+Sjtdkq+TQ7rWmav
	 tfZi6ZW1Q9diAGp49N/tl2NO7HN5hmTC1WPtP0jrr4STg0cwycDA2SABJO08A6kB6o
	 fNFt0QkANFra051U8qBiKmn0RtN2dx3fi0v3LV1BaJrUEdEkgXhpzH0IRRi857Ujdw
	 zGYhxeaL5NRHqrAL5n/9eCiVF7GbDkMA8VRqDJX3b4Sqy9JCksCCrLOAqiQjo3bsaS
	 Wr227dQfbt8Yg==
From: Kalle Valo <kvalo@kernel.org>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Nuno Oliveira <nuno@eq.uc.pt>,  Sebastian Bachmann <hello@reox.at>,  wgong@codeaurora.org,  ath10k@lists.infradead.org,  "regressions\@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: Compex WLE200NX: regdomain sanitized regression
References: <1c160dfb-6ccc-b4d6-76f6-4364e0adb6dd@reox.at>
	<YaIix40KaVlxT+XG@eq.uc.pt>
	<96b3682d-71b3-ada0-6fc7-686e51609968@leemhuis.info>
	<87v8zja7em.fsf@codeaurora.org> <YcDMGdpvINCX9VlX@eq.uc.pt>
	<625a51ed-8185-6fdb-bd7d-cfb0a913c7a4@leemhuis.info>
	<87v8x4tet6.fsf@kernel.org>
	<cf56111a-e6f6-249b-4953-25159420e99d@leemhuis.info>
Date: Thu, 24 Feb 2022 18:47:08 +0200
In-Reply-To: <cf56111a-e6f6-249b-4953-25159420e99d@leemhuis.info> (Thorsten
	Leemhuis's message of "Thu, 24 Feb 2022 17:38:10 +0100")
Message-ID: <87k0dktdo3.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Thorsten Leemhuis <regressions@leemhuis.info> writes:

> On 24.02.22 17:22, Kalle Valo wrote:
>> Thorsten Leemhuis <regressions@leemhuis.info> writes:
>> 
>>> Hi, this is your Linux kernel regression tracker speaking. Top-posting
>>> for once, to make this easy accessible to everyone.
>>>
>>> Kalle, thx for looking into this, I'm well aware this is kinda tricky.
>>> This is a gently reminder about the issue to ensure it doesn't fall
>>> through the cracks. At the same time I know that it's not urgent, that
>>> why I'm not putting it on backburner in regzbot now:
>>>
>>> #regzbot backburner: tricky situation and around for a while, hence not
>>> that urgent
>>> #regzbot poke
>>>
>>> I'll likely sent another gentle reminder after the next merge-window.
>> 
>> I now queued the revert to my pending branch:
>> 
>> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=dfc438d224e4ad756b276d79e5771c45b523156d
>
> Ohh, great, many thx!
>
>> Thorsten, can you please check that the Link tag is correct so that
>> regzbot can automatically detect the fix?
>
> Yeah, it will, thx to the "Link:
> https://lore.kernel.org/all/1c160dfb-6ccc-b4d6-76f6-4364e0adb6dd@reox.at/".

Great, thanks for checking.

> The kernel's docs say the redirector should be used in such cases (so
> "/r/" instead of "/all/"), but regzbot doesn't care about it -- and I
> wonder if that detail is actually important anyway now that we have
> lore.kernel.org/all/.

Funny that you ask, I was just few minutes ago updating my emacs
function which creates the lore link and was wondering the same. It
looks like '/r/' redirects to '/all/', so I guess we should use the
latter now:

$ curl --head https://lore.kernel.org/r/1c160dfb-6ccc-b4d6-76f6-4364e0adb6dd@reox.at/
HTTP/1.1 302 Found
Server: nginx
Date: Thu, 24 Feb 2022 16:43:32 GMT
Content-Type: text/plain
Connection: keep-alive
Location: https://lore.kernel.org/all/1c160dfb-6ccc-b4d6-76f6-4364e0adb6dd@reox.at/

But yeah, it shouldn't matter as hopefully all sane tools can handle
both.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
