Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C581F16B
	for <regressions@lists.linux.dev>; Fri, 22 Sep 2023 11:14:15 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qje6w-0008RG-6E; Fri, 22 Sep 2023 13:14:14 +0200
Message-ID: <d44b0746-2aa6-4608-ab22-bcb9efb27a26@leemhuis.info>
Date: Fri, 22 Sep 2023 13:14:13 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Re: [REGRESSION] Re: [PATCH 6.1 033/219] memcg: drop
 kmem.limit_in_bytes
Content-Language: en-US, de-DE
To: regressions@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
References: <20230917191040.964416434@linuxfoundation.org>
 <20230917191042.204185566@linuxfoundation.org>
 <20230920081101.GA12096@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
From: "Linux regression tracking #adding (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <20230920081101.GA12096@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1695381256;9f95c760;
X-HE-SMSGID: 1qje6w-0008RG-6E

[TLDR: I'm adding this report to the list of tracked Linux kernel
regressions; the text you find below is based on a few templates
paragraphs you might have encountered already in similar form.
See link in footer if these mails annoy you.]

On 20.09.23 10:11, Jeremi Piotrowski wrote:
> On Sun, Sep 17, 2023 at 09:12:40PM +0200, Greg Kroah-Hartman wrote:
>> 6.1-stable review patch.  If anyone has any objections, please let me know.
>>
>> ------------------
> 
> Hi Greg/Michal,
> 
> This commit breaks userspace which makes it a bad commit for mainline and an
> even worse commit for stable.
> 
> We ingested 6.1.54 into our nightly testing and found that runc fails to gather
> cgroup statistics (when reading kmem.limit_in_bytes). The same code is vendored
> into kubelet and kubelet fails to start if this operation fails. 6.1.53 is
> fine.
> 
>> Address this by wiping out the file completely and effectively get back to
>> pre 4.5 era and CONFIG_MEMCG_KMEM=n configuration.
> 
> On reads, the runc code checks for MEMCG_KMEM=n by checking
> kmem.usage_in_bytes. If it is present then runc expects the other cgroup files
> to be there (including kmem.limit_in_bytes). So this change is not effectively
> the same.
> 
> Here's a link to the PR that would be needed to handle this change in userspace
> (not merged yet and would need to be propagated through the ecosystem):
> 
> https://github.com/opencontainers/runc/pull/4018.

Thanks for the report. To be sure the issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
tracking bot:

#regzbot ^introduced 86327e8eb94c52
#regzbot title mm, memcg: runc fails to gather cgroup statistics
#regzbot fix: mm, memcg: reconsider kmem.limit_in_bytes deprecation
#regzbot ignore-activity

FWIW, the porposed fix can be found here:
https://lore.kernel.org/all/ZQwnUpX7FlzIOWXP@dhcp22.suse.cz/

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
