Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81613629
	for <regressions@lists.linux.dev>; Mon, 23 May 2022 09:28:35 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nt4MF-0007Ub-GJ; Mon, 23 May 2022 11:28:11 +0200
Message-ID: <bc69ee03-1a74-c15d-ec94-da3b987ab8b1@leemhuis.info>
Date: Mon, 23 May 2022 11:28:08 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Stefan Wahren <stefan.wahren@i2se.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Nicolas Saenz Julienne <nsaenzju@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>, Minchan Kim <minchan@kernel.org>,
 Matthew Wilcox <willy@infradead.org>,
 Mel Gorman <mgorman@techsingularity.net>, Juri Lelli
 <juri.lelli@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 "Paul E. McKenney" <paulmck@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Phil Elwell <phil@raspberrypi.com>, regressions@lists.linux.dev
References: <77d6d498-7dd9-03eb-60f2-d7e682bb1b20@i2se.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: vchiq: Performance regression since 5.18-rc1
In-Reply-To: <77d6d498-7dd9-03eb-60f2-d7e682bb1b20@i2se.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1653298115;efadc79d;
X-HE-SMSGID: 1nt4MF-0007Ub-GJ

[TLDR: I'm adding this regression report to the list of tracked
regressions; all text from me you find below is based on a few templates
paragraphs you might have encountered already already in similar form.]

Hi, this is your Linux kernel regression tracker.

On 22.05.22 01:22, Stefan Wahren wrote:
> 
> while testing the staging/vc04_services/interface/vchiq_arm driver with
> my Raspberry Pi 3 B+ (multi_v7_defconfig) i noticed a huge performance
> regression since [ff042f4a9b050895a42cae893cc01fa2ca81b95c] mm:
> lru_cache_disable: replace work queue synchronization with synchronize_rcu
> 
> Usually i run "vchiq_test -f 1" to see the driver is still working [1].
> 
> Before commit:
> 
> real    0m1,500s
> user    0m0,068s
> sys    0m0,846s
> 
> After commit:
> 
> real    7m11,449s
> user    0m2,049s
> sys    0m0,023s

Thanks for the report.

To be sure below issue doesn't fall through the cracks unnoticed, I'm
adding it to regzbot, my Linux kernel regression tracking bot:

#regzbot ^introduced ff042f4a9b050895a42cae893cc01fa2ca81b95
#regzbot title mm: chiq_test runs 7 minutes instead of ~ 1 second.
#regzbot ignore-activity

This isn't a regression? This issue or a fix for it are already
discussed somewhere else? It was fixed already? You want to clarify when
the regression started to happen? Or point out I got the title or
something else totally wrong? Then just reply -- ideally with also
telling regzbot about it, as explained here:
https://linux-regtracking.leemhuis.info/tracked-regression/

Reminder for developers: When fixing the issue, add 'Link:' tags
pointing to the report (the mail this one replied to), as the kernel's
documentation call for; above page explains why this is important for
tracked regressions.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.
