Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38899944A
	for <regressions@lists.linux.dev>; Thu, 15 Jun 2023 12:54:55 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1q9mUy-0007NP-Fd; Thu, 15 Jun 2023 14:54:48 +0200
Message-ID: <a9d02800-2cd6-a27b-7998-4c97cf2eb692@leemhuis.info>
Date: Thu, 15 Jun 2023 14:54:48 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [regression] STP on 80211s is broken in 6.4-rc4
Content-Language: en-US, de-DE
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Nicolas Escande <nico.escande@gmail.com>, nbd@nbd.name,
 =?UTF-8?Q?Toke_H=c3=b8iland-J=c3=b8rgensen?= <toke@toke.dk>,
 Kalle Valo <kvalo@kernel.org>, Johannes Berg <johannes.berg@intel.com>
Cc: linux-wireless@vger.kernel.org,
 Linux Regressions <regressions@lists.linux.dev>
References: <CT5GNZSK28AI.2K6M69OXM9RW5@syracuse> <ZIQbs0wqdRh7c0Kx@debian.me>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <ZIQbs0wqdRh7c0Kx@debian.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1686833695;a52346de;
X-HE-SMSGID: 1q9mUy-0007NP-Fd

On 10.06.23 08:44, Bagas Sanjaya wrote:
> On Tue, Jun 06, 2023 at 12:55:57PM +0200, Nicolas Escande wrote:
>> Hello Felix,
>>
>> As user of the mesh part of mac80211 on multiple products at work let me say
>> thank you for all the work you do on wifi, especially on 80211s, and especially
>> the recent improvements you made for mesh fast RX/TX & cross vendor AMSDU compat
>>
>> We upgraded our kernel from an older (5.15) to a newer 6.4. The problem is STP 
>> doesn't work anymore and alas we use it for now (for the better or worse).
>>
>> What I gathered so far from my setup:
>>  - we use ath9k & ath10k
>>  - in my case STP frames are received as regular packet and not as amsdu
>>  - the received packets have a wrong length of 44 in tcpdump
>>    (instead of 38 with our previous kernel)
>>  - llc_fixup_skb() tries to pull some 41 bytes out of a 35 bytes packet
>>    this makes llc_rcv() discard the frames & breaks STP
>>
>> >From bisecting the culprit seems to be 986e43b19ae9176093da35e0a844e65c8bf9ede7
>> (wifi: mac80211: fix receiving A-MSDU frames on mesh interfaces)
>>
>> I guess that your changes to handle both ampdu subframes & normal frames in the
>> same datapath ends up putting a wrong skb->len for STP (multicast) frames ?
>> Honestly I don't understand enough of the 80211 internals & spec to pinpoint the
>> exact problem.
>>
>> It seems this change was already in the 6.3 kernel so I guess someone should
>> have seen it before (but I didn't find anything..) ? Maybe I missed something...
>>
>> Anyway I'm happy to provide more info or try anything you throw at me.
>>
> 
> Thanks for the regression report. I'm adding it to regzbot:
> 
> (Felix: it looks like this regression is introcued by a commit authored by you.
> Would you like to take a look on it?)
> 
> #regzbot ^introduced: 986e43b19ae917

Hmmm, Felix did not reply. But let's ignore that for now.

Nicolas, I noticed there are a few patches in next that refer to the
culprit. Might be worth giving this series a try:

https://lore.kernel.org/all/20230314095956.62085-1-nbd@nbd.name/

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.
