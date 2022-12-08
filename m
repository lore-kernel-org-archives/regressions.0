Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0275657
	for <regressions@lists.linux.dev>; Thu,  8 Dec 2022 07:06:56 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1p3Aze-0002hS-VT; Thu, 08 Dec 2022 08:06:55 +0100
Message-ID: <bf87ea86-9545-0f43-f444-16d2eaecda5d@leemhuis.info>
Date: Thu, 8 Dec 2022 08:06:54 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: tboot suspend broken on Lenovo T460p #forregzbot
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <0b09b35a-64d3-5ba3-dabc-1e36ace1c275@leemhuis.info>
 <ce38e824-2083-fcce-dc6c-2e6d58c132c2@leemhuis.info>
In-Reply-To: <ce38e824-2083-fcce-dc6c-2e6d58c132c2@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1670483217;f3a0fa46;
X-HE-SMSGID: 1p3Aze-0002hS-VT

On 26.09.22 15:37, Thorsten Leemhuis wrote:
> TWIMC: this mail is primarily send for documentation purposes and for
> regzbot, my Linux kernel regression tracking bot. These mails usually
> contain '#forregzbot' in the subject, to make them easy to spot and filter.
> 
> On 29.04.22 14:03, Thorsten Leemhuis wrote:
>> Hi, this is your Linux kernel regression tracker speaking.
>>
>> About a week ago a regression was reported to bugzilla.kernel.org that
>> seems to be handled there already, nevertheless I'd like to add to the
>> tracking to ensure it's not forgotten.
>>
>> #regzbot introduced: 453e41085183980087f8a80dada523caf1131c3c
>> #regzbot from: Derek Dolney <z23@posteo.net>
>> #regzbot title: tboot suspend broken on Lenovo T460p
>> #regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=215867
> 
> 
> #regzbot backburner: fix available, but maintainer didn't pick it up and
> developer of the fix is MIA for unkown reason

#regzbot unbackburn
#regzbot fixed-by: 6f855b39e4602b6b
