Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CDE320A
	for <regressions@lists.linux.dev>; Mon, 10 Jul 2023 08:53:04 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qImdY-0003UR-Rh; Mon, 10 Jul 2023 10:52:52 +0200
Message-ID: <6f333133-2cc4-406a-d6c2-642ac6ccabca@leemhuis.info>
Date: Mon, 10 Jul 2023 10:52:52 +0200
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
To: Keith Busch <kbusch@kernel.org>, Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, "Clemens S." <cspringsguth@gmail.com>,
 Martin Belanger <martin.belanger@dell.com>,
 Chaitanya Kulkarni <kch@nvidia.com>, John Meneghini <jmeneghi@redhat.com>,
 Hannes Reinecke <hare@suse.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux NVMe <linux-nvme@lists.infradead.org>,
 Pankaj Raghav <p.raghav@samsung.com>, Kanchan Joshi <joshi.k@samsung.com>
References: <d18d2a08-9d24-0209-c2cf-baf60bbf5048@gmail.com>
 <ZJsKBkPqoWzYyngS@kbusch-mbp.dhcp.thefacebook.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <ZJsKBkPqoWzYyngS@kbusch-mbp.dhcp.thefacebook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1688979185;9af37f03;
X-HE-SMSGID: 1qImdY-0003UR-Rh

On 27.06.23 18:10, Keith Busch wrote:
> On Mon, Jun 26, 2023 at 08:15:49AM +0700, Bagas Sanjaya wrote:
>> See Bugzilla for the full thread.
>>
>> The reporter had a quirk (see above) that fixed this regression,
>> nevertheless I'm adding it to regzbot to make sure it doesn't fall
>> through cracks unnoticed:
>>
>> #regzbot introduced: 86c2457a8e8112f https://bugzilla.kernel.org/show_bug.cgi?id=217593
>> #regzbot title: NVME_QUIRK_BOGUS_NID is needed for SAMSUNG MZ1WV480HCGL-000MV
> 
> These bug reports really should go to the vendors that created the
> broken device with non-unique "unique" fields.

I understand that, but I think we need middlemen for that, as I or Bagas
don't have the contacts -- and it's IMHO also a bit much too ask us for
in general, as regression tracking is hard enough already. At least
unless this becomes something that happen regularly, then a list of
persons we could contact would be fine I guess. But we simply can't deal
with too many subsystem specific special cases.

> It's easy enough for me
> to write the quirk patch, but it's not the ideal solution and may harm
> devices/firmwares with the same VID:DID that don't have this problem.
> Not being the vendor, I'm not in a postition to know that, so CC'ing
> some Samsung folks.

Another request came in today, even with a pseudo-patch:
https://bugzilla.kernel.org/show_bug.cgi?id=217649

To quote:
```
As with numerous NVMe controllers these days, Samsung's
MZAL41T0HBLB-00BL2, which Lenovo builds into their 16ARP8 also suffers
from invalid IDs, breaking suspend and hibernate also on the latest
kernel 6.4.2.

The following change restores this functionality:

File: root/drivers/nvme/host/pci.c
Change:

-	{ PCI_DEVICE(0x144d, 0xa80b),   /* Samsung PM9B1 256G and 512G */
-		.driver_data = NVME_QUIRK_DISABLE_WRITE_ZEROES, },

+	{ PCI_DEVICE(0x144d, 0xa80b),   /* Samsung PM9B1 256G, 512G and 1TB */
+		.driver_data = NVME_QUIRK_BOGUS_NID |
+				NVME_QUIRK_DISABLE_WRITE_ZEROES, },
```

Ciao, Thorsten
