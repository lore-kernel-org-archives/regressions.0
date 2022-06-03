Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37537ED2
	for <regressions@lists.linux.dev>; Fri,  3 Jun 2022 12:57:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7798EC385A9;
	Fri,  3 Jun 2022 12:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1654261028;
	bh=BgxSOabF8NS37zOh6KbugrE/MEMF9mMNUdEJ5iL5IBk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MiP6OTFBDA92tEzIiGA3uLEDPs3VtM1bNSM+s+iigi4cMZxb03rZEEvXGa5O/TA8q
	 dcAC3vhH6Kl+jTSeqZlQQfhMrOpycfqwp4p7sxpKyGyof2AYpf7vFY+LYkQWJZrArO
	 K7f+YffaBKOijQSIaEnjAnyTtqMwuWF0tsv5mC8g=
Date: Fri, 3 Jun 2022 14:57:05 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Thomas Sattler <sattler@med.uni-frankfurt.de>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: boot loop since 5.17.6
Message-ID: <YpoFId6um9GaXKha@kroah.com>
References: <11495172-41dd-5c44-3ef6-8d3ff3ebd1b2@med.uni-frankfurt.de>
 <YpkY0RLWki4PJ49y@kroah.com>
 <88b0eb42-41eb-af0e-285c-05f86a5c5fea@med.uni-frankfurt.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <88b0eb42-41eb-af0e-285c-05f86a5c5fea@med.uni-frankfurt.de>

On Fri, Jun 03, 2022 at 01:29:26AM +0200, Thomas Sattler wrote:
> Am 02.06.22 um 22:08 schrieb Greg KH:
> > On Thu, Jun 02, 2022 at 06:14:43PM +0200, Thomas Sattler wrote:
> > > After applying "patch-5.17.5-6.part198.patch" compilation is
> > > broken. Still after applying "patch-5.17.5-6.part199.patch".
> > > After applying "patch-5.17.5-6.part200.patch", compilation
> > > works again but the resulting kernel now fails to boot.
> > 
> > I have no idea what those random patches are, please can you say what
> > the upstream commit is?
> 
> I took what I reverted from patch-5.17.5-6.xz. In your tree it
> matches what Nathan mentioned (60d2b0b1018a) plus d17f64c29512.
> 
> Now, knowing that they were two patchsets, I compiled 5.17.12
> twice, once without 60d2b0b1018a and once without d17f64c29512.
> 
> And it turns out it is 60d2b0b1018a which breaks my system.

Does 5.18.1 also break for you?

thanks,

greg k-h
