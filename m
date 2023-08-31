Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036F88BE6
	for <regressions@lists.linux.dev>; Thu, 31 Aug 2023 09:40:40 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qbeAI-0000cH-Si; Thu, 31 Aug 2023 11:40:38 +0200
Message-ID: <fe7400f8-aa26-01a9-3c54-be36a15ec0f9@leemhuis.info>
Date: Thu, 31 Aug 2023 11:40:38 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: nouveau bug in linux/6.1.38-2
Content-Language: en-US, de-DE
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: Linux kernel regressions list <regressions@lists.linux.dev>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
References: <20be6650-5db3-b72a-a7a8-5e817113cff5@kravcenko.com>
 <c27fb4dd-b2dc-22de-4425-6c7db5f543ba@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <c27fb4dd-b2dc-22de-4425-6c7db5f543ba@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1693474841;3c7cd674;
X-HE-SMSGID: 1qbeAI-0000cH-Si

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking. See link in footer if these mails annoy you.]

On 04.08.23 14:02, Thorsten Leemhuis wrote:
> On 02.08.23 23:28, Olaf Skibbe wrote:
>> Dear Maintainers,
>>
>> Hereby I would like to report an apparent bug in the nouveau driver in
>> linux/6.1.38-2.
> 
> Thx for your report. Maybe your problem is caused by a incomplete
> backport. I Cced the maintainers for the drivers (and the regressions
> and the stable list), maybe one of them has an idea, as they know the
> driver.

#regzbot fix: 98e470dc73a9b3539e5a7a3c72f6b7c01c98
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.


