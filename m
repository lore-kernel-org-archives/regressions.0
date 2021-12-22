Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2735F168
	for <regressions@lists.linux.dev>; Wed, 22 Dec 2021 06:33:01 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id 077F032009E0;
	Wed, 22 Dec 2021 01:32:59 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Wed, 22 Dec 2021 01:33:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm2; bh=i+Xa9JQgZRKXXLOI7u0IfbVXZau
	M1zpZgey1fhPKaUw=; b=aXQ0fiRk0cAU2wPP2XySb2Ou9fqATcovxtQlH1/gcfZ
	k4ZK1HSzv2CdelkzMwaSJml39PHtVf5orU3cdAdoGU/snn0oxiO1GP/1y+Ch6HCP
	vFFlfjd7HW4906SMUjOCrgWqscFKGJC3r3HUkyTNvAUkiKYwOSefMXqjZNj2fLzL
	kvT/W3YsNsNWwHi1ymYkCmcaYm91KVOFzJ+wjt1sQ2TSNBu+/VATJvZ9La297r1i
	YSYTyoizVHIUo92x/vscjE7FuLrtJvysFIRxanGMt55c6UdEWlC0VsRjj9KHnMyN
	cczevbbXtoZql+ruuy31J2vPm4jJtCfSkl4UU8VNaLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=i+Xa9J
	QgZRKXXLOI7u0IfbVXZauM1zpZgey1fhPKaUw=; b=NnE3acgg+SDDmWlUkwE4l8
	VSFfJgejeCsI9i5SA9D3DoKHY2rg24fVwfehAjOPpm9uKPz2yO/F1MZyVepYLH9y
	7QpYUnf5R3GTccRiKydKtTtolrUzbxUSWAjXwhKE97qiqIhkamMSxk10sIC6T26i
	Lsm1gmsGQ1+mFeIhuVNmctY7gRny1glOYiXQN2K+nDMUYvMAeYLUNPzfvSFkJTH1
	H5UOlBwf6c72HvrWyNIb2bFTrR3UiTbqBTZ6aPzwHKuJTtVJUJY8Om1iQ+8GQSlj
	Go7aC21orYpHmFuM+JDQk+f85CynFNCAaCkOOzaJNoalkFrnIF/P1/WR0OP9HQZw
	==
X-ME-Sender: <xms:m8bCYbX1ZqwQJCwsomZ7HP3RgjL2sQUNHAehh1RpkCS4iAjxvTPz6Q>
    <xme:m8bCYTlYaanNM854HokvwIpyFiTc1aJoJP8vYxXq3tNdjAfaI87TcAZ9SibAPZrhm
    F8s2UI0TeZ9Uw>
X-ME-Received: <xmr:m8bCYXYeCoHo1zqGcAKqrF5psuY-nT4-6EKTh9WtLBtGYYdN1Q54icwgoPKVEky2Yo0JZmFRAhnG-8HtgVsBZVNdl251mla2>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddruddthedgleekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesthdtre
    dttddtvdenucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheq
    necuggftrfgrthhtvghrnhepueelledtheekleethfeludduvdfhffeuvdffudevgeehke
    egieffveehgeeftefgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhh
    drtghomh
X-ME-Proxy: <xmx:m8bCYWVoWLYBVD55YOpGQ-DpZAmhatd6FH_aRB4mFVmcB4HYGWUB7A>
    <xmx:m8bCYVn1ziC49LClDdcGQNorney-JDwZQjQtiJiehiz1ktwz0sYxdw>
    <xmx:m8bCYTcJf8XPz0h2CXpbrZ7rkfs0vOeanc5MwpZQUCIcZQKKNsUMhw>
    <xmx:m8bCYaz0tz4nN0g5GDy08PF7K7FVHtXW_FYHA7rYi_JYXN0eab6lrQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Dec 2021 01:32:58 -0500 (EST)
Date: Wed, 22 Dec 2021 07:32:54 +0100
From: Greg KH <greg@kroah.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: [Bug 215117] New: ucsi_acpi: kernel NULL pointer dereference
 #forregzbot
Message-ID: <YcLGlrW06oddk9SE@kroah.com>
References: <bug-215117-208809@https.bugzilla.kernel.org/>
 <eb34f98f-00ef-3238-2daa-80481116035d@leemhuis.info>
 <f74c422e-776a-46c5-4508-a7d15bb93c61@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f74c422e-776a-46c5-4508-a7d15bb93c61@leemhuis.info>

On Tue, Dec 21, 2021 at 07:06:30PM +0100, Thorsten Leemhuis wrote:
> Hi, this is your Linux kernel regression tracker speaking.
> 
> For the record:
> 
> #regzbot fixed-by: 3f345e907a8e7c56fdebf7231cd67afc85d02aaa
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?h=usb-linus&id=3f345e907a8e7c56fdebf7231cd67afc85d02aaa
> 
> Greg helpfully added a "Link:" tag to make regzbot happy, but he
> specified a reply to the report and not the report itself, as expected
> by regzbot (I'm taken back and forth for a while already if that's a
> good or bad idea). And that was not Greg's but my fault, as I had given
> him the wrong link here:
> https://lore.kernel.org/r/YcH2w9jmGnqUMWp4@kroah.com/

Sorry about that, I tried!  :(

Keep up the great work, we'll get the workflow down yet.

greg k-h

