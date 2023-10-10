Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54269250F8
	for <regressions@lists.linux.dev>; Tue, 10 Oct 2023 16:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=anarazel.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=anarazel.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=anarazel.de header.i=@anarazel.de header.b="b52Xgyat";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="nxNvv0Z5"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 502165C0312;
	Tue, 10 Oct 2023 12:25:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Tue, 10 Oct 2023 12:25:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=anarazel.de; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1696955135; x=1697041535; bh=ZG
	VSxNi35608RGYlrz8WA9GS/fgxYdq+OeE1/dRcEt8=; b=b52Xgyat8mPBltL96V
	Ax0b1LbrDeqWCblefYWqoxrUkPzFuP8sTllz/65S0oW3ZStBIq2ZKB7tA8ZPpjhD
	x5sjtQD35cYu/g2LGaZFAzW38MJ4KVh+FQvBXSmqPEjFlW0EHJ9vYI6FdSu1zHvO
	lvj1bxPH73SIMzNte9AQYl0Cw9eS3LObHs1Fq0YH2cK3dM3uaC6+zBvxYuJ135m3
	9pDpwMa6UJxoBVMpqwuVWSW5mgJxR1HnTMXESe/hSErV64Y/POtdlfYgvnFkHQp/
	F7pcbJVejM0ruVLLr4g6XTCEMTfPgvtMliQTbuyDMg4tS7olGOqXyjvBKgLEMO7J
	4aCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1696955135; x=1697041535; bh=ZGVSxNi35608R
	GYlrz8WA9GS/fgxYdq+OeE1/dRcEt8=; b=nxNvv0Z5bnfiZTDa2hq+5Qdc0Pob5
	gqYt92W/vA+7OKkrnhlQZU2B3sFkF3X23qHFu2h0o1kKWd5yA6v4N/1iZ/ssB7EA
	gbmPQqpu6PhQ9fYI7ZLXpebFQr7JAiXgiIKIAKy2sRaZqGKCYwltrg2IU4gDnbSQ
	xyRlhkZu95Qt5J4EA57xVWIURWLmdqG4mFQqf4i3ftdHG005yEf+b0TwxEno4xHV
	uRve1eDMp8gu1R6EvqctNACnPMhvgavbSVTeYwEHiBoZhphjuo5fp3892TGezaGm
	8grxbva/bT6pu6Lg1gxfk73S4PdbZ+7otZ4cdAtmhIWIniPkGMjvEnkBQ==
X-ME-Sender: <xms:_nolZXYdpF_R0wyuk6gBHEJk7acTUMATmogSp3janMM1TwVM_CUf-g>
    <xme:_nolZWarFvAbcheVl22ovSWBOpAZCv0ktCdJBvcvz3YBdAjM2bye4jZdlx6HLrTze
    kQbxOGC2OGdq7QnaQ>
X-ME-Received: <xmr:_nolZZ_2DAVZVyfw5cQsS8_9xy3z7OA1B0kUpLkAdiTl54JFPvugtoJWjBtGksxuFFG_MB1x-6RRociQVRLCIB3sC4jYpZdE3QP2NW3RO8j8L9hVe9yd7T5NG-C5>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrheehgdellecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetnhgurhgv
    shcuhfhrvghunhguuceorghnughrvghssegrnhgrrhgriigvlhdruggvqeenucggtffrrg
    htthgvrhhnpedvffefvefhteevffegieetfefhtddvffejvefhueetgeeludehteevudei
    tedtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grnhgurhgvshesrghnrghrrgiivghlrdguvg
X-ME-Proxy: <xmx:_3olZdpHj037cKO-wYCY6nj8ZvF3genDDBujV_3dByYpRkIZLTJODQ>
    <xmx:_3olZSo4y0VDaPUrKf3gO60LQukyUZHKUujcGBWoKCZ8cW5T6s1mzA>
    <xmx:_3olZTRCm__n6ZncYg5hBJWL4ydkRzB_ve-TbjZ0uwLBaCGyTScibA>
    <xmx:_3olZefE8vm6b2QtLiiWozKJBjEsGRqnIbyNqnAsN6WqP1zsFgWFNQ>
Feedback-ID: id4a34324:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 10 Oct 2023 12:25:34 -0400 (EDT)
Date: Tue, 10 Oct 2023 09:25:32 -0700
From: Andres Freund <andres@anarazel.de>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Shreeya Patel <shreeya.patel@collabora.com>,
	Theodore Ts'o <tytso@mit.edu>, linux-ext4@vger.kernel.org,
	Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>,
	"gustavo.padovan@collabora.com" <gustavo.padovan@collabora.com>,
	groeck@google.com, zsm@google.com, garrick@google.com,
	Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Re: [syzbot] INFO: task hung in ext4_fallocate
Message-ID: <20231010162532.kgtphbupib5gwwft@awork3.anarazel.de>
References: <d89989ef-e53b-050e-2916-a4f06433798b@collabora.com>
 <ZQjKOjrjDYsoXBXj@mit.edu>
 <20231003141138.owt6qwqyf4slgqgp@alap3.anarazel.de>
 <20231003232505.GA444157@mit.edu>
 <20231004004247.zkswbseowwwc6vvk@alap3.anarazel.de>
 <604bc623-a090-005b-cbfc-39805a8a7b20@collabora.com>
 <c9632187-bcbc-483f-8b18-1fa403b46ebb@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c9632187-bcbc-483f-8b18-1fa403b46ebb@leemhuis.info>

Hi,

On 2023-10-10 11:21:47 +0200, Thorsten Leemhuis wrote:
> Andres Freund: as it seems you have a different issue, have you or
> somebody else done anything to get us closer to a solution (like a
> bisection)? Doesn't look like it, but it's quite possible that I missed
> something.

I've indeed not performed a bisection - unfortunately it doesn't quite seem
viable at this point, I've only hit the issue after using the kernel
interactively for several hours. Being confident that some kernel version
doesn't hit the issue would require using a kernel version for quite a long
time...


> I just want to ensure that this is not lost if you care about the problems
> you encountered; makes we wonder if reporting it separately (e.g. in a new
> thread) might be wise.

Yes, probably a good idea. I'll try to do so soon.

Greetings,

Andres Freund
