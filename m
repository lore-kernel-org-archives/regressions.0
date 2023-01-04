Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936978F77
	for <regressions@lists.linux.dev>; Wed,  4 Jan 2023 14:02:10 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pD4LI-0002Kl-EC; Wed, 04 Jan 2023 15:02:08 +0100
Message-ID: <818ec46b-d058-d294-8b22-cea427c2911a@leemhuis.info>
Date: Wed, 4 Jan 2023 15:02:07 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: 6.2 nvme-pci: something wrong #forregzbot
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Cc: linux-block@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <572cfcc0-197a-9ead-9cb-3c5bf5e735@google.com>
 <dedcb972-e934-53c2-f933-c25afa5c65a4@leemhuis.info>
In-Reply-To: <dedcb972-e934-53c2-f933-c25afa5c65a4@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1672840930;bf63648c;
X-HE-SMSGID: 1pD4LI-0002Kl-EC

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking. See link in footer if these mails annoy you.]

On 24.12.22 08:52, Thorsten Leemhuis wrote:
> [Note: this mail contains only information for Linux kernel regression
> tracking. Mails like these contain '#forregzbot' in the subject to make
> then easy to spot and filter out. The author also tried to remove most
> or all individuals from the list of recipients to spare them the hassle.]
> 
> On 24.12.22 06:24, Hugh Dickins wrote:
>>
>> There's something wrong with the nvme-pci heading for 6.2-rc1:
>> no problem booting here on this Lenovo ThinkPad X1 Carbon 5th,
>> but under load...> [...]
>> Bisection points to your
>> 0da7feaa5913 ("nvme-pci: use the tagset alloc/free helpers")
>> And that does revert cleanly, giving a kernel which shows no problem.
>> [...]
> 
> Thanks for the report. To be sure below issue doesn't fall through the
> cracks unnoticed, I'm adding it to regzbot, my Linux kernel regression
> tracking bot:
> 
> #regzbot ^introduced 0da7feaa5913
> #regzbot title nvme-pci: problems under load
> #regzbot ignore-activity

#regzbot fix: 88d356ca41ba1c3effc2d4208dfbd43

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
