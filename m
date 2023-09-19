Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433FB847F
	for <regressions@lists.linux.dev>; Tue, 19 Sep 2023 11:48:20 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qiZDG-000218-3R; Tue, 19 Sep 2023 13:48:18 +0200
Message-ID: <acef4b9e-a6be-45be-91bf-40ad5fb469d2@leemhuis.info>
Date: Tue, 19 Sep 2023 13:48:17 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fwd: Kernel 6.5.2 Causes Marvell Technology Group 88SE9128 PCIe
 SATA to Constantly Reset
Content-Language: en-US, de-DE
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Linux Regressions <regressions@lists.linux.dev>,
 Linux IDE and libata <linux-ide@vger.kernel.org>,
 Linux PCI <linux-pci@vger.kernel.org>
References: <dacb34e4-ce58-bc0e-8206-672d743a3e34@gmail.com>
 <ZQHRQHAPQdG+Nu1o@x1-carbon>
 <59f6ff78-6b45-465a-bd41-28c7a5d10931@davidgow.net>
 <10f65dfe-5e8a-10ab-4d89-efe693c07caa@kernel.org>
 <658b9285-e030-4987-86a7-57cdb6c7f161@davidgow.net>
 <ZQQa0QRhm1BuI5IT@x1-carbon>
 <49d92af6-4968-4066-b33c-0fd06f8fdf28@davidgow.net>
 <ZQSEXl0GB3iKoqjZ@x1-carbon>
 <bbe4ae16-86b3-4629-b5e0-c704881fe5cb@davidgow.net>
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <bbe4ae16-86b3-4629-b5e0-c704881fe5cb@davidgow.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1695124100;d36f9ec2;
X-HE-SMSGID: 1qiZDG-000218-3R

[TLDR: This mail in primarily relevant for Linux regression tracking. A
change or fix related to the regression discussed in this thread was
posted or applied, but it did not use a Closes: tag to point to the
report, as Linus and the documentation call for. Things happen, no
worries -- but now the regression tracking bot needs to be told manually
about the fix. See link in footer if these mails annoy you.]

On 16.09.23 04:21, David Gow wrote:
> Le 2023/09/16 à 0:20, Niklas Cassel a écrit :
>> On Fri, Sep 15, 2023 at 08:26:58PM +0800, David Gow wrote:
>>> In any case, the bisect is done:
>>>
>>> 624885209f31eb9985bf51abe204ecbffe2fdeea is the first bad commit
>>> commit 624885209f31eb9985bf51abe204ecbffe2fdeea
>>> Author: Damien Le Moal <dlemoal@kernel.org>
>>> Date:   Thu May 11 03:13:41 2023 +0200
> [...]
>> Thank you very much for your effort of bisecting this.
>>
>> Could you please try this patch and see if it improves things for you:
>> https://lore.kernel.org/linux-scsi/20230915022034.678121-1-dlemoal@kernel.org/
> 
> Thanks very much: this seems to fix it here (on top of torvalds/master).

#regzbot: introduced: 624885209f31eb9
#regzbot fix: scsi: Do no try to probe for CDL on old drives
#regzbot monitor:
https://lore.kernel.org/linux-scsi/20230915022034.678121-1-dlemoal@kernel.org/
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.


