Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3455C121
	for <regressions@lists.linux.dev>; Sat,  8 Jul 2023 21:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=wXULueV0LImr02o0X+qLe5+8Lmg5sxL2j9fograBLZ0=; b=1BqUG3kdrYo4iEUNNB4HJTKqz+
	AIIWi+EzbuRRyVSQGcUJ+Kyi/ZcROIVFuAozdPv4dFe0c6zjraKlEFIxFuYeowK2SVlaz6CiJni0i
	mL5NNbquxEvOHdbO8FomFUV9XexM6foULL+HM5wd1LbQeaI36aCr0leTDccAoIpA/YSI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qIErU-000pfz-CI; Sat, 08 Jul 2023 22:49:00 +0200
Date: Sat, 8 Jul 2023 22:49:00 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Ross Maynard <bids.7405@bigpond.com>
Cc: Dave Jones <davej@codemonkey.org.uk>,
	Thorsten Leemhuis <regressions@leemhuis.info>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux Networking <netdev@vger.kernel.org>,
	Linux USB <linux-usb@vger.kernel.org>,
	Oliver Neukum <oneukum@suse.com>
Subject: Re: Fwd: 3 more broken Zaurii - SL-5600, A300, C700
Message-ID: <05a229e8-b0b6-4d29-8561-70d02f6dc31b@lunn.ch>
References: <7ea9abd8-c35d-d329-f0d4-c8bd220cf691@gmail.com>
 <50f4c10d-260c-cb98-e7d2-124f5519fa68@gmail.com>
 <e1fdc435-089c-8ce7-d536-ce3780a4ba95@leemhuis.info>
 <ZKbuoRBi50i8OZ9d@codemonkey.org.uk>
 <62a9e058-c853-1fcd-5663-e2e001f881e9@bigpond.com>
 <14fd48c8-3955-c933-ab6f-329e54da090f@bigpond.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <14fd48c8-3955-c933-ab6f-329e54da090f@bigpond.com>

> Could someone please submit the patch for me?

You are not far from it yourself.

I've not followed the history here. Did it never work, or has it
worked in the past, and then at some point broke?

If it never worked, this would be classed as new development, and so
the patch should be for net-next. If it did work, but at some point in
time it stopped working, then it is for net.

Take a read of:

https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html

And produce a patch based on net, or net-next.

Also read:

https://www.kernel.org/doc/html/latest/process/submitting-patches.html

Please ask questions if anything is not clear.

	Andrew
