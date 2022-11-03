Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5FC6FC7
	for <regressions@lists.linux.dev>; Thu,  3 Nov 2022 12:54:08 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1oqZjR-0007WA-Ov; Thu, 03 Nov 2022 13:54:06 +0100
Message-ID: <2c6b195b-287c-c5de-8e22-72aed337af39@leemhuis.info>
Date: Thu, 3 Nov 2022 13:54:04 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [REGRESSION 6.0.x / 6.1.x] NULL dereferencing at tracing
 #forregzbot
Content-Language: en-US, de-DE
Cc: linux-kernel@vger.kernel.org
References: <87h6zklb6n.wl-tiwai@suse.de>
To: regressions@lists.linux.dev
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <87h6zklb6n.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1667480048;cde84bfd;
X-HE-SMSGID: 1oqZjR-0007WA-Ov

[Note: this mail is primarily send for documentation purposes and/or for
regzbot, my Linux kernel regression tracking bot. That's why I removed
most or all folks from the list of recipients, but left any that looked
like a mailing lists. These mails usually contain '#forregzbot' in the
subject, to make them easy to spot and filter out.]

On 31.10.22 08:11, Takashi Iwai wrote:
> 
> we've got a bug report indicating the NULL dereference at the recent
> tracing changes, showing at the start of KDE.  The details including
> the dmesg are found at:
>   https://bugzilla.opensuse.org/show_bug.cgi?id=1204705
> 
> It was reported at first for 6.0.3, and confirmed that the problem
> persists with 6.1-rc, too.
> 
> The culprit seems to be the commit
> f3ddb74ad0790030c9592229fb14d8c451f4e9a8
>     tracing: Wake up ring buffer waiters on closing of the file
> and reverting it seems fixing the problem.
> 
> Could you take a look?

Just adding this to the tracking:

#regzbot introduced f3ddb74ad07 ^
https://bugzilla.opensuse.org/show_bug.cgi?id=1204705
#regzbot title NULL dereferencing at tracing
#regzbot ignore-activity
#regzbot monitor:
https://lore.kernel.org/all/20221101191009.1e7378c8@rorschach.local.home/

Ciao, Thorsten
