Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98E923C7
	for <regressions@lists.linux.dev>; Fri, 30 Sep 2022 11:22:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06211C433C1;
	Fri, 30 Sep 2022 11:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1664536950;
	bh=rwuLhHp1OBNRrvJo+rqDanmHfRrY/shHT7Hv9gIgCqk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p2yYH5vYmpzXCseXCE81Ujuaa8ocRbi7R03+IIZFJbSYXbYmaonWl1IBmINwZxYCi
	 X7rtqW97eQwfQ2DGxhdEtEQKWkD32UmcqosdwEYIfMl4/yva/O0HOGUgy3TGBgXqg8
	 OrITtrOxFIvnbnDr4KCgBxgJ65Mp1mB79alWwBqA=
Date: Fri, 30 Sep 2022 13:22:27 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Slade Watkins <srw@sladewatkins.net>
Cc: Jerry Ling <jiling@cern.ch>, stable@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: Regression on 5.19.12, display flickering on Framework laptop
Message-ID: <YzbRcyi6Evu2RrNt@kroah.com>
References: <55905860-adf9-312c-69cc-491ac8ce1a8b@cern.ch>
 <YzZynE2FAMNQKm2E@kroah.com>
 <YzaFq7fzw5TbrJyv@kroah.com>
 <03147889-B21C-449B-B110-7E504C8B0EF4@sladewatkins.net>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <03147889-B21C-449B-B110-7E504C8B0EF4@sladewatkins.net>

On Fri, Sep 30, 2022 at 07:11:19AM -0400, Slade Watkins wrote:
> Hey Greg,
> 
> > On Sep 30, 2022, at 1:59 AM, Greg KH <gregkh@linuxfoundation.org> wrote:
> > 
> > On Fri, Sep 30, 2022 at 06:37:48AM +0200, Greg KH wrote:
> >> On Thu, Sep 29, 2022 at 10:26:25PM -0400, Jerry Ling wrote:
> >>> Hi,
> >>> 
> >>> It has been reported by multiple users across a handful of distros that
> >>> there seems to be regression on Framework laptop (which presumably is not
> >>> that special in terms of mobo and display)
> >>> 
> >>> Ref: https://community.frame.work/t/psa-dont-upgrade-to-linux-kernel-5-19-12-arch1-1-on-arch-linux-gen-11-model/23171
> >> 
> >> Can anyone do a 'git bisect' to find the offending commit?
> > 
> > Also, this works for me on a gen 12 framework laptop:
> > 	$ uname -a
> > 	Linux frame 5.19.12 #68 SMP PREEMPT_DYNAMIC Fri Sep 30 07:02:33 CEST 2022 x86_64 GNU/Linux
> > 
> > so there's something odd with the older hardware?
> > 
> > greg k-h
> 
> Could be. Running git bisect for 5.19.11 and 5.19.12 (as suggested by the linked forum thread) returned nothing on gen 11 for me.
> 
> This is very odd,

So 5.19.11 works for you, but 5.19.12 does not?

Or is it just the arch packaged kernel that does not work for you?

confused,

greg k-h
