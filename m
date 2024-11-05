Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5B51CF28B;
	Tue,  5 Nov 2024 09:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730798281; cv=none; b=dhZrKF7H5vo70/Gyw/h6Tq+z87JkWP8g8/AHPyq+8Y3bIVzJErODmX3BkXXtEWS0MLWOCQbHA5iyCjKfOSYi/r4dhiDj+gIpJLmm3cdNQYUbCkCzrVWg+wY8kVcIp67nasaGQNaTblmR2ziGetIDrD6o4gWdD4c28ukYMDSjvHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730798281; c=relaxed/simple;
	bh=BLPBTOIOxx0ebh88CssCres6HFIJYuop0KJYw/89Tws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pxdbyMqoiigiH6zsQoW9CAkPYZv9aJ/Hz6NWMGDbWGZwdSR84N997itWux4/J26MHV2B0Q2qd8T9Oor+PCyWhuYmMC5IYe6p8BzQsqbVY0NW9FlExeL4CIW4AbbqfDTB+msaY9DYio2UR2oJBJ0lxDnFJfbnyLUZ08QLUwvxeUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZBTGnPgQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZBTGnPgQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44CC5C4CECF;
	Tue,  5 Nov 2024 09:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1730798280;
	bh=BLPBTOIOxx0ebh88CssCres6HFIJYuop0KJYw/89Tws=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZBTGnPgQp4dTjuRdvFnihOeb5lYYP6VzzBmvgTX6fol3vsQoOcLn7srCUZIP/qj81
	 BythrNtY4A5jHCjDVjZ2YoxajkSRVfbaxAkP56ubdDeBbRWlWPlrg4el8ZOn6x+FH2
	 Xsg75J/9dG2oApEs3CKhXq8UD/l99ckzWxazOLRI=
Date: Tue, 5 Nov 2024 10:17:43 +0100
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
Message-ID: <2024110514-unashamed-amenity-6b9c@gregkh>
References: <20241105085301.524312-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105085301.524312-1-mika.westerberg@linux.intel.com>

On Tue, Nov 05, 2024 at 10:53:01AM +0200, Mika Westerberg wrote:
> Rick reported that his Pluggable USB4 dock does not work anymore after
> 6.6.28 kernel.
> 
> It looks like commit c6ca1ac9f472 ("thunderbolt: Increase sideband
> access polling delay") makes the device router enumeration happen later
> than what might be expected by the dock (although there is no such limit
> in the USB4 spec) which probably makes it assume there is something
> wrong with the high-speed link and reset it. After the link is reset the
> same issue happens again and again.
> 
> For this reason lower the sideband access delay from 5ms to 1ms. This
> seems to work fine according to Rick's testing.
> 
> Reported-by: Rick Lahaye <rick@581238.xyz>
> Closes: https://lore.kernel.org/linux-usb/000f01db247b$d10e1520$732a3f60$@581238.xyz/
> Tested-by: Rick Lahaye <rick@581238.xyz>
> Fixes: c6ca1ac9f472 ("thunderbolt: Increase sideband access polling delay")

This commit is not in the 6.6.y tree, it only showed up in 6.10.y, so
how does this resolve an issue in the 6.6.y tree?

confused,

greg k-h
