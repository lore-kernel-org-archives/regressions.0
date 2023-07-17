Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F42253A0
	for <regressions@lists.linux.dev>; Mon, 17 Jul 2023 14:37:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A82DC433C7;
	Mon, 17 Jul 2023 14:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1689604669;
	bh=2r0sll+s0IDy8bTc7YEbr58iDiN4CqkfNKcW4JXgjNo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q36eFDp2S55Uz3SGh9XpDRKshan0KQuW4SsGfDkGUd3gdtRMaGjBGClRcWqJedQLW
	 94YlB3S2VU7KqhljCOksy9V/PP+vbfVVDavv1H4nxsWs1Kng77cxegWwkf288YJGuD
	 BQit2h1PmgEgP/M6u3OhPMNkUmXnIIG3WLuviGJM=
Date: Mon, 17 Jul 2023 16:37:46 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
	Jakub Kicinski <kuba@kernel.org>, corbet@lwn.net,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH docs] docs: maintainer: document expectations of small
 time maintainers
Message-ID: <2023071759-visible-identify-e5d7@gregkh>
References: <20230713223432.1501133-1-kuba@kernel.org>
 <6f1014cd-f8c5-f935-dcc7-4f5a6b85e473@kernel.org>
 <20230714101028.337fb39a@kernel.org>
 <bb8c6476-283c-3bc6-710b-5a8602ccd40e@leemhuis.info>
 <895ed8ae-e93f-b296-330e-356cda698de2@kernel.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <895ed8ae-e93f-b296-330e-356cda698de2@kernel.org>

On Mon, Jul 17, 2023 at 09:49:09AM +0200, Krzysztof Kozlowski wrote:
> On 15/07/2023 12:31, Linux regression tracking (Thorsten Leemhuis) wrote:
> > [CCing other people in the thread]
> > How about something like this:
> > 
> > ```
> > Bug reports
> > -----------
> > 
> > Maintainers must ensure severe problems in their code reported to them
> > are resolved in a timely manner: security vulnerabilities, regressions,
> > compilation errors, data loss, kernel crashes, and bugs of similar scope.
> > 
> > Maintainers furthermore should respond to reports about other kind of
> > bugs as well, if the report is of reasonable quality or indicates a
> > problem that might be severe -- especially if they have *Supported*
> > status of the codebase in the MAINTAINERS file.
> 
> I like mentioning the "Supported" part. We should be a bit more
> understanding to all folks who are not paid to do this.

And, we should not be as understanding for companies who do NOT allow
their developers to do this on company time, so pointing out the
difference here is good, as most of the time it goes unnoticed as to
just how little companies allow their maintainers to do their work.

thanks,

greg k-h
