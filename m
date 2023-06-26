Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B3613AC5
	for <regressions@lists.linux.dev>; Mon, 26 Jun 2023 18:27:07 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qDqvS-0004ns-WC; Mon, 26 Jun 2023 20:26:59 +0200
Message-ID: <25015200-c433-f20b-0257-64d66b34930b@leemhuis.info>
Date: Mon, 26 Jun 2023 20:26:58 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: Fwd: Need NVME QUIRK BOGUS for SAMSUNG MZ1WV480HCGL-000MV
 (Samsung SM-953 Datacenter SSD)
Content-Language: en-US, de-DE
To: Chaitanya Kulkarni <chaitanyak@nvidia.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>, "Clemens S." <cspringsguth@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux NVMe <linux-nvme@lists.infradead.org>,
 John Meneghini <jmeneghi@redhat.com>, Sagi Grimberg <sagi@grimberg.me>,
 Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Hannes Reinecke <hare@suse.de>, Martin Belanger <martin.belanger@dell.com>
References: <d18d2a08-9d24-0209-c2cf-baf60bbf5048@gmail.com>
 <8f4e6d32-55b3-9df5-de91-1afbcb30ce13@nvidia.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <8f4e6d32-55b3-9df5-de91-1afbcb30ce13@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1687804028;ab8e1220;
X-HE-SMSGID: 1qDqvS-0004ns-WC

On 26.06.23 17:39, Chaitanya Kulkarni wrote:
> On 6/25/2023 6:15 PM, Bagas Sanjaya wrote:
>>
>> I notice a regression report on Bugzilla [1]. Quoting from it:
> 
> [...]
> 
>>> Only one drive, out of 6 is usable.
>>>
>>> These drives are rather common datacenter drives (Samsung SM-953).
>>>
>>>  From another Bug-Report (https://bugzilla.kernel.org/show_bug.cgi?id=217384):
>>>
>>> To fix it, please add two strings in pci.c
>>>
>>> { PCI_DEVICE(0x144d, 0xa802), /* SAMSUNG MZ1WV480HCGL-000MV  */
>>> .driver_data = NVME_QUIRK_BOGUS_NID, },
> 
> Please send a formal patch I'll be happy to review it ..

Huh, sorry, but why?

You might not know this, but Bagas is somebody that helps with
regression tracking (many thx for this BTW), so he's not even affected
by the problem -- and most likely is neither familiar with the code or
has the hardware to test the quirk entry.

Sure, asking others for help is fine. But from what I see this is
something that should be handled by those that developed the culprit.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

