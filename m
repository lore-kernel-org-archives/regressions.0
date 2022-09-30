Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE05110C
	for <regressions@lists.linux.dev>; Fri, 30 Sep 2022 04:37:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B396FC433D6;
	Fri, 30 Sep 2022 04:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1664512633;
	bh=ZRAneb5EcyZv3GWlaKMOIKXFNSHL4IGIBr70WUNZcIQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yzAUlKsvKUtXC7KxaLpRgt5sQadaJsJRJ2qcIjBvFcMFspnw9Fb1eYyKI5Yel2bAB
	 2bEsUUMDe6X/HZAURnoUsyb/OjkjUHWLB3pMADdtxY5DwXI7hElgt4Fto7nazPVM3V
	 ecxkrq5NL5xq2dK5PUqwr7/oaC6Ausr7zRWwUqs8=
Date: Fri, 30 Sep 2022 06:37:48 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jerry Ling <jiling@cern.ch>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: Regression on 5.19.12, display flickering on Framework laptop
Message-ID: <YzZynE2FAMNQKm2E@kroah.com>
References: <55905860-adf9-312c-69cc-491ac8ce1a8b@cern.ch>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55905860-adf9-312c-69cc-491ac8ce1a8b@cern.ch>

On Thu, Sep 29, 2022 at 10:26:25PM -0400, Jerry Ling wrote:
> Hi,
> 
> It has been reported by multiple users across a handful of distros that
> there seems to be regression on Framework laptop (which presumably is not
> that special in terms of mobo and display)
> 
> Ref: https://community.frame.work/t/psa-dont-upgrade-to-linux-kernel-5-19-12-arch1-1-on-arch-linux-gen-11-model/23171

Can anyone do a 'git bisect' to find the offending commit?

thanks,

greg k-h
