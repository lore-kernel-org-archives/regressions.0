Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14682CA1
	for <regressions@lists.linux.dev>; Mon, 10 Jan 2022 13:15:13 +0000 (UTC)
Received: from ip4d173d02.dynamic.kabel-deutschland.de ([77.23.61.2] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1n6uVy-00083O-HA; Mon, 10 Jan 2022 14:15:10 +0100
Message-ID: <0408cc8b-c67f-ea28-8e82-8a7de57089ff@leemhuis.info>
Date: Mon, 10 Jan 2022 14:15:10 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: Observation of a memory leak with commit 314001f0bf92 ("af_unix:
 Add OOB support") #forregzbot
Content-Language: en-BS
References: <CAKXUXMzZkQvHJ35nwVhcJe+DrtEXGw+eKGVD04=xRJkVUC2sPA@mail.gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
In-Reply-To: <CAKXUXMzZkQvHJ35nwVhcJe+DrtEXGw+eKGVD04=xRJkVUC2sPA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1641820513;6c128eb8;
X-HE-SMSGID: 1n6uVy-00083O-HA

On 07.01.22 07:48, Lukas Bulwahn wrote:
> Dear Rao and David,
> 
> 
> In our syzkaller instance running on linux-next,
> https://elisa-builder-00.iol.unh.edu/syzkaller-next/, we have been
> observing a memory leak in prepare_creds,
> https://elisa-builder-00.iol.unh.edu/syzkaller-next/report?id=1dcac8539d69ad9eb94ab2c8c0d99c11a0b516a3,
> for quite some time.
> 
> It is reproducible on v5.15-rc1, v5.15, v5.16-rc8 and next-20220104.
> So, it is in mainline, was released and has not been fixed in
> linux-next yet.
> 
> As syzkaller also provides a reproducer, we bisected this memory leak
> to be introduced with  commit 314001f0bf92 ("af_unix: Add OOB
> support").
> 
> We also tested that reverting this commit on torvalds' current tree
> made the memory leak with the reproducer go away.
> 
> Could you please have a look how your commit introduces this memory
> leak? We will gladly support testing your fix in case help is needed.

#regzbot ^introduced: 314001f0bf92

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.
