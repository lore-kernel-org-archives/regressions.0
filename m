Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB282137C2D
	for <regressions@lists.linux.dev>; Tue, 27 Feb 2024 10:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709028356; cv=none; b=RxmKubbMg1QBCYgG2nuJeL6OayJvqveFl+fJJnD/n/lkOMDqRqSN4jzLwP/llP47RUhSdVbty2oJtDCWmaH6lTzMKe6giPAc/Qs1wXWKV46s6QKwMHs/31ajpvqaw7VzhXrfY8k5s06M9kPVTPl4M+ZN1vuf/Q2JMODL6PkWAhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709028356; c=relaxed/simple;
	bh=dXCGiNGi/3XJCWTmlTtROpusGiiqFBltCiaxikusSx4=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r5sepKuQBAJBXccw9GyBh7wwENnPO7lOIuEkc73QRSNTaER1CbAHI0C/aCEbqfEjN/F6JKyvSsljOH1zk4v+uLBBXw+ny+eoFhtze+1A/LtxAoTWxtO/ZoLbDmk4lghUuCHL2QO27MQh4FYyZy33rVRMLMBcq5A7SZl60HdQrJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PobNYDHO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PobNYDHO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 383A1C433C7
	for <regressions@lists.linux.dev>; Tue, 27 Feb 2024 10:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709028356;
	bh=dXCGiNGi/3XJCWTmlTtROpusGiiqFBltCiaxikusSx4=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=PobNYDHOD5BWfh+qiD6BddFTj5bzicckuCvq0grnV609bpTjKCimt2Jhwr4sD3SXK
	 9bw42fwh2N4enqb0mIU3Vrwop93BPJa4Gl9m9+DQ4qz50I9ZXO49QGbmk/nWSXQPQg
	 YHoJpQTNBlCdIUxMG6ELtbw47jTqe/I2PMQXJzJIS+MARMr/9nlDBMLu8gALc0ehL+
	 pNvLTO/2DXaXG1sFMiHSV+qgD+7ukBkZwI1nQ1VqGW6jl658X2nCr+L/UMOISlE9n3
	 TbCM9pLCOLqTirfwDtHzjG/CNmzmfJuT6uDcdOwWljAspRxM2jJV1QJEyeO2THDONc
	 roT2pNXtjcZQA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1reuLX-000000004HD-0xTV
	for regressions@lists.linux.dev;
	Tue, 27 Feb 2024 11:05:59 +0100
Date: Tue, 27 Feb 2024 11:05:59 +0100
From: Johan Hovold <johan@kernel.org>
To: Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Re: drm/msm/dp: runtime PM cause internal eDP display on the Lenovo
 ThinkPad X13s to not always show up on boot (2/2 regressions)
Message-ID: <Zd20B-mslSxb0bDu@hovoldconsulting.com>
References: <faad839a-4c28-449f-bd87-845b47a1a6a1@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <faad839a-4c28-449f-bd87-845b47a1a6a1@leemhuis.info>

On Fri, Feb 23, 2024 at 08:53:15AM +0100, Linux regression tracking #adding (Thorsten Leemhuis) wrote:
> Lo! Johan reported a second regressions
> (https://lore.kernel.org/all/ZdMwZa98L23mu3u6@hovoldconsulting.com/ ) in
> a thread about another related regression. Tell regzbot to track the
> first one separately:
> 
> #regzbot introduced: 5814b8bf086a
> #regzbot title: drm/msm/dp: runtime PM cause internal eDP display on the
> Lenovo ThinkPad X13s to not always show up on boot (2/2 regressions)

This second regression actually triggers a hard reset when initialising
the display subsystem at boot, so I'll try to update the title to
reflect that:

#regzbot title: drm/msm/dp: runtime PM rework triggers hard reset of Lenovo ThinkPad X13s on boot (2/2 regressions)

A fix for this has now been posted here:

	https://lore.kernel.org/linux-arm-msm/20240226-rpmhpd-enable-corner-fix-v1-1-68c004cec48c@quicinc.com/T/#u

but it logs like the bot is already on to that one.

Johan
