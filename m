Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44DC930F7EE
	for <regressions@lists.linux.dev>; Thu,  6 Nov 2025 15:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762441891; cv=none; b=lT8TDBy9Srdq9NL3dChVN00xRaESB4dLcNXzEmULxFkgva1twLN3p8hWpKdr3PviH/lwMRVoQkGwHevzyhD4D8eLBXFP14DVk8ax7ud3HmcusUNwXaRgEB0YHM+zZtXvgNqdn1e2Oc8LgjLs4jr3myxkYxg2FqZ/ooROnTf1Fiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762441891; c=relaxed/simple;
	bh=prvuB6uMaK1hUauWmJf4huTMC186m7fu84Px9xumt9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JNXpygBLisK/UWPYXH19X9n4d3UVdvMqg6bJXyDuHtoT5Dp8dhG8x9bb6vD9MObIaYvKrX71mGxY52UA/WbxA7PO1o7aQuhHMMlE8F2jDkmg0oilkQT7mP8akallp8TyGT4OPZ/W/dnahkELyHyGIf8UXUpaYfAy0A+a2HFnR4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nqmr3c8I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nqmr3c8I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4865C116C6;
	Thu,  6 Nov 2025 15:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762441890;
	bh=prvuB6uMaK1hUauWmJf4huTMC186m7fu84Px9xumt9I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nqmr3c8IHkLVXI5bg56Mz9PG8+mkbxwgEkmO2y5g+bviZHrVTSUjpXnjJe+osjCwI
	 NgZfXG+mKYdsUM6heaWBSgmXLSdTjOjCg/qWf6Y8ygtdAFUB6wEchYQFpvZKk1YzBC
	 LUvmvpbHkE6XQRDGyxbHdkDtxtTlSKF9B3hNwqRrHmPUFVrCMrXnKvOCDrIbNI7bPT
	 2J8zETrjtoMMOmRDbaH2Ozzpc6TEoYcMKRlJozRNzzcKlW8GBfQBH9p+flrxNPKRr/
	 lrvKcLs1x03yxmpwi7Fsgkgm5kJ52Bw/LHgCdDxbp56iv9ghi0sMF4aompC/7Zhb60
	 tYle93BG6DTFQ==
Date: Thu, 6 Nov 2025 10:11:29 -0500
From: Sasha Levin <sashal@kernel.org>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: "kailang@realtek.com" <kailang@realtek.com>,
	Takashi Iwai <tiwai@suse.de>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	"tiwai@suse.com" <tiwai@suse.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"perex@perex.cz" <perex@perex.cz>,
	Ruslan Nikolaev <nruslan_devel@yahoo.com>,
	Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [Bug 220109] New: Audio disappears on HP 15-fc000 after warm
 boot again (ALC256 code path)
Message-ID: <aQy6oUX7THK_VhqO@laps>
References: <1064773772.509063.1747061777318.ref@mail.yahoo.com>
 <1064773772.509063.1747061777318@mail.yahoo.com>
 <87o6vxuauk.wl-tiwai@suse.de>
 <946767975.787038.1747111000631@mail.yahoo.com>
 <e182047c-ed7c-4fb1-bd61-fc0536b12b2e@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <e182047c-ed7c-4fb1-bd61-fc0536b12b2e@leemhuis.info>

On Thu, Nov 06, 2025 at 10:34:44AM +0100, Thorsten Leemhuis wrote:
>Hi, top-posting for once, to make this easily accessible to everyone.
>
>@Kailang, @Takashi: The fix for the mainline/6.12.y regression this
>thread is about was afaics merged for v6.17-rc3 as f4b3cef55f5f96
>("ALSA: hda/realtek: Audio disappears on HP 15-fc000 after warm boot
>again").
>
>Greg's scripts despite the Fixes-tag for some reason did not backport it
>to various series that contain the culprit. Is there a reason for that?
>Otherwise we likely should ask Greg to pick it up.

We didn't pick it up because it doesn't apply to 6.12 or prior, nor is there a
stable tag on that commit :)

I'll backport it to older trees and queue it up.

-- 
Thanks,
Sasha
