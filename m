Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B9B10E8
	for <regressions@lists.linux.dev>; Thu,  1 Dec 2022 08:26:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D27F6C433C1;
	Thu,  1 Dec 2022 08:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1669883193;
	bh=m+xBpKCMOKEc9qx0KBpk8BDiMGASH/67XkkPb9hnV9g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bVGPu5NcMPitMLV+CN7ZbClV8Vb1OURhVOVZRX9HmCXN/o/d/djAgWB7ZkHxPB/y1
	 TSAgMEQFiE1njyALfQnF59QNQe6KGRxzWSal7fMf4ynBknoFL9WAkiGnyNV8Jw6n20
	 POhUj8p0njS+YdUH/T8pDhsr8jSlahLOK+pzAMks=
Date: Thu, 1 Dec 2022 06:57:40 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: John Aron <john@aronetics.com>
Cc: 'Mark Salter' <mark.salter@canonical.com>,
	'Mark Lewis' <mark.lewis@canonical.com>,
	regressions@lists.linux.dev, stable@vger.kernel.org,
	kernelnewbies@kernelnewbies.org
Subject: Re: OBJTOOL Build error
Message-ID: <Y4hCVMrg9oZt+YAL@kroah.com>
References: <041601d90035$4f738de0$ee5aa9a0$@aronetics.com>
 <Y3/c73nZVdHCBdZo@kroah.com>
 <0be301d90514$9250bd70$b6f23850$@aronetics.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0be301d90514$9250bd70$b6f23850$@aronetics.com>

A: http://en.wikipedia.org/wiki/Top_post
Q: Were do I find info about this thing called top-posting?
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?

A: No.
Q: Should I include quotations after my reply?

http://daringfireball.net/2007/07/on_top

On Wed, Nov 30, 2022 at 06:36:19PM -0500, John Aron wrote:
> One C file and a few header files.

Can you provide a link to them so that we can see what might be the
problem?  Without that, it's impossible to help, sorry.

thanks,

greg k-h
