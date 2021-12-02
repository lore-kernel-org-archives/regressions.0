Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E342C82
	for <regressions@lists.linux.dev>; Thu,  2 Dec 2021 15:17:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EFF4C00446;
	Thu,  2 Dec 2021 15:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1638458250;
	bh=dqyYaDn/E5myyUzU2SJe2NF7iZJAZCHUH8VQYzT8BAE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ldSHS6kXZwEItru1cto2wJlhTP/yjfMp5/iPKInwpWyOTr91bQnnaWRQjIOh0AlNJ
	 b2UlNafILQK+jrxHhHRiET7+HxdxQLZIAjwOGZsrdwIenV8KNs0R7d+D2VMxUE82eL
	 MbCXFpvIAUdKhcwbWEXwxUHxClfN8fJwBYXpEheU=
Date: Thu, 2 Dec 2021 16:17:27 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Robert Munteanu <rombert@apache.org>
Cc: Mathias Nyman <mathias.nyman@intel.com>, tiwai@suse.com,
	regressions@lists.linux.dev, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: Regression: plugging in USB scanner breaks all USB functionality
Message-ID: <YajjhwMDkX2CyrQD@kroah.com>
References: <35f7428b39f996c793f5b4a6a314772681c73d7a.camel@apache.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <35f7428b39f996c793f5b4a6a314772681c73d7a.camel@apache.org>

On Thu, Dec 02, 2021 at 03:55:44PM +0100, Robert Munteanu wrote:
> Hi,
> 
> After updating from kernel 5.14.11 to 5.14.14 I am seeing the following
> problem:

Can you run 'git bisect' between those kernel versions to get the
offending commit located?  It shouldn't take that long as there's not a
lot of changes there.

thanks,

greg k-h
