Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F872C844
	for <regressions@lists.linux.dev>; Tue, 24 Oct 2023 14:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qvIF3-0006SC-6t; Tue, 24 Oct 2023 16:18:45 +0200
Message-ID: <f21c7064-dac1-4667-96c6-0d85368300ca@leemhuis.info>
Date: Tue, 24 Oct 2023 16:18:44 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fwd: Memleaks in offset_ctx->xa (shmem)
Content-Language: en-US, de-DE
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Linux Filesystem Development <linux-fsdevel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>
Cc: Chuck Lever <chuck.lever@oracle.com>,
 Christian Brauner <brauner@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>, vladbu@nvidia.com
References: <429b452c-2211-436a-9af7-21332f68db7d@gmail.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <429b452c-2211-436a-9af7-21332f68db7d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1698157128;e906a0cb;
X-HE-SMSGID: 1qvIF3-0006SC-6t

On 24.10.23 09:55, Bagas Sanjaya wrote:
> 
> I notice a regression report on Bugzilla [1]. Quoting from it:
> 
>> We have been getting memleaks in offset_ctx->xa in our networking tests:
>>
>> unreferenced object 0xffff8881004cd080 (size 576):
> [...]
> #regzbot introduced: 6faddda69f623d https://bugzilla.kernel.org/show_bug.cgi?id=218039
> #regzbot title: stable offsets directory operation support triggers offset_ctx->xa memory leak

Thx for adding this to regzbot.

Bagas, FWIW, before doing so you in the future might want to search lore
for an abbreviated commit-id with a wildcard (e.g.
https://lore.kernel.org/all/?q=6faddda6* ) and the bugzilla url (e.g.
https://lore.kernel.org/all/?q=https%3A%2F%2Fbugzilla.kernel.org%2Fshow_bug.cgi%3Fid%3D218039).
Because then in this case you would have noticed that this was already
discussed on the lists and Chuck asked to bring it to bugzilla for
further tracking, so forwarding this likely was not worth it:
https://lore.kernel.org/all/87ttqhq0i7.fsf@nvidia.com/

OTOH I wonder if what Chuck asked for was wise: '''Looks like "Memory
Management / Other" is appropriate for shmem, and Hugh or Andrew can
re-assign ownership to me.'''

Not sure if Hugh or Andrew actually do anything like that. I doubt that,
but maybe I'm wrong. Ahh, the joys of our bugzilla instance that many
core developers avoid... (FWIW, I don't blame anyone for that, I
understand why it's like that; but it complicated things...).

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

P.S., FWIW:

#regzbot monitor: https://lore.kernel.org/all/87y1g9xjre.fsf@nvidia.com/
