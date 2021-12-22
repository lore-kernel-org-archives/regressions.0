Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE382CA0
	for <regressions@lists.linux.dev>; Wed, 22 Dec 2021 09:02:31 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id B3A013200B8B;
	Wed, 22 Dec 2021 04:02:30 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Wed, 22 Dec 2021 04:02:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm2; bh=44i3cKj4C+IU/gdPgbxbEeXUV0f
	fKrBGDVKNTA7fXGU=; b=fQq+TdZyLeZWGjCMaMii6PIN7RrDc30nqQsgB5tWBNL
	fpDqSfJKd+Okd3LTrU6MK8wUUZEaDFy0FwahzdCh0mRq/H4+cO90OcdDfK2xNXTs
	tfD0g4LK/WwD35LZhevVSuVhjV92PCcYPxLUs87EbALF7CJT5ZiuK8iVHhpfB7Hr
	KrF53fGVu/M19YjZNwbPASbsBVQRRoLj/cMfqmmxkdwEVkfPmJ+jrwb0dUIXUwTV
	cM02cxxJduXQcRKbuALqIkkoUUERdcLWh0kfXwLFSMSxu5Jn4BtVgWK+q3psMYwp
	11RID9Vc7NejYnPbyX7mJ32SPXFyRoRdEJ1DLwbo5nw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=44i3cK
	j4C+IU/gdPgbxbEeXUV0ffKrBGDVKNTA7fXGU=; b=SRy2OUTZ9xXAQvFTGozkX3
	4/qOGoeBo4sCDaltwnu+qPEYtAbuAEgDeIuGo38mbc78a6VJirTnTnDclonm5bE9
	5ySnVjnlKEQKeGmhk4gcpbTeCF+uoFcnLo2OpHrkCgvI2hGtn3nvqlD0aUu6gWDX
	K+0whu3AJ6LczA0hOdCSmYEVyzlHN7EBTtNgqnkKbH6REsex1XRsKhFGKoLFTfEU
	0f44hIJGbujXzQcoIjdpnmFfh/32X0VtC/i7VJ+fzCkAr8dZZEo5LDfz1Q/k8sOx
	1HA6RtRLmUcI4Jix8SQwt2HP66bFez3iN73o/s0HNgwb5hTl7JzKXrUOXdY2lCCg
	==
X-ME-Sender: <xms:penCYZDVSSVYYKf8TkgG42cz6wmOuIiYitW0awRM5OyuLhyAQ3bRKg>
    <xme:penCYXhqBT-HiYh4b5bHZwkocQBLzdV9HmBDzGL9ioezzS7K76Ns841e5X3sPkRFp
    iGRpLrNyx3P7g>
X-ME-Received: <xmr:penCYUl99uAeJ8qZa2x-gm2tFHeI_2ib2h8AJ5rF4JDgFUb6U2sRtu_SBm1OP86a1PyVf9U6Qi-9zvNLzoK1CdH2qAOsG88A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddruddthedguddvkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehttd
    ertddttddvnecuhfhrohhmpefirhgvghcumffjuceoghhrvghgsehkrhhorghhrdgtohhm
    qeenucggtffrrghtthgvrhhnpeeuleeltdehkeeltefhleduuddvhfffuedvffduveeghe
    ekgeeiffevheegfeetgfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorg
    hhrdgtohhm
X-ME-Proxy: <xmx:penCYTxask_A2qo6FpgOoQ3_cX7a-txhWXkIqbZmKMnQc1T2hNWrEQ>
    <xmx:penCYeQXlp8CsuVK3WPp6n20Ws-92Ug-6yxAJZXA1R5ExWOXw5hyow>
    <xmx:penCYWagdQvw-yfkvZo2bDTQDfsLUMtO1UHdZAd9KLI-DpTLEmio1Q>
    <xmx:punCYZe97pefBWGhLvlYiEj_kc-tfhIK1WvNuR7fql3KfhyolZ2XYg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Dec 2021 04:02:29 -0500 (EST)
Date: Wed, 22 Dec 2021 10:02:27 +0100
From: Greg KH <greg@kroah.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: [Bug 215117] New: ucsi_acpi: kernel NULL pointer dereference
 #forregzbot
Message-ID: <YcLpo5gKp4uPcVQL@kroah.com>
References: <bug-215117-208809@https.bugzilla.kernel.org/>
 <eb34f98f-00ef-3238-2daa-80481116035d@leemhuis.info>
 <f74c422e-776a-46c5-4508-a7d15bb93c61@leemhuis.info>
 <YcLGlrW06oddk9SE@kroah.com>
 <3de36d9f-0579-f442-2bb2-b4b21ee990a2@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3de36d9f-0579-f442-2bb2-b4b21ee990a2@leemhuis.info>

On Wed, Dec 22, 2021 at 09:37:55AM +0100, Thorsten Leemhuis wrote:
> My biggest problem is: many developers don't place the Link: tags. I
> obviously expected that up to a point. But what I didn't expect: so much
> opposition to place them, because quite a few developers think they are
> reserved for maintainers, as they are only meant for linking to the
> submission of the applied patch; a few also think others tags should be
> needed for linking to bugs.

Hah, I can't even get developers to add a Fixes: or a Cc: stable tag,
trying to get them to add a Link: tag to a lore reference is going to be
an uphill battle.

Right now, the best thing we have is the git hook that auto-adds the
Link: tag that points to the lore thread where the patch came from.
Maintainers don't have the energy or time to add anything other than
that, so I think you just might have to rely on Fixes: for a while.

> My proposed "introduce the commit message tags 'Reported:' and
> 'Posted:'" patch likely would have helped here, but didn't get any
> traction :-/
> https://lore.kernel.org/lkml/c6724c7fb534a46e095e6aef13d996ed9589e578.1639042966.git.linux@leemhuis.info/
> 
> Maybe that was partly due to the stupid mixup in the subject of the
> cover letter, but whatever. So I guess I'll drop the bold idea. I
> consider proposing to create "Reported: <url>" while leaving ambiguous
> Link: alone, which will help my case. Note sure if I also should propose
> to drop "Reported-by" at the same time, which makes things easier for
> developers, as that tag can only be set after asking the reporter.

Nah, I add "Reported-by:" all the time without asking for explicit
permission, relying on the public email instead.  If there was some way
to automate the Reported: tag, maybe it could be used, but again, that's
a lot of manual work to do, which is going to be a hard sell.

thanks,

greg k-h
