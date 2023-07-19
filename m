Received: from mail.lichtvoll.de (luna.lichtvoll.de [194.150.191.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BCFE3D8B
	for <regressions@lists.linux.dev>; Wed, 19 Jul 2023 06:52:51 +0000 (UTC)
Received: from 127.0.0.1 (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
	(No client certificate requested)
	by mail.lichtvoll.de (Postfix) with ESMTPSA id D86EF7478E3;
	Wed, 19 Jul 2023 08:42:58 +0200 (CEST)
Authentication-Results: mail.lichtvoll.de;
	auth=pass smtp.auth=martin smtp.mailfrom=martin@lichtvoll.de
From: Martin Steigerwald <martin@lichtvoll.de>
To: Tim Cuthbertson <ratcheer@gmail.com>, linux-btrfs@vger.kernel.org,
 Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: Scrub of my nvme SSD has slowed by about 2/3
Date: Wed, 19 Jul 2023 08:42:58 +0200
Message-ID: <3526703.iIbC2pHGDl@lichtvoll.de>
In-Reply-To: <1d611dbb-8aee-9a6e-701c-6498f1b51c34@leemhuis.info>
References:
 <CAAKzf7=yS9vnf5zNid1CyvN19wyAgPz5o9sJP0vBqN6LReqXVg@mail.gmail.com>
 <1d611dbb-8aee-9a6e-701c-6498f1b51c34@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Thorsten.

#regzbot monitor: https://lore.kernel.org/linux-btrfs/cover.1689744163.git.wqu@suse.com/

I hope that does it.

Above links to a patch of Qu about asking for other ideas to fix the
regression. It however has been superseded by a later patch of him.

So feel free to drop this.

Best,
Martin

Linux regression tracking #adding (Thorsten Leemhuis) - 12.07.23, 13:02:18 CEST:
> [CCing the regression list, as it should be in the loop for
> regressions:
> https://docs.kernel.org/admin-guide/reporting-regressions.html]
> 
> [TLDR: I'm adding this report to the list of tracked Linux kernel
> regressions; the text you find below is based on a few templates
> paragraphs you might have encountered already in similar form.
> See link in footer if these mails annoy you.]
> 
> On 03.07.23 22:19, Tim Cuthbertson wrote:
> > Yesterday, I noticed that a scrub of my main system filesystem has
> > slowed from about 2.9 gb/sec to about 949 mb/sec. My scrub used to
> > run in about 12 seconds, now it is taking 51 seconds. I had just
> > installed Linux kernel 6.4.1 on Arch Linux, upgrading from 6.3.9.
> > At first I suspected the new kernel, but now I am not so sure.
> 
> Thanks for the report. It seems it will take some work to address
> this, so to be sure the issue doesn't fall through the cracks
> unnoticed, I'm adding it to regzbot, the Linux kernel regression
> tracking bot:
> 
> #regzbot ^introduced e02ee89baa66
> #regzbot title btrfs: scrub nvme SSD has slowed by about 2/3 due to
> csum #regzbot monitor:
> https://lore.kernel.org/all/6c1ffe48e93fee9aa975ecc22dc2e7a1f3d7a0de.1
> 688539673.git.wqu@suse.com/ #regzbot ignore-activity
> 
> This isn't a regression? This issue or a fix for it are already
> discussed somewhere else? It was fixed already? You want to clarify
> when the regression started to happen? Or point out I got the title
> or something else totally wrong? Then just reply and tell me --
> ideally while also telling regzbot about it, as explained by the page
> listed in the footer of this mail.
> 
> Developers: When fixing the issue, remember to add 'Link:' tags
> pointing to the report (the parent of this mail). See page linked in
> footer for details.
> 
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker'
> hat) --
> Everything you wanna know about Linux kernel regression tracking:
> https://linux-regtracking.leemhuis.info/about/#tldr
> That page also explains what to do if mails like this annoy you.


-- 
Martin


