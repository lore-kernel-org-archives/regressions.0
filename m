Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E35618BC37
	for <regressions@lists.linux.dev>; Tue,  5 Nov 2024 09:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730800613; cv=none; b=hZCmUnClZBHB+jJxVH0hY1+rZ7Z7dFMWQKiPJpoyUS19mCwisuQaAWKeUVBFs3TMOHxQ7PT/THlvPkjWDUD8EBdy/4yw0v4l7H10YLN8x998o63UXu6sNFxyWM+9yYyAjKO2WTotmF8XCgWUS9MtG4KzCtX2d6pYM7GETJ6U/m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730800613; c=relaxed/simple;
	bh=SwFCw1xL3FxmuvsWUdKKhBt/vHq2obw2Efy5V62E3Ic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qp/5ALKwOsPzx16KVpBYAlwHlmPInLP+KwASy4eqLUaVwma2vnHPIqDw/19fUGHJUO94eRh+wP+xIadM+qqjv7ggN4pMiJy+t97OzkjZXOwPoEbR3ViIS4jzZzo7jp4/UNllVUk3AawX+HmopgiZP8bgahCcAyCjav4wByIFlcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f2NM43Fr; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f2NM43Fr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730800611; x=1762336611;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SwFCw1xL3FxmuvsWUdKKhBt/vHq2obw2Efy5V62E3Ic=;
  b=f2NM43Frvt8ZrYz5BkAlJHULoPuCzmVDmIgUFEAPngPX3rhoPhEW55WK
   QY6qIkbI6fNigEXjiE5mo2jQfyIo4+7P3uzmRBwAi6V7YdE2molFQfeYn
   Vc0rJYE55YTZHjVOpPVnfnFvv4nZFOFza3smAs4QrRjpHDWn4srYPWZy2
   UlrZpZxFmwcUKjrCSBR7jjiUqzIbsMIJiT+XLxvoplJOMeyAc+mWDri4Q
   QUjhaKt2nA6g70ec45K2ChaGbIQQsFpP1lkGmszck6mz/ps6wHdX7YkJp
   +kYCnuZs+I6q2UbJwDMaZ+Pq0OVtmyc9M1iUsapQCQTUKqXQ/XCOy45gU
   w==;
X-CSE-ConnectionGUID: 9pV2DbJBR/qEZnYGPm4bvQ==
X-CSE-MsgGUID: CjNTAT1ITA+A2Dp7Cm8qaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="29953391"
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="29953391"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 01:56:42 -0800
X-CSE-ConnectionGUID: 0y3jJdWkR12qcsNllw8F1Q==
X-CSE-MsgGUID: tL70GAaYQs2fgVUjxRJYDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="83885187"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa010.jf.intel.com with ESMTP; 05 Nov 2024 01:56:39 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 2FBAE1E0; Tue, 05 Nov 2024 11:56:38 +0200 (EET)
Date: Tue, 5 Nov 2024 11:56:38 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Rick Lahaye <rick@581238.xyz>,
	Mario Limonciello <mario.limonciello@amd.com>, Sanath.S@amd.com,
	christian@heusel.eu, fabian@fstab.de, regressions@lists.linux.dev
Subject: Re: [PATCH] thunderbolt: Fix connection issue with Pluggable UD-4VPD
 dock
Message-ID: <20241105095638.GG275077@black.fi.intel.com>
References: <20241105085301.524312-1-mika.westerberg@linux.intel.com>
 <2024110514-unashamed-amenity-6b9c@gregkh>
 <20241105092412.GF275077@black.fi.intel.com>
 <2024110532-overdrawn-eggnog-4234@gregkh>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2024110532-overdrawn-eggnog-4234@gregkh>

On Tue, Nov 05, 2024 at 10:50:17AM +0100, Greg KH wrote:
> On Tue, Nov 05, 2024 at 11:24:12AM +0200, Mika Westerberg wrote:
> > Hi Greg,
> > 
> > On Tue, Nov 05, 2024 at 10:17:43AM +0100, Greg KH wrote:
> > > On Tue, Nov 05, 2024 at 10:53:01AM +0200, Mika Westerberg wrote:
> > > > Rick reported that his Pluggable USB4 dock does not work anymore after
> > > > 6.6.28 kernel.
> > > > 
> > > > It looks like commit c6ca1ac9f472 ("thunderbolt: Increase sideband
> > > > access polling delay") makes the device router enumeration happen later
> > > > than what might be expected by the dock (although there is no such limit
> > > > in the USB4 spec) which probably makes it assume there is something
> > > > wrong with the high-speed link and reset it. After the link is reset the
> > > > same issue happens again and again.
> > > > 
> > > > For this reason lower the sideband access delay from 5ms to 1ms. This
> > > > seems to work fine according to Rick's testing.
> > > > 
> > > > Reported-by: Rick Lahaye <rick@581238.xyz>
> > > > Closes: https://lore.kernel.org/linux-usb/000f01db247b$d10e1520$732a3f60$@581238.xyz/
> > > > Tested-by: Rick Lahaye <rick@581238.xyz>
> > > > Fixes: c6ca1ac9f472 ("thunderbolt: Increase sideband access polling delay")
> > > 
> > > This commit is not in the 6.6.y tree, it only showed up in 6.10.y, so
> > > how does this resolve an issue in the 6.6.y tree?
> > 
> > This refers to a mainline commit that caused the issue. The 6.6.28 is
> > the kernel version Rick used where it still worked. In other words, this
> > is not a backport of a fix but a fix intented to the mainline ;-) I hope
> > this clarifies. I can adjust the commit message if needed.
> 
> Ah, yeah, that is confusing so rewording it might be good as the
> offending kernel is really 6.10, not 6.6.

Okay will do!

> Also, do you want me to take this in my tree now when you resend it, or
> do you want to send it with other changes later?

I'll send it along with one more fix later this week if that's fine.
