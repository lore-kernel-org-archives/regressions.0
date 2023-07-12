Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283FB1F959
	for <regressions@lists.linux.dev>; Wed, 12 Jul 2023 11:02:20 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qJXbu-0004z8-Nx; Wed, 12 Jul 2023 13:02:18 +0200
Message-ID: <1d611dbb-8aee-9a6e-701c-6498f1b51c34@leemhuis.info>
Date: Wed, 12 Jul 2023 13:02:18 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Re: Scrub of my nvme SSD has slowed by about 2/3
Content-Language: en-US, de-DE
To: Tim Cuthbertson <ratcheer@gmail.com>, linux-btrfs@vger.kernel.org
References: <CAAKzf7=yS9vnf5zNid1CyvN19wyAgPz5o9sJP0vBqN6LReqXVg@mail.gmail.com>
From: "Linux regression tracking #adding (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Cc: Linux kernel regressions list <regressions@lists.linux.dev>
In-Reply-To: <CAAKzf7=yS9vnf5zNid1CyvN19wyAgPz5o9sJP0vBqN6LReqXVg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1689159741;a8446381;
X-HE-SMSGID: 1qJXbu-0004z8-Nx

[CCing the regression list, as it should be in the loop for regressions:
https://docs.kernel.org/admin-guide/reporting-regressions.html]

[TLDR: I'm adding this report to the list of tracked Linux kernel
regressions; the text you find below is based on a few templates
paragraphs you might have encountered already in similar form.
See link in footer if these mails annoy you.]

On 03.07.23 22:19, Tim Cuthbertson wrote:
> Yesterday, I noticed that a scrub of my main system filesystem has
> slowed from about 2.9 gb/sec to about 949 mb/sec. My scrub used to run
> in about 12 seconds, now it is taking 51 seconds. I had just installed
> Linux kernel 6.4.1 on Arch Linux, upgrading from 6.3.9. At first I
> suspected the new kernel, but now I am not so sure.

Thanks for the report. It seems it will take some work to address this,
so to be sure the issue doesn't fall through the cracks unnoticed, I'm
adding it to regzbot, the Linux kernel regression tracking bot:

#regzbot ^introduced e02ee89baa66
#regzbot title btrfs: scrub nvme SSD has slowed by about 2/3 due to csum
#regzbot monitor:
https://lore.kernel.org/all/6c1ffe48e93fee9aa975ecc22dc2e7a1f3d7a0de.1688539673.git.wqu@suse.com/
#regzbot ignore-activity

This isn't a regression? This issue or a fix for it are already
discussed somewhere else? It was fixed already? You want to clarify when
the regression started to happen? Or point out I got the title or
something else totally wrong? Then just reply and tell me -- ideally
while also telling regzbot about it, as explained by the page listed in
the footer of this mail.

Developers: When fixing the issue, remember to add 'Link:' tags pointing
to the report (the parent of this mail). See page linked in footer for
details.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
