Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641DF3457F;
	Mon, 27 Nov 2023 15:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZmGMfjRA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36DD2C433CA;
	Mon, 27 Nov 2023 15:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1701100400;
	bh=ZRLND9QQ2LvpuKSpNQ1bb/wBvN1S6RZHzJUtIiZwoqs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZmGMfjRAqd4leoIf9Hjxovxd+LmQ6JcIcvJAKxohMdFZRK5sG1epvOisPyHqO+tFT
	 6PfLwxVaguiY+7TbjhpiC1kQNT610Mr1o+Tsdnk091lD2fFcXfMHGRg5YVXbOSRNZO
	 4bDNUxMtDJQ9ZG+cMPwC7oax6zMeW2/jPjyGCCcU=
Date: Mon, 27 Nov 2023 15:53:18 +0000
From: Greg KH <gregkh@linuxfoundation.org>
To: Malcolm Hart <malcolm@5harts.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
	Mark Brown <broonie@kernel.org>,
	Sven Frotscher <sven.frotscher@gmail.com>, git@augustwikerfors.se,
	alsa-devel@alsa-project.org, lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: ASoC: amd: yc: Fix non-functional mic on ASUS E1504FA
Message-ID: <2023112706-surcharge-swifter-cf3b@gregkh>
References: <b9dd23931ee8709a63d884e4bd012723c9563f39.camel@5harts.com>
 <ZWSckMPyqJl4Ebib@finisterre.sirena.org.uk>
 <87leajgqz1.fsf@5harts.com>
 <08590a87-e10c-4d05-9c4f-39d170a17832@amd.com>
 <87h6l72o8f.fsf@5harts.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h6l72o8f.fsf@5harts.com>

On Mon, Nov 27, 2023 at 03:44:37PM +0000, Malcolm Hart wrote:
> 
> 
> >From da1e023a39987c1bc2d5b27ecf659d61d9a4724c Mon Sep 17 00:00:00 2001
> From: foolishhart <62256078+foolishhart@users.noreply.github.com>
> Date: Mon, 27 Nov 2023 11:51:04 +0000
> Subject: [PATCH] Update acp6x-mach.c
> 
> Added 	ASUSTeK COMPUTER INC  "E1504FA" to quirks file to enable microphone array on ASUS Vivobook GO 15.
> ---
>  sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>
