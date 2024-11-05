Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605AF18F2F7;
	Tue,  5 Nov 2024 10:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730801140; cv=none; b=tJspRYLw6Xh0ZSPqeOHYhszd/mzau+77QIqxMGTmdA5MFWyZScTIf8UOfpbCYVoD0o0iwrwvVcu3Y1Zt+5cNTYlFiPssI+UZqiCz3mMruo03QcMpR6N96cg1+4t/liaurxeeXB9xpkeAt/hj7Prh7FHZHGyVHBnRYRL+hUnSQo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730801140; c=relaxed/simple;
	bh=8gI7vMpxiszhNbsM0yztQsyOwMcRiqS5+EruV+2HAYk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VRtx0jVHB9YJRZmqEauJg5yDRfDK6Qk/EUdfS7yInzw3tb/mnczt+ujYLVpwMea9LD/Q2GYGCZIhi7wA0vWyKun/HmI1uMaGWg/GAbEvaXimjEYQHGR+90RHex8LRI0R/+5YW1U0Ek4wjQ0O+xmMmvFr1aatVRd8bN3FCL8pRnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=bAEFPHw4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="bAEFPHw4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94B13C4CECF;
	Tue,  5 Nov 2024 10:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1730801139;
	bh=8gI7vMpxiszhNbsM0yztQsyOwMcRiqS5+EruV+2HAYk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bAEFPHw4SRQoj/PZUW/PGpRp0GogHwispFyTiybWs8lfKpMkNcXa9gqmA2/NFHwcQ
	 wdB1uVDO/RotilEgyBphKz9ATas54J6U94mxlmUrQbGaQrq4DEdBJe0eMruVCq1whv
	 mx9K+z/9mul1gBSh5XaSi6zkE3GzwWOiRr0mMEtQ=
Date: Tue, 5 Nov 2024 11:05:21 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org, Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Rick Lahaye <rick@581238.xyz>,
	Mario Limonciello <mario.limonciello@amd.com>, Sanath.S@amd.com,
	christian@heusel.eu, fabian@fstab.de, regressions@lists.linux.dev
Subject: Re: [PATCH] thunderbolt: Fix connection issue with Pluggable UD-4VPD
 dock
Message-ID: <2024110516-boat-unheated-0045@gregkh>
References: <20241105085301.524312-1-mika.westerberg@linux.intel.com>
 <2024110514-unashamed-amenity-6b9c@gregkh>
 <20241105092412.GF275077@black.fi.intel.com>
 <2024110532-overdrawn-eggnog-4234@gregkh>
 <20241105095638.GG275077@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105095638.GG275077@black.fi.intel.com>

On Tue, Nov 05, 2024 at 11:56:38AM +0200, Mika Westerberg wrote:
> On Tue, Nov 05, 2024 at 10:50:17AM +0100, Greg KH wrote:
> > On Tue, Nov 05, 2024 at 11:24:12AM +0200, Mika Westerberg wrote:
> > > Hi Greg,
> > > 
> > > On Tue, Nov 05, 2024 at 10:17:43AM +0100, Greg KH wrote:
> > > > On Tue, Nov 05, 2024 at 10:53:01AM +0200, Mika Westerberg wrote:
> > > > > Rick reported that his Pluggable USB4 dock does not work anymore after
> > > > > 6.6.28 kernel.
> > > > > 
> > > > > It looks like commit c6ca1ac9f472 ("thunderbolt: Increase sideband
> > > > > access polling delay") makes the device router enumeration happen later
> > > > > than what might be expected by the dock (although there is no such limit
> > > > > in the USB4 spec) which probably makes it assume there is something
> > > > > wrong with the high-speed link and reset it. After the link is reset the
> > > > > same issue happens again and again.
> > > > > 
> > > > > For this reason lower the sideband access delay from 5ms to 1ms. This
> > > > > seems to work fine according to Rick's testing.
> > > > > 
> > > > > Reported-by: Rick Lahaye <rick@581238.xyz>
> > > > > Closes: https://lore.kernel.org/linux-usb/000f01db247b$d10e1520$732a3f60$@581238.xyz/
> > > > > Tested-by: Rick Lahaye <rick@581238.xyz>
> > > > > Fixes: c6ca1ac9f472 ("thunderbolt: Increase sideband access polling delay")
> > > > 
> > > > This commit is not in the 6.6.y tree, it only showed up in 6.10.y, so
> > > > how does this resolve an issue in the 6.6.y tree?
> > > 
> > > This refers to a mainline commit that caused the issue. The 6.6.28 is
> > > the kernel version Rick used where it still worked. In other words, this
> > > is not a backport of a fix but a fix intented to the mainline ;-) I hope
> > > this clarifies. I can adjust the commit message if needed.
> > 
> > Ah, yeah, that is confusing so rewording it might be good as the
> > offending kernel is really 6.10, not 6.6.
> 
> Okay will do!
> 
> > Also, do you want me to take this in my tree now when you resend it, or
> > do you want to send it with other changes later?
> 
> I'll send it along with one more fix later this week if that's fine.

Sure!
