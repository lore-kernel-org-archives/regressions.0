Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E78018039
	for <regressions@lists.linux.dev>; Fri, 20 Oct 2023 10:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qtmuW-0007S1-1l; Fri, 20 Oct 2023 12:39:20 +0200
Message-ID: <74cc751f-05d1-4e58-bcef-0ab1435595aa@leemhuis.info>
Date: Fri, 20 Oct 2023 12:39:19 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: usb: dwc3: some USB devices not working after 6.4.8
Content-Language: en-US, de-DE
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Linux Regressions <regressions@lists.linux.dev>,
 Linux USB <linux-usb@vger.kernel.org>, Linux Stable <stable@vger.kernel.org>
References: <CAF1eZtsBzGb_UxOqZpNiEsk8Uk7DkqPh5AnYRRNc_kkr-tFasQ@mail.gmail.com>
 <ZPUciRLUcjDywMVS@debian.me>
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <ZPUciRLUcjDywMVS@debian.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1697798362;57eed106;
X-HE-SMSGID: 1qtmuW-0007S1-1l

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking. See link in footer if these mails annoy you.]

On 04.09.23 01:53, Bagas Sanjaya wrote:
> On Sun, Sep 03, 2023 at 09:19:13PM +0900, Kenta Sato wrote:
>>
>> I am using the FriendlyElec NanoPi R4S board.
>> When I update the kernel from 6.4.7 to 6.4.11, 6.4.13, and 6.5.1, it
>> doesn't recognize some USB devices.
>>
>> The board has two USB 3.0 ports. I connected 1) BUFFALO USB Flash Disk
>> (high-speed) and 2) NETGEAR A6210 (SuperSpeed) to each port.
>> 1) is often not recognized. On the other hand, 2) was working while I
>> was testing.
>> Regardless of whether a USB device is connected, I could see the below
>> message on dmesg:
> [...]
> Thanks for the regression report. I'm adding it to regzbot:
> 
> #regzbot ^introduced: e835c0a4e23c38
> #regzbot title: some USB devices unrecognized caused by not resetting dwc3 device if it is host-only

#regzbot fix: 8bea147dfdf823ea
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.

