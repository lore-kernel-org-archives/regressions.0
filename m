Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F093C02
	for <regressions@lists.linux.dev>; Thu, 25 Aug 2022 16:13:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D6A1C433D6;
	Thu, 25 Aug 2022 16:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661444024;
	bh=vZbgVY2G/5OHN0gh3qchTpghD4a8tCzza/y15Oz5I0U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=P7A+WAnDdtwS91BYv3Rv+pX+9G0TX8G9reOfyDHKMgWrvjxXDNBk1hLpS7tdtM51a
	 Gfi05PdZWtNQPamG+NZ3OIlndVUYqjuF+0xv63qIKv5h/KcPnnqmRj4vVwXbL5EOwX
	 p7oRbum5ZMBMQvfwKVaqqsRbVe8wr6/qJ0MOUFs4tz7+nn58jFq6ear4LQ4xENQfeq
	 at28aIP0Dpr5xz9B7ohAY5O2IbCFjjLVBVSrd5T4mLoD2A5RqKnfB/Zw6IyyXdGlJB
	 5Lf5ZD6Qj3GpmTYrlM1wOvySQhYri3Kvy3rnUj4NAfCXwQ9SeIK7PCdnFhFH27dzBa
	 6i1XM2OMv+ViQ==
Date: Thu, 25 Aug 2022 09:13:43 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Maxim Levitsky <mlevitsk@redhat.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, Hayes Wang
 <hayeswang@realtek.com>, "regressions@lists.linux.dev"
 <regressions@lists.linux.dev>
Subject: Re: Commit 'r8152: fix a WOL issue' makes Ethernet port on Lenovo
 Thunderbolt 3 dock go crazy
Message-ID: <20220825091343.2e5f99dd@kernel.org>
In-Reply-To: <8c214c0b-4b8f-5e62-5aef-76668987e8fd@leemhuis.info>
References: <3745745afedb2eff890277041896356149a8f2bf.camel@redhat.com>
	<339e2f94-213c-d707-b792-86d53329b3e5@leemhuis.info>
	<8c214c0b-4b8f-5e62-5aef-76668987e8fd@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 25 Aug 2022 09:26:21 +0200 Thorsten Leemhuis wrote:
> On 24.08.22 13:16, Thorsten Leemhuis wrote:
> > Hi, this is your Linux kernel regression tracker.
> > 
> > Quick note before the boilerplate: there is another report about issues
> > caused by cdf0b86b250fd3 also involving a dock, but apparently it's
> > ignored so far:
> > https://bugzilla.kernel.org/show_bug.cgi?id=216333  
> 
> TWIMC, apparently it's the same problem.
> 
> Fun fact: Hayes discussed this in privately with the bug reporter
> according to this comment:
> https://bugzilla.kernel.org/show_bug.cgi?id=216333#c3
> 
> Well, that's not how things normally should be handled, but whatever, he
> in the end recently submitted a patch to fix it that is already merged
> to net.git:
> 
> https://lore.kernel.org/lkml/20220818080620.14538-394-nic_swsd@realtek.com/

Yup, it will be part of 6.0-rc3. 

Thanks!
