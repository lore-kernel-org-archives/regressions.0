Received: from trent.utfs.org (trent.utfs.org [94.185.90.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EFFE33C1
	for <regressions@lists.linux.dev>; Sun,  5 Feb 2023 17:17:14 +0000 (UTC)
Received: from localhost (localhost [IPv6:::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by trent.utfs.org (Postfix) with ESMTPS id 0DA775F820;
	Sun,  5 Feb 2023 18:17:06 +0100 (CET)
Date: Sun, 5 Feb 2023 18:17:05 +0100 (CET)
From: Christian Kujau <lists@nerdbynature.de>
To: Borislav Petkov <bp@alien8.de>
cc: Linus Torvalds <torvalds@linux-foundation.org>, 
    Juergen Gross <jgross@suse.com>, Michael Kelley <mikelley@microsoft.com>, 
    linux-kernel@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>, 
    Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Re: External USB disks not recognized with v6.1.8 when using Xen
In-Reply-To: <Y9+tDmLAlqg37TS+@zn.tnic>
Message-ID: <8f0f9275-be8e-1155-d06f-240cd33a8702@nerdbynature.de>
References: <4fe9541e-4d4c-2b2a-f8c8-2d34a7284930@nerdbynature.de> <f22551ea-0694-2838-4a3f-f60d8d93fa64@leemhuis.info> <8f132803-f496-f33a-d2ab-b47fd5af0b88@nerdbynature.de> <0f441adb-f565-7a37-d9e5-3b14f6f7aea6@suse.com> <f02c49da-0377-97b9-9438-9e0ddbfbcc6d@nerdbynature.de>
 <CAHk-=wg1yXaX+Ut4uctf7x1WrZ4WW9hjSCr1VACwZtkZT9frFw@mail.gmail.com> <Y9+tDmLAlqg37TS+@zn.tnic>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

On Sun, 5 Feb 2023, Borislav Petkov wrote:
> See below. I think it should be this way but I might be missing an
> angle...

Thanks for taking a stab at this, Borislav. With this applied to v6.2-rc6 
(and 90b926e68f50 still reverted), the machine boots just fine, no new 
errors and the USB disks show up just fine and appear to be usable. If 
this ends up the final fix for this, feel free to add my Tested-by to the 
same.

Thanks again,
Christian.
-- 
BOFH excuse #176:

vapors from evaporating sticky-note adhesives
