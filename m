Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206F67E
	for <regressions@lists.linux.dev>; Tue, 20 Dec 2022 11:47:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A275C433D2;
	Tue, 20 Dec 2022 11:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1671536836;
	bh=HaezOBjWm0I5jWaDF8cAgd1/U87DIvY8kmuYRDi2zZo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Eo83z733mvFA18n1TON10XetS41cggDp8NQamtOquCaDSDL2qDrNZF8+y7OekhMHB
	 KrxMBbHQmIrm1w8yGbC3Bt1c3V+WXd/js46qaoY0La86fl9eglw5L6sDCG1zcSXAhu
	 RO8Z0I3NI1Il526rWfd2LBxfu6Lqz/fpv3rHlOl0=
Date: Tue, 20 Dec 2022 12:47:13 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>,
	Thorsten Leemhuis <regressions@leemhuis.info>,
	Alsa-devel <alsa-devel@alsa-project.org>,
	yung-chuan.liao@linux.intel.com, Takashi Iwai <tiwai@suse.de>,
	daniel.baluta@nxp.com, Oliver Neukum <oneukum@suse.com>,
	lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
	Zhen Ni <nizhen@uniontech.com>, ranjani.sridharan@linux.intel.com,
	Ricardo Ribalda <ribalda@chromium.org>,
	Archana Patni <archana.patni@intel.com>,
	peter.ujfalusi@linux.intel.com,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: [PATCH 0/2] ASoC: SOF: remove unregister calls from shutdown
Message-ID: <Y6GgwcN+7hlJeHOT@kroah.com>
References: <20221209114529.3909192-1-kai.vehmanen@linux.intel.com>
 <167102472177.27755.10161077455234852195.b4-ty@kernel.org>
 <e23ec080-9fe4-ee28-1d4c-879127803660@leemhuis.info>
 <Y6BhTWGUp2D5hhbE@sirena.org.uk>
 <alpine.DEB.2.22.394.2212201334340.3532114@eliteleevi.tm.intel.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2212201334340.3532114@eliteleevi.tm.intel.com>

On Tue, Dec 20, 2022 at 01:41:01PM +0200, Kai Vehmanen wrote:
> Hi,
> 
> On Mon, 19 Dec 2022, Mark Brown wrote:
> 
> > On Mon, Dec 19, 2022 at 10:41:41AM +0100, Thorsten Leemhuis wrote:
> > 
> > > * there are no "CC: <stable..." tags in these patches. Is the plan to
> > > manually ask for a backport? Or how can we get the regression fixed in
> > > older releases?
> > 
> > Speak to the stable maintainers I guess, or hope their bot picks the
> > commits up.
> 
> thanks Thorsten for the notice. These patches do lack the "Fixes:" tag, so 
> it's possible the bots will not pick these up. I can follow up and send 
> these to stable if this does not happen.

"Fixes:" guarantees nothing, please NEVER rely on that.  As per the
kernel documentation for the last 18+ years, you have to tag a commit
with the "Cc: stable@..." tag to ensure that it gets picked up properly.

thanks,

greg k-h
