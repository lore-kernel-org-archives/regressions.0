Received: from trent.utfs.org (trent.utfs.org [94.185.90.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA5BAD3A
	for <regressions@lists.linux.dev>; Fri,  3 Feb 2023 17:30:00 +0000 (UTC)
Received: from localhost (localhost [IPv6:::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by trent.utfs.org (Postfix) with ESMTPS id E0C735F820;
	Fri,  3 Feb 2023 18:29:57 +0100 (CET)
Date: Fri, 3 Feb 2023 18:29:57 +0100 (CET)
From: Christian Kujau <lists@nerdbynature.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
cc: Juergen Gross <jgross@suse.com>, Michael Kelley <mikelley@microsoft.com>, 
    Borislav Petkov <bp@alien8.de>, linux-kernel@vger.kernel.org, 
    Greg KH <gregkh@linuxfoundation.org>, 
    Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Re: External USB disks not recognized with v6.1.8 when using Xen
In-Reply-To: <4973310d-005b-5228-78c8-74cf353f05a9@nerdbynature.de>
Message-ID: <fbaaf7cb-7ca3-e755-708d-3a08b4eeff76@nerdbynature.de>
References: <4fe9541e-4d4c-2b2a-f8c8-2d34a7284930@nerdbynature.de> <f22551ea-0694-2838-4a3f-f60d8d93fa64@leemhuis.info> <8f132803-f496-f33a-d2ab-b47fd5af0b88@nerdbynature.de> <0f441adb-f565-7a37-d9e5-3b14f6f7aea6@suse.com> <f02c49da-0377-97b9-9438-9e0ddbfbcc6d@nerdbynature.de>
 <CAHk-=wg1yXaX+Ut4uctf7x1WrZ4WW9hjSCr1VACwZtkZT9frFw@mail.gmail.com> <4973310d-005b-5228-78c8-74cf353f05a9@nerdbynature.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

On Fri, 3 Feb 2023, Christian Kujau wrote:
> Not fully understanding what your proposal really does, I got curious and 
> applied it to v6.2-rc6 with 90b926e68f50 (upstream) reverted. And it 
> boots, and the disks are there, and the "ioremap error" is gone, but now 
> I've got strange memory allocation errors, for like really small 
> operations (I wanted to capture dmesg):
> 
>   $ dmesg -t | xz -9ec | base64 
>   xz: (stdin): Out of memory

OK, whatever that is, it's unrelated to Linus's "patch" here, this happens 
with v6.2-rc6 (under Xen, and the revert of 90b926e68f50 (upstream) too. 
Dmesg has this too:

 __vm_enough_memory: pid: 3450, comm: xz, no enough memory for the allocation

Never seen this before, and Xen DomU (pvh) domains can be started just 
fine. Not sure what this message is all about, the system appears to run 
just fine.

Christian.

> 
> With v6.2-rc6 (vanilla, and also booted under Xen) there's no problem 
> allocating much more memory than that, so something is still not right. 
> Patch applied for reference, but as you said: nobody should apply this :-)
> 
> More details:
> 
> - https://nerdbynature.de/bits/usb_v6.1.8/dmesg.6.1.8.xen
> - https://nerdbynature.de/bits/usb_v6.1.8/dmesg_xen-6.1.8_MTRR_TYPE_INVALID.txt
> - https://nerdbynature.de/bits/usb_v6.1.8/meminfo_xen-6.1.8.txt
> - https://nerdbynature.de/bits/usb_v6.1.8/meminfo_xen-6.1.8_MTRR_TYPE_INVALID.txt
> 
> Thanks,
> Christian.
> -- 
> BOFH excuse #448:
> 
> vi needs to be upgraded to vii

-- 
BOFH excuse #83:

Support staff hung over, send aspirin and come back LATER.
