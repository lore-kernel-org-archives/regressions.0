Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB54429B2
	for <regressions@lists.linux.dev>; Wed,  5 Apr 2023 13:07:54 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pk2rg-0001e1-LZ; Wed, 05 Apr 2023 15:07:52 +0200
Message-ID: <1334e2af-b55f-3bb2-6e1a-6ab0b0ef93f0@leemhuis.info>
Date: Wed, 5 Apr 2023 15:07:52 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Re: LMDB mdb_copy produces a corrupt database on btrfs, but not on
 ext4
Content-Language: en-US, de-DE
To: Btrfs BTRFS <linux-btrfs@vger.kernel.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <aa1fb69e-b613-47aa-a99e-a0a2c9ed273f@app.fastmail.com>
From: "Linux regression tracking #adding (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <aa1fb69e-b613-47aa-a99e-a0a2c9ed273f@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1680700074;87e9146c;
X-HE-SMSGID: 1pk2rg-0001e1-LZ

[TLDR: I'm adding this report to the list of tracked Linux kernel
regressions; the text you find below is based on a few templates
paragraphs you might have encountered already in similar form.
See link in footer if these mails annoy you.]

On 15.02.23 21:04, Chris Murphy wrote:
> Downstream bug report, reproducer test file, and gdb session transcript
> https://bugzilla.redhat.com/show_bug.cgi?id=2169947
> 
> I speculated that maybe it's similar to the issue we have with VM's when O_DIRECT is used, but it seems that's not the case here.

To properly track this, let me add this report as well to the tracking
(I already track another report not mentioned in the commit log of the
proposed fix: https://bugzilla.kernel.org/show_bug.cgi?id=217042 )

#regzbot ^introduced 51bd9563b678
#regzbot dup-of:
https://lore.kernel.org/all/efc853aa-0592-e43d-3ad1-c42d33f0ab6b@leemhuis.info/
#regzbot title btrfs: mdb_copy produces a corrupt database on btrfs
#regzbot monitor
https://lore.kernel.org/all/b7c72ffeb725c2a359965655df9827bdbeebfb4e.1679512207.git.boris@bur.io/
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
