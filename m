Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304575234
	for <regressions@lists.linux.dev>; Mon, 12 Jun 2023 19:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=xcHZ2DX5/YwZi9C88bvZoXbhxWPXPxROs8EOIULWnXs=; b=MDxOX+11skLBU+1xfqQ4k8p0GN
	WPv5I6lbK0iepmkLvakE06HzdmKkpT5e9MOwm2vayg+IdVkagTcCS2wiOxxMKM+/Usc1DY5Y9yfV4
	TeGShgMRix05wxHOuewF+1TZwg1ec58HXXJvzLF2FwYFik06Jfzex7GhXiNR8Xof4f+c=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1q8nYm-00FdWH-ST; Mon, 12 Jun 2023 21:50:40 +0200
Date: Mon, 12 Jun 2023 21:50:40 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Sami Korkalainen <sami.korkalainen@proton.me>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Linux Stable <stable@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux Networking <netdev@vger.kernel.org>,
	Linux ACPI <linux-acpi@vger.kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	"Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>
Subject: Re: [REGRESSION][BISECTED] Boot stall from merge tag 'net-next-6.2'
Message-ID: <e2ca75ef-d779-4bad-84a5-a9f262dbe213@lunn.ch>
References: <GQUnKz2al3yke5mB2i1kp3SzNHjK8vi6KJEh7rnLrOQ24OrlljeCyeWveLW9pICEmB9Qc8PKdNt3w1t_g3-Uvxq1l8Wj67PpoMeWDoH8PKk=@proton.me>
 <ZHFaFosKY24-L7tQ@debian.me>
 <NVN-hJsvHwaHe6R-y6XIYJp0FV7sCavgMjobFnseULT1wjgkOFNXbGBGT5iVjCfbtU7dW5xy2hIDoq0ASeNaXhvSY-g2Df4aHWVIMQ2c3TQ=@proton.me>
 <ZIcmpcEsTLXFaO0f@debian.me>
 <oEbkgJ-ImLxBDZDUTnIAGFWrRVnwBss3FOlalTpwrz83xWgESC9pcvNKiAVp9BzFgqZ0V-NIwzBZ7icKD8ynuIi_ZMtGt7URu3ftcSt16u4=@proton.me>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <oEbkgJ-ImLxBDZDUTnIAGFWrRVnwBss3FOlalTpwrz83xWgESC9pcvNKiAVp9BzFgqZ0V-NIwzBZ7icKD8ynuIi_ZMtGt7URu3ftcSt16u4=@proton.me>

On Mon, Jun 12, 2023 at 07:05:45PM +0000, Sami Korkalainen wrote:

> Ok. I will try the latest mainline and if it does not work, I try
> bisecting again, but it should take at least a couple of weeks with
> this old PC. Can't really compile more than once a day.

Cross compiling Linux has been possible for at least 20 years. Do the
build on something modern and copy the results to the target.

      Andrew
