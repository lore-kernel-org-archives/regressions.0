Received: from scorn.kernelslacker.org (scorn.kernelslacker.org [45.56.101.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452EABE46
	for <regressions@lists.linux.dev>; Thu,  6 Jul 2023 17:14:32 +0000 (UTC)
Received: from [2601:196:4600:6634:ae9e:17ff:feb7:72ca] (helo=wopr.kernelslacker.org)
	by scorn.kernelslacker.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <davej@codemonkey.org.uk>)
	id 1qHS2U-006KW9-Jc; Thu, 06 Jul 2023 12:41:06 -0400
Received: by wopr.kernelslacker.org (Postfix, from userid 1026)
	id A53C756016B; Thu,  6 Jul 2023 12:41:05 -0400 (EDT)
Date: Thu, 6 Jul 2023 12:41:05 -0400
From: Dave Jones <davej@codemonkey.org.uk>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Ross Maynard <bids.7405@bigpond.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux Networking <netdev@vger.kernel.org>,
	Linux USB <linux-usb@vger.kernel.org>,
	Oliver Neukum <oneukum@suse.com>
Subject: Re: Fwd: 3 more broken Zaurii - SL-5600, A300, C700
Message-ID: <ZKbuoRBi50i8OZ9d@codemonkey.org.uk>
Mail-Followup-To: Dave Jones <davej@codemonkey.org.uk>,
	Thorsten Leemhuis <regressions@leemhuis.info>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Ross Maynard <bids.7405@bigpond.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux Networking <netdev@vger.kernel.org>,
	Linux USB <linux-usb@vger.kernel.org>,
	Oliver Neukum <oneukum@suse.com>
References: <7ea9abd8-c35d-d329-f0d4-c8bd220cf691@gmail.com>
 <50f4c10d-260c-cb98-e7d2-124f5519fa68@gmail.com>
 <e1fdc435-089c-8ce7-d536-ce3780a4ba95@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e1fdc435-089c-8ce7-d536-ce3780a4ba95@leemhuis.info>
X-Spam-Note: SpamAssassin invocation failed

On Thu, Jul 06, 2023 at 01:45:57PM +0200, Thorsten Leemhuis wrote:
 > On 06.07.23 05:08, Bagas Sanjaya wrote:
 > >>
 > >> I notice a regression report on Bugzilla [1]. Quoting from it:
 > >>
 > >>> The following patch broke support of 3 more Zaurus models: SL-5600, A300 and C700
 > >>>
 > >>> [16adf5d07987d93675945f3cecf0e33706566005] usbnet: Remove over-broad module alias from zaurus
 > 
 > ...
 > He sometimes shows up on Linux kernel lists, but I doubt he cares about
 > that change after all these years. And I would not blame him at all.

That's about the size of it.  This is pretty near the bottom of my ever-shrinking
list of kernel drivers I care about.

 > Yes, we have the "no regressions" rule, but contributing a change to the
 > kernel OTOH should not mean that you are responsible for all regressions
 > it causes for your whole life. :-)

That said, 12 years later, 16adf5d07987d93675945f3cecf0e33706566005
is still the right thing to do. Adding actual matches for the devices
rather than matching by class will prevent this getting loaded where it
doesn't need to be.

If someone actually cares to get this working, cargo-culting Oliver's
change to add the extra id is likely the way forward.

	Dave

