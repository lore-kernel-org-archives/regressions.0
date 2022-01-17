Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69C92C9C
	for <regressions@lists.linux.dev>; Mon, 17 Jan 2022 08:09:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEF8AC36AE7;
	Mon, 17 Jan 2022 08:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1642406950;
	bh=+ker6gPqXQx23Br01jW9fxItorIHv0lFU3htpl/ApUY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OfnzylFJBmQV9Y73T0iNxTjqdDQABm/h3OndI613+xpDaE06QBLu8lMjkVgnwS1f8
	 KLzZrnjL0zE/Xn6XTxourrPFYRiuKagDS2VhZmXjWcBrgEu1JIzcaHN2MWYghtuzix
	 JkFK5kkiW16iBTgUOg93vgA/Y2w5r59Tr5RM0qUY=
Date: Mon, 17 Jan 2022 09:09:07 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: "James D. Turner" <linuxkernel.foss@dmarc-none.turner.link>
Cc: Alex Williamson <alex.williamson@redhat.com>, kvm@vger.kernel.org,
	regressions@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [REGRESSION] Too-low frequency limit for AMD GPU
 PCI-passed-through to Windows VM
Message-ID: <YeUkIyAsrYHOuaKt@kroah.com>
References: <87ee57c8fu.fsf@turner.link>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ee57c8fu.fsf@turner.link>

On Sun, Jan 16, 2022 at 09:12:21PM -0500, James D. Turner wrote:
> So, the issue was introduced between v5.13 and v5.14-rc1. I'm willing to
> bisect the commit history to narrow it down further, if that would be
> helpful.

Bisection would be great as that is a very large range of commits there
from many months ago, so people might not remember what could have
caused this issue.

thanks,

greg k-h
