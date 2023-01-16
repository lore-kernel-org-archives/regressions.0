Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2114123C7
	for <regressions@lists.linux.dev>; Mon, 16 Jan 2023 14:40:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 427F2C433D2;
	Mon, 16 Jan 2023 14:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1673880009;
	bh=Zewr+BXSd1xtUfsVvelEr4+dgC5KA8R63s8FHwFEuQM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Su+jH/rs/rf/nSmhuq98WLmrdufhiZETt7JFu0Hu5BzrrjbSIsif0no/LoC46pfNC
	 SF0VUA9Q7324WHsgmuzGPxE79ySpJQxjRIla2w+4s9BmL2CfzDNYlluSKSVFq6xqvb
	 YY8KemrvGRHDntfHchJcF4bKNDyQjtKa59Cd47ew=
Date: Mon, 16 Jan 2023 15:40:07 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev,
	Christoph Hellwig <hch@lst.de>,
	Sreekanth Reddy <sreekanth.reddy@broadcom.com>,
	Sathya Prakash <sathya.prakash@broadcom.com>,
	Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>,
	MPT-FusionLinux.pdl@broadcom.com,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	John Pittman <jpittman@redhat.com>, linux-scsi@vger.kernel.org,
	it+linux-scsi@molgen.mpg.de
Subject: Re: [5.15] Backport commit 0c25422d34b4 (scsi: mpt3sas: Remove
 scsi_dma_map() error messages)
Message-ID: <Y8Vhx6XekU6ka3UZ@kroah.com>
References: <693e9047-f52a-b426-616a-6157505e5165@molgen.mpg.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <693e9047-f52a-b426-616a-6157505e5165@molgen.mpg.de>

On Mon, Jan 16, 2023 at 03:23:46PM +0100, Paul Menzel wrote:
> Dear Linux folks,
> 
> 
> Could you please apply commit 0c25422d34b4 (scsi: mpt3sas: Remove
> scsi_dma_map() error messages) to the 5.15.y series?
> 
> commit 0c25422d34b4726b2707d5f38560943155a91b80
> Author: Sreekanth Reddy <sreekanth.reddy@broadcom.com>
> Date:   Thu Mar 3 19:32:03 2022 +0530
> 
>     scsi: mpt3sas: Remove scsi_dma_map() error messages
> 
>     When scsi_dma_map() fails by returning a sges_left value less than zero,
>     the amount of logging produced can be extremely high.  In a recent
> end-user
>     environment, 1200 messages per second were being sent to the log buffer.
>     This eventually overwhelmed the system and it stalled.
> 
>     These error messages are not needed. Remove them.
> 
>     Link:
> https://lore.kernel.org/r/20220303140203.12642-1-sreekanth.reddy@broadcom.com
>     Suggested-by: Christoph Hellwig <hch@lst.de>
>     Signed-off-by: Sreekanth Reddy <sreekanth.reddy@broadcom.com>
>     Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
> 
> We see this regression after upgrading from Linux 5.10 to 5.15 on our file
> servers with Broadcom/LSI SAS3008 PCI-Express Fusion-MPT SAS-3 (mpt3sas) –
> though luckily our systems do not stall/crash.
> 
> The commit message does not say anything about, what commit caused these
> error to be appearing – the log statements have been there since v4.20-rc1,
> if I am not mistaken, so it must be something else –, and also do not
> mention, why these log messages are not needed, but the new error condition
> is actually expected.

Now queued up, thanks.

greg k-h
