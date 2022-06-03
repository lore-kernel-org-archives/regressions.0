Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A941EED2
	for <regressions@lists.linux.dev>; Fri,  3 Jun 2022 14:27:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4958C385A9;
	Fri,  3 Jun 2022 14:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1654266424;
	bh=7U0aoCVVJE0y26ZR04Q4Y/AUEyFaCWAx1E1DyqF52f0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cYuPmkx4ivmTG39CYvx1XmOq89XTMK9NuDmBCG/1ATT8DgPZDmppsrVcH3x7V4NDm
	 ID5fdZu8quyz9FHVs4KpcdDlHsSYRoYpq5k6e9ShsRNmaBmLItCW0Gz6wa9zEP6tWJ
	 ZVtsO//rD9oCTunsyknkUgnmUaeOVCSkFns+TlxY=
Date: Fri, 3 Jun 2022 16:27:01 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Thomas Sattler <sattler@med.uni-frankfurt.de>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: boot loop since 5.17.6
Message-ID: <YpoaNR9lxNrJcmY+@kroah.com>
References: <11495172-41dd-5c44-3ef6-8d3ff3ebd1b2@med.uni-frankfurt.de>
 <YpkY0RLWki4PJ49y@kroah.com>
 <88b0eb42-41eb-af0e-285c-05f86a5c5fea@med.uni-frankfurt.de>
 <YpoFId6um9GaXKha@kroah.com>
 <21de0fda-0ff0-a553-dae4-193eaec25ca3@med.uni-frankfurt.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <21de0fda-0ff0-a553-dae4-193eaec25ca3@med.uni-frankfurt.de>

On Fri, Jun 03, 2022 at 03:46:34PM +0200, Thomas Sattler wrote:
> Am 03.06.22 um 14:57 schrieb Greg KH:
> > On Fri, Jun 03, 2022 at 01:29:26AM +0200, Thomas Sattler wrote:
> > > Am 02.06.22 um 22:08 schrieb Greg KH:
> > > > On Thu, Jun 02, 2022 at 06:14:43PM +0200, Thomas Sattler wrote:
> > > 
> > > Now, knowing that they were two patchsets, I compiled 5.17.12
> > > twice, once without 60d2b0b1018a and once without d17f64c29512.
> > > 
> > > And it turns out it is 60d2b0b1018a which breaks my system.
> > 
> > Does 5.18.1 also break for you?
> > 
> 
> There is no difference between 5.17.6, 5.17.12 and 5.18.1:
> 
>   - they do not boot vanilla
>   - applying ead165fa1042 is no help
>   - reverting 60d2b0b1018a allows booting

Great, please work with the developers of that change to track down the
problem and get it fixed.

thanks,

greg k-h
