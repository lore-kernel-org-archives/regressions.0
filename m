Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508F623A2
	for <regressions@lists.linux.dev>; Fri, 23 Dec 2022 08:08:35 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1p8d6Q-00066H-Et; Fri, 23 Dec 2022 09:08:26 +0100
Message-ID: <4563bddb-8c44-8d3f-93e3-a1433dc3af3f@leemhuis.info>
Date: Fri, 23 Dec 2022 09:08:25 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH for v6.1 regression] mm, mremap: fix mremap() expanding
 vma with addr inside vma #forregzbot
Content-Language: en-US, de-DE
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20221216163227.24648-1-vbabka@suse.cz>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <20221216163227.24648-1-vbabka@suse.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1671782915;a806733e;
X-HE-SMSGID: 1p8d6Q-00066H-Et

[Note: this mail contains only information for Linux kernel regression
tracking. Mails like these contain '#forregzbot' in the subject to make
then easy to spot and filter out. The author also tried to remove most
or all individuals from the list of recipients to spare them the hassle.]

On 16.12.22 17:32, Vlastimil Babka wrote:
> Since 6.1 we have noticed random rpm install failures that were tracked
> to mremap() returning -ENOMEM and to commit ca3d76b0aa80 ("mm: add
> merging after mremap resize").
> 
> The problem occurs when mremap() expands a VMA in place, but using an
> starting address that's not vma->vm_start, but somewhere in the middle.
> The extension_pgoff calculation introduced by the commit is wrong in
> that case, so vma_merge() fails due to pgoffs not being compatible.
> Fix the calculation.
> 
> By the way it seems that the situations, where rpm now expands a vma
> from the middle, were made possible also due to that commit, thanks to
> the improved vma merging. Yet it should work just fine, except for the
> buggy calculation.
> 
> Reported-by: Jiri Slaby <jirislaby@kernel.org>
> Link: https://bugzilla.suse.com/show_bug.cgi?id=1206359
> Fixes: ca3d76b0aa80 ("mm: add merging after mremap resize")

This is just for the record, the fix will soon land, but I want to have
this in the report I plan to send later.

#regzbot ^introduced ca3d76b0aa80
#regzbot from: Jiri Slaby <jirislaby@kernel.org>
#regzbot title mm: random rpm install failures that were tracked to
mremap() returning -ENOMEM
#regzbot fix mm, mremap: fix mremap() expanding vma with addr inside vma
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.
