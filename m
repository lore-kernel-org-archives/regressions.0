Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A972156C7
	for <regressions@lists.linux.dev>; Tue, 29 Aug 2023 12:17:36 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qaxf4-0007Lv-9L; Tue, 29 Aug 2023 14:17:34 +0200
Message-ID: <efbe13a5-1c6d-e6fe-25be-bd942823432c@leemhuis.info>
Date: Tue, 29 Aug 2023 14:17:33 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Scrub of my nvme SSD has slowed by about 2/3
Content-Language: en-US, de-DE
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: linux-btrfs@vger.kernel.org
Cc: Linux kernel regressions list <regressions@lists.linux.dev>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <CAAKzf7=yS9vnf5zNid1CyvN19wyAgPz5o9sJP0vBqN6LReqXVg@mail.gmail.com>
 <1d611dbb-8aee-9a6e-701c-6498f1b51c34@leemhuis.info>
In-Reply-To: <1d611dbb-8aee-9a6e-701c-6498f1b51c34@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1693311456;db9aaf5d;
X-HE-SMSGID: 1qaxf4-0007Lv-9L

On 12.07.23 13:02, Linux regression tracking #adding (Thorsten Leemhuis)
wrote:

> On 03.07.23 22:19, Tim Cuthbertson wrote:
>> Yesterday, I noticed that a scrub of my main system filesystem has
>> slowed from about 2.9 gb/sec to about 949 mb/sec. My scrub used to run
>> in about 12 seconds, now it is taking 51 seconds. I had just installed
>> Linux kernel 6.4.1 on Arch Linux, upgrading from 6.3.9. At first I
>> suspected the new kernel, but now I am not so sure.
> 
> Thanks for the report. It seems it will take some work to address this,
> so to be sure the issue doesn't fall through the cracks unnoticed, I'm
> adding it to regzbot, the Linux kernel regression tracking bot:
> 
> #regzbot ^introduced e02ee89baa66

#regzbot resolve: various changes merged for 6.6 improve things again;
more planned; backporting is planned, too;
#regzbot ignore-activity

(yes, that is not idea, but that's how it is sometimes)

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.

