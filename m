Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6B4810
	for <regressions@lists.linux.dev>; Wed,  4 Jan 2023 11:31:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C24DCC433EF;
	Wed,  4 Jan 2023 11:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1672831901;
	bh=v+0G+kQjDPZcgzyLAonltcocpIDs/oeo0yIa+WxMioo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jaW9/2IEM6Wvyg0dBgFkIqCUmk40O7invRLZNi5z3G6eRQS0M/I8BJCxXeDt6jZu2
	 itU3Ge1LXKNw1pubUjO1rVPjB3O81IxgjffO85Ushs/3Fno6PE4MU1lJTTrBeHlu29
	 SvE+gXqm/dD+yOdwidUi09q+SuhjN5JJK/qDuIGU=
Date: Wed, 4 Jan 2023 12:31:38 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: stable@vger.kernel.org,
	=?iso-8859-1?Q?P=C1LFFY_D=E1niel?= <dpalffy@gmail.com>,
	Alsa-devel <alsa-devel@alsa-project.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	Mark Brown <broonie@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Thorsten Leemhuis <regressions@leemhuis.info>,
	Sergey <zagagyka@basealt.ru>,
	Salvatore Bonaccorso <carnil@debian.org>
Subject: Re: Request for cherry-picks for sound (Re: [regression, 5.10.y] Bug
 216861)
Message-ID: <Y7Vjmod9m/Zmp4v2@kroah.com>
References: <bebd692d-7d21-6648-6b7a-c91063bb51c2@leemhuis.info>
 <Y7K1WDmPYi3EMOn1@eldamar.lan>
 <87wn65umye.wl-tiwai@suse.de>
 <CALp6mkJhM1zDcNr9X_7WL09+uqcaAhNFFMhrjme0r7584O+Lgw@mail.gmail.com>
 <CALp6mk+rdqGXySUowxZv3kEEVWrh96m_x-h8xcFNQ9YZPkbc5w@mail.gmail.com>
 <87h6x7r7w6.wl-tiwai@suse.de>
 <87sfgrpos6.wl-tiwai@suse.de>
 <87wn62obhm.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wn62obhm.wl-tiwai@suse.de>

On Wed, Jan 04, 2023 at 11:11:33AM +0100, Takashi Iwai wrote:
> Greg, just in case you missed my previous post.
> 
> Could you cherry-pick the following two commits to 5.10.y and 5.15.y
> stable trees?
> 
> e8444560b4d9302a511f0996f4cfdf85b628f4ca
>     ASoC/SoundWire: dai: expand 'stream' concept beyond SoundWire
>  
> 636110411ca726f19ef8e87b0be51bb9a4cdef06
>     ASoC: Intel/SOF: use set_stream() instead of set_tdm_slots() for HDAudio

Took a bit of work, but both now queued up, thanks.

greg k-h
