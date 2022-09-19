Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B3B7462
	for <regressions@lists.linux.dev>; Mon, 19 Sep 2022 19:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02F87C433D6;
	Mon, 19 Sep 2022 19:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663616426;
	bh=vzHs6HImCbawWl0/lH97YDZV4vqQI59VYt7CEm6uy8I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qCYi9yt8oAF9w4DOJqJAwXrdg70FqfFe4OuUXXsPNVUpmdF6sw3X3QgkAuTRnkpap
	 r2Clx8s6svSLh++t/o4C3NYfv/2KSNIcFIQY2WS/snK+VJNgtWGfm8yjgr/2b9t+q7
	 zMe2hhtvGvS93PwXlfpmAYb/2YrB6fvQolFkRg+NOVp2px0vOuaSdjNz9Y0Z0+Mwx6
	 Hz9nMO+SFGPZj8GxZlbqoIJX7yVwYIZfPedKL0oYorY44bfwjFiC+NH5dVSE21TVmr
	 gfkXSR8hsDTZYAuFqf5cyhxOJm0eiZ3RZ7qLNleeVgkEUUpqQD/QlOIU9gwEjPmHzh
	 uqU48AoigVYIg==
Date: Mon, 19 Sep 2022 12:40:24 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Chris Clayton <chris2553@googlemail.com>, Florian Westphal
 <fw@strlen.de>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 regressions@lists.linux.dev, netfilter-devel@vger.kernel.org,
 coreteam@netfilter.org
Subject: Re: removing conntrack helper toggle to enable auto-assignment [was
 Re: b118509076b3 (probably) breaks my firewall]
Message-ID: <20220919124024.0c341af4@kernel.org>
In-Reply-To: <YxvwKlE+nyfUjHx8@salvia>
References: <e5d757d7-69bc-a92a-9d19-0f7ed0a81743@googlemail.com>
	<20220908191925.GB16543@breakpoint.cc>
	<78611fbd-434e-c948-5677-a0bdb66f31a5@googlemail.com>
	<20220908214859.GD16543@breakpoint.cc>
	<YxsTMMFoaNSM9gLN@salvia>
	<a3c79b7d-526f-92ce-144a-453ec3c200a5@googlemail.com>
	<YxvwKlE+nyfUjHx8@salvia>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 10 Sep 2022 04:02:18 +0200 Pablo Neira Ayuso wrote:
> > > I'll update netfilter.org to host a copy of the github sources.
> > > 
> > > We have been announcing this going deprecated for 10 years...  
> > 
> > That may be the case, it should be broken before -rc1 is released. Breaking it at -rc4+ is, I think, a regression!
> > Adding Thorsten Leemuis to cc list  
> 
> Disagreed, reverting and waiting for one more release cycle will just
> postpone the fact that users must adapt their policies, and that they
> rely on a configuration which is not secure.

What are the chances the firewall actually needs the functionality?
Perhaps we can add the file back but have it do nothing?
