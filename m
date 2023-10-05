Received: from tartarus.angband.pl (tartarus.angband.pl [51.83.246.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EEF32E65A
	for <regressions@lists.linux.dev>; Thu,  5 Oct 2023 15:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=angband.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=angband.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=angband.pl header.i=@angband.pl header.b="Hj/mQTHP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=angband.pl;
	s=tartarus; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=glxtyoqeaI0kbkfNF4iPI6CTTiHa0BUQ75DXKNcNDsQ=; b=Hj/mQTHPrHOhfnc+0vx/7Gr0wf
	+63HJXuM5mYseQtCsn5h0iTaaQ86SdVtqfdEfgwSffPVJ42DTvUXH3wnCtcTy3GBkv4DXBWiePwPT
	IxIu4FeR1JQz8elkj8OGrt9SkRnabcFxV/iGzmUx1WDefkTLJnagREMxflNG7TMcqYjo=;
Received: from kilobyte by tartarus.angband.pl with local (Exim 4.96)
	(envelope-from <kilobyte@angband.pl>)
	id 1qoQGt-002gHy-1z;
	Thu, 05 Oct 2023 17:28:15 +0200
Date: Thu, 5 Oct 2023 17:28:15 +0200
From: Adam Borowski <kilobyte@angband.pl>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>
Subject: Re: what to do on no reproducer case? (was Re: Fwd: Uhhuh. NMI
 received for unknown reason 3d/2d/ on CPU xx)
Message-ID: <20231005152815.GA630707@angband.pl>
References: <0e6de51b-da1d-43f0-ffae-fb521febbe07@gmail.com>
 <ZQo8hzP-eRjXvtXf@debian.me>
 <2a298145-b6ec-4b4e-bd45-0cddf62b6052@leemhuis.info>
 <bcf1998e-5efa-4505-a8d2-3381c16de885@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bcf1998e-5efa-4505-a8d2-3381c16de885@gmail.com>
X-Junkbait: aaron@angband.pl, zzyx@angband.pl
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: kilobyte@angband.pl
X-SA-Exim-Scanned: No (on tartarus.angband.pl); SAEximRunCond expanded to false

On Wed, Oct 04, 2023 at 07:50:29PM +0700, Bagas Sanjaya wrote:
> On 21/09/2023 15:10, Thorsten Leemhuis wrote:
> > Yes, without a reliable bisection result there sometimes is not much we
> > can do -- apart from prodding various developers directly and asking for
> > help or an idea. But in this case that's not worth it afaics, as
> > messages like
> > https://lore.kernel.org/all/e08e33d5-4f6d-91aa-f335-9404d16a983c@amd.com/
> > indicate that it might be a hardware problem and not really a
> > regression. Hence:
> > 
> > #regzbot resolve: inconclusive: not bisected and might be a hardware
> > problem after all

> Thanks for the tip! Now to fix up:
> 
> #regzbot inconclusive: regression not bisected - possibly hardware issue

This doesn't seem to be a regression, I'm seeing this (reason 2c/3c) since
forever (2019) on my box (2990WX), up to current -rc kernels.

Of course, it might be a different problem that results in same message,
but I don't pretend to have a clue about the cause -- just reporting.


Meow!
-- 
⢀⣴⠾⠻⢶⣦⠀
⣾⠁⢠⠒⠀⣿⡁ Q: Is it ok to combine wired, wifi, and/or bluetooth connections
⢿⡄⠘⠷⠚⠋⠀    in wearable computing?
⠈⠳⣄⠀⠀⠀⠀ A: No, that would be mixed fabric, which Lev19:19 forbids.
