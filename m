Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DDFD7B
	for <regressions@lists.linux.dev>; Thu, 24 Feb 2022 16:38:19 +0000 (UTC)
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nNH87-0000rL-JG; Thu, 24 Feb 2022 17:38:11 +0100
Message-ID: <cf56111a-e6f6-249b-4953-25159420e99d@leemhuis.info>
Date: Thu, 24 Feb 2022 17:38:10 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Compex WLE200NX: regdomain sanitized regression
Content-Language: en-BS
To: Kalle Valo <kvalo@kernel.org>
Cc: Nuno Oliveira <nuno@eq.uc.pt>, Sebastian Bachmann <hello@reox.at>,
 wgong@codeaurora.org, ath10k@lists.infradead.org,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <1c160dfb-6ccc-b4d6-76f6-4364e0adb6dd@reox.at>
 <YaIix40KaVlxT+XG@eq.uc.pt>
 <96b3682d-71b3-ada0-6fc7-686e51609968@leemhuis.info>
 <87v8zja7em.fsf@codeaurora.org> <YcDMGdpvINCX9VlX@eq.uc.pt>
 <625a51ed-8185-6fdb-bd7d-cfb0a913c7a4@leemhuis.info>
 <87v8x4tet6.fsf@kernel.org>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <87v8x4tet6.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1645720699;a9734271;
X-HE-SMSGID: 1nNH87-0000rL-JG

On 24.02.22 17:22, Kalle Valo wrote:
> Thorsten Leemhuis <regressions@leemhuis.info> writes:
> 
>> Hi, this is your Linux kernel regression tracker speaking. Top-posting
>> for once, to make this easy accessible to everyone.
>>
>> Kalle, thx for looking into this, I'm well aware this is kinda tricky.
>> This is a gently reminder about the issue to ensure it doesn't fall
>> through the cracks. At the same time I know that it's not urgent, that
>> why I'm not putting it on backburner in regzbot now:
>>
>> #regzbot backburner: tricky situation and around for a while, hence not
>> that urgent
>> #regzbot poke
>>
>> I'll likely sent another gentle reminder after the next merge-window.
> 
> I now queued the revert to my pending branch:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=dfc438d224e4ad756b276d79e5771c45b523156d

Ohh, great, many thx!

> Thorsten, can you please check that the Link tag is correct so that
> regzbot can automatically detect the fix?

Yeah, it will, thx to the "Link:
https://lore.kernel.org/all/1c160dfb-6ccc-b4d6-76f6-4364e0adb6dd@reox.at/".

The kernel's docs say the redirector should be used in such cases (so
"/r/" instead of "/all/"), but regzbot doesn't care about it -- and I
wonder if that detail is actually important anyway now that we have
lore.kernel.org/all/.

Ciao, Thorsten
