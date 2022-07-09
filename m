Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544357E2
	for <regressions@lists.linux.dev>; Sat,  9 Jul 2022 06:34:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 956ECC3411C;
	Sat,  9 Jul 2022 06:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1657348453;
	bh=2uTm3WC6wxy89V7V/4cci/5HmlCO92Cyj+BDgD/BNfo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MCBWD3s4U8kA4iVEWKblTdkSCNRCHOfNLpLNLmDlorBjcJyIIsm6Gg0jieTau6y2+
	 8NJEmjoY7DtJ39rJgF+Ovd3Vjg3gGv+U+Cq/3gBKuYUi2DOiWvfQBqfzG06nMU2Qu+
	 8UgwaK/hNQT6DH23pMYCoeHk+UPWkW14mhefAbi0=
Date: Sat, 9 Jul 2022 08:34:10 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Juergen Gross <jgross@suse.com>,
	Linux kernel regressions <regressions@lists.linux.dev>,
	stable@vger.kernel.org,
	Linux kernel mailing list <linux-kernel@vger.kernel.org>,
	Xen developer discussion <xen-devel@lists.xenproject.org>
Subject: Re: gntdev warning fixes
Message-ID: <YskhYmJFg2KgYF3n@kroah.com>
References: <20220708163750.2005-1-demi@invisiblethingslab.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220708163750.2005-1-demi@invisiblethingslab.com>

On Fri, Jul 08, 2022 at 12:37:44PM -0400, Demi Marie Obenour wrote:
> The recent gntdev fixes introduced two incorrect WARN_ON()s, which
> triggered immediately on my system.  Patches for master and all
> supported stable versions follow.
> 
> 

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>
