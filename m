Received: from trent.utfs.org (trent.utfs.org [94.185.90.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E98A7F
	for <regressions@lists.linux.dev>; Wed,  1 Feb 2023 09:37:46 +0000 (UTC)
Received: from localhost (localhost [IPv6:::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by trent.utfs.org (Postfix) with ESMTPS id 71AF15F8F9;
	Wed,  1 Feb 2023 10:37:41 +0100 (CET)
Date: Wed, 1 Feb 2023 10:37:41 +0100 (CET)
From: Christian Kujau <lists@nerdbynature.de>
To: Juergen Gross <jgross@suse.com>
cc: Michael Kelley <mikelley@microsoft.com>, Borislav Petkov <bp@alien8.de>, 
    linux-kernel@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>, 
    Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Re: External USB disks not recognized with v6.1.8 when using Xen
In-Reply-To: <0f441adb-f565-7a37-d9e5-3b14f6f7aea6@suse.com>
Message-ID: <58cf4464-57e0-afe7-68d1-8f42d8088545@nerdbynature.de>
References: <4fe9541e-4d4c-2b2a-f8c8-2d34a7284930@nerdbynature.de> <f22551ea-0694-2838-4a3f-f60d8d93fa64@leemhuis.info> <8f132803-f496-f33a-d2ab-b47fd5af0b88@nerdbynature.de> <0f441adb-f565-7a37-d9e5-3b14f6f7aea6@suse.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

On Wed, 1 Feb 2023, Juergen Gross wrote:
> I have problems understanding the behavior.
> 
> Assuming the cited error messages
> 
>   ioremap error for 0xf2520000-0xf2530000, requested 0x2, got 0x0

Yes, that and the XHCI_HCD error are only present in dmesg when it's 
running as the Xen Dom0:

+ioremap error for 0xf2520000-0xf2530000, requested 0x2, got 0x0
+xhci_hcd 0000:00:14.0: init 0000:00:14.0 fail, -14
+xhci_hcd: probe of 0000:00:14.0 failed with error -14

I don't know if it's related, but the issue is really, really gone when 
that commit is reverted. And "no external disks when running in Dom0 mode" 
(i.e. started by the Xen HV) is kind of a big issue, I'm afraid.

But I'm at a loss on the technicalities of that commit, sorry.

Christian.

> are related to the issue, this would mean that the ioremap() caller
> requested _PAGE_CACHE_MODE_UC_MINUS (type 0x2) and got _PAGE_CACHE_MODE_WB
> (type 0x0).
> 
> The patch you have reverted is modifying behavior only if the _input_ type
> is _PAGE_CACHE_MODE_WB.
> 
> Anyone having an idea what could be wrong here?
-- 
BOFH excuse #339:

manager in the cable duct
