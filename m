Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029DB1C33
	for <regressions@lists.linux.dev>; Wed, 23 Nov 2022 09:56:56 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1oxmUr-0006vt-82; Wed, 23 Nov 2022 10:56:49 +0100
Message-ID: <91cafa86-804c-94e6-31ac-7c41d8cf60f8@leemhuis.info>
Date: Wed, 23 Nov 2022 10:56:48 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [syzbot] possible deadlock in jbd2_journal_lock_updates
 #forregzbot
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Cc: linux-ext4@vger.kernel.org
References: <c77bf00f-4618-7149-56f1-b8d1664b9d07@linux.microsoft.com>
 <17a07226-722f-d98f-3641-0c1c768c3a46@leemhuis.info>
In-Reply-To: <17a07226-722f-d98f-3641-0c1c768c3a46@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1669197417;2522f562;
X-HE-SMSGID: 1oxmUr-0006vt-82

[Note: this mail is primarily send for documentation purposes and/or for
regzbot, my Linux kernel regression tracking bot. That's why I removed
most or all folks from the list of recipients, but left any that looked
like a mailing lists. These mails usually contain '#forregzbot' in the
subject, to make them easy to spot and filter out.]

On 30.09.22 14:16, Thorsten Leemhuis wrote:

> #regzbot ^introduced 30dfb75e1f86454
> #regzbot title ext4: system hangs on  Flatcar Container Linux
> #regzbot ignore-activity

#regzbot introduced 6048c64b2609
