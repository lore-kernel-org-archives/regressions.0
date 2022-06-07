Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5C97F
	for <regressions@lists.linux.dev>; Tue,  7 Jun 2022 11:53:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94FCBC385A5;
	Tue,  7 Jun 2022 11:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1654602813;
	bh=2M2eENT/bbK+vvC+mlii6iocsi6UJNyaXmmTRUEaVjM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u/7K3bzCVhn8cuOeztl40PXhrfFZ6FNWu2tKwzWQabW9+B1rGIGVC/lY3JVE+EmeW
	 ClC0z8KAHd4fjSAi8hB90j8cFELKEYeJRmRGVG4HcFVgr7c/aox4cW5+SJTNEAPaZq
	 89bwt3IES+lZPKjaxlkojxqsa+LxQeiaHQAXjZrk=
Date: Tue, 7 Jun 2022 13:53:27 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Thomas Sattler <sattler@med.uni-frankfurt.de>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, stable@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: boot loop since 5.17.6
Message-ID: <Yp88N2qL3HXLz0bi@kroah.com>
References: <11495172-41dd-5c44-3ef6-8d3ff3ebd1b2@med.uni-frankfurt.de>
 <c3b370a8-193e-329b-c73a-1371bd62edf3@med.uni-frankfurt.de>
 <181a6369-e373-b020-2059-33fb5161d8d3@med.uni-frankfurt.de>
 <YpksflOG2Y1Xng89@dev-arch.thelio-3990X>
 <1f8a4bec-53bd-aaaa-49a7-b5ed4fc5ae34@med.uni-frankfurt.de>
 <a9a68c68-8830-2aa0-acbe-d5d3bb04968f@leemhuis.info>
 <4dc96ed3-169e-37b9-7b8f-85e58dca0bbf@med.uni-frankfurt.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4dc96ed3-169e-37b9-7b8f-85e58dca0bbf@med.uni-frankfurt.de>

On Tue, Jun 07, 2022 at 01:40:03PM +0200, Thomas Sattler wrote:
> Hi Thorsten,
> 
> I just compiled 5.19-rc1 and my issue is solved there.

Any chance you can do 'git bisect' between 5.18 and 5.19-rc1 to find the
commit that fixed the issue?

thanks,

greg k-h
