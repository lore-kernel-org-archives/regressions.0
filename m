Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1177A28F0
	for <regressions@lists.linux.dev>; Wed, 15 Feb 2023 14:49:59 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pSJ6b-0007K5-G7; Wed, 15 Feb 2023 15:49:57 +0100
Message-ID: <91b38494-f296-d01d-3b98-6bc51406cad0@leemhuis.info>
Date: Wed, 15 Feb 2023 15:49:56 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: PROBLEM: sparc64 random crashes starting w/ Linux 6.1
 (regression)
Content-Language: en-US, de-DE
To: Nick Bowler <nbowler@draconx.ca>, Peter Xu <peterx@redhat.com>
Cc: linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org,
 regressions@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>
References: <CADyTPExpEqaJiMGoV+Z6xVgL50ZoMJg49B10LcZ=8eg19u34BA@mail.gmail.com>
 <Y9bvwz4FIOQ+D8c4@x1n>
 <CADyTPEzsvdRC15+Z5T3oryofwRYqHmHzwqRmJKJoHB3d7Tdayw@mail.gmail.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <CADyTPEzsvdRC15+Z5T3oryofwRYqHmHzwqRmJKJoHB3d7Tdayw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1676472600;80a7d7c1;
X-HE-SMSGID: 1pSJ6b-0007K5-G7

On 31.01.23 02:46, Nick Bowler wrote:
> On 2023-01-29, Peter Xu <peterx@redhat.com> wrote:
>> On Sat, Jan 28, 2023 at 09:17:31PM -0500, Nick Bowler wrote:
>>> Starting with Linux 6.1.y, my sparc64 (Sun Ultra 60) system is very
>>> unstable, with userspace processes randomly crashing with all kinds of
>>> different weird errors.  The same problem occurs on 6.2-rc5.  Linux
>>> 6.0.y is OK.
> [...]
>> Could you try below patch to see whether it fixes your problem?  It should
>> cover the last piece of possible issue with dirty bit on sparc after that
>> patchset.  It's based on latest master branch (commit ab072681eabe1ce0).
> 
> Haven't seen any failures yet, so it seems this patch on top of 6.2-rc6
> makes things much better.
> 
> I'll keep running this for a while to see if any other problems come up.

Nick, I assume no other problems showed up?

In that case Peter could send the patch in for merging. Or did you do
that already?

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

#regzbot ignore-activity
