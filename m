Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0815B23A8
	for <regressions@lists.linux.dev>; Tue, 17 Jan 2023 12:15:24 +0000 (UTC)
Received: from [141.14.220.45] (g45.guest.molgen.mpg.de [141.14.220.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id E671E61CC40F9;
	Tue, 17 Jan 2023 13:15:18 +0100 (CET)
Message-ID: <90dab560-da68-6fa1-57e5-7afa8aedfe4c@molgen.mpg.de>
Date: Tue, 17 Jan 2023 13:15:18 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [5.15] Backport commit 0c25422d34b4 (scsi: mpt3sas: Remove
 scsi_dma_map() error messages)
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
To: stable@vger.kernel.org
Cc: Greg KH <gregkh@linuxfoundation.org>, regressions@lists.linux.dev,
 Christoph Hellwig <hch@lst.de>,
 Sreekanth Reddy <sreekanth.reddy@broadcom.com>,
 Sathya Prakash <sathya.prakash@broadcom.com>,
 Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>,
 MPT-FusionLinux.pdl@broadcom.com,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 John Pittman <jpittman@redhat.com>, linux-scsi@vger.kernel.org,
 it+linux-scsi@molgen.mpg.de, Laurence Oberman <loberman@redhat.com>,
 djeffery@redhat.com
References: <693e9047-f52a-b426-616a-6157505e5165@molgen.mpg.de>
In-Reply-To: <693e9047-f52a-b426-616a-6157505e5165@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

[Cc: +loberman@redhat.com, +djeffery@redhat.com]

Am 16.01.23 um 15:23 schrieb Paul Menzel:
> Dear Linux folks,
> 
> 
> Could you please apply commit 0c25422d34b4 (scsi: mpt3sas: Remove 
> scsi_dma_map() error messages) to the 5.15.y series?
> 
> commit 0c25422d34b4726b2707d5f38560943155a91b80
> Author: Sreekanth Reddy <sreekanth.reddy@broadcom.com>
> Date:   Thu Mar 3 19:32:03 2022 +0530
> 
>      scsi: mpt3sas: Remove scsi_dma_map() error messages
> 
>      When scsi_dma_map() fails by returning a sges_left value less than zero,
>      the amount of logging produced can be extremely high.  In a recent end-user
>      environment, 1200 messages per second were being sent to the log buffer.
>      This eventually overwhelmed the system and it stalled.
> 
>      These error messages are not needed. Remove them.
> 
>      Link: https://lore.kernel.org/r/20220303140203.12642-1-sreekanth.reddy@broadcom.com
>      Suggested-by: Christoph Hellwig <hch@lst.de>
>      Signed-off-by: Sreekanth Reddy <sreekanth.reddy@broadcom.com>
>      Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
> 
> We see this regression after upgrading from Linux 5.10 to 5.15 on our 
> file servers with Broadcom/LSI SAS3008 PCI-Express Fusion-MPT SAS-3 
> (mpt3sas) – though luckily our systems do not stall/crash.
> 
> The commit message does not say anything about, what commit caused these 
> error to be appearing – the log statements have been there since 
> v4.20-rc1, if I am not mistaken, so it must be something else –, and 
> also do not mention, why these log messages are not needed, but the new 
> error condition is actually expected.
> 
> In the Canonical/Ubuntu bug tracker I found the explanation below [2].
> 
>> 2. mpt3sas: Remove scsi_dma_map errors messages:
>> When driver set the DMA mask to 32bit then we observe that the
>> SWIOTLB bounce buffers are getting exhausted quickly. For most of the
>> IOs driver observe that scsi_dma_map() API returned with failure
>> status and hence driver was printing below error message. Since this
>> error message is getting printed per IO and if user issues heavy IOs
>> then we observe that kernel overwhelmed with this error message. Also
>> we will observe the kernel panic when the serial console is enabled.
>> So to limit this issue, we removed this error message though this
>> patch.
>> "scsi_dma_map failed: request for 1310720 bytes!"
> 
> The Launchpad issue was created in March 2022, and the fixed Linux 
> kernel package 5.15.0-53.59 for Ubuntu 22.04 released on November 15th, 
> 2022.
> 
> Sreekanth, looking again, you are the patch author, one of the Broadcom 
> maintainers (LSILOGIC MPT FUSION DRIVERS (FC/SAS/SPI)) and created the 
> Launchpad bug report. I am surprised you didn’t get it backported upstream.
> 
> 
> Kind regards,
> 
> Paul
> 
> 
> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=master&id=0c25422d34b4726b2707d5f38560943155a91b80
> [2]: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1965927
>      "[Ubuntu 22.04] mpt3sas: Request to include latest bug fix patches"
