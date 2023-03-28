Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5058476
	for <regressions@lists.linux.dev>; Tue, 28 Mar 2023 14:45:20 +0000 (UTC)
Received: from [141.14.220.45] (g45.guest.molgen.mpg.de [141.14.220.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id DF99261CC457B;
	Tue, 28 Mar 2023 16:39:01 +0200 (CEST)
Message-ID: <652a9a96-f499-f31f-2a55-3c80b6ac9c75@molgen.mpg.de>
Date: Tue, 28 Mar 2023 16:39:01 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [Intel-wired-lan] [REGRESSION] e1000e probe/link detection fails
 since 6.2 kernel
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
Cc: Jesse Brandeburg <jesse.brandeburg@intel.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>, netdev@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <87jzz13v7i.wl-tiwai@suse.de>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <87jzz13v7i.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Takashi,


Am 28.03.23 um 14:40 schrieb Takashi Iwai:

> we've got a regression report for e1000e device on Lenovo T460p since
> 6.2 kernel (with openSUSE Tumbleweed).  The details are found in
>    https://bugzilla.opensuse.org/show_bug.cgi?id=1209254

Thank you for forwarding the report.

> It seems that the driver can't detect the 1000Mbps but only 10/100Mbps
> link, eventually making the device unusable.
> 
> On 6.1.12:
> [    5.119117] e1000e: Intel(R) PRO/1000 Network Driver
> [    5.119120] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
> [    5.121754] e1000e 0000:00:1f.6: Interrupt Throttling Rate (ints/sec) set to dynamic conservative mode
> [    7.905526] e1000e 0000:00:1f.6 0000:00:1f.6 (uninitialized): Failed to disable ULP
> [    7.988925] e1000e 0000:00:1f.6 0000:00:1f.6 (uninitialized): registered PHC clock
> [    8.069935] e1000e 0000:00:1f.6 eth0: (PCI Express:2.5GT/s:Width x1) 50:7b:9d:cf:13:43
> [    8.069942] e1000e 0000:00:1f.6 eth0: Intel(R) PRO/1000 Network Connection
> [    8.072691] e1000e 0000:00:1f.6 eth0: MAC: 12, PHY: 12, PBA No: 1000FF-0FF
> [   11.643919] e1000e 0000:00:1f.6 eth0: NIC Link is Up 1000 Mbps Full Duplex, Flow Control: None
> [   15.437437] e1000e 0000:00:1f.6 eth0: NIC Link is Up 1000 Mbps Full Duplex, Flow Control: None
> 
> On 6.2.4:
> [    4.344140] e1000e: Intel(R) PRO/1000 Network Driver
> [    4.344143] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
> [    4.344933] e1000e 0000:00:1f.6: Interrupt Throttling Rate (ints/sec) set to dynamic conservative mode
> [    7.113334] e1000e 0000:00:1f.6 0000:00:1f.6 (uninitialized): Failed to disable ULP
> [    7.201715] e1000e 0000:00:1f.6 0000:00:1f.6 (uninitialized): registered PHC clock
> [    7.284038] e1000e 0000:00:1f.6 eth0: (PCI Express:2.5GT/s:Width x1) 50:7b:9d:cf:13:43
> [    7.284044] e1000e 0000:00:1f.6 eth0: Intel(R) PRO/1000 Network Connection
> [    7.284125] e1000e 0000:00:1f.6 eth0: MAC: 12, PHY: 12, PBA No: 1000FF-0FF
> [   10.897973] e1000e 0000:00:1f.6 eth0: NIC Link is Up 10 Mbps Full Duplex, Flow Control: None
> [   10.897977] e1000e 0000:00:1f.6 eth0: 10/100 speed: disabling TSO
> [   14.710059] e1000e 0000:00:1f.6 eth0: NIC Link is Up 10 Mbps Full Duplex, Flow Control: None
> [   14.710064] e1000e 0000:00:1f.6 eth0: 10/100 speed: disabling TSO
> [   59.894807] e1000e 0000:00:1f.6 eth0: NIC Link is Up 10 Mbps Full Duplex, Flow Control: None
> [   59.894812] e1000e 0000:00:1f.6 eth0: 10/100 speed: disabling TSO
> [   63.808662] e1000e 0000:00:1f.6 eth0: NIC Link is Up 10 Mbps Full Duplex, Flow Control: None
> [   63.808668] e1000e 0000:00:1f.6 eth0: 10/100 speed: disabling TSO
> 
> The same problem persists with 6.3-rc3.
> 
> Can you guys check what can go wrong, or if there is a fix?

Does openSUSE Tumbleweed make it easy to bisect the regression at least 
on “rc level”? It be great if narrow it more down, so we know it for 
example regressed in 6.2-rc7.


Kind regards,

Paul
