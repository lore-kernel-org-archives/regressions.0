Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCAA12B72
	for <regressions@lists.linux.dev>; Fri, 28 Jul 2023 12:02:03 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qPMAM-0000xt-1A; Fri, 28 Jul 2023 14:01:54 +0200
Message-ID: <d3320f6f-0f31-4894-713b-821f6e1e48ec@leemhuis.info>
Date: Fri, 28 Jul 2023 14:01:52 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: two reports about NULL pointer dereferences in mm subsystem since
 5.18(?) with qbittorrent on XFS
Content-Language: en-US, de-DE
To: Matthew Wilcox <willy@infradead.org>,
 Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Linux-MM
 <linux-mm@kvack.org>, LKML <linux-kernel@vger.kernel.org>
References: <2e453cab-9049-98e5-1d96-2305fbb751ee@leemhuis.info>
 <ZMEzuqTOdT1EDApa@casper.infradead.org>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <ZMEzuqTOdT1EDApa@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1690545723;6ed89bb7;
X-HE-SMSGID: 1qPMAM-0000xt-1A

On 26.07.23 16:54, Matthew Wilcox wrote:
> On Wed, Jul 26, 2023 at 02:43:24PM +0200, Linux regression tracking (Thorsten Leemhuis) wrote:
>> Hi everyone! There are two regression reports with somewhat similar
>> symptoms in bugzilla.kernel.org that seem to not get the attention they
>> IMHO deserve.
> 
> I'm sorry you think this regression hasn't received the attention that
> it deserves.  I've spent weeks thinking about this problem

I know, but my last mails to prod things a few weeks ago iirc didn't
even get any reply, that's why I got impatient and started this thread
once it was confirmed the bug is not fixed. I pretty sure that's
expected in my position at this point; looking back at this now in
contrast to how Linus usually handles regressions I wonder if I should
have gotten impatient a bit earlier, as this caused trouble for a quite
a few users for quite a while already. But whatever, that's water under
the bridge now.

> and trying to track it down, with no success so far.

I saw your comments in the bugzilla ticket, so it seems you finally
found something that might cause the reported problems. Great & many thx
for that!

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.
