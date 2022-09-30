Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E7F186B
	for <regressions@lists.linux.dev>; Fri, 30 Sep 2022 05:58:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41A00C433D6;
	Fri, 30 Sep 2022 05:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1664517510;
	bh=MX7SYb4vy45NYzPRy+E4YlrZSouPYPalitZ97czaT4A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jv4J32GgJaNufhN1gRA8h4Ixj4SRbWVvoFq06xFK0eaqZpjmuMHm5SwFa2n2rnTJu
	 oDAcqr2P/kBWmdIC6EqLs72pzIDg/HOUURaM1fetywXw0YQk9mLKgLO/AKgtmHZZ5W
	 A3pZ9YRvk0qguOC9xIYxgoxMaApQoYPbXXomOvO4=
Date: Fri, 30 Sep 2022 07:59:07 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jerry Ling <jiling@cern.ch>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: Regression on 5.19.12, display flickering on Framework laptop
Message-ID: <YzaFq7fzw5TbrJyv@kroah.com>
References: <55905860-adf9-312c-69cc-491ac8ce1a8b@cern.ch>
 <YzZynE2FAMNQKm2E@kroah.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YzZynE2FAMNQKm2E@kroah.com>

On Fri, Sep 30, 2022 at 06:37:48AM +0200, Greg KH wrote:
> On Thu, Sep 29, 2022 at 10:26:25PM -0400, Jerry Ling wrote:
> > Hi,
> > 
> > It has been reported by multiple users across a handful of distros that
> > there seems to be regression on Framework laptop (which presumably is not
> > that special in terms of mobo and display)
> > 
> > Ref: https://community.frame.work/t/psa-dont-upgrade-to-linux-kernel-5-19-12-arch1-1-on-arch-linux-gen-11-model/23171
> 
> Can anyone do a 'git bisect' to find the offending commit?

Also, this works for me on a gen 12 framework laptop:
	$ uname -a
	Linux frame 5.19.12 #68 SMP PREEMPT_DYNAMIC Fri Sep 30 07:02:33 CEST 2022 x86_64 GNU/Linux

so there's something odd with the older hardware?

greg k-h
