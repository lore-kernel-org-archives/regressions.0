Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04903EBD
	for <regressions@lists.linux.dev>; Tue, 23 Aug 2022 07:49:49 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1oQOfT-0004Ow-28; Tue, 23 Aug 2022 09:49:47 +0200
Message-ID: <19c01d05-4bcd-dd03-7104-a6075f037f7b@leemhuis.info>
Date: Tue, 23 Aug 2022 09:49:45 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <dd6844e7-f338-a4e9-2dad-0960e25b2ca1@redhat.com>
Content-Language: en-US
From: Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: 6.0-rc1 regression block (blk_mq) / RCU task stuck errors +
 block-io hang #forregzbot
In-Reply-To: <dd6844e7-f338-a4e9-2dad-0960e25b2ca1@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1661240990;6fc41977;
X-HE-SMSGID: 1oQOfT-0004Ow-28

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.

On 19.08.22 14:01, Hans de Goede wrote:
> Hi All,
> 
> I've been dogfooding 6.0-rc1 on my main workstation and I have hit
> this pretty serious bug, serious enough for me to go back to 5.19
> 
> My dmesg is showing various blk_mq (RCU?) related lockdep splats
> followed by some tasks getting stuck on disk-IO. E.g. "sync"
> is guaranteed to hang, but other tasks too.
> 
> This seems to be mainly the case on "sd" disks (both sata
> and USB) where as my main nvme drive seems fine, which has
> probably saved me from worse issues...
> 
> Here are 4 task stuck reports from my last boot, where
> I had to turn off the machine by keeping the power button
> pressed for 4 seconds.
> [...]
> 
> Sorry for not being able to write a better bug-report but I don't have
> the time to dive into this deeper. I hope this report is enough for
> someone to have a clue what is going on.

Just for the record:

#regzbot introduced: v5.19..v6.0-rc1
#regzbot dup-of:
https://lore.kernel.org/all/98592410-dd31-9081-86be-fda67d3b06d2@suse.cz/

Ciao, Thorsten
