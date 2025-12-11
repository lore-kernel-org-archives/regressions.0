Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D201421770B
	for <regressions@lists.linux.dev>; Thu, 11 Dec 2025 03:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765422295; cv=none; b=SDiz9gVoDBnNDKQd7EPBIf7L4LHrI+fuQtAqDP5k3jBx7oD+jFMvyYvhjfvTphEz0UheG0QqMD92cTDw1yG8f70xaPEhFFHGkrpAlh6UGoUN29/2hBeSWwHY+edo7MKDQE+52ypaKSCLbWlaW0YOT/RnCcDay0vO2KTGpm3dsgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765422295; c=relaxed/simple;
	bh=mReH8dZIUa+WTkWCx4VXEstqghzVty9l/g48TmrVojI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XJa/jZ/frFgDXCycU42cGiReoItBGEXR+BPbDjHH0j3nQdPBr1S93frY+yvsshou4TdaGwBXY/YsdEo1AgjbIhpG5FKH8BT26c2iYGhgvlmM3aWPHSRGdQ5i6LUYZpvFV40ipR2Q/uDciYWaMSTLRfea/meFFw5DJ339tNguBl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b=F8UxsWMY; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b="F8UxsWMY"
Received: from macsyma.thunk.org (fs98a57d9c.tkyc007.ap.nuro.jp [152.165.125.156])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 5BB34NIk028683
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Dec 2025 22:04:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1765422268; bh=mIQCA6hzriQxhu9ibbIRTKlmkOBqLieFccUpRx8dDl0=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=F8UxsWMYSx3pNutbpljqoS30JNsMXfwS5/BWQVIC0gvWqwfJZaWUp2vrrRGIYRLsG
	 zCHq6cIJqO/d4j2Rq0Atm8IEX+h9QLfl8Ed+n31XB3bVPjMW0tEe2DtKDUgTSQtzsU
	 E7GnelYmEkV+1WDvGIC5N1bSeqY8gua2thpk62G+Dq2PwpU+KEGc6icxgBFeFQQGCQ
	 cEFd6/h8LvEwixnm0dgONBpoC5wHg46A/ec7LOdlWa/D2qcSPPi93wr46dZYrAOVb/
	 d4NvYcvBK9/I057mnJs9ClcHS/J0V9bLeEtfZtGJF+opWAP30mZPJqIfB/4r4rNIrQ
	 0Yl+ilLOf0UAw==
Received: by macsyma.thunk.org (Postfix, from userid 15806)
	id DFB524F94E73; Thu, 11 Dec 2025 12:04:22 +0900 (JST)
Date: Thu, 11 Dec 2025 12:04:22 +0900
From: "Theodore Tso" <tytso@mit.edu>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@kernel.org,
        ksummit@lists.linux.dev,
        Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: kernel.org tooling update
Message-ID: <20251211030422.GF42106@macsyma.local>
References: <20251209-roaring-hidden-alligator-068eea@lemur>
 <f1bb8d04-9949-417d-9726-64787994d40e@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f1bb8d04-9949-417d-9726-64787994d40e@leemhuis.info>

On Wed, Dec 10, 2025 at 02:30:37PM +0100, Thorsten Leemhuis wrote:
> * How many kernel subsystems have a strong interest in a bug tracking
> solution at all[2]? And how many of those might be happy by using some
> external issue tracker, like those in github (like Rust for Linux,
> thesofproject, and a few others do), gitlab (either directly, like
> apparmor, or self-hosted, like the DRM subsystem)?

One of the discussions we had (both during and after Konstantin's
tools session) was that all we really need is some kind of way of
associating state with a set of URL's to lore --- this could be used
to indicate "this is a bug report" and a set of flags "this bug has
been resolved / needs more information / needs triaging, etc".  A
different set of states is also what we would need as a replacement
for patchwork --- this patch series is a not applicable for a
subsystem, has been applied, has been rejected, etc.

This is quite similar to what you've done with your regzbot dashboard,
actually.

> FWIW, development of my regression tracker (regzbot) and me using it to
> track regressions nearly stalled but is slowly restarting. Would be good
> if we could work together here, as there is some overlap -- and
> regression tracking afaics is something that a lot of people want and
> consider important. And regzbot is already capable of monitoring reports
> in various places (lore, gitlab, github, bugzilla); so if we decide that
> we don't need a tracker for the kernel as a whole, it might already do
> nearly everything for the bugs where tracking really helps a lot.

  	 	    	    	       		- Ted
