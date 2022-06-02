Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43DE3D65
	for <regressions@lists.linux.dev>; Thu,  2 Jun 2022 20:08:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E49BC385A5;
	Thu,  2 Jun 2022 20:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1654200530;
	bh=8GzgWaU02MkgYx6vlC1/LAX6muJRS4/DxBOnAunjqzE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OEHh7NeUB4SYdD+8lksQ+W01tZb4oc2BpECOu1kvSUffnh03rTJsBIetclVoZmUfi
	 +55OPuzmPRRneVmefFwMZQkMjJd3ne3Y1nTeDNEm+Q57wcwQfsAmqFF87oW0yRSRWZ
	 aaKyCHRS5RscOF1aT1QAtrKG/Ri8aoWnv91sYpig=
Date: Thu, 2 Jun 2022 22:08:49 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Thomas Sattler <sattler@med.uni-frankfurt.de>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: boot loop since 5.17.6
Message-ID: <YpkY0RLWki4PJ49y@kroah.com>
References: <11495172-41dd-5c44-3ef6-8d3ff3ebd1b2@med.uni-frankfurt.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <11495172-41dd-5c44-3ef6-8d3ff3ebd1b2@med.uni-frankfurt.de>

On Thu, Jun 02, 2022 at 06:14:43PM +0200, Thomas Sattler wrote:
> After applying "patch-5.17.5-6.part198.patch" compilation is
> broken. Still after applying "patch-5.17.5-6.part199.patch".
> After applying "patch-5.17.5-6.part200.patch", compilation
> works again but the resulting kernel now fails to boot.

I have no idea what those random patches are, please can you say what
the upstream commit is?

thanks,

greg k-h
